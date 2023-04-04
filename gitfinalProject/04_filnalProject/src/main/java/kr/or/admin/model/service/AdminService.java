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

	public int insertMovie(Movie movie, MovieFile mainFile, ArrayList<MovieFile> postList) {
		int result = dao.insertMovie(movie);

		if (result > 0) {
			mainFile.setMovieNo(movie.getMoviceNo());

			result += dao.insertMainFile(mainFile);

			for (MovieFile file : postList) {
				file.setMovieNo(movie.getMoviceNo());

				result += dao.insertPostFile(file);
			}
		}

		return result;
	}
}
