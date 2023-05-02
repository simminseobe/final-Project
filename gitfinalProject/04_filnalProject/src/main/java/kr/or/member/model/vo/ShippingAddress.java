package kr.or.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShippingAddress {
	private int saNo;
	private int memberNo;
	private String addressOld;
	private String addressNew;
	private String addressDetail;
	private int zipCode;
	private String addressName;
	private String addressPhone;
	private String addressReceiverName;
	
	//전화번호 배열 [0] = 010 [1] = 1111...
	private String[] split;
}
