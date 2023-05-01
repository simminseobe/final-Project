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
	private String numOfPeople;//성인,청소년,우대
	private String countArr;//1,2,3
	private String totalAmount;
	private int scheduleNo;
	private int usePoint;
	private int memberNo;
}
