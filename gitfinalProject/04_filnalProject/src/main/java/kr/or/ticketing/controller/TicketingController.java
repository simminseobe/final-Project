package kr.or.ticketing.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ticketing.model.service.TicketingService;

@Controller
public class TicketingController {
	/*
	 * @Autowired private TicketingService service;
	 */
	
	@RequestMapping(value="/ticketing.do")
	public String ticketing() {
		return "ticketing/ticketing";
	}
	
	@RequestMapping(value="/choiceSeat.do")
	public String choiceSeat() {
		return "ticketing/seat";
	}
}
