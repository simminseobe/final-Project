package kr.or.giftticket.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TicketVO {
	private String giftTicketSerial;
	private int memberNo;
}
