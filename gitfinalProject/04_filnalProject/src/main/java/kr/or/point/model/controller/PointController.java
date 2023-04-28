package kr.or.point.model.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPoint;
import kr.or.point.model.service.PointService;
import kr.or.point.model.vo.Point;

@Controller
public class PointController {
	
@Autowired
	private PointService service;
	
	//포인트사용
	@RequestMapping(value="/usePoint.do")
	public int usePoint(Point uPoint) {
		int result = service.usePoint(uPoint);
		return result;
	}
	
	//포인트적립
	@RequestMapping(value="/savePoint.do")
	public int savePoint(Point sPoint) {
		int result = service.savePoint(sPoint);
		return result;
	}
	
	//포인트이용내력
	@RequestMapping(value="/memberPoint2.do")
	public String memberPoint(@SessionAttribute(required = false) Member m , Model model) {
		ArrayList<MemberPoint> memberPoint = service.memberPoint(m.getMemberNo());
		return "member/mypage";
	}
	
}
