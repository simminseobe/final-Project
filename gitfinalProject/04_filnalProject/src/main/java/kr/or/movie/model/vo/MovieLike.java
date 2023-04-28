package kr.or.movie.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class MovieLike {
	private int movieLike;
	private int movieNo;
	private int memberNo;
	private int likeCount;
	
}
