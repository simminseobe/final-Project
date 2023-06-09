package kr.or.movie.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MoviePost {
	private int moviePostNo;
	private int movieNo;
	private int movieVideoNo;
	private int movieFileNo;
	private String memberId;
	private String movieTitle;
	private String moviePostContent;
	private String moviePostDate;
	private String movieFilePath;
	private String videoLink;
	private ArrayList<MoviePostComment> moviePostComment;
}
