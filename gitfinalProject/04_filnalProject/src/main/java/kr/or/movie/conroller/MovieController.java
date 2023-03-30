package kr.or.movie.conroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MovieController {
	
	@RequestMapping(value = "/allMovieList.do")
	public String allMovieList() {
		return "movie/allMovieList";
	}
	
}
