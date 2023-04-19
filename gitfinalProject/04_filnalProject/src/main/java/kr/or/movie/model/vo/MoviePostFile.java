package kr.or.movie.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MoviePostFile {
	private int moviePostFileNo;
	private int postNo;
	private String moviePostFileName;
	private String moviePostFilePath;
}
