package kr.or.member.controller;

import java.util.ArrayList;

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
	
	@RequestMapping(value = "/member.do")
	public String member(Model model) {
		ArrayList<Member> list = service.selectAllMember();

		model.addAttribute("list", list);
		
		System.out.println("테스트");
		
		return "member/member";
	}
}
