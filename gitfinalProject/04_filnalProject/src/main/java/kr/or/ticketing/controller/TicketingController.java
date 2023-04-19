package kr.or.ticketing.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.admin.model.vo.Schedule;
import kr.or.admin.model.vo.Theater;
import kr.or.movie.model.service.MovieService;
import kr.or.movie.model.vo.Movie;
import kr.or.ticketing.model.service.TicketingService;

@Controller
public class TicketingController {
	@Autowired
	private TicketingService service;
	@Autowired
	private MovieService movieService;

	@RequestMapping(value = "/ticketing.do")
	public String ticketing(Model model) {
		ArrayList<Movie> list = movieService.selectMovieAll();
		model.addAttribute("list", list);
		return "ticketing/ticketing";
	}

	@RequestMapping(value = "/ticketing2.do")
	public String ticketing2(Model model) {
		ArrayList<Movie> list = movieService.selectMovieAll();
		model.addAttribute("list", list);
		return "ticketing/ticketing2";
	}

	@RequestMapping(value = "/choiceSeat.do")
	public String choiceSeat() {
		return "ticketing/seat";
	}

	@RequestMapping(value = "/paymentMethod.do")
	public String paymentMethod() {
		return "ticketing/paymentMethod";
	}
	@ResponseBody
	@RequestMapping(value="/choiceDay.do", produces="application/json;charset=utf-8")
	public String selectSchedule(String dataDay) {
		ArrayList<Schedule> list = new ArrayList<Schedule>();
		list = service.selectSchedule(dataDay);
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value="/selectOneTheaterBrch.do")
	public String selectOneTheater(int theaterNo, Model model) {
		Theater theater = service.selectOntTheaterBrch(theaterNo);
		model.addAttribute("theater", theater);
		return "admin/ticketing";
	}
	//////////////////////////////////////////////////////// 임시
	@RequestMapping(value = "/testPage.do")
	public String testPage() {
		return "ticketing/testPage";
	}

	@RequestMapping(value = "/testPage2.do")
	public String testPage2() {
		return "ticketing/testPage2";
	}
	//////////////////////////////////////////////////////// 임시

}
