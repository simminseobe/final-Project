package kr.or.movie.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.request.SessionScope;

import com.google.gson.Gson;

import kr.or.member.model.vo.Member;
import kr.or.movie.model.service.MovieService;
import kr.or.movie.model.vo.Movie;
import kr.or.movie.model.vo.MovieFile;
import kr.or.movie.model.vo.MovieLike;
import kr.or.movie.model.vo.MoviePost;
import kr.or.movie.model.vo.MoviePostComment;
import kr.or.movie.model.vo.MovieVideo;
import kr.or.movie.model.vo.Review;
import kr.or.movie.model.vo.ReviewLike;
import kr.or.movie.model.vo.ReviewPageData;
import kr.or.movie.model.vo.ReviewWatch;
import kr.or.movie.model.vo.WatchPoint;
import sun.util.logging.resources.logging;

@Controller
public class MovieController {
	@Autowired
	private MovieService service;
	
	@RequestMapping(value="/allMovieList.do")
	public String allMovieList(Model model, @SessionAttribute(required = false) Member m) {
		//영화전체 조회와 관람평점이 들어가 있음
		int memberNo = 0;
		if(m!=null) {
			memberNo = m.getMemberNo();
		}
		
		ArrayList<Movie> list = service.selectMovieAll(memberNo);
		model.addAttribute("list", list);
		
		int movieListCount= service.selectMovieListCount();
		model.addAttribute("movieListCount", movieListCount);
		
		//사용자선호 영화
		ArrayList<Movie> favoriteMovieList =service.selectFavoriteMovie(memberNo);
		model.addAttribute("favoriteMovieList", favoriteMovieList);
		//사용자 선호 영화  총 갯수 조회를 위함
		int favoriteMovieCount = service.selectFavoriteMovieCount(memberNo);
		model.addAttribute("favoriteMovieCount",favoriteMovieCount);
		 
		//상영예정작 조회와 관람평점이 들어가 있음
		ArrayList<Movie> expectedList = service.expectedMovie(memberNo);
		model.addAttribute("expectedList",expectedList);
		//상영예정작 총 갯수 조회를 위함
		int expectedMovieCount = service.selectExpectedMovieCount();
		model.addAttribute("expectedMovieCount",expectedMovieCount);
		
		//특별상영 조회와 관람평점
		ArrayList<Movie> specialList = service.specialMovie(memberNo);
		model.addAttribute("specialList",specialList);
		//특별상영작 총 갯수 조회를 위함
		int specialMovieCount=service.selectSpecialMovieCount();
		model.addAttribute("specialMovieCount",specialMovieCount);
		
		//필름소사이어티 조회와 관람평점
		ArrayList<Movie> filmSocietyList = service.filmSocietyList(memberNo);
		model.addAttribute("filmSocietyList",filmSocietyList);
		//필름소사이어트 총 갯수 조회를 위함
		int filmSocietyCount=service.selectFilmSocietyCount();
		model.addAttribute("filmSocietyCount",filmSocietyCount);
		
		//클래식소사이어티 조회와 관람평점
		ArrayList<Movie> classicSocietyList = service.classicSocietyList(memberNo);
		model.addAttribute("classicSocietyList",classicSocietyList);
		//클래식소사이어티 총 갯수 조회를 위함
		int classicSocietyCount=service.selectclassicSocietyCount();
		model.addAttribute("classicSocietyCount",classicSocietyCount);
		
		return "movie/movieAllList";
	}
	
	@RequestMapping(value="/movieDetail.do")
	public String detailMovie(int movieNo,int reqPage, Model model,@SessionAttribute(required = false) Member m) {
		int memberNo=0;
		if(m != null) {
			memberNo = m.getMemberNo();
		}
		
		Movie mov = service.selectOneMovie(movieNo);		//1, 7(1.영화정보 / 7.영화포스터file)
		model.addAttribute("mov", mov);
		ReviewPageData rpd=service.selectReviewList(movieNo,reqPage);//(2.페이징된 리뷰리스트)
		model.addAttribute("pageList",rpd.getList());
		model.addAttribute("pageNavi",rpd.getPageNavi());

		//3번없음
		//영화좋아요 갯수 조회
		
		
		
		/*
		 * int movieLikeCount=service.movieLikeCount(movieNo);
		 * model.addAttribute("movieLikeCount",movieLikeCount);
		 */
		
		//4.무비포스트 리스트(무비포스트 리스트)
		ArrayList<MoviePost> oneMoviepostAll=service.oneMovieAllPost(movieNo);
		model.addAttribute("oneMoviepostAll",oneMoviepostAll);
	
		//무비포스트 총 개수
		int moviePostCount=service.moviePostCount(movieNo);
		model.addAttribute("moviePostCount",moviePostCount);
		
		//모든 관람평(review)조회하기
		ArrayList<Review> reviewList = service.oneMovieAllReview(movieNo);//(5.관람포인트 / 리뷰 수정 위한 리뷰조회)
		model.addAttribute("reviewList",reviewList);
		
		//아이디로 관람평 조회
		//Review oneReview = service.selectOneReview();
		
		//관람포인트별 합산점수조회
		WatchPoint watchPointSum=service.watchPointSum(movieNo);//(5-1.관람포인트 합산)
		model.addAttribute("watchPointSum", watchPointSum);
		
		//영화 비디오
		ArrayList<MovieVideo> mvList = service.selectOneMovieVideo(movieNo);//(6.영화비디오조회)
		model.addAttribute("mvList", mvList);
		
		
		
		//9.예매율 없음
		
		//10.누적관객수 조회
		
		//실관람평점산출위한 watchPoint조회
		Review watchPointAvg = service.onlyWatchPointAvg(movieNo);//(12.실관람평점영화평점)
		model.addAttribute("watchPointAvg",watchPointAvg);
		
		//영화별 관람평 갯수를 위한 조회
		int reviewListCount= service.selectReviewListCount(movieNo);
		model.addAttribute("reviewListCount", reviewListCount);
		
		//스틸컷(movie_file) 조회
		ArrayList<MovieFile> movieFileList =service.selectFileList(movieNo);
		model.addAttribute("movieFileList", movieFileList);
		

		
		
		
		
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
		Movie mov = service.selectOneMovie(movieNo);
		model.addAttribute("mov", mov);
		
		return "movie/moviePostFrm";
	}
	//실관람평 인서트
	@RequestMapping(value="/watchPointInsert.do")
	public String reviewInsert(Review rev,WatchPoint wPoint) {
		int result = service.reviewInsert(rev,wPoint);

		return "redirect:/movieDetail.do?movieNo="+rev.getMovieNo()+"&reqPage=1";
	}
	//실관람평 수정하기
	@RequestMapping(value="/watchPointUpdate.do")
	public String reviewUpdate(Review rev, WatchPoint wPoint) {
		int result=service.reviewUpdate(rev);
		int wresult=service.watchPointUpdate(wPoint); 
		return "redirect:/movieDetail.do?movieNo="+rev.getMovieNo()+"&reqPage=1";
		
		
	}
	//실관람평 삭제하기
	@RequestMapping(value="/deleteReview.do")
	public String reviewDelete(int reviewCommentNo,int movieNo) {
		int result = service.deleteReview(reviewCommentNo);
		int wresult = service.deleteWatchPoint(reviewCommentNo);
		return  "redirect:/movieDetail.do?movieNo="+movieNo+"&reqPage=1";
	}
	 
	//무비포스트 등록
	@RequestMapping(value="/moviePostInsert.do")
	public String moviePostInsert(MoviePost post) {
		int result = service.postInsert(post);
		
		return "redirect:/movieDetail.do?movieNo="+post.getMovieNo()+"&reqPage=1";
		
	}
	//무비포스트 상세보기
	@ResponseBody
	@RequestMapping(value="/moviePostDetail.do", produces = "application/json;charset=utf-8")
	public String moviePostDetail(int moviePostNo,Model model) {
		MoviePost moviePostOne= service.selectDetailPost(moviePostNo);
		
		
		return new Gson().toJson(moviePostOne);
		
		
	}
	@ResponseBody
	@RequestMapping(value="/insertPostComment.do")
	public String insertPostComment(MoviePostComment mpc) {
		System.out.println(mpc);
		int result =service.insertPostComment(mpc);

		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/updatePostComment.do")
	public String updatePostComment(MoviePostComment mpc) {
		int result=service.updatePostComment(mpc);
		System.out.println(mpc);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	@ResponseBody
	@RequestMapping(value="deletePostComment.do")
	public String deletePostComment(int moviePostCommentNo) {
		int result=service.deletePostComment(moviePostCommentNo);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		
		
	}
	
	@RequestMapping (value="/postAllList.do")
	public String postAllList() {
		return "movie/moviePostAll";
		
	}
	
	@RequestMapping(value="moviePostUpdateFrm.do")
	public String postUpdateFrm(int moviePostNo,int movieNo,Model model) {
		MoviePost moviePost=service.selectOneMoviePost(moviePostNo);
		model.addAttribute("moviePost", moviePost);
		//movie_file조회해오기
				ArrayList<MovieFile> movieFileAll=service.selectMovieFileAll(movieNo);
				model.addAttribute("movieFileAll",movieFileAll);
				ArrayList<MovieVideo> mvList = service.selectOneMovieVideo(movieNo);
				model.addAttribute("mvList", mvList);
				Movie mov = service.selectOneMovie(movieNo);
				model.addAttribute("mov", mov);
		return "movie/moviePostUpdateFrm";
		
	}
	
	@RequestMapping(value="/updatePost.do")
	public String postUpdate(MoviePost moviePost,int movieNo) {
		int result = service.postUpdate(moviePost);
		System.out.println(moviePost);
		return "redirect:/movieDetail.do?movieNo="+movieNo+"&reqPage=1";
		
	}
	
	@RequestMapping(value="/moviePostDelete.do")
	public String postDelete(MoviePost moviePost, int movieNo) {
		int result = service.postDelete(moviePost);
		return "redirect:/movieDetail.do?movieNo="+movieNo+"&reqPage=1";
		
	}
	//영화좋아요 insert
	@ResponseBody
	@RequestMapping(value="/movieLikeInsert.do")
	public String movieLikeInsert(int movieNo, int memberNo) {
		int result = service.movieLikeInsert(movieNo,memberNo);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	//영화 좋아요 delete
	@ResponseBody
	@RequestMapping(value="/movieLikeDelete.do")
	public String movieLikeDelete(int movieNo,int memberNo) {
		int result = service.movieLikeDelete(movieNo,memberNo);
		System.out.println(movieNo);
		System.out.println(memberNo);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	//관람평(review)좋아요 insert
	@ResponseBody
	@RequestMapping(value="/reviewLikeInsert.do")
	public String reviewLikeInsert(int reviewCommentNo, int memberNo) {
		int result = service.reviewLikeInsert(reviewCommentNo,memberNo);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	//관람평(review)좋아요 delete
	@ResponseBody
	@RequestMapping(value="/reviewLikeDelete.do")
	public String reviewLikeDelete(int reviewCommentNo, int memberNo) {
		int result=service.reviewLikeDelete(reviewCommentNo,memberNo);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}

	
	
}
