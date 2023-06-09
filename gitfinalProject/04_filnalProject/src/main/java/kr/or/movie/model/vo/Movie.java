package kr.or.movie.model.vo;

import java.util.ArrayList;

import kr.or.admin.model.vo.Schedule;
import kr.or.ticketing.model.vo.Ticketing;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Movie {
	private int movieNo;
	private String movieTitle;
	private String movieDirector;
	private String movieActor;
	private String movieGenre;
	private String movieTime;
	private String movieDate;
	private int movieRating;
	private String movieContent;
	private String filmSociety;
	private String classicSociety;
	private String specialMovie;
	private String enrollMember;
	private String movieType;
	private MovieFile mainFile;
	private ArrayList<MovieFile> moviePost;
	private ArrayList<String> movieLink;
	private ArrayList<MovieVideo> movieVideos;
	private Review movieScoreAvg;
	private int likeCount;
	private int likeCheck;
	private double reservationRate;
	private int totalAudience;

}
