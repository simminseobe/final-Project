package kr.or.giftticket.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.giftticket.model.service.GiftTicketService;
import kr.or.member.model.vo.Member;

@Controller
public class GiftTicketController {
	@Autowired
	private GiftTicketService service;
	
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
