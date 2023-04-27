package kr.or.ticketing.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TicketingInfo {
	private String movieTitle;
	private String theaterBranch;
	private String scheduleStartEnd;
	private String choiceDtDay;
	private String joinSeats;
	private String numOfPeople;
	private String totalAmount;
	private int scheduleNo;
}
