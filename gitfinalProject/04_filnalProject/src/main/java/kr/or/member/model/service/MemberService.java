package kr.or.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;

	// 로그인
	public Member selectOneMember(Member member) {
		return dao.selectOneMember(member);
	}

	// 아이디 중복체크
	public Member selectOneId(String memberId) {
		return dao.selectOneId(memberId);
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
	
}
