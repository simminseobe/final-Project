package kr.or.ticketing.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;

import kr.or.admin.model.vo.Schedule;
import kr.or.admin.model.vo.Theater;
import kr.or.giftticket.model.vo.GiftTicket;
import kr.or.member.model.vo.Member;
import kr.or.movie.model.service.MovieService;
import kr.or.movie.model.vo.Movie;
import kr.or.ticketing.model.service.TicketingService;
import kr.or.ticketing.model.vo.ChoiceDataDay;
import kr.or.ticketing.model.vo.TheaterLocalCount;
import kr.or.ticketing.model.vo.TicketingInfo;
import kr.or.ticketing.model.vo.TicketingSchedule;

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
	public String choiceOneticket(Schedule schedule, ChoiceDataDay choiceDataDay, Model model) {
		model.addAttribute("choiceDataDay",choiceDataDay);
		model.addAttribute("schedule",schedule);
		return "ticketing/choiceSeat";
	}

	@RequestMapping(value = "/paymentMethod.do")
	public String paymentMethod(TicketingInfo ticketingInfo, Model model, @SessionAttribute(required=false)Member m) {
		model.addAttribute("TicketingInfo",ticketingInfo);
		int memberNo = m.getMemberNo();
		ArrayList<GiftTicket> giftList = service.selectGiftTicket(memberNo);
		System.out.println("giftList : "+giftList);
		return "ticketing/paymentMethod";
	}

	@ResponseBody
	@RequestMapping(value = "/choiceDay.do", produces = "application/json;charset=utf-8")
	public String selectSchedule(String dataDay) {
		ArrayList<Schedule> list = new ArrayList<Schedule>();

		list = service.selectSchedule(dataDay);

		return new Gson().toJson(list);
	}

	@RequestMapping(value = "/selectOneTheaterBrch.do")
	public String selectOneTheater(int theaterNo, Model model) {
		Theater theater = service.selectOntTheaterBrch(theaterNo);
		model.addAttribute("theater", theater);
		return "admin/detailTheater";
	}

	@ResponseBody
	@RequestMapping(value = "/choiceDayTheater.do", produces = "application/json;charset=utf-8")
	public String choiceDayTheater(String movieTitle, String choiceDataDay) {
		ArrayList<TheaterLocalCount> list = service.choiceDayTheater(movieTitle, choiceDataDay);

		System.out.println(movieTitle);
		System.out.println(choiceDataDay);

		return new Gson().toJson(list);
	}
	@ResponseBody
	@RequestMapping(value="/choiceLocalBranch.do", produces = "application/json;charset=utf-8")
	public String choiceLocalBranch(String movieTitle, String choiceDataDay, String theaterLocal) {
		ArrayList<String> list = service.choiceLocalBranch(movieTitle, choiceDataDay, theaterLocal);

		System.out.println(movieTitle);
		System.out.println(choiceDataDay);
		System.out.println(theaterLocal);
		System.out.println(list);
		
		return new Gson().toJson(list);
	}
	@ResponseBody
	@RequestMapping(value="/choiceBranchSchedule.do", produces = "application/json;charset=utf-8")
	public String choiceBranchSchedule(String movieTitle, String choiceDataDay, String theaterBranch) {
		ArrayList<TicketingSchedule> list = service.choiceBranchSchedule(movieTitle, choiceDataDay, theaterBranch);
		
		System.out.println(movieTitle);
		System.out.println(choiceDataDay);
		System.out.println(theaterBranch);
		System.out.println(list);
		
		return new Gson().toJson(list);
	}

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/paymentPage.do", produces =
	 * "application/json;charset=utf-8") public String paying(int payPrice) { int
	 * result = service.paying(payPrice);
	 * 
	 * return new Gson().toJson(result); }
	 */
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
