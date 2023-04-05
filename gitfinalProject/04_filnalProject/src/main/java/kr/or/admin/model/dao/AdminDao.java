package kr.or.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.movie.model.vo.Movie;
import kr.or.movie.model.vo.MovieFile;
import kr.or.movie.model.vo.MovieVideo;

@Repository
public class AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertMovie(Movie movie) {
		int result = sqlSession.insert("movie.insertMovie", movie);

		return result;
	}

	public int insertMainFile(MovieFile mainFile) {
		int result = sqlSession.insert("movie.insertMainFile", mainFile);

		return result;
	}

	public int insertPostFile(MovieFile file) {
		int result = sqlSession.insert("movie.insertPostFile", file);

		return result;
	}

	public int insertmovieVideo(MovieVideo video) {
		int result = sqlSession.insert("movie.insertmovieVideo", video);

		return result;
	}
}
