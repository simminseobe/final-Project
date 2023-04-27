package kr.or.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShoppingAddress {
	private int saNo;
	private int memberNo;
	private String addressOld;
	private String addressNew;
	private String addressDetail;
	private int zipCode;
	private String addressName;
	private String addressPhone;
	private String addressReiceverName;
}
