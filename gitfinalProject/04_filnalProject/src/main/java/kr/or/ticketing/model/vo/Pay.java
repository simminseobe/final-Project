package kr.or.ticketing.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pay {
	private int payNo;			//결제번호
	private int payPrice;		//총 결제금액
	private String payRegdate;	//결제날짜
	private int payStatus;		//결제상태	//default:1 /1.결제대기/2.결제완료/3.결제취소
	private int memberNo;		//회원번호
}
