package kr.or.movie.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.movie.model.dao.MovieDao;

@Service
public class MovieService {
	@Autowired
	private MovieDao dao;
}
