package kr.or.ticketing.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reservation {
	private int ticketingNo;
	private String movieTitle;
	private String theaterBranch;
	private int seat;
	private String scheduleStart;
	
	private int payPrice;
}
