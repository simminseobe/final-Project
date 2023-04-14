package kr.or.movie.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.member.model.vo.Member;
import kr.or.movie.model.service.MovieService;
import kr.or.movie.model.vo.Movie;
import kr.or.movie.model.vo.MovieVideo;
import kr.or.movie.model.vo.Review;
import kr.or.movie.model.vo.WatchPoint;

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
		//모든 관람평(review)조회하기
		model.addAttribute("mvList", mvList);
		ArrayList<Review> reviewList = service.oneMovieAllReview(movieNo);
		model.addAttribute("reviewList",reviewList);
		//실관람평점산출위한 watchPoint조회
		Movie watchPointAvg = service.onlyWatchPointAvg(movieNo);
		model.addAttribute("watchPointAvg",watchPointAvg);
		
		return "movie/movieDetail";
	}
	//무비포스트 작성 폼으로 이동
	@RequestMapping(value="/moviePostFrm.do")
	public String moviePostFrm(int movieNo,Model model) {
		return "movie/moviePostFrm";
	}
	//실관람평 인서트
	//@ResponseBody
	@RequestMapping(value="/watchPointInsert.do")
	public String reviewInsert(Review rev,WatchPoint wPoint) {
		int result = service.reviewInsert(rev,wPoint);
		return "redirect:/movieDetail.do?movieNo="+rev.getMovieNo();
	}
    /*
	//@ResponseBody
	@RequestMapping(value="/checkReview.do", produces="application/json;charset=utf-8")
	public String checkReviewTest(String memberId) {
		System.out.println(memberId);
		Review review = service.getReview(memberId);
		System.out.println(review);
		String result = "no";
		if(review == null)  return "ok" ;
		return result;
	}*/
	
	//모든 관람평(review)조회하기
	/*@ResponseBody
	@RequestMapping(value="oneMovieReviewList.do",produces="application/json;charset=utf-8")
	public String oneMovieAllReview(int movieNo) {
		System.out.println(reviewList);
		return new Gson().toJson(reviewList);
	}

	*/
}
