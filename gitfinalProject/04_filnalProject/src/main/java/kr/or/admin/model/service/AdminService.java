package kr.or.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.admin.model.dao.AdminDao;
import kr.or.admin.model.vo.Theater;
import kr.or.movie.model.vo.Movie;
import kr.or.movie.model.vo.MovieFile;
import kr.or.movie.model.vo.MovieVideo;

@Service
public class AdminService {
	@Autowired
	private AdminDao dao;

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

	public int insertTheater(Theater theater, String theaternewAddr) {
		if (theater.getTheaterAddr() == null) {
			theater.setTheaterAddr(theaternewAddr);
		}

		int result = dao.insertTheater(theater);

		return result;
	}
}
