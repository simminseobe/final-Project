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
		return (ArrayList<Movie>) list;

	}

	public MovieFile selectMovieFile(int movieNum) {
		MovieFile result = sqlSession.selectOne("movie.selectMovieFile", movieNum);
		return result;
	}

	public ArrayList<MovieFile> selectMoviePost(int movieNo) {
		List list = sqlSession.selectList("movie.selectMoviePost", movieNo);

		return (ArrayList<MovieFile>) list;
	}

	public ArrayList<Movie> selectMovieAll(int movieNo) {
		List list = sqlSession.selectList("movie.selectMovieAllDetail", movieNo);
		return (ArrayList<Movie>) list;
	}

	public Movie selectOneMovie(int movieNo) {
		Movie mov = sqlSession.selectOne("movie.selectOneMovie", movieNo);

		return mov;
	}

	public ArrayList<MovieVideo> selectOneMovieVideo(int movieNo) {
		List list = sqlSession.selectList("movie.selectOneMovieVideo", movieNo);
		return (ArrayList<MovieVideo>) list;
	}

	public Movie selectOneUpdateMovie(int movieNo) {
		Movie movie = sqlSession.selectOne("movie.selectOneUpdateMovie", movieNo);

		return movie;
	}

}
