package kr.or.giftticket.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.giftticket.model.dao.GiftTicketDao;
import kr.or.giftticket.model.vo.TicketVO;
import kr.or.member.model.vo.Member;

@Service
public class GiftTicketService {
	@Autowired
	private GiftTicketDao dao;

	public int addGiftTicket(String giftTicketSerial, int memberNo) {
		TicketVO add = new TicketVO(giftTicketSerial, memberNo);
		
		return dao.addGiftTicket(add);
	}
	
	public int useGiftTicket(String giftTicketSerial, int memberNo) {
		TicketVO use = new TicketVO(giftTicketSerial, memberNo);
		
		return dao.useGiftTicket(use);
	}
	
}
