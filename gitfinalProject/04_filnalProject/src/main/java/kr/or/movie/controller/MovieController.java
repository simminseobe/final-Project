package kr.or.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.movie.model.service.MovieService;

@Controller
public class MovieController {
	@Autowired
	private MovieService service;
	
	@RequestMapping(value="/allMovieList.do")
	public String allMovieList() {
		return "movie/movieAllList";
	}
	@RequestMapping(value="/movieDetail.do")
	public String detailMovie() {
		return "movie/movieDetail";
	}
}
