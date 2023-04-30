package kr.or.movie.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class myMovie {
	private int memberNo;
	private String memberId;
	private int movieNo;
	private String movieTitle;
	private String moviefileName;
	private String scheduleStart;
	private String theaterBranch;
}
