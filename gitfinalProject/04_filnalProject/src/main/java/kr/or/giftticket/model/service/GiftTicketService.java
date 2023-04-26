package kr.or.giftticket.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.giftticket.model.dao.GiftTicketDao;

@Service
public class GiftTicketService {
	@Autowired
	private GiftTicketDao dao;

	public int addGiftTicket(String ticketSerial) {
		return dao.addGiftTicket(ticketSerial);
	}
}
