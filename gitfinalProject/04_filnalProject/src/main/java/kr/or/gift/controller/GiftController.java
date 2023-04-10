package kr.or.gift.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.gift.model.service.GiftService;

@Controller
public class GiftController {
	@Autowired
	private GiftService sv;
	
	@RequestMapping(value = "/allGiftList.do")
	public String allGiftLsit() {
		return "gift/allGiftList";
	}
	
	@RequestMapping(value = "/giftInsertForm.do")
	public String giftInsertForm() {
		return "gift/giftInsertForm";
	}
} 
