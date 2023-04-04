package kr.or.movie.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MovieFile {
	private int movieFileNo;
	private String movieFileName;
	private String movieFilePath;
	private String movieFileCategory;
	private int movieNo;
}
