package kr.or.movie.model.service;

import java.util.Iterator;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.movie.model.dao.MovieDao;
import kr.or.movie.model.vo.Movie;

@Service
public class MovieService {
	@Autowired
	private MovieDao dao;

	public List<Movie> movieList() throws Exception {
		String url = "https://www.megabox.co.kr/movie";
		
		 Document doc =Jsoup.connect(url).get();
		 Elements element = doc.select("div.movie-list");
		 
		 Iterator<Element>  movieTitle = element.select("p.tit").iterator(); //영화 이름
		
		 Iterator<Element> movieDate = element.select("span.date").iterator(); //개봉일
		 
	
		
		 return null;
		 
		
	
		
		
		
		
		
	}
}
