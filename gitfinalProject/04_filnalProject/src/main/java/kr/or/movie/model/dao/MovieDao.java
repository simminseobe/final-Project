package kr.or.movie.model.dao;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.movie.model.vo.Movie;
import kr.or.movie.model.vo.MovieFile;
import kr.or.movie.model.vo.MovieVideo;

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
	public MovieVideo selectOneMovieVideo(int movieNo) {
		MovieVideo mv = sqlSession.selectOne("movie.selectOneMovieVideo", movieNo);
		return mv;
	}





}
