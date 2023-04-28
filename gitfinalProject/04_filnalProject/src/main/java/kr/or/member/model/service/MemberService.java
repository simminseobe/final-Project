package kr.or.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPoint;
import kr.or.member.model.vo.ShoppingAddress;
import kr.or.ticketing.model.vo.Reservation;
import kr.or.ticketing.model.vo.ReservationPageData;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;

	// 로그인
	public Member selectOneMember(Member member) {
		return dao.selectOneMember(member);
	}

	// 회원가입
	public int insertMember(Member m) {
		return dao.insertMember(m);
	}

	// 비밀번호 찾기
	public Member selectPw(Member m) {
		return dao.selectPw(m);
	}

	// Modal 아이디, 가입일 띄우기
	public Member searchId(Member m) {
		return dao.searchId(m);
	}

	// 개인정보 수정
	public int updateMember(Member member) {
		return dao.updateMember(member);
	}

	// 회원탈퇴
	public int deleteMember(int memberNo) {
		return dao.deleteMember(memberNo);
	}

	// 마이페이지 → 비밀번호 변경
	public int updatePw(Member member, String newPassword) {
		return dao.updatePw(member);
	}

	// 아이디 중복체크 버튼 클릭
	public Member selectId(Member m) {
		return dao.selectId(m);
	}

	// 임시비밀번호로 pw 변경
	public int updatePwMember(Member member) {
		return dao.updatePwMember(member);
	}

	// 카카오 로그인
	public Member selectOneKaKao(Member member) {
		return dao.selectOneKaKao(member);
	}

	// 네이버 로그인
	public Member selectOneNaver(Member member) {
		return dao.selectOneNaver(member);
	}

	// 배송지 정보 조회
	public ArrayList<ShoppingAddress> shopAddress(int memberNo) {
		return dao.shopAddress(memberNo);
	}
	
	//포인트 정보 조회
	public ArrayList<MemberPoint> memberPoint(int memberNo) {
		return dao.memberPoint(memberNo);
	}
	
	//잔여포인트 조회
	
	public int mpAmount(int memberNo) {
		return dao.mpAmount(memberNo);
	}
	
	// 페이징 처리
	public ReservationPageData selectBookList(int reqPage, int memberNo) {
		int numPerPage = 5;
		
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberNo",  memberNo);
		
		ArrayList<Reservation> list = dao.selectBookList(map);
		
		int totalCount = dao.selectBookListCount();
		
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
			pageNavi += "<a href='/purchaseDetail.do?reqPage="+(pageNo-1)+"'>[이전]</a>";
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
				pageNavi += "<a href='/purchaseDetail.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				// pageNavi를 만들지 않게 break
				break;
			}
		}
		
		// 다음버튼
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/purchaseDetail.do?reqPage="+pageNo+"'>[다음]</a>";
		}
		
		ReservationPageData rpd = new ReservationPageData(list, pageNavi);
		return rpd;
	}

	
}
