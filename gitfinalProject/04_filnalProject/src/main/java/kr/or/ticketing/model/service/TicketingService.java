package kr.or.ticketing.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ticketing.model.dao.TicketingDao;

@Service
public class TicketingService {
	@Autowired
	private TicketingDao dao;
}
