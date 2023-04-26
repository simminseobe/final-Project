package kr.or.gift.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GiftTicket {
	private int giftTicketNo;
	private String giftTicketSerial;
	private String giftTicketName;
	private String giftTicketDate;
	private String giftTicketStatus;
	private String memberNo;
}
