package kr.or.point.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPoint;
import kr.or.point.model.vo.AddUsePoint;
import kr.or.point.model.vo.Point;
import kr.or.ticketing.model.vo.Reservation;

@Repository
public class PointDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	//포인트사용
	public int usePoint(AddUsePoint use) {
		int result = sqlSession.insert("point.usePoint", use);
		return result;
	}
	
	//포인트적립
	public int addPoint(AddUsePoint add) {
		int result = sqlSession.insert("point.addPoint", add);
		return result;
	}

	
	//포인트 정보 조회
	public ArrayList<MemberPoint> memberPoint(int memberNo) {
		List list = sqlSession.selectList("point.memberPoint",memberNo);
		return (ArrayList<MemberPoint>)list;
	}

	//포인트 이용내역 (페이지내비 o)
	public ArrayList<Point> myPoint(HashMap<String, Object> map) {
		List list  = sqlSession.selectList("point.myPoint", map);
		return (ArrayList<Point>)list;
	}

	//전체게시물 수 조회
	public int myPointCount(int memberNo) {
		int totalCount = sqlSession.selectOne("point.totalCount", memberNo);
		return totalCount;
	}
}
