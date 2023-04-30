package kr.or.movie.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.movie.model.vo.Movie;
import kr.or.movie.model.vo.MovieFile;
import kr.or.movie.model.vo.MoviePost;
import kr.or.movie.model.vo.MoviePostComment;
import kr.or.movie.model.vo.MovieVideo;
import kr.or.movie.model.vo.Review;
import kr.or.movie.model.vo.WatchPoint;

@Repository
public class MovieDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Movie> selectMovieList(int memberNo) {
		List list = sqlSession.selectList("movie.selectMovieAll", memberNo);
		return (ArrayList<Movie>) list;

	}

	// movieFile메인
	public MovieFile selectMovieFile(int movieNum) {
		MovieFile result = sqlSession.selectOne("movie.selectMovieFile", movieNum);
		return result;
	}

	// movieFile포스트
	public ArrayList<MovieFile> selectMoviePost(int movieNo) {
		List list = sqlSession.selectList("movie.selectMoviePost", movieNo);

		return (ArrayList<MovieFile>) list;
	}

	public ArrayList<Movie> selectMovieAll(int movieNo) {
		List list = sqlSession.selectList("movie.selectMovieAllDetail", movieNo);
		return (ArrayList<Movie>) list;
	}

	public ArrayList<Movie> selectMovieList() {
		List list = sqlSession.selectList("movie.selectMovieList");

		return (ArrayList<Movie>) list;
	}

	public Movie selectOneMovie(int movieNo) {
		Movie mov = sqlSession.selectOne("movie.selectOneMovie", movieNo);

		return mov;
	}
	public ArrayList<Movie> selectOneMovieAll(int memberNo) {
		List list = sqlSession.selectList("movie.selectOneMovieAll", memberNo);

		return  (ArrayList<Movie>)list;
	}

	public ArrayList<MovieVideo> selectOneMovieVideo(int movieNo) {
		List list = sqlSession.selectList("movie.selectOneMovieVideo", movieNo);
		return (ArrayList<MovieVideo>) list;
	}

	public int reviewInsert(Review rev) {
		int result = sqlSession.insert("movie.insertReview", rev);
		return result;
	}

	public int watchPointInsert(WatchPoint wPoint) {
		int result = sqlSession.insert("movie.insertWatchPoint", wPoint);
		return result;
	}

	public Review getReview(String memberId) {
		// TODO Auto-generated method stub
		return (Review) sqlSession.selectOne("movie.getOneReview", memberId);
	}

	public ArrayList<Review> oneMovieAllReview(int movieNo) {
		List list = sqlSession.selectList("movie.oneMovieAllReview", movieNo);
		return (ArrayList<Review>) list;
	}

	public ArrayList<WatchPoint> watchPointAll(int reviewCommentNo) {
		List list = sqlSession.selectList("movie.watchPointAll", reviewCommentNo);
		return (ArrayList<WatchPoint>) list;
	}

	public Review onlyWatchPointAvg(int movieNo) {
		Review movie = sqlSession.selectOne("movie.selectWatchPointAvg", movieNo);
		return movie;
	}

	public WatchPoint watchPointSum(int movieNo) {
		WatchPoint wpSum = sqlSession.selectOne("movie.selectWatchPointSum", movieNo);
		return wpSum;
	}

	public int selectReviewListCount(int movieNo) {
		int reviewListCount = sqlSession.selectOne("movie.ReviewListCount", movieNo);
		return reviewListCount;
	}

	public ArrayList<MovieFile> selectMovieFileAll(int movieNo) {
		List list = sqlSession.selectList("movie.selectmovieFileAll", movieNo);
		return (ArrayList<MovieFile>) list;
	}

	// 관람평 업데이트(=리뷰 업데이트)
	public int reviewUpdate(Review rew) {
		int result = sqlSession.update("movie.updateReview", rew);
		return result;
	}

	// 관람포인트 업데이트(=관람포인트 업데이트)
	public int watchPointUpdate(WatchPoint wPoint) {
		int result = sqlSession.update("movie.updateWatchPoint", wPoint);
		return result;
	}
	
	public int deleteReview(int reviewCommentNo) {
		int result = sqlSession.delete("movie.deleteReview", reviewCommentNo);
		return result;
	}

	public int deleteWatchPoint(int reviewCommentNo) {
		int result = sqlSession.delete("movie.deleteWatchPoint", reviewCommentNo);
		return result;
	}

	public ArrayList<Review> selectReviewList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("movie.selectReviewList", map);
		return (ArrayList<Review>) list;
	}

	public int selectReviewCount(int movieNo) {
		int totalCount = sqlSession.selectOne("movie.totalCount", movieNo);
		return totalCount;
	}

	public int postInsert(MoviePost post) {
		System.out.println(post);
		int result = sqlSession.insert("movie.postInsert", post);
		return result;
	}

	public int totalMovieCount() {
		int result = sqlSession.selectOne("movie.movieListCount");
		return result;
	}
	//무비포스트 전체 리스트를 조회
	public ArrayList<MoviePost> selectOneMovieAllPost(int movieNo) {
		List list = sqlSession.selectList("movie.oneMoviePostAll", movieNo);
		return (ArrayList<MoviePost>) list;
	}
	//무비포스트 상세보기를 위함
	public MoviePost selectDetailPost(int moviePostNo) {
		MoviePost moviePostOne = sqlSession.selectOne("movie.detailPost", moviePostNo);

		return moviePostOne;
	}
	//무비포스트 댓글 작성
	public int insertPostComment(MoviePostComment mpc) {

		int result = sqlSession.insert("movie.insertPostComment", mpc);
		return result;

	}
	//무비포스트 댓글 전체 리스트 조회
	public ArrayList<MoviePostComment> selectPostComment(int moviePostNo) {
		System.out.println("dao postNo : " + moviePostNo);
		List list = sqlSession.selectList("movie.selectPostComment", moviePostNo);
		return (ArrayList<MoviePostComment>) list;
	}
	//무비포스트 댓글 수정
	public int updatePostComment(MoviePostComment mpc) {
		int result = sqlSession.update("movie.updatePostComment", mpc);
		return result;
	}
	//무비포스트 총 갯수를 조회
	public int selectMoviePostCount(int movieNo) {
		int moviePostCount = sqlSession.selectOne("movie.moviePostCount", movieNo);
		return moviePostCount;
	}
	//무비포스트 댓글 삭제
	public int deletePostComment(int moviePostCommentNo) {
		int deletePostComment = sqlSession.delete("movie.deletePostComment", moviePostCommentNo);
		return deletePostComment;
	}
	//상영예정작 리스트 조회를 위함
	public ArrayList<Movie> expectedMovie(int memberNo) {
		List list = sqlSession.selectList("movie.expectedMovie",memberNo);
		return (ArrayList<Movie>) list;
	}
	//특별상영작 리스트를  조회하기 위함
	public ArrayList<Movie> specialMovie(int memberNo) {
		List list = sqlSession.selectList("movie.specialMovieList",memberNo);
		return (ArrayList<Movie>) list;
	}
	//필름소사이어티 리스트를 조회하기 위함
	public ArrayList<Movie> filmSocietyList(int memberNo) {
		List list = sqlSession.selectList("movie.filmSocietyList",memberNo);
		return (ArrayList<Movie>) list;
	}
	//클래식소사이어티 리스트를 조회하기 위함
	public ArrayList<Movie> classicSocietyList(int memberNo) {
		List list = sqlSession.selectList("movie.classicSocietyList",memberNo);
		return (ArrayList<Movie>) list;

	}
	//사용자 선호 영화조회를 위함
	public ArrayList<Movie> favoriteMovieList(int memberNo) {
		List list = sqlSession.selectList("movie.favoriteMovieList",memberNo);
		return (ArrayList<Movie>) list;
	}
	//무비포스트를 영화별로 조회를 하기 위함
	public MoviePost selectOneMoviePost(int moviePostNo) {
		MoviePost moviePost = sqlSession.selectOne("movie.selectOneMoviePost", moviePostNo);
		return moviePost;
	}
	//무비포스트 수정
	public int postUpdate(MoviePost moviePost) {
		int result = sqlSession.update("movie.postUpdate", moviePost);
		return result;
	}
	//무비포스트 삭제
	public int postDelete(MoviePost moviePost) {
		int result = sqlSession.delete("movie.postDelete", moviePost);
		return result;
	}
	//영화 좋아요 insert
	public int movieLikeInsert(HashMap<String, Object> map) {
		int result = sqlSession.insert("movie.movieLikeInsert", map);
		return result;
	}
	//영화 좋아요 delete
	public int movieLikeDelete(HashMap<String, Object> map) {
		int result = sqlSession.delete("movie.movieLikeDelete", map);
		return result;
	}
	//관람평(review)좋아요 insert
	public int reviewLikeInsert(HashMap<String, Object> map) {
		int result = sqlSession.insert("movie.reviewLikeInsert",map);
		return result;
	}
	//관람평(review)좋아요 delete
	public int reviewLikeDelete(HashMap<String, Object> map) {
		int result =sqlSession.delete("movie.reviewLikeDelete",map);
		return result;
	}
	
	//상영예정작 총 갯수
	public int totalExpectedMovieCount() {
		int result =sqlSession.selectOne("movie.expectedMovieCount");
		return result;
	}
	//특별영화 총 갯수
	public int totalSpecialMovieCount() {
		int result = sqlSession.selectOne("movie.specialMovieCount");
		return result;
	}
	//필름 소사이어티 영화 총갯수
	public int totalFilmSocietyCount() {
		int result =sqlSession.selectOne("movie.fileSocietyCount");
		return result;
	}
	//클래식 소사이어티 영화 총 갯수
	public int totalClassicSocietyCount() {
		int result =sqlSession.selectOne("movie.classicSocietyCount");
		return result;
	}
	//사용자 영화 총갯수
	public int totalFavoriteMovieCount(int memberNo) {
		int result =sqlSession.selectOne("movie.favoriteMovieCount", memberNo);
		return result;
		
	}
	//영화 포스터(movieFile)전체 조회를 위함
	public ArrayList<MovieFile> selectFileList(int movieNo) {
		List list = sqlSession.selectList("movie.selectFileList", movieNo);
		return (ArrayList<MovieFile>) list;
	}
	//영화 좋아요 총 갯수를 위함
	public int totalMovieLikeCount(int movieNo) {
		int result = sqlSession.selectOne("movie.totalMovieLike", movieNo);
		return result;
	}



}
