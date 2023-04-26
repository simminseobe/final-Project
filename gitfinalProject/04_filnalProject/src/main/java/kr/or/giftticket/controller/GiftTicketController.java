package kr.or.giftticket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.giftticket.model.service.GiftTicketService;

@Controller
public class GiftTicketController {
	@Autowired
	private GiftTicketService service;
	
}
