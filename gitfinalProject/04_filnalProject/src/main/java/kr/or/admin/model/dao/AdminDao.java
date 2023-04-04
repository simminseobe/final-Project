package kr.or.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.movie.model.vo.Movie;

@Repository
public class AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertMovie(Movie movie) {
		int result = sqlSession.insert("movie.insertMovie", movie);

		return result;
	}
}
