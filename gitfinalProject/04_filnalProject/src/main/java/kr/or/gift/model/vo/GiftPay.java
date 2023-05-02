package kr.or.gift.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GiftPay {
	private int gpNo, orderNo, memberNo;
	private String payMethod, gpDate;
}
