package kr.or.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.or.member.model.vo.Member;

@Component
@Aspect
public class PasswordEncAdvice {

	@Autowired
	private SHA256Enc passEnc;
	
	// 표현식 : execution(리턴타입 패키지경로.클래스명()
	// *Member : Member로 끝나는 모든 클래스를 의미함
	// (kr.or.member.model.vo.Member) : 매개변수로 Member를 가지는 메소드 선택
	
	// * : 매개변수
	// kr.or.member.model.service : 패키지명
	// MemberService : 클래스명
	// *Member : Member로 끝나는 모든 클래스
	// kr.or.member.model.vo.Member : 매개변수로 Member를 가지는 메소드 선택
	@Pointcut(value="execution(* kr.or.member.model.service.MemberService.*Member(kr.or.member.model.vo.Member))")
	public void encPointcut() {}
	
	@Before(value="encPointcut()")
	public void passwordEnc(JoinPoint jp) throws Exception {
		// 메소드 이름 가져오기
		String methodName = jp.getSignature().getName();
		//System.out.println("비밀번호 암호화 동작 메소드 : " + methodName);
		// 매개변수 꺼내기(항상 Object[] 타입)
		Object[] args = jp.getArgs(); 
		Member member = (Member)args[0];
		
		String memberPw = member.getMemberPw();
		//System.out.println("사용자 입력 비밀번호 : " + memberPw);
		
		String encPw = passEnc.encDate(memberPw);
		//System.out.println("암호화 비밀번호 : " + encPw);
		
		member.setMemberPw(encPw);
	}
	
	@Pointcut(value="execution(* kr.or.member.model.service.MemberService.updatePw(..))")
	public void pwChange() {}
	
	@Before(value="pwChange()")
	public void passPw(JoinPoint jp) throws Exception {
		String methodName = jp.getSignature().getName();
		//System.out.println("비밀번호 변경 메소드 : " + methodName);
		Object[] args = jp.getArgs();
		Member member = (Member)args[0];
		String memberPwRe = (String)args[1];
		//System.out.println("pw : " + member.getMemberPw());
		//System.out.println("pwRe : " + memberPwRe);
		String encPw = passEnc.encDate(member.getMemberPw());
		member.setMemberPw(encPw);
	}
	
}
