package kr.or.point.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.member.model.vo.Member;
import kr.or.point.model.dao.PointDao;
import kr.or.point.model.vo.Point;

@Service
public class PointService {

	@Autowired
	private PointDao dao;
	
	//포인트사용
	public int usePoint(Point uPoint) {
		int result = dao.usePoint(uPoint);
		return result;
	}
	//포인트적립
	public int savePoint(Point sPoint) {
		int result = dao.savePoint(sPoint);
		return result;
	}
	//포인트이용내력
	public Point memberPoint(Member m) {
		return  dao.memberPoint(m);
	}
	
	
}
