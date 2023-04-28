package kr.or.ticketing.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReservationCancel {
	private int payNo;
	private String movieTitle;
	private String theaterBranch;
	private ArrayList<String> seat;
	private String scheduleStart;
	private String movieDate;
	private int payPrice;
	private ArrayList<People> list;
}
