package kr.or.ticketing.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.admin.model.vo.Schedule;
import kr.or.admin.model.vo.Theater;
import kr.or.ticketing.model.vo.TheaterLocalCount;

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

	public ArrayList<String> choiceBranchSchedule(HashMap<String, Object> map) {
		System.out.println(map);
		List list = sqlSession.selectList("ticketing.choiceBranchSchedule",map);
		return (ArrayList<String>) list;
	}
}
