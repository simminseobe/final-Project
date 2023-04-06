package kr.or.gift.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GiftController {

	
	@RequestMapping(value = "/allGiftList.do")
	public String allGiftLsit() {
		return "gift/allGiftList";
	}
}
