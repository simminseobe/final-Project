package kr.or.movie.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WatchPoint {
	private int watchPointNo;
	private int reviewCommentNo;
	private int story;
	private int actor;
	private int ost;
	private int videoVisual;
	private int production;
}
