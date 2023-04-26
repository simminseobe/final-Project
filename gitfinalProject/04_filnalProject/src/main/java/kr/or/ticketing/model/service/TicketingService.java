package kr.or.ticketing.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.admin.model.vo.Schedule;
import kr.or.admin.model.vo.Theater;
import kr.or.giftticket.model.vo.GiftTicket;
import kr.or.ticketing.model.dao.TicketingDao;
import kr.or.ticketing.model.vo.TheaterLocalCount;
import kr.or.ticketing.model.vo.TicketingSchedule;

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

	public ArrayList<TheaterLocalCount> choiceDayTheater(String movieTitle, String choiceDataDay) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("movieTitle", movieTitle);
		map.put("choiceDataDay", choiceDataDay);

		ArrayList<TheaterLocalCount> list = dao.choiceDayTheater(map);

		return list;
	}

	public ArrayList<String> choiceLocalBranch(String movieTitle, String choiceDataDay,
			String theaterLocal) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("movieTitle", movieTitle);
		map.put("choiceDataDay", choiceDataDay);
		map.put("theaterLocal", theaterLocal);

		ArrayList<String> list = dao.choiceLocalBranch(map);

		return list;
	}

	public ArrayList<TicketingSchedule> choiceBranchSchedule(String movieTitle, String choiceDataDay, String theaterBranch) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("movieTitle", movieTitle);
		map.put("choiceDataDay", choiceDataDay);
		map.put("theaterBranch", theaterBranch);

		ArrayList<TicketingSchedule> list = dao.choiceBranchSchedule(map);

		return list;
	}

	public ArrayList<GiftTicket> selectGiftTicket(int memberNo) {
		ArrayList<GiftTicket> giftList = dao.selectGiftTicket(memberNo);
		return (ArrayList<GiftTicket>) giftList;
	}

	
}
