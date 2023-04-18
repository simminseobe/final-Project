package kr.or.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Schedule {
	private String scheduleNo;
	private String movieTitle;
	private String theaterBranch;
	private String scheduleStart;
	private String scheduleEnd;
}
