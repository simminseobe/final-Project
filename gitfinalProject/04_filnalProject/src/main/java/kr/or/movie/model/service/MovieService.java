package kr.or.movie.model.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.or.movie.model.dao.MovieDao;
import kr.or.movie.model.vo.Movie;
import kr.or.movie.model.vo.MovieFile;
import kr.or.movie.model.vo.MovieVideo;
import kr.or.movie.model.vo.Review;
import kr.or.movie.model.vo.WatchPoint;

@Service
public class MovieService {
	@Autowired
	private MovieDao dao;

public ArrayList<Movie> selectMovieAll() {
		
		ArrayList<Movie> list =dao.selectMovieAll();
		for(Movie movie : list) {
			int movieNum= movie.getMovieNo();
			MovieFile movieFile = dao.selectMovieFile(movieNum);
			movie.setMainFile(movieFile);
		}
		return list;
		
	}
	public Movie selectOneMovie(int movieNo) {
		Movie mov = dao.selectOneMovie(movieNo);
		 if(mov !=null) {
			 MovieFile movieFile = dao.selectMovieFile(movieNo);
			 mov.setMainFile(movieFile);
		 }
		return mov;
	}
	public ArrayList<MovieVideo> selectOneMovieVideo(int movieNo) {
		ArrayList<MovieVideo> mv= dao.selectOneMovieVideo(movieNo);	
		return mv;
	}
	//영화 리뷰 인서트
	public int reviewInsert(Review rev, WatchPoint wPoint) {
		int result = dao.reviewInsert(rev);
		if(result>0) {
			wPoint.setReviewCommentNo(rev.getReviewCommentNo());
			result += dao.watchPointInsert(wPoint);
		}
		return result;
	}
	public Review getReview(String memberId) {
		// TODO Auto-generated method stub
		return dao.getReview(memberId);
	}
	
	//한 영화의 관람평 리스트를 모두 조회함
	public ArrayList<Review> oneMovieAllReview(int movieNo) {
		ArrayList<Review> reviewList = dao.oneMovieAllReview(movieNo);
		return reviewList;
	}
	//watchPoint를 위한 조회
	public Movie onlyWatchPointAvg(int movieNo) {
		Movie wpList=dao.onlyWatchPointAvg(movieNo);
		return wpList;
	}

}
