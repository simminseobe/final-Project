package kr.or.ticketing.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class TicketingDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
