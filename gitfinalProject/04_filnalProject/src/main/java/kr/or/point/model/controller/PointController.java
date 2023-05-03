package kr.or.point.model.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;

import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPoint;
import kr.or.point.model.service.PointService;
import kr.or.point.model.vo.Point;
import kr.or.point.model.vo.PointPageData;

@Controller
public class PointController {
	
@Autowired
	private PointService service;
	
	//포인트사용
	@ResponseBody
	@RequestMapping(value="/usePoint.do", produces = "application/json;charset=utf-8")
	public String usePoint(int usePoint, int memberNo) {
		int result = service.usePoint(usePoint, memberNo);
		if(result>0) {
			//등록가능
			return new Gson().toJson("ok");
			//return "ok";
		}else {
			//등록완료
			return new Gson().toJson("error");
			
		}
	}
	
	//포인트적립
	@ResponseBody
	@RequestMapping(value="/addPoint.do", produces = "application/json;charset=utf-8")
	public String addPoint(int addPoint, int memberNo) {
		int result = service.addPoint(addPoint, memberNo);
		if(result>0) {
			//등록가능
			return new Gson().toJson("ok");
			//return "ok";
		}else {
			//등록완료
			return new Gson().toJson("error");
			
		}
	}
	
	//포인트이용내력
	@RequestMapping(value="/myPoint.do")
	public String myPoint(@SessionAttribute(required = false) Member m, int reqPage, Model model, int memberNo) {
		PointPageData ppd = service.myPoint(reqPage,memberNo);
		model.addAttribute("list", ppd.getList());
		model.addAttribute("pageNavi", ppd.getPageNavi());
		Integer mpAmount = service.mpAmount(m.getMemberNo()); //최초 회원가입시 포인트내역 없음(null) -> 단순 int로 선언 시 에러

		//null이면 null값 반환
		if(mpAmount==null) { 
			model.addAttribute("mpAmount", mpAmount);
		}else { //null이 아니면 int형으로 변환 후 반환
			int mpAmountInt = mpAmount.intValue();  
			model.addAttribute("mpAmount", mpAmountInt);
		}
		System.out.println(m.getMemberLevel());
		System.out.println(mpAmount);
		return "member/myPoint";
	}
	
}
