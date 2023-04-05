package kr.or.movie.model.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.movie.model.vo.Movie;

@Repository
public class MovieDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Movie> movieList() throws Exception{
		return null;
		
		
	
	}
}
