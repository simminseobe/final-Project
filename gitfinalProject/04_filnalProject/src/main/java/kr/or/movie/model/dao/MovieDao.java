package kr.or.movie.model.dao;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.movie.model.vo.Movie;
import kr.or.movie.model.vo.MovieFile;
import kr.or.movie.model.vo.MovieVideo;
import kr.or.movie.model.vo.Review;
import kr.or.movie.model.vo.WatchPoint;

@Repository
public class MovieDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Movie> selectMovieAll() {
		List list = sqlSession.selectList("movie.selectMovieAll");
		return (ArrayList<Movie>)list;
		
	}
	public MovieFile selectMovieFile(int movieNum) {
		MovieFile result = sqlSession.selectOne("movie.selectMovieFile",movieNum);
		return result;
	}
	public ArrayList<Movie> selectMovieAll(int movieNo) {
		List list = sqlSession.selectList("movie.selectMovieAllDetail",movieNo);
		return (ArrayList<Movie>)list;
	}
	public Movie selectOneMovie(int movieNo) {
		Movie mov =sqlSession.selectOne("movie.selectOneMovie", movieNo);
		
		return mov;
	}
	public ArrayList<MovieVideo> selectOneMovieVideo(int movieNo) {
		List list = sqlSession.selectList("movie.selectOneMovieVideo", movieNo);
		return (ArrayList<MovieVideo>) list;
	}
	public int reviewInsert(Review rev) {
		int result = sqlSession.insert("movie.insertReview",rev);
		return result;
	}
	public int watchPointInsert(WatchPoint wPoint) {
		int result = sqlSession.insert("movie.insertWatchPoint", wPoint);
		return result;
	}
	public Review getReview(String memberId) {
		// TODO Auto-generated method stub
		return (Review)sqlSession.selectOne("movie.getOneReview",memberId);
	}
	public ArrayList<Review> oneMovieAllReview(int movieNo) {
		List list=sqlSession.selectList("movie.oneMovieAllReview", movieNo);
		return (ArrayList<Review>)list;
	}
	public ArrayList<WatchPoint> watchPointAll(int reviewCommentNo) {
		List list = sqlSession.selectList("movie.watchPointAll",reviewCommentNo);
		return (ArrayList<WatchPoint>)list;
	}






}
