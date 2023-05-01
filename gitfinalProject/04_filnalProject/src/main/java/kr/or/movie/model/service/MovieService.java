package kr.or.movie.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.or.movie.model.dao.MovieDao;
import kr.or.movie.model.vo.Movie;
import kr.or.movie.model.vo.MovieFile;
import kr.or.movie.model.vo.MoviePost;
import kr.or.movie.model.vo.MoviePostComment;
import kr.or.movie.model.vo.MovieVideo;
import kr.or.movie.model.vo.Review;
import kr.or.movie.model.vo.ReviewPageData;
import kr.or.movie.model.vo.ReviewWatch;
import kr.or.movie.model.vo.WatchPoint;
import kr.or.movie.model.vo.MyMovie;

@Service
public class MovieService {
	@Autowired
	private MovieDao dao;

public ArrayList<Movie> selectMovieAll(int memberNo) {
		//영화 전체조회
		ArrayList<Movie> list =dao.selectMovieList(memberNo);
		for(Movie movie : list) {
			int movieNum= movie.getMovieNo();
			MovieFile movieFile = dao.selectMovieFile(movieNum);
			movie.setMainFile(movieFile);
			Review movieScoreAvg=dao.onlyWatchPointAvg(movieNum);
			movie.setMovieScoreAvg(movieScoreAvg);
			String movieTitle = movie.getMovieTitle();
			
		}
		
		return list;
		
	}
	//상영예정작 조회
	public ArrayList<Movie> expectedMovie(int memberNo) {
		ArrayList<Movie> expectedList =dao.expectedMovie(memberNo);
		for(Movie movie : expectedList) {
			int movieNum= movie.getMovieNo();
			MovieFile movieFile = dao.selectMovieFile(movieNum);
			movie.setMainFile(movieFile);
			Review movieScoreAvg=dao.onlyWatchPointAvg(movieNum);
			movie.setMovieScoreAvg(movieScoreAvg);

		}
		
		return expectedList;
	}
	//특별상영작 조회
	public ArrayList<Movie> specialMovie(int memberNo) {
		ArrayList<Movie> specialMovieList =dao.specialMovie(memberNo);
		for(Movie movie : specialMovieList) {
			int movieNum= movie.getMovieNo();
			MovieFile movieFile = dao.selectMovieFile(movieNum);
			movie.setMainFile(movieFile);
			Review movieScoreAvg=dao.onlyWatchPointAvg(movieNum);
			movie.setMovieScoreAvg(movieScoreAvg);
			
		}	
		
		return specialMovieList;
	}
	//필름소사이어티 조회
	public ArrayList<Movie> filmSocietyList(int memberNo) {
		ArrayList<Movie> filmSocietyList =dao.filmSocietyList(memberNo);
		for(Movie movie : filmSocietyList) {
			int movieNum= movie.getMovieNo();
			MovieFile movieFile = dao.selectMovieFile(movieNum);
			movie.setMainFile(movieFile);
			Review movieScoreAvg=dao.onlyWatchPointAvg(movieNum);
			movie.setMovieScoreAvg(movieScoreAvg);
			
		}	
		
		return filmSocietyList;
	}
	//클래식소사이어티조회
	public ArrayList<Movie> classicSocietyList(int memberNo) {
		ArrayList<Movie> classicSocietyList =dao.classicSocietyList(memberNo);
		for(Movie movie : classicSocietyList) {
			int movieNum= movie.getMovieNo();
			MovieFile movieFile = dao.selectMovieFile(movieNum);
			movie.setMainFile(movieFile);
			Review movieScoreAvg=dao.onlyWatchPointAvg(movieNum);
			movie.setMovieScoreAvg(movieScoreAvg);
			
		}	
		
		return classicSocietyList;
	}
	
	//사용자 선호영화 리스트조회
	public ArrayList<Movie> selectFavoriteMovie(int memberNo) {
		ArrayList<Movie> favoriteMovieList =dao.favoriteMovieList(memberNo);
		for(Movie movie : favoriteMovieList) {
			int movieNum= movie.getMovieNo();
			MovieFile movieFile = dao.selectMovieFile(movieNum);
			movie.setMainFile(movieFile);
			Review movieScoreAvg=dao.onlyWatchPointAvg(movieNum);
			movie.setMovieScoreAvg(movieScoreAvg);
			
		}	
		return favoriteMovieList;
	}
	
	

	public Movie selectOneMovie(int movieNo) {
		Movie mov = dao.selectOneMovie(movieNo);
		 if(mov !=null) {
			 MovieFile movieFile = dao.selectMovieFile(movieNo);
			 mov.setMainFile(movieFile);
		 }
		return mov;
	}
	public ArrayList<MyMovie> selectOneMovieAll2(String memberId) {
		ArrayList<MyMovie> list = dao.selectOneMovieAll2(memberId);
		
		/*
		for(Movie movie : list) {
			int movieNum= movie.getMovieNo();
			MovieFile movieFile = dao.selectMovieFile(movieNum);
			movie.setMainFile(movieFile);
			Review movieScoreAvg=dao.onlyWatchPointAvg(movieNum);
			movie.setMovieScoreAvg(movieScoreAvg);
			
		}	*/
		return list;
	}
	public ArrayList<MovieVideo> selectOneMovieVideo(int movieNo) {
		ArrayList<MovieVideo> mv= dao.selectOneMovieVideo(movieNo);	
		return mv;
	}
	//영화 리뷰 인서트
	public int reviewInsert(Review rev, WatchPoint wPoint) {
		int result = dao.reviewInsert(rev);
		if(result>0) {
			wPoint.setReviewCommentNo(rev.getReviewCommentNo());
			result += dao.watchPointInsert(wPoint);
		}
		return result;
	}
		//관람평 업데이트(=리뷰 업데이트)
		public int reviewUpdate(Review rev) {
			int result = dao.reviewUpdate(rev);
			System.out.println(result);
			return result;
		}
		public int watchPointUpdate(WatchPoint wPoint) {
			int result = dao.watchPointUpdate(wPoint);
			System.out.println(result);
			return result;
		}
		
		
	public Review getReview(String memberId) {
		// TODO Auto-generated method stub
		return dao.getReview(memberId);
	}
	
	//한 영화의 관람평 리스트를 모두 조회함
	public ArrayList<Review> oneMovieAllReview(int movieNo) {
		ArrayList<Review> reviewList = dao.oneMovieAllReview(movieNo);
		return reviewList;
	}
	//watchPoint를 위한 조회
	public Review onlyWatchPointAvg(int movieNo) {
		Review wpList=dao.onlyWatchPointAvg(movieNo);
		return wpList;
	}
	//watchPointSum(관람포인트별 합계 조회)
	public WatchPoint watchPointSum(int movieNo) {
		WatchPoint wpSum=dao.watchPointSum(movieNo);
		return wpSum;
	}
	public int selectReviewListCount(int movieNo) {
		int reviewListCount = dao.selectReviewListCount(movieNo);
		return reviewListCount;
	}
	public ArrayList<MovieFile> selectMovieFileAll(int movieNo) {
		ArrayList<MovieFile> movieFileAll=dao.selectMovieFileAll(movieNo);
		return movieFileAll;
	}
	//리뷰삭제하기
	public int deleteReview(int reviewCommentNo) {
		return dao.deleteReview(reviewCommentNo);
	}
	//관람포인트 삭제하기
	public int deleteWatchPoint(int reviewCommentNo) {
		return dao.deleteWatchPoint(reviewCommentNo);
	}
	public ReviewPageData selectReviewList(int movieNo,int reqPage) {
		//처음에 페이지당 보여줄 게시물의 수는 10개로 함
		int numPerPage = 10;
		//reqPage=1인경우 1번 10번 2인경우 11번 20번까지
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end",end);
		map.put("movieNo",movieNo);
		ArrayList<Review> list = dao.selectReviewList(map);
		System.out.println(map);
		
		//pageNavi제작시작
		//먼저 전체 페이지 수 계산하기->전체 게시물 수 조회
		int totalCount = dao.selectReviewCount(movieNo);
		System.out.println(totalCount+"전체게시물 수");
		//전체 게시물로 전체 페이지 수 계산
		
		int totalPage=(int)Math.ceil(totalCount/(double)numPerPage);
		//페이지 네비사이즈
		int pageNaviSize=5;
		
		int pageNo = 1;
		if(reqPage>3) {
			pageNo=reqPage-2;
		}
		
		//페이지너비 생성
		String pageNavi="";
		//이전버튼 생성
		if(reqPage != 1) {
			pageNavi += "<a href='/movieDetail.do?movieNo="+movieNo+"&reqPage="+(pageNo-1)+"&stat=1'>[이전]</a>";
		}
		//페이지 숫자 생성
		for(int i =0; i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi+="<span>"+pageNo+"</span>";
			}else {
				pageNavi +="<a href='/movieDetail.do?movieNo="+movieNo+"&reqPage="+pageNo+"&stat=1'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;//더이상 페이지 번호를 만들지 않음
				
			}
		}
		//다음버튼 생성
		if(pageNo<=totalPage) {
			pageNavi += "<a href='/movieDetail.do?movieNo="+movieNo+"&reqPage="+pageNo+"&stat=1'>[다음]</a>";
		}
		ReviewPageData rpd= new ReviewPageData(list,pageNavi);
		return rpd;
	}
	public int postInsert(MoviePost post) {
		int result = dao.postInsert(post);
		return result;
	}
	public int selectMovieListCount() {
		return dao.totalMovieCount();
	}
	public ArrayList<MoviePost> oneMovieAllPost(int movieNo) {
		ArrayList<MoviePost> postAllList=dao.selectOneMovieAllPost(movieNo);
		
		
		return postAllList;
	}
	public ArrayList<MoviePost> oneMovieAllPost2(String memberId) {
		ArrayList<MoviePost> postAllList=dao.selectOneMovieAllPost2(memberId);
		
		
		return postAllList;
	}
	public MoviePost selectDetailPost(int moviePostNo) {
		MoviePost moviePostOne=dao.selectDetailPost(moviePostNo);
		
		if(moviePostOne != null) {
			ArrayList<MoviePostComment> mpc= dao.selectPostComment(moviePostNo);
			moviePostOne.setMoviePostComment(mpc);
		}
		 return moviePostOne; 
	}
	public int insertPostComment(MoviePostComment mpc) {
		int result = dao.insertPostComment(mpc);
		return result;
	}


	public int updatePostComment(MoviePostComment mpc) {
		int result = dao.updatePostComment(mpc);
		return result;
	}
	public int moviePostCount(int movieNo) {
		int moviePostCount = dao.selectMoviePostCount(movieNo);
		return moviePostCount;
	}
	public int moviePostCount2(String memberId) {
		int moviePostCount = dao.selectMoviePostCount2(memberId);
		return moviePostCount;
	}
	public int deletePostComment(int moviePostCommentNo) {
		int deletePostComment=dao.deletePostComment(moviePostCommentNo);
		return deletePostComment;
	}
	public MoviePost selectOneMoviePost(int moviePostNo) {
		MoviePost moviePost=dao.selectOneMoviePost(moviePostNo);
		System.out.println(moviePost);
		return moviePost;
	}
	public int postUpdate(MoviePost moviePost) {
		int result = dao.postUpdate(moviePost);
		return result;
	}
	public int postDelete(MoviePost moviePost) {
		int result = dao.postDelete(moviePost);
		return result;
	}
	//영화 좋아요 insert
	public int movieLikeInsert(int movieNo, int memberNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo",memberNo);
		map.put("movieNo",movieNo);
		
		int result= dao.movieLikeInsert(map);
		return result;
	}
	public int movieLikeDelete(int movieNo, int memberNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo",memberNo);
		map.put("movieNo",movieNo);
		
		int result= dao.movieLikeDelete(map);
		return result;
	}
	//관람평(review) 좋아요 insert
	public int reviewLikeInsert(int reviewCommentNo, int memberNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("reviewCommentNo",reviewCommentNo);
		map.put("memberNo",memberNo);
		
		int result =dao.reviewLikeInsert(map);
		return result;
	}
	//관람평(review) 좋아요 delete
	public int reviewLikeDelete(int reviewCommentNo, int memberNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("reviewCommentNo",reviewCommentNo);
		map.put("memberNo",memberNo);
		
		System.out.println(map+" : reviewlike delete map");
		int result =dao.reviewLikeDelete(map);
		return result;
		
	}
	
	//영화 좋아요 총 갯수
	public int movieLikeCount(int movieNo) {
		int  result =dao.totalMovieLikeCount(movieNo);
		return result;
	}
	 
	
	//상영예정작 총 갯수 조회를 위함
	public int selectExpectedMovieCount() {
		int result =dao.totalExpectedMovieCount();
		return result;
	}
	//특별상영작 총 갯수 조회를 위함
	public int selectSpecialMovieCount() {
		return dao.totalSpecialMovieCount();
	}
	//필름소사이어티 총 갯수 조회를 위함
	public int selectFilmSocietyCount() {
		return dao.totalFilmSocietyCount();
	}
	//클래식 소사이어트 총 갯수 조회를 위함
	public int selectclassicSocietyCount() {
		return dao.totalClassicSocietyCount();
	}
	//사용자 선호영화 총 갯수 조회를 위함
	public int selectFavoriteMovieCount(int memberNo) {
		return dao.totalFavoriteMovieCount(memberNo);
		
	}
	//사용자 관람영화 총 갯수 조회를 위함
		public int selectmyMovieListCount(int memberNo) {
			return dao.totalmyMovieListCount(memberNo);
			
	}
	//스틸컷(movie_file) 조회
	public ArrayList<MovieFile> selectFileList(int movieNo) {
		ArrayList<MovieFile> movieFileList=dao.selectFileList(movieNo);
		
		
		return movieFileList;
	}
	//아이디로 관람평 조회
	public Review selectOneReview(String memberId,int movieNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId",memberId);
		map.put("movieNo",movieNo);
		Review review = dao.selectOneReview(map);
		return review;
	}
	public double reservationRate(String movieTitle) {
		double result = dao.reservationRate(movieTitle);
		return result;
	}



	






	

}
