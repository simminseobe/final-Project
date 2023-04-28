package kr.or.point.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPoint;
import kr.or.point.model.dao.PointDao;
import kr.or.point.model.vo.AddUsePoint;
import kr.or.point.model.vo.Point;

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
	//포인트이용내력
	public Point memberPoint(Member m) {
		return  dao.memberPoint(m);
	}
	//포인트 정보 조회
	public ArrayList<MemberPoint> memberPoint(int memberNo) {
		return dao.memberPoint(memberNo);
	}
	
	
}
