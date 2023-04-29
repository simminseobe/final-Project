package kr.or.point.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPoint;
import kr.or.point.model.dao.PointDao;
import kr.or.point.model.vo.AddUsePoint;
import kr.or.point.model.vo.Point;
import kr.or.point.model.vo.PointPageData;
import kr.or.ticketing.model.vo.ReservationPageData;

@Service
public class PointService {

	@Autowired
	private PointDao dao;
	
	//포인트사용
	public int usePoint(int usePoint, int memberNo) {
		AddUsePoint use = new AddUsePoint(usePoint, memberNo);
		return dao.usePoint(use);
	}
	//포인트적립
	public int addPoint(int addPoint, int memberNo) {
		AddUsePoint add = new AddUsePoint(addPoint, memberNo);
		return dao.addPoint(add);
	}
	
	//포인트 정보 조회
	public ArrayList<MemberPoint> memberPoint(int memberNo) {
		return dao.memberPoint(memberNo);
	}
	
	public PointPageData myPoint(int reqPage, int memberNo) {
		int numPerPage = 5;
		
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberNo",  memberNo);
		
		ArrayList<Point> list = dao.myPoint(map);
		
		int totalCount = dao.myPointCount(memberNo);
		
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
					pageNavi += "<a href='/myPoint.do?reqPage="+(pageNo-1)+"&memberNo="+memberNo+"'>[이전]</a>";
					
					
				}
				
				// 페이지 숫자 생성
				
				// 웹페에지 하단에 보이는 페이지 번호
				// 1, 2, 3, 4, 5
				for(int i=0; i<pageNaviSize; i++) {
					if(pageNo == reqPage) {
						pageNavi += "<span>"+pageNo+"</span>";
					} else {
						pageNavi += "<a href='/myPoint.do?reqPage="+pageNo+"&memberNo="+memberNo+"'>"+pageNo+"</a>";
					}
					pageNo++;
					if(pageNo > totalPage) {
						// pageNavi를 만들지 않게 break
						break;
					}
				}
				
				// 다음버튼
				if(pageNo <= totalPage) {
					pageNavi += "<a href='/myPoint.do?reqPage="+pageNo+"&memberNo="+memberNo+"'>[다음]</a>";
				}
				
				PointPageData ppd = new PointPageData(list, pageNavi);
				return ppd;
			
	}
	
	
}
