package kr.or.giftticket.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.giftticket.model.vo.GiftTicket;
import kr.or.giftticket.model.vo.TicketVO;
import kr.or.member.model.vo.Member;
import kr.or.ticketing.model.vo.Reservation;

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

	public ArrayList<GiftTicket> selectTicketList(HashMap<String, Object> map) {
			List list  = sqlSession.selectList("giftTicket.selectTicketList", map);
			return (ArrayList<GiftTicket>)list;
	}

	public int selectTicketListCount(int memberNo) {
			int totalCount = sqlSession.selectOne("giftTicket.selectTicketListCount",memberNo);
			return totalCount;
		
	}
	
}
