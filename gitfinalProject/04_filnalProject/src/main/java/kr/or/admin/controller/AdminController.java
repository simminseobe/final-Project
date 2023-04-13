package kr.or.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.FileManager;
import kr.or.admin.model.service.AdminService;
import kr.or.admin.model.vo.Theater;
import kr.or.movie.model.service.MovieService;
import kr.or.movie.model.vo.Movie;
import kr.or.movie.model.vo.MovieFile;
import kr.or.movie.model.vo.MovieVideo;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	@Autowired
	private MovieService movieServie;
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
	public String registerMovie(Movie movie, String movieVideo[], MultipartFile movieMain, MultipartFile[] moviePoster,
			HttpServletRequest request) {
		MovieFile mainFile = new MovieFile();
		ArrayList<MovieFile> postList = new ArrayList<MovieFile>();

		// 파일 서버에 업로드
		if (movieMain != null && !moviePoster[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/movie/");

			String mainFilename = movieMain.getOriginalFilename();
			String mainFilepath = fileManager.upload(savePath, movieMain);

			mainFile.setMovieFileName(mainFilename);
			mainFile.setMovieFilePath(mainFilepath);

			for (MultipartFile file : moviePoster) {
				String filename = file.getOriginalFilename();
				String filepath = fileManager.upload(savePath, file);

				MovieFile postFile = new MovieFile();

				postFile.setMovieFileName(filename);
				postFile.setMovieFilePath(filepath);

				postList.add(postFile);
			}

		}

		ArrayList<MovieVideo> videoList = new ArrayList<MovieVideo>();

		for (String link : movieVideo) {
			MovieVideo video = new MovieVideo();

			video.setVideoLink(link);

			videoList.add(video);
		}

		int result = service.insertMovie(movie, mainFile, postList, videoList);

		if (result == (postList.size() + 2 + videoList.size())) { // mainfile insert + postfile insert + board insert +
																	// insert movieVideo[]
			return "admin/registerMovieFrm";
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/MovieList.do")
	public String MovieList(Model model) {
		ArrayList<Movie> list = service.selectMovieList();

		model.addAttribute("list", list);

		return "admin/movieList";
	}

	@RequestMapping(value = "/registerTheaterFrm.do")
	public String registerTheaterFrm(Model model) {
		ArrayList<Theater> list = service.selectTheaterList();
//
		model.addAttribute("list", list);

		return "admin/registerTheaterFrm";
	}

	@RequestMapping(value = "/registerTheater.do")
	public String registerTheater(Theater theater) {
		int result = service.insertTheater(theater);

		if (result > 0) {
			return "admin/manageTheaterFrm";
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/theaterList.do")
	public String theaterList(Model model) {
		ArrayList<Theater> list = service.selectTheaterList();

		model.addAttribute("list", list);

		return "/admin/theaterList";
	}

	@ResponseBody
	@RequestMapping(value = "/searchtheaterAddr.do", produces = "application/json;charset=utf-8")
	public String searchtheaterAddr(String theaterLocal) {
		ArrayList<String> theaterAddrList = new ArrayList<String>();

		theaterAddrList = service.selectTheaterAddr(theaterLocal);

		return new Gson().toJson(theaterAddrList);
	}

	@RequestMapping(value = "/updateMovieFrm.do")
	public String updateMovieFrm(int movieNo, Model model) {
		Movie movie = service.selectOneUpdateMovie(movieNo);

		model.addAttribute("movie", movie);

		return "admin/updateMovieFrm";
	}

	@RequestMapping(value = "/updateMovie.do")
	public String updateMovie(Movie movie, int[] fileNo, String[] filepath, MultipartFile movieMain,
			MultipartFile[] moviePoster, HttpServletRequest request) {
		MovieFile mainFile = new MovieFile();
		ArrayList<MovieFile> postList = new ArrayList<MovieFile>();

		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/movie/");

		// 파일 서버에 업로드
		if (movieMain != null && !moviePoster[0].isEmpty()) {
			String mainFilename = movieMain.getOriginalFilename();
			String mainFilepath = fileManager.upload(savePath, movieMain);

			mainFile.setMovieFileName(mainFilename);
			mainFile.setMovieFilePath(mainFilepath);

			for (MultipartFile file : moviePoster) {
				String filename = file.getOriginalFilename();
				String upfilepath = fileManager.upload(savePath, file);

				MovieFile postFile = new MovieFile();

				postFile.setMovieFileName(filename);
				postFile.setMovieFilePath(upfilepath);

				postList.add(postFile);
			}
		}

		// board: board 내용 업데이트, fileList 사진 업데이트, fileNo 삭제
		int result = service.movieUpdate(movie, mainFile, postList, fileNo);

		// 업데이트 성공 조건, result가 삭제한 파일수 + 추가한 파일수 + 1(boardUpadte)
		if (fileNo != null && (result == (postList.size() + fileNo.length + 2))) { // 파일도 삭제하고 파일도 첨부하면
			for (String delFile : filepath) {
				boolean delResult = fileManager.deleteFile(savePath, delFile);

				if (delResult) {
					System.out.println("파일 삭제 성공");
				} else {
					System.out.println("파일 삭제 실패");
				}
			}

			return "admin/updateMovieFrm";
		} else if (fileNo == null && (result == (postList.size() + 1))) { // 파일을 삭제안하고 파일만 첨부하거나 첨부 안하면
			return "admin/updateMovieFrm";
		} else {
			return "ridirect:/";
		}
	}

	@RequestMapping(value = "/allTheater.do")
	public String allTheater() {
		return "admin/allTheater";
	}


	@RequestMapping(value="/selectOneTheater.do")	//임시 (no줘서 이동할거)
	public String selectOneTheater(int theaterNo, Model model) {
		Theater theater = service.selectOntTheater(theaterNo);
		model.addAttribute("theater",theater);
		return "admin/detailTheater";
	}
	
	@ResponseBody
	@RequestMapping(value="/selectBranchList.do", produces = "application/json;charset=utf-8")
	public String selectBranchList(String theaterLocal) {
		ArrayList<Theater> list = new ArrayList<Theater>();
		list =	service.selectBranchList(theaterLocal);
		return new Gson().toJson(list);
	}



}
