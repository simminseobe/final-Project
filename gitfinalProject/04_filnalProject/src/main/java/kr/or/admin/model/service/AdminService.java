package kr.or.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.admin.model.dao.AdminDao;
import kr.or.movie.model.vo.Movie;
import kr.or.movie.model.vo.MovieFile;

@Service
public class AdminService {
	@Autowired
	private AdminDao dao;

	public int insertMovie(Movie movie, MovieFile mainFile, ArrayList<MovieFile> postList, String[] movieVideo) {
		int result = dao.insertMovie(movie);
		
		if (result > 0) {
			// 파일 insert
			mainFile.setMovieNo(movie.getMoviceNo());

			result += dao.insertMainFile(mainFile);
			
			for (MovieFile file : postList) {
				file.setMovieNo(movie.getMoviceNo());

				result += dao.insertPostFile(file);
			}
			
			// 영상 링크 insert
			for (String link : movieVideo) {
				result += dao.insertmovieVideo(link);
			}
		}

		return result;
	}
}
