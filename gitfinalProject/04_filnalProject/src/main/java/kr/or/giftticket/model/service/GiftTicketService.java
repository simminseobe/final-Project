package kr.or.giftticket.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.giftticket.model.dao.GiftTicketDao;
import kr.or.giftticket.model.vo.GiftTicket;
import kr.or.giftticket.model.vo.GiftTicketPageData;
import kr.or.giftticket.model.vo.TicketVO;
import kr.or.member.model.vo.Member;
import kr.or.ticketing.model.vo.Reservation;
import kr.or.ticketing.model.vo.ReservationPageData;

@Service
public class GiftTicketService {
	@Autowired
	private GiftTicketDao dao;

	public int addGiftTicket(String giftTicketSerial, int memberNo) {
		TicketVO add = new TicketVO(giftTicketSerial, memberNo);
		
		return dao.addGiftTicket(add);
	}
	
	public int useGiftTicket(String giftTicketSerial, int memberNo) {
		TicketVO use = new TicketVO(giftTicketSerial, memberNo);
		
		return dao.useGiftTicket(use);
	}
	
	//관람권 조회
	public GiftTicketPageData selectTicketList(int reqPage, int memberNo) {
		int numPerPage = 5;
		
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberNo",  memberNo);
		
		ArrayList<GiftTicket> list = dao.selectTicketList(map);
		
		int totalCount = dao.selectTicketListCount(memberNo);
		
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		
		// 페이지 네비 사이즈
		// 1, 2, 3, 4, 5
		int pageNaviSize = 5;
		
		int pageNo = 1;
		if(reqPage > 3) {
			// 1,2 페이지 외 다른 페이지들은 가운데 부터 시작
			pageNo = reqPage - 2;
		}
		
		// 페이지 네비 생성시작
		String pageNavi = "";
		
		// 이전버튼 생성
		if(pageNo != 1) {
			pageNavi += "<a href='/giftTicket.do?reqPage="+(pageNo-1)+"&memberNo="+memberNo+"'> [이전] </a>";
			// pageNavi = "" + "<a href='/boardList.do?reqPage="+(pageNo-1)+"'>[이전]</a>";
			// pageNavi = <a href='/boardList.do?reqPage="+(pageNo-1)+"'>[이전]</a>;
		}
		
		// 페이지 숫자 생성
		
		// 웹페에지 하단에 보이는 페이지 번호
		// 1, 2, 3, 4, 5
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<span>"+pageNo+"</span>";
			} else {
				pageNavi += "<a href='/giftTicket.do?reqPage="+pageNo+"&memberNo="+memberNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				// pageNavi를 만들지 않게 break
				break;
			}
		}
		
		// 다음버튼
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/giftTicket.do?reqPage="+pageNo+"&memberNo="+memberNo+"'>[다음]</a>";
		}
		
		GiftTicketPageData gtpd = new GiftTicketPageData(list, pageNavi);
		return gtpd;
	}
	
}
