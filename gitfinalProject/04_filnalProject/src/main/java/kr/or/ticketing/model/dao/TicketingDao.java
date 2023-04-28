package kr.or.ticketing.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.admin.model.vo.Schedule;
import kr.or.admin.model.vo.Theater;
import kr.or.giftticket.model.vo.GiftTicket;
import kr.or.ticketing.model.vo.Pay;
import kr.or.ticketing.model.vo.TheaterLocalCount;
import kr.or.ticketing.model.vo.Ticketing;
import kr.or.ticketing.model.vo.TicketingInfo;
import kr.or.ticketing.model.vo.TicketingSchedule;

@Repository
public class TicketingDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Schedule> selectSchedule(String dataDay) {
		List list = sqlSession.selectList("ticketing.selectSchedule", dataDay);

		return (ArrayList<Schedule>) list;
	}

	public Theater selectOneTheaterBrch(int theaterNo) {
		Theater theater = sqlSession.selectOne("theater.selectOneTheaterBrch", theaterNo);
		return theater;
	}

	public ArrayList<TheaterLocalCount> choiceDayTheater(HashMap<String, Object> map) {
		List list = sqlSession.selectList("ticketing.choiceDayTheater", map);

		return (ArrayList<TheaterLocalCount>) list;
	}

	public ArrayList<String> choiceLocalBranch(HashMap<String, Object> map) {
		System.out.println(map);
		List list = sqlSession.selectList("ticketing.choiceLocalBranch",map);
		return (ArrayList<String>) list;
	}

	public ArrayList<TicketingSchedule> choiceBranchSchedule(HashMap<String, Object> map) {
		System.out.println(map);
		List list = sqlSession.selectList("ticketing.choiceBranchSchedule",map);
		return (ArrayList<TicketingSchedule>) list;
	}

	public ArrayList<GiftTicket> selectGiftTicket(int memberNo) {
		List giftList = sqlSession.selectList("ticketing.selectGiftTicket",memberNo);
		return (ArrayList<GiftTicket>) giftList;
	}

	public int insertPay(Pay pay, TicketingInfo ticketingInfo) {
		int result = sqlSession.insert("ticketing.insertPay",pay);
		return result;
	}

	public int selectLatestPay() {
		int payNo = sqlSession.selectOne("ticketing.selectLatestPay");
		return payNo;
	}

	public int insertTicketing(Ticketing ticketing) {
		int result = sqlSession.insert("ticketing.insertTicketing",ticketing);
		return result;
	}

	public ArrayList<Schedule> selectSeat(int scheduleNo) {
		List list = sqlSession.selectList("schedule.selectSeat",scheduleNo);
		return (ArrayList<Schedule>)list;
	}

	public String getMovieFile(String movieTitle) {
		String mfp = sqlSession.selectOne("ticketing.getMovieFile",movieTitle);
		System.out.println("mfp : "+mfp);
		return mfp;
	}

	

	
}
