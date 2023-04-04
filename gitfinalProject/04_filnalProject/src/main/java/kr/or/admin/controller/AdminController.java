package kr.or.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.admin.model.service.AdminService;
import kr.or.movie.model.vo.Movie;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;

	@RequestMapping("/adminPage.do")
	public String adminPage() {
		return "admin/adminPage";
	}

	@RequestMapping(value = "/registerMovieFrm.do")
	public String registerMovieFrm() {
		return "admin/registerMovieFrm";
	}

	@RequestMapping(value = "/registerMovie.do")
	public String registerMovie(Movie movie) {
		int result = service.insertMovie(movie);

		return "admin/registerMovieFrm";
	}
}
