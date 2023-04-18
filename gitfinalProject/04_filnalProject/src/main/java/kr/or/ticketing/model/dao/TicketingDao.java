package kr.or.ticketing.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.admin.model.vo.Schedule;
@Repository
public class TicketingDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Schedule> selectSchedule(String dataDay) {
		List list = sqlSession.selectList("schedule.selectSchedule",dataDay);
		return (ArrayList<Schedule>)list;
	}
}
