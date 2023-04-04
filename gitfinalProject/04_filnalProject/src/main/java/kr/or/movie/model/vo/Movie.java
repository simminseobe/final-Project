package kr.or.movie.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Movie {
	private int moviceNo;
	private String movieTitle;
	private String movieActor;
	private String movieGenre;
	private String movieTime;
	private String movieDate;
	private int movieRating;
	private String movieContent;
	private int movieAudience;
	private String movieDistributor;
	private String fileSociety;
	private String classicSociety;
	private String specialMovie;
	private String enrollMember;
	
}
