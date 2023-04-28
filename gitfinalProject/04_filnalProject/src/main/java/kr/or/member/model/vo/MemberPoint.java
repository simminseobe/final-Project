package kr.or.member.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberPoint {
	private int pointNo;
	private int memberNo;
	private int pointAmount;
	private String pointStatus;
	private String pointDetail;
	private String pointDate;
}
