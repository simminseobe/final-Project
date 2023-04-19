package kr.or.ticketing.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.admin.model.vo.Schedule;
import kr.or.admin.model.vo.Theater;
@Repository
public class TicketingDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Schedule> selectSchedule(String dataDay) {
		List list = sqlSession.selectList("schedule.selectSchedule",dataDay);
		return (ArrayList<Schedule>)list;
	}

	public Theater selectOneTheaterBrch(int theaterNo) {
		Theater theater = sqlSession.selectOne("theater.selectOneTheaterBrch", theaterNo);
		return theater;
	}

	public int choiceDayTheater(String movieTitle, String choiceDataDay) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("movieTitle", movieTitle);
		map.put("choiceDataDay", choiceDataDay);
		System.out.println(map);
		int result = sqlSession.selectOne("ticketing.choiceDayTheater",map);
		return result;
	}
}
