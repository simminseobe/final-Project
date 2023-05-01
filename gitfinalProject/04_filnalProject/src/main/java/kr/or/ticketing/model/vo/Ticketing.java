package kr.or.ticketing.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ticketing {
	private int ticketingNo;
	private String ticketingTime;//
	private int ticketingAge;
	private String seat;
	private int payNo;//
	private int scheduleNo;//
	
}
