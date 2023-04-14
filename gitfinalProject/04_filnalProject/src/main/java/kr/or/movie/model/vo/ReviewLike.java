package kr.or.movie.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewLike {
	private int reviewLikeNo;
	private int reviewCommentNo;
	private int memberNo;
}
