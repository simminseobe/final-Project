package kr.or.gift.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Receive {
	private int raNo, orderNo, receiveZipCode;
	private String receiver, receiverPhone, receiveAddressOld, receiveAddressNew, receiveAddressDetail, phone0, phone1, phone2;
}
