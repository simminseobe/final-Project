package kr.or.ticketing.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TicketingComplete {
	private String movieTitle;
	private String theaterBranch;
	private String choiceDtDay;
	private String scheduleStart;
	private String numOfPeople;
	private String joinSeats;
	private String memberPhone;
	private int payPrice;
}
