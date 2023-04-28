package kr.or.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.gift.model.vo.ProductCategory;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPoint;
import kr.or.member.model.vo.ShoppingAddress;
import kr.or.ticketing.model.vo.Reservation;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 로그인
	public Member selectOneMember(Member member) {
		Member m = sqlSession.selectOne("member.selectOneMember", member);
		return m;
	}

	// 회원가입
	public int insertMember(Member m) {
		int result = sqlSession.insert("member.insertMember", m);
		return result;
	}

	// 비밀번호 찾기
	public Member selectPw(Member m) {
		Member member = sqlSession.selectOne("member.selectPw", m);
		return member;
	}

	// Modal 아이디, 가입일 띄우기
	public Member searchId(Member m) {
		Member member = sqlSession.selectOne("member.searchId", m);
		return member;
	}

	// 개인정보 수정
	public int updateMember(Member member) {
		int result = sqlSession.update("member.updateMember", member);
		return result;
	}

	// 회원탈퇴
	public int deleteMember(int memberNo) {
		int result = sqlSession.delete("member.deleteMember", memberNo);
		return result;
	}

	// 마이페이지 -> 비밀번호 변경
	public int updatePw(Member member) {
		int result = sqlSession.update("member.updatePw", member);
		return result;
	}

	// 아이디 중복체크 버튼 클릭
	public Member selectId(Member m) {
		Member member = sqlSession.selectOne("member.selectId", m);
		return member;
	}

	// 임시비밀번호로 pw 변경
	public int updatePwMember(Member member) {
		int result = sqlSession.update("member.updatePwMember", member);
		return result;
	}

	// 카카오 로그인
	public Member selectOneKaKao(Member member) {
		Member m = sqlSession.selectOne("member.selectOneKakao", member);
		return m;
	}

	// 네이버 로그인
	public Member selectOneNaver(Member member) {
		Member m = sqlSession.selectOne("member.selectOneNaver", member);
		return m;
	}

	// 배송지 정보 조회
	public ArrayList<ShoppingAddress> shopAddress(int memberNo) {
		List list = sqlSession.selectList("member.shopAddress", memberNo);
		return (ArrayList<ShoppingAddress>)list;
	}
	
	// 예매/구매 내역 조회
	public ArrayList<Reservation> selectBookList(HashMap<String, Object> map) {
		List list  = sqlSession.selectList("member.selectBookList", map);
		return (ArrayList<Reservation>)list;
	}

	// 전체 게시물 수 조회
	public int selectBookListCount() {
		int totalCount = sqlSession.selectOne("member.totalCount");
		return totalCount;
	}

	//포인트 정보 조회
	public ArrayList<MemberPoint> memberPoint(int memberNo) {
		List list = sqlSession.selectList("member.memberPoint",memberNo);
		return (ArrayList<MemberPoint>)list;
	}

	//잔여포인트 조회
	
	public int mpAmount(int memberNo) {
		int mpAmount = sqlSession.selectOne("member.mpAmount",memberNo);
		return mpAmount;
	}
	

}
