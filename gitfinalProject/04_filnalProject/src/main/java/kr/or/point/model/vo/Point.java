package kr.or.point.model.vo;

import kr.or.member.model.vo.Member;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Point {
	private int pointNo;
	private int memberNo;
	private int pointAmount;
	private String pointStatus;
	private String pointDetail;
	private String pointDate;
	
}
