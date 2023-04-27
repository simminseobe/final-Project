package kr.or.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPageData;
import kr.or.member.model.vo.ShoppingAddress;

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
	
	// 페이징 처리
	public MemberPageData selectBookList(int reqPage) {
		int numPerPage = 5;
		
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Member> list = dao.selectBookList(map);
		
		int totalCount = dao.selectBookListCount();
		
		return null;
	}

	
}
