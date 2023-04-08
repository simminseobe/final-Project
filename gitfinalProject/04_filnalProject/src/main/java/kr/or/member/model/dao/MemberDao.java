package kr.or.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 로그인
	public Member selectOneMember(Member member) {
		Member m = sqlSession.selectOne("member.selectOneMember", member);
		return m;
	}

	// 아이디 중복체크
	public Member selectOneId(String memberId) {
		Member m = sqlSession.selectOne("member.selectOneId", memberId);
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
		//System.out.println(m);
		Member member = sqlSession.selectOne("member.searchId", m);
		//System.out.println(member);
		return member;
	}
}
