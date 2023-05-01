package kr.or.giftticket.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.giftticket.model.service.GiftTicketService;
import kr.or.giftticket.model.vo.GiftTicketPageData;
import kr.or.member.model.vo.Member;
import kr.or.ticketing.model.vo.ReservationCancelPageData;
import kr.or.ticketing.model.vo.ReservationPageData;

@Controller
public class GiftTicketController {
	@Autowired
	private GiftTicketService service;
	
	@RequestMapping(value = "/giftTicket.do")
	public String giftTicket(int reqPage, Model model, int memberNo) {
		GiftTicketPageData gtpd = service.selectTicketList(reqPage, memberNo);
		model.addAttribute("list", gtpd.getList());
		model.addAttribute("pageNavi", gtpd.getPageNavi());
		
		
		return "member/giftTicket";
	}
	
	@ResponseBody
	@RequestMapping(value="/addGiftTicket.do", produces = "application/json;charset=utf-8")
	public String ticketCheck(String giftTicketSerial, int memberNo) {
			int result = service.addGiftTicket(giftTicketSerial, memberNo);
			if(result>0) {
				//등록가능
				return new Gson().toJson("ok");
				//return "ok";
			}else {
				//등록완료
				return new Gson().toJson("error");
				
			}
	}
	
	@ResponseBody
	@RequestMapping(value="/useGiftTicket.do", produces = "application/json;charset=utf-8")
	public String useticket(String giftTicketSerial, int memberNo) {
			int result = service.useGiftTicket(giftTicketSerial, memberNo);
			if(result>0) {
				//사용완료
				return new Gson().toJson("ok");
				//return "ok";
			}else {
				return new Gson().toJson("error");
				
			}
	}
	
}
