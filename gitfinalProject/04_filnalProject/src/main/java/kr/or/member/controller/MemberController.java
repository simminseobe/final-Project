package kr.or.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;

	// 로그인
	@RequestMapping(value="/login.do")
	public String login(Member member, HttpSession session) {
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
		return "member/memberFrm";
	}
	
	//마이페이지 이동
	@RequestMapping(value="/mypage.do")
	public String mypage() {
		return "member/mypage";
	}
	
	
	
}
