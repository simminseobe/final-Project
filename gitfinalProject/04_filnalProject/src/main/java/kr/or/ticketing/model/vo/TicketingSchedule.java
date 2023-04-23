package kr.or.ticketing.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TicketingSchedule {
	private String movieTitle;
	private String scheduleStart;
	private String scheduleEnd;
	private String theaterBranch;
}
