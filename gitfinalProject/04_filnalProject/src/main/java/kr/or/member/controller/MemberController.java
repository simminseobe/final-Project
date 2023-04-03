package kr.or.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;

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
	
	// 아이디 중복체크
	@ResponseBody
	@RequestMapping(value="/checkId.do", produces = "application/json;charset=utf-8")
	public String checkId(Member member) {
		Member m = service.selectOneId(member);
		if(m != null) {
			return "0";
		} else {
			return "1";
		}
		
	}
	
	// 회원가입
	@RequestMapping(value="/join.do")
	public String join(Member m) {
		int result = service.insertMember(m);
		return "redirect:/";
	}
	
	
	
	
}
