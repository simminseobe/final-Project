package kr.or.point.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;
import kr.or.point.model.vo.Point;

@Repository
public class PointDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	//포인트사용
	public int usePoint(Point uPoint) {
		int result = sqlSession.selectOne("point.usePoint", uPoint);
		return result;
	}
	
	//포인트적립
	public int savePoint(Point sPoint) {
		int result = sqlSession.selectOne("point.savePoint", sPoint);
		return result;
	}
	
	//포인트이용내력
	public Point memberPoint(Member m) {
		Point p = sqlSession.selectOne("point.memberPoint", m);
		 return p;
	}
}
