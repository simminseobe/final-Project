package kr.or.movie.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class MoviePostComment {
	private int moviePostCommentNo;
	private int moviePostNo;
	private String movieTitle;
	private String memberId;
	private String postComment;
	private String moviePostCommentDate;
}
