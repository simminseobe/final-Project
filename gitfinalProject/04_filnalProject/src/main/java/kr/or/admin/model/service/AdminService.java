package kr.or.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.admin.model.dao.AdminDao;
import kr.or.admin.model.vo.Theater;
import kr.or.movie.model.dao.MovieDao;
import kr.or.movie.model.vo.Movie;
import kr.or.movie.model.vo.MovieFile;
import kr.or.movie.model.vo.MovieVideo;

@Service
public class AdminService {
	@Autowired
	private AdminDao dao;
	@Autowired
	private MovieDao movieDao;

	@Transactional
	public int insertMovie(Movie movie, MovieFile mainFile, ArrayList<MovieFile> postList,
			ArrayList<MovieVideo> videoList) {
		int result = dao.insertMovie(movie);

		if (result > 0) {
			// 파일 insert
			mainFile.setMovieNo(movie.getMovieNo());

			result += dao.insertMainFile(mainFile);

			for (MovieFile file : postList) {
				file.setMovieNo(movie.getMovieNo());

				result += dao.insertPostFile(file);
			}

			// 영상 링크 insert
			for (MovieVideo video : videoList) {

				video.setMovieNo(movie.getMovieNo());

				System.out.println(video.getVideoLink());

				if (video.getVideoLink() != null) {
					result += dao.insertmovieVideo(video);
				}
			}
		}

		return result;
	}

	@Transactional
	public ArrayList<MovieFile> delteMovie(int movieNo) {
		// 실제로 서버의 파일을 삭제하기 위해서, 한 게시물 삭제하면 여러개의 파일도 같이 삭제
		// 삭제 하기전에 파일 목록들 불러옴
		ArrayList<MovieFile> fileList = dao.selectFileList(movieNo);
		int result = dao.delteMovie(movieNo);

		if (result > 0) {
			return fileList;
		} else {
			return null;
		}
	}

	public ArrayList<String> selectTheaterAddr(String theaterLocal) {
		ArrayList<String> theaterAddrList = dao.selectTheaterAddrList(theaterLocal);

		return theaterAddrList;
	}

	public int insertTheater(Theater theater) {
		int result = dao.insertTheater(theater);

		return result;
	}

	public int deleteTheater(int theaterNo) {
		int result = dao.deleteTheater(theaterNo);

		return result;
	}

	public int updateTheater(Theater theater) {
		return dao.updateTheater(theater);
	}

	public ArrayList<Movie> selectMovieList() {
		ArrayList<Movie> list = movieDao.selectMovieAll();

		return list;
	}

	public ArrayList<Theater> selectTheaterList() {
		ArrayList<Theater> list = dao.selectTheaterList();

		return list;
	}

	public Movie selectOneUpdateMovie(int movieNo) {
		Movie movie = dao.selectOneUpdateMovie(movieNo);

		if (movie != null) {
			MovieFile movieFile = movieDao.selectMovieFile(movieNo);
			movie.setMainFile(movieFile);
		}

		return movie;
	}

	@Transactional
	public int movieUpdate(Movie movie, MovieFile mainFile, ArrayList<MovieFile> postList, int[] fileNo,
			ArrayList<MovieVideo> videoList, int[] videoNo) {
		int result = dao.updateMovie(movie);

		if (result > 0) {
			if (fileNo != null) {
				result += dao.deleteFile(fileNo);
			}

			if (videoNo != null) {
				result += dao.deleteVideo(videoNo);
			}

			if (mainFile.getMovieNo() != 0) {
				result += dao.insertMainFile(mainFile);
			}

			// 첨부파일 추가
			for (MovieFile file : postList) {
				file.setMovieFileNo(movie.getMovieNo());

				result += dao.insertPostFile(file);
			}

			// 영상 링크 insert
			for (MovieVideo video : videoList) {
				video.setMovieNo(movie.getMovieNo());

				if (video.getVideoLink() != null) {
					result += dao.insertmovieVideo(video);
				}
			}
		}

		return result;
	}

	public Theater selectOntTheater(int theaterNo) {
		Theater theater = dao.selectOneTheater(theaterNo);
		return theater;
	}

	public ArrayList<Theater> selectBranchList(String theaterLocal) {
		ArrayList<Theater> list = dao.selectBranchList(theaterLocal);
		return list;
	}

}
