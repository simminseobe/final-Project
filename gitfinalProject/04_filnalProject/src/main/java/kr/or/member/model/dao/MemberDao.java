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
	public Member selectOneId(Member member) {
		Member m = sqlSession.selectOne("member.selectOneId", member);
		return m;
	}
}
