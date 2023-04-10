package kr.or.movie.model.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.or.movie.model.dao.MovieDao;
import kr.or.movie.model.vo.Movie;
import kr.or.movie.model.vo.MovieFile;

@Service
public class MovieService {
	@Autowired
	private MovieDao dao;

	public ArrayList<Movie> selectMovieAll() {
		
		ArrayList<Movie> list =dao.selectMovieAll();
		System.out.println(list);
		for(Movie movie : list) {
			int movieNum= movie.getMovieNo();
			System.out.println(movieNum);
			MovieFile movieFile = dao.selectMovieFile(movieNum);
			movie.setMainFile(movieFile);
		}
		return list;
		
	}

	public Movie selectOneMovie(int movieNo) {
		Movie mov = dao.selectOneMovie(movieNo);
		 if(mov !=null) {
			 MovieFile movieFile = dao.selectMovieFile(movieNo);
			 mov.setMainFile(movieFile);
		 }
		return mov;
	}

}
