package kr.or.ticketing.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.admin.model.vo.Schedule;
import kr.or.admin.model.vo.Theater;
import kr.or.ticketing.model.dao.TicketingDao;

@Service
public class TicketingService {
	@Autowired
	private TicketingDao dao;

	public ArrayList<Schedule> selectSchedule(String dataDay) {
		ArrayList<Schedule> list = dao.selectSchedule(dataDay);
		return list;
	}

	public Theater selectOntTheaterBrch(int theaterNo) {
		Theater theater = dao.selectOneTheaterBrch(theaterNo);
		return theater;
	}
}
