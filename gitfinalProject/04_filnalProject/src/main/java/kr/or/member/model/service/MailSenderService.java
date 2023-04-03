package kr.or.member.model.service;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;

@Component
public class MailSenderService {
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber;
	
	public void makeRandomNumber() {
		// 랜덤코드 생성
		Random r = new Random();
		StringBuffer sb = new StringBuffer();
		for(int i=0; i<8; i++) {
			int flag = r.nextInt(3);
			if(flag == 0) {
				int randomMember = r.nextInt(10);
				sb.append(randomMember);
			} else if(flag == 1) {
				char randomChar = (char)(r.nextInt(25)+65);
				sb.append(randomChar);
			} else if(flag == 2) {
				char randomChar = (char)(r.nextInt(25)+97);
				sb.append(randomChar);
			}
			authNumber = flag;
		}
	}
	
	// 보낼 이메일 양식
	public String emailCheck(String email) {
		makeRandomNumber();
		String setFrom = "jjune41@naver.com"; // email-config에 설정한 자신의 이메일 주소 입력
		String toMail = email;
		String title= "MovieIsland 회원 가입 인증 이메일 입니다."; // 이메일 제목
		String content = "홈페이지를 방문해주셔서 감사합니다." +
						"<br><br>" + 
						"인증 번호는" + authNumber + "입니다" + "<br>" +
						"해당 인증 번호를 확인번호 확인란에 기입하여 주세요."; // 이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	
	// 이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능
		// 문자 인코딩 설정도 가능
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
		}catch (javax.mail.MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
}
