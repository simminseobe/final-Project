package kr.or.giftticket.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GiftTicketDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
