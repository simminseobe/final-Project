package kr.or.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import common.FileManager;
import kr.or.admin.model.service.AdminService;
import kr.or.movie.model.vo.Movie;
import kr.or.movie.model.vo.MovieFile;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	@Autowired
	private FileManager fileManager;

	@RequestMapping("/adminPage.do")
	public String adminPage() {
		return "admin/adminPage";
	}

	@RequestMapping(value = "/registerMovieFrm.do")
	public String registerMovieFrm() {
		return "admin/registerMovieFrm";
	}

	@RequestMapping(value = "/registerMovie.do")
	public String registerMovie(Movie movie, MultipartFile movieMain, MultipartFile[] moviePoster,
			HttpServletRequest request) {
		System.err.println(moviePoster);
		System.out.println(movieMain);

		MovieFile mainFile = new MovieFile();
		ArrayList<MovieFile> postList = new ArrayList<MovieFile>();

		// 파일 서버에 업로드
		if (movieMain != null && !moviePoster[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/movie/");

			String mainFilename = movieMain.getOriginalFilename();
			String mainFilepath = fileManager.upload(savePath, movieMain);

			MovieFile movieFile = new MovieFile();

			movieFile.setMovieFileName(mainFilename);
			movieFile.setMovieFilePath(mainFilepath);

			mainFile = movieFile;

			for (MultipartFile file : moviePoster) {
				String filename = file.getOriginalFilename();
				String filepath = fileManager.upload(savePath, file);

				movieFile.setMovieFileName(filename);
				movieFile.setMovieFilePath(filepath);

				postList.add(movieFile);
			}

			int result = service.insertMovie(movie, mainFile, postList);

			if (result == (postList.size() + 2)) { // mainfile insert + postfile insert + board insert
				return "admin/registerMovieFrm";
			} else {
				return "redirect:/";
			}
		}

		return "admin/registerMovieFrm";
	}
}
