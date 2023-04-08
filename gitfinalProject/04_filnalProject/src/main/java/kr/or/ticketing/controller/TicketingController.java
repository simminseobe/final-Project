package kr.or.ticketing.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.movie.model.service.MovieService;
import kr.or.movie.model.vo.Movie;
import kr.or.ticketing.model.service.TicketingService;
import lombok.RequiredArgsConstructor;


@Controller
public class TicketingController {
	
	
	 @Autowired 
	 private TicketingService service;
	 @Autowired 
	 private MovieService movieService;
	 
	
	
	@RequestMapping(value="/ticketing.do")
	public String ticketing(Model model) {
		ArrayList<Movie> list = movieService.selectMovieAll();
		model.addAttribute("list", list);
		return "ticketing/ticketing";
	}
	
	@RequestMapping(value="/choiceSeat.do")
	public String choiceSeat() {
		return "ticketing/seat";
	}
	@RequestMapping(value="/paymentMethod.do")
	public String paymentMethod() {
		return "ticketing/paymentMethod";
	}
	
	
	
}
