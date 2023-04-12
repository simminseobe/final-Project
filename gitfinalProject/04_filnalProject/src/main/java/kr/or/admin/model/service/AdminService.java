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

				result += dao.insertmovieVideo(video);
			}
		}

		return result;
	}

	public ArrayList<String> selectTheaterAddr(String theaterLocal) {
		ArrayList<String> theaterAddrList = dao.selectTheaterAddrList(theaterLocal);

		return theaterAddrList;
	}

	public int insertTheater(Theater theater) {
		int result = dao.insertTheater(theater);

		return result;
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
		Movie movie = movieDao.selectOneUpdateMovie(movieNo);

		if (movie != null) {
			MovieFile movieFile = movieDao.selectMovieFile(movieNo);
			movie.setMainFile(movieFile);
		}

		return movie;
	}

	@Transactional
	public int movieUpdate(Movie movie, MovieFile mainFile, ArrayList<MovieFile> postList, int[] fileNo) {
		int result = dao.updateMovie(movie);

		if (result > 0) {
			if (fileNo != null) {
				result += dao.deleteFile(fileNo);
			}

			result += dao.insertMainFile(mainFile);

			// 첨부파일 추가
			for (MovieFile file : postList) {
				file.setMovieFileNo(movie.getMovieNo());

				result += dao.insertPostFile(file);
			}
		}

		return result;
	}
}
