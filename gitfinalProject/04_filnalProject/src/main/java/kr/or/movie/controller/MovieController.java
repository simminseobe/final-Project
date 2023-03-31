package kr.or.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.movie.model.service.MovieService;

@Controller
public class MovieController {
	@Autowired
	private MovieService service;
	
	
}