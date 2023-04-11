package kr.or.movie.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.movie.model.service.MovieService;
import kr.or.movie.model.vo.Movie;
import kr.or.movie.model.vo.MovieVideo;

@Controller
public class MovieController {
	@Autowired
	private MovieService service;
	
	@RequestMapping(value="/allMovieList.do")
	public String allMovieList(Model model) {
		ArrayList<Movie> list = service.selectMovieAll();
		model.addAttribute("list", list);
		return "movie/movieAllList";
	}
	
	@RequestMapping(value="/movieDetail.do")
	public String detailMovie(int movieNo, Model model) {
		Movie mov = service.selectOneMovie(movieNo);
		ArrayList<MovieVideo> mvList = service.selectOneMovieVideo(movieNo);
		model.addAttribute("mov", mov);
		model.addAttribute("mvList", mvList);
		return "movie/movieDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="/searchMovieVideo.do",produces = "application/json;charset=utf-8")
	public String searchMovieVideo(int movieNo) {
		ArrayList<MovieVideo> mvList = service.selectOneMovieVideo(movieNo);
//		model.addAttribute("mvmvList", mvList);
		return new Gson().toJson(mvList);
		
	}

	
}
