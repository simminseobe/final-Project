package kr.or.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.admin.model.dao.AdminDao;
import kr.or.movie.model.vo.Movie;

@Service
public class AdminService {
	@Autowired
	private AdminDao dao;

	public int insertMovie(Movie movie) {
		int result = dao.insertMovie(movie);

		return result;
	}
}
