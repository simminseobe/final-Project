package kr.or.movie.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.SessionScope;

import com.google.gson.Gson;

import kr.or.member.model.vo.Member;
import kr.or.movie.model.service.MovieService;
import kr.or.movie.model.vo.Movie;
import kr.or.movie.model.vo.MovieFile;
import kr.or.movie.model.vo.MovieVideo;
import kr.or.movie.model.vo.Review;
import kr.or.movie.model.vo.ReviewWatch;
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
		model.addAttribute("mov", mov);
		ArrayList<MovieVideo> mvList = service.selectOneMovieVideo(movieNo);
		model.addAttribute("mvList", mvList);
		//모든 관람평(review)조회하기
		ArrayList<Review> reviewList = service.oneMovieAllReview(movieNo);
		model.addAttribute("reviewList",reviewList);
		//로그인한 사람의 관람평을 조회하기
		
		//실관람평점산출위한 watchPoint조회
		Review watchPointAvg = service.onlyWatchPointAvg(movieNo);
		model.addAttribute("watchPointAvg",watchPointAvg);
		//관람포인트별 합산점수조회
		WatchPoint watchPointSum=service.watchPointSum(movieNo);
		model.addAttribute("watchPointSum", watchPointSum);
		//영화별 관람평 갯수를 위한 조회
		int reviewListCount= service.selectReviewListCount(movieNo);
		model.addAttribute("reviewListCount", reviewListCount);
		
		
		return "movie/movieDetail";
	}
	//무비포스트 작성 폼으로 이동
	@RequestMapping(value="/moviePostFrm.do")
	public String moviePostFrm(int movieNo,Model model) {
		//movie_file조회해오기
		ArrayList<MovieFile> movieFileAll=service.selectMovieFileAll(movieNo);
		model.addAttribute("movieFileAll",movieFileAll);
		ArrayList<MovieVideo> mvList = service.selectOneMovieVideo(movieNo);
		model.addAttribute("mvList", mvList);
		return "movie/moviePostFrm";
	}
	//실관람평 인서트
	@RequestMapping(value="/watchPointInsert.do")
	public String reviewInsert(Review rev,WatchPoint wPoint) {
		int result = service.reviewInsert(rev,wPoint);

		return "redirect:/movieDetail.do?movieNo="+rev.getMovieNo();
	}
	//실관람평 수정하기
	@RequestMapping(value="/watchPointUpdate.do")
	public String reviewUpdate(Review rev, WatchPoint wPoint) {
		System.out.println(rev+"컨트롤");
		int result=service.reviewUpdate(rev);
		int wresult=service.watchPointUpdate(wPoint); 
		return "redirect:/movieDetail.do?movieNo="+rev.getMovieNo();
		
		
	}
	//실관람평 삭제하기
	

}
