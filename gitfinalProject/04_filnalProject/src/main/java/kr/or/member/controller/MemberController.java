package kr.or.member.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import common.FileManager;
import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private FileManager manager;

	// 로그인 폼 이동
	@RequestMapping(value="/login.do")
	public String login(Member member) {
		return "member/signIn";
	}
	
	// 로그인
	@RequestMapping(value="/signIn.do")
	public String signIn(Member member, HttpSession session, Model model) {
		Member m = service.selectOneMember(member);
		if(m != null) {
			session.setAttribute("m", m);
		}
		return "redirect:/";
	}
	
	// 로그아웃
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원가입 폼 이동
	@RequestMapping(value="/joinFrm.do")
	public String joinFrm() {
		return "member/joinFrm";
	}

	private int authNumber;
	// 이메일 인증을 위한 랜덤 난수 생성
	public void makeRandomNumber() {
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		authNumber = checkNum;
	}
	
	// 이메일 인증
	@ResponseBody
	@RequestMapping(value="/emailCheck.do")
	public String emailCheck(String email) {
		makeRandomNumber();
		String subject = "MovieIsland 회원 가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다."
						 + "<br>"
						 + "인증번호는 " + authNumber + " 입니다"
						 + "<br>" 
						 + "해당 인증 번호를 인증번호 란에 기입하여 주세요.";
		String from = "manager@movieIsland.com";
		String to = email;

		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
			// true는 멀티파트 메세지를 사용하겠다는 의미

			/*
			 * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 MimeMessageHelper mailHelper = new
			 * MimeMessageHelper(mail,"UTF-8");
			 */

			mailHelper.setFrom(from);
			// 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
			// 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
			// mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
			mailHelper.setTo(to);
			mailHelper.setSubject(subject);
			mailHelper.setText(content, true);
			// true는 html을 사용하겠다는 의미입니다.

			/*
			 * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
			 */

			mailSender.send(mail);
			return Integer.toString(authNumber);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "1";
	}		
	
	// 회원가입
	@RequestMapping(value="/join.do")
	public String join(Member m) {
		int result = service.insertMember(m);
		if(result > 0) {
			return "redirect:/";
		} else {
			return "redirect:/join.do";
		}
	}

	// 아이디 찾기 폼 이동
	@RequestMapping(value="/findIdFrm.do")
	public String findIdFrm() {
		return "member/findId";
	}
	
	// 아이디 찾기(모달창 띄워서 데이터 전송)
	@ResponseBody
	@RequestMapping(value="/findId.do", produces = "application/json;charset=utf-8")
	public String searchId(Member m) {
		Member member = service.searchId(m);
		return new Gson().toJson(member);
	}
	
	// 비밀번호 찾기(모달창 띄워서 데이터 전송)
	@ResponseBody
	@RequestMapping(value="/findPw.do", produces = "application/json;charset=utf-8")
	public String findPw(Member m) {
		Member member = service.selectPw(m);
		return new Gson().toJson(member);
	}
	
	// 비밀번호 찾기(이메일 전송)
	@ResponseBody
	@RequestMapping(value="/sendEmailPw.do")	
	public String sendEmailPw(String email, Member member) {
		makeRandomNumber();
		String subject = "MovieIsland 임시 비밀번호 이메일 입니다.";
		String content = "회원님의 임시 비밀번호를 알려드리겠습니다."
						 + "<br>"
						 + "인증번호는 " + authNumber + " 입니다"
						 + "<br>" 
						 + "해당 임시 비밀번호를 통해 로그인 해주세요.";
		String from = "manager@movieIsland.com";
		String to = email;
		
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
			// true는 멀티파트 메세지를 사용하겠다는 의미

			/*
			 * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 MimeMessageHelper mailHelper = new
			 * MimeMessageHelper(mail,"UTF-8");
			 */

			mailHelper.setFrom(from);
			// 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
			// 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
			// mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
			mailHelper.setTo(to);
			mailHelper.setSubject(subject);
			mailHelper.setText(content, true);
			// true는 html을 사용하겠다는 의미입니다.

			/*
			 * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
			 */

			mailSender.send(mail);
			// 임시비밀번호로 pw 변경
			member.setMemberId(member.getMemberId());
			member.setMemberName(member.getMemberName());
			member.setMemberEmail(member.getMemberEmail());
			member.setMemberPw(String.valueOf(authNumber));
			int result = service.updatePwMember(member);
			return Integer.toString(authNumber);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "1";
	}
	
	
	
	// 마이페이지 이동
	@RequestMapping(value="/mypage.do")
	public String mypage() {
		return "member/mypage";
	}
	
	// 개인정보 수정 페이지 이동
	@RequestMapping(value="/myProfile.do")
	public String myProfile() {
		return "member/myProfile";
	}
	
	// 개인정보 수정
	@RequestMapping(value="/updateMember.do")
	public String updateMember(Member member, @SessionAttribute(required=false) Member m, String memberFilepath, MultipartFile file, HttpServletRequest request) {
		if(!file.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/member/");
			String filename = file.getOriginalFilename();			
			String upFilepath = manager.upload(savePath, file);
			member.setMemberFilename(filename);
			member.setMemberFilepath(upFilepath);
		}
		
		int result = service.updateMember(member);
		if(result > 0) {
			m.setMemberPhone(member.getMemberPhone());
			m.setMemberEmail(member.getMemberEmail());
			m.setMemberFilename(member.getMemberFilename());
			m.setMemberFilepath(member.getMemberFilepath());
			return "redirect:/myProfile.do";
		} else {
			return "redirect:/";
		}
	}
	
	// 회원탈퇴 페이지 이동
	@RequestMapping(value="/deleteFrm.do")
	public String deleteFrm() {
		return "member/deleteFrm";
	}
	
	// 회원탈퇴
	@RequestMapping(value="/deleteMember.do")
	public String deleteMember(int memberNo) {
		int result = service.deleteMember(memberNo);
		if(result > 0) {
			return "redirect:/logout.do";
		} else {
			return "redirect:/myProfile.do";
		}
	}
	
	// 마이페이지 → 비밀번호 변경 페이지 이동
	@RequestMapping(value="/changePw.do")
	public String changePw() {
		return "member/changeNewPw";
	}
	
	// 마이페이지 → 비밀번호 변경 
	@RequestMapping(value="/updatePw.do")
	public String updatePw(Member member, String newPassword) {
		int result = service.updatePw(member, newPassword);
		if(result > 0) {
			return "redirect:/logout.do";
		} else {
			return "redirect:/myProfile.do";
		}
	}
	
	// 아이디 중복체크 버튼 클릭
	@ResponseBody
	@RequestMapping(value="/dupIdChk.do", produces = "application/json;charset=utf-8")
	public String dupIdchk(Member m, Model model) {
		Member member = service.selectId(m);
		System.out.println(member);
		return new Gson().toJson(member);
	}
	
	// 예매/구매 내역 페이지 이동
	@RequestMapping(value="/purchaseList.do")
	public String purchaseList(int reqPage, Model model) {
//		MemberPageData mpd = service.selectBookList(reqPage);
//		model.addAttribute("list", mpd.getList());
//		model.addAttribute("pageNavi", mpd.getPageNavi());
		return "member/purchaseDetail";
	}
	
	// 카카오 로그인 시 필요한 토큰 발급
	@RequestMapping(value="/kakaoLogin.do")
    public String getAccessToken (String code, Member member, HttpSession session) {
		
		// Access_Token 출력
		System.out.println(code);
		
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            // URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=95e454d415a0cf20175203f81771b058"); //본인이 발급받은 REST API key
            sb.append("&redirect_uri=http://192.168.10.32/kakaoLogin.do"); // 로그인처리 컨트롤러 주소
            //sb.append("&client_id=REST_API_KEY"); //본인이 발급받은 REST API key
            //sb.append("&redirect_uri=http://아이피주소/컨트롤러주소"); // 로그인처리 컨트롤러 주소
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            // 결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            // 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        HashMap<String, Object> userInfo = getUserInfo(access_Token);
        System.out.println("userInfo : " + userInfo);
		//System.out.println("###access_Token#### : " + access_Token);
		//System.out.println("###userInfo - nickname#### : " + userInfo.get("nickname"));
		//System.out.println("###userInfo - email#### : " + userInfo.get("email"));
        
        // 로그인 처리
        // Member VO의 memberId에 email 값을 대입
        // 이때, memberPw는 Null 값을 갖게 끔 설정
        // 왜냐하면 email(memberId)의 memberPw가 일치 할 때 로그인 수행
        
		String kakao = userInfo.toString();
		System.out.println("kakao : " + kakao); // ok - 문자열로 나옴
		
        JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(kakao);
        
        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
        
        System.out.println("properties : " + properties);
        System.out.println("kakao_account : " + kakao_account);
        
		//필요한 정보 추출하는 코드(여기선 nickname, email)
        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
        String email = kakao_account.getAsJsonObject().get("email").getAsString();
        
        System.out.println("nickname : " + nickname);
        System.out.println("email : " + email);
        
        member.setMemberId(email);
        member.setMemberName(nickname);
        Member m = service.selectOneMember(member);
        if(m != null) {
        	// 로그인 수행 -> redirect:/ 이동??
        	session.setAttribute("m", m);
        	session.setAttribute("access_Token", access_Token);
        	return "redirect:/";
        } else {
        	// 회원가입 페이지로 이동
        	// 이때, 회원가입 jsp를 따로 만들어 주어야 함
			// memberId -- email
			// return -> 새로만든 회원가입 페이지 jsp로 리턴???
        	return "member/kakaoJoinFrm";
        }
        
        //return access_Token;
    }
	
	// 카카오 로그인 시 회원의 정보 조회
    public HashMap<String, Object> getUserInfo (String access_Token) {

        // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            // 요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode111111 : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			//필요한 정보 추출하는 코드(여기선 nickname, email)
            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();

            userInfo.put("accessToken", access_Token);
            userInfo.put("nickname", nickname);
            userInfo.put("email", email);

            userInfo.get(email);
            System.out.println("email");
            
        } catch (IOException e) {
            e.printStackTrace();
        }

        return userInfo;
    }
}
