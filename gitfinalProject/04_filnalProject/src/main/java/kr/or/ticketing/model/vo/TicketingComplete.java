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
	private String memberPhone;//하이픈(-)없음
	private String memberHyphenPhone;//하이픈(-)있음 (출력용)
	private int payPrice;
	private int payNo;
}
