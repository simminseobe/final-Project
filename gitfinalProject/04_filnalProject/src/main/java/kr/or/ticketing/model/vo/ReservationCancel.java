package kr.or.ticketing.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReservationCancel {
	private int ticketingNo;
	private String movieTitle;
	private String theaterBranch;
	private String movieTime;
	private int payPrice;
}
