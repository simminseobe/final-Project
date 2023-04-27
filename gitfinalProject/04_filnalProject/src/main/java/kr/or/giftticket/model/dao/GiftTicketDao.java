package kr.or.giftticket.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.giftticket.model.vo.TicketVO;
import kr.or.member.model.vo.Member;

@Repository
public class GiftTicketDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int addGiftTicket(TicketVO add) {
		int result = sqlSession.update("giftTicket.addGiftTicket", add);
		return result;
	}
	
	public int useGiftTicket(TicketVO use) {
		int result = sqlSession.update("giftTicket.useGiftTicket", use);
		return result;
	}
	
}
