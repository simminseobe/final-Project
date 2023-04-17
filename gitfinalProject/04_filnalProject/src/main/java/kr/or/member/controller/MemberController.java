package kr.or.member.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.FileManager;
import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPageData;

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
	
	
	
	
}
