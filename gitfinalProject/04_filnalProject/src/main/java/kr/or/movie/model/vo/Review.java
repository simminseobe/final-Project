package kr.or.movie.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
	private int reviewCommentNo;
	private int movieNo;
	private String memberId;
	private String reviewContent;
	private int movieScore;
	private String reviewDate;

	private int watchPointNo;
	private int story;
	private int actor;
	private int ost;
	private int videoVisual;
	private int production;
	
}
