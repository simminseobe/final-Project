package kr.or.movie.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MovieVideo {
	private int videoNo;
	private String videoLink;
	private int movieNo;
}
