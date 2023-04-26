package kr.or.giftticket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.giftticket.model.service.GiftTicketService;

@Controller
public class GiftTicketController {
	@Autowired
	private GiftTicketService service;
	
	@ResponseBody
	@RequestMapping(value="/addGiftTicket.do", produces = "application/json;charset=utf-8")
	public String ticketCheck(String ticketSerial) {
		int result = service.addGiftTicket(ticketSerial);
		if(result>0) {
			//등록가능
			return new Gson().toJson("ok");
		}else {
			//등록완료
			return new Gson().toJson("nope");
		}
	}
	
}
