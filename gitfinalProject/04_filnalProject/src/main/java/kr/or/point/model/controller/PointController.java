package kr.or.point.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.member.model.vo.Member;
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
	@RequestMapping(value="/memberPoint.do")
	public Point memberPoint(Member m) {
		Point mPoint = service.memberPoint(m);
		return mPoint;
	}
	
}
