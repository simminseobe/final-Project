package kr.or.admin.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import common.FileManager;
import kr.or.admin.model.service.AdminService;
import kr.or.admin.model.vo.Chat;
import kr.or.admin.model.vo.Consultation;
import kr.or.admin.model.vo.SalesPerDay;
import kr.or.admin.model.vo.Schedule;
import kr.or.admin.model.vo.Theater;
import kr.or.member.model.vo.Member;
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
	public String adminPage(Model model) {
		ArrayList<Member> list = new ArrayList<Member>();

		int memberCnt = service.selectMemberCnt();
		int movieCnt = service.selectMovieCnt();
		int scheduleCnt = service.selectSchduleCnt();
		int consultationCnt = service.selectConsultationCnt();
		list = service.selectAllMember();

		model.addAttribute("memberCnt", memberCnt);
		model.addAttribute("movieCnt", movieCnt);
		model.addAttribute("scheduleCnt", scheduleCnt);
		model.addAttribute("consultationCnt", consultationCnt);
		model.addAttribute("list", list);

		return "admin/adminPage";
	}

	@RequestMapping(value = "/manageMember.do")
	public String manageMember(Model model) {
		ArrayList<Member> list = new ArrayList<Member>();

		list = service.selectAllMember();

		model.addAttribute("list", list);

		return "admin/manageMember";
	}

	@RequestMapping(value = "/updateMemberLevel.do")
	public String updateMemberLevel(Member member) {
		int result = service.updateMemberLevel(member);

		if (result > 0 && member.getMemberLevel() == 0) {
			return "redirect:/adminPage.do";
		} else if (result > 0) {
			return "redirect:/manageMember.do";
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/registerMovieFrm.do")
	public String registerMovieFrm() {
		return "admin/registerMovieFrm";
	}

	@ResponseBody
	@RequestMapping(value = "/dupTitleChk.do")
	public String dupTitleChk(String movieTitle) {
		Movie movie = movieServie.selectTitleMovie(movieTitle);

		return new Gson().toJson(movie);
	}

	@RequestMapping(value = "/registerMovie.do")
	public String registerMovie(Movie movie, String movieVideo[], MultipartFile movieMain, MultipartFile[] moviePoster,
			HttpServletRequest request) {
		MovieFile mainFile = new MovieFile();
		ArrayList<MovieFile> postList = new ArrayList<MovieFile>();

		// 파일 서버에 업로드
		if (!movieMain.isEmpty() && !moviePoster[0].isEmpty()) {
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

	@RequestMapping(value = "/updateMovieFrm.do")
	public String updateMovieFrm(int movieNo, Model model) {
		Movie movie = service.selectOneUpdateMovie(movieNo);

		model.addAttribute("movie", movie);

		return "admin/updateMovieFrm";
	}

	@RequestMapping(value = "/updateMovie.do")
	public String updateMovie(Movie movie, int[] fileNo, String[] filepath, int[] videoNo, MultipartFile movieMain,
			MultipartFile[] moviePoster, String movieVideo[], HttpServletRequest request) {
		MovieFile mainFile = new MovieFile();
		ArrayList<MovieFile> postList = new ArrayList<MovieFile>();
		ArrayList<MovieVideo> videoList = new ArrayList<MovieVideo>();

		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/movie/");

		// 파일 서버에 업로드
		if (!movieMain.isEmpty() && !moviePoster[0].isEmpty()) {
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
		} else if (!moviePoster[0].isEmpty()) {
			for (MultipartFile file : moviePoster) {
				String filename = file.getOriginalFilename();
				String upfilepath = fileManager.upload(savePath, file);

				MovieFile postFile = new MovieFile();

				postFile.setMovieFileName(filename);
				postFile.setMovieFilePath(upfilepath);

				postList.add(postFile);
			}
		} else if (!movieMain.isEmpty()) {
			String mainFilename = movieMain.getOriginalFilename();
			String mainFilepath = fileManager.upload(savePath, movieMain);

			mainFile.setMovieFileName(mainFilename);
			mainFile.setMovieFilePath(mainFilepath);
		} else {
			System.out.println("파일 추가 없음");
		}

		if (movieVideo != null) {
			for (String link : movieVideo) {
				MovieVideo video = new MovieVideo();

				video.setVideoLink(link);

				videoList.add(video);
			}
		}

		// board: board 내용 업데이트, fileList 사진 업데이트, fileNo 삭제
		int result = service.movieUpdate(movie, mainFile, postList, fileNo, videoList, videoNo);

		// 파일 삭제 동작 = 삭제 파일 이 있고 && 다 성공 하면
		if (fileNo != null && result > 0) {
			// 파일 삭제
			for (String delFile : filepath) {
				boolean delResult = fileManager.deleteFile(savePath, delFile);

				if (delResult) {
					System.out.println("파일 삭제 성공");
				} else {
					System.out.println("파일 삭제 실패");
				}
			}
			// 리턴
			return "redirect:/updateMovieFrm.do?movieNo=" + movie.getMovieNo();
			// 파일 삭제 동작 != 삭제 파일 이 없고 && 다 성공 하면 - 파일 삭제 수
		} else if (fileNo == null && result > 0) {
			return "redirect:/updateMovieFrm.do?movieNo=" + movie.getMovieNo();
		} else {
			return "ridirect:/";
		}
	}

	@RequestMapping(value = "/deleteMovie.do")
	public String deleteMovie(int movieNo, HttpServletRequest request) {
		// db 삭제하고, 서버에 업로드 되있는 파일을 지우기위해 파일 목록을 가져옴
		ArrayList<MovieFile> list = service.delteMovie(movieNo);

		if (list == null) {
			return "redirect:/";
		} else { // 파일 목록 가져오면
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/movie/");

			for (MovieFile file : list) {
				boolean deleteResult = fileManager.deleteFile(savePath, file.getMovieFilePath());

				if (deleteResult) {
					System.out.println("파일 삭제 성공");
				} else {
					System.out.println("파일 삭제 실패");
				}
			}
		}

		return "redirect:/MovieList.do";
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
			return "admin/registerTheaterFrm";
		} else {
			return "redirect:/";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/dupBranchChk.do")
	public String dupBranchChk(String theaterBranch) {
		Theater theater = service.dupBranchChk(theaterBranch);

		return new Gson().toJson(theater);
	}

	@RequestMapping(value = "/theaterList.do")
	public String theaterList(Model model) {
		ArrayList<Theater> list = service.selectTheaterList();

		model.addAttribute("list", list);

		return "/admin/theaterList";
	}

	@RequestMapping(value = "/deleteTheater.do")
	public String deleteTheater(int theaterNo) {
		int result = service.deleteTheater(theaterNo);

		if (result > 0) {
			return "redirect:/theaterList.do";
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/updateTheaterFrm.do")
	public String updateTheaterFrm(int theaterNo, Model model) {
		Theater theater = service.selectOntTheater(theaterNo);

		model.addAttribute("theater", theater);

		return "admin/updateTheaterFrm";
	}

	@RequestMapping(value = "/updateTheater.do")
	public String updateTheater(Theater theater) {
		int result = service.updateTheater(theater);

		if (result > 0) {
			return "redirect:/theaterList.do";
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/allTheater.do")
	public String allTheater() {
		return "admin/allTheater";
	}

	@RequestMapping(value = "/selectOneTheater.do") // 임시 (no줘서 이동할거)
	public String selectOneTheater(int theaterNo, Model model) {
		Theater theater = service.selectOntTheater(theaterNo);
		model.addAttribute("theater", theater);
		return "admin/detailTheater";
	}

	@ResponseBody
	@RequestMapping(value = "/selectBranchList.do", produces = "application/json;charset=utf-8")
	public String selectBranchList(String theaterLocal) {
		ArrayList<Theater> list = new ArrayList<Theater>();
		list = service.selectBranchList(theaterLocal);
		return new Gson().toJson(list);
	}

	@RequestMapping(value = "/screenSchedule.do")
	public String screenSchedule() {
		return "admin/screenSchedule";
	}

	@ResponseBody
	@RequestMapping(value = "/selectScheduleCalendar.do", produces = "application/json;charset=utf-8")
	public String selectScheduleCalendar(String theaterBranch) {
		List<Schedule> list = service.selectScheduleCalendar(theaterBranch);

		Gson gson = new Gson();
		JsonArray jsonArray = new JsonArray();

		for (Schedule schedule : list) {
			JsonObject jsonObject = new JsonObject();

			jsonObject.addProperty("title", schedule.getMovieTitle());
			jsonObject.addProperty("start", schedule.getScheduleStart());
			jsonObject.addProperty("end", schedule.getScheduleEnd());
			jsonObject.addProperty("description", schedule.getTheaterBranch());

			jsonArray.add(jsonObject);
		}

		return gson.toJson(jsonArray);
	}

	@ResponseBody
	@RequestMapping(value = "registerSchedule.do")
	public String registerSchedule(@RequestBody String param) {
		JsonElement element = JsonParser.parseString(param);

		String title = element.getAsJsonObject().get("title").getAsString();
		String branch = element.getAsJsonObject().get("branch").getAsString();
		String start = element.getAsJsonObject().get("start").getAsString();
		String end = element.getAsJsonObject().get("end").getAsString();

		// fullCalander 시간을 DB형식에 맞게 Format
		DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
		DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yy/MM/dd HH:mm");

		// fullCalander가 미국시라서 시차 9시간 더해주기ㅏ.minusHours(15)
		LocalDateTime startDateTime = LocalDateTime.parse(start, inputFormatter).plusHours(9);
		LocalDateTime endDateTime = LocalDateTime.parse(end, inputFormatter).plusHours(9);

		String startOutput = startDateTime.format(outputFormatter);
		String endOutput = endDateTime.format(outputFormatter);

		int result = service.insertSchedule(title, branch, startOutput, endOutput);

		return String.valueOf(result);
	}

	@ResponseBody
	@RequestMapping(value = "/selectscheduleNo.do")
	public String selectscheduleNo(@RequestBody String param) {
		JsonElement element = JsonParser.parseString(param);

		String oldTitle = element.getAsJsonObject().get("oldTitle").getAsString();
		String oldBranch = element.getAsJsonObject().get("oldBranch").getAsString();
		String oldStart = element.getAsJsonObject().get("oldStart").getAsString();
		String oldEnd = element.getAsJsonObject().get("oldEnd").getAsString();

		// fullCalander 시간을 DB형식에 맞게 Format
		DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
		DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yy/MM/dd HH:mm");
		// fullCalander가 미국시라서 시차 9시간 더해주기ㅏ.minusHours(15)
		LocalDateTime startDateTime = LocalDateTime.parse(oldStart, inputFormatter);
		LocalDateTime endDateTime = LocalDateTime.parse(oldEnd, inputFormatter);

		String startOutput = startDateTime.format(outputFormatter);
		String endOutput = endDateTime.format(outputFormatter);

		int schduleNo = service.selectscheduleNo(oldTitle, oldBranch, startOutput, endOutput);

		return String.valueOf(schduleNo);
	}

	@ResponseBody
	@RequestMapping(value = "/updateSchedule.do")
	public String updateSchedule(@RequestBody String param) {
		JsonElement element = JsonParser.parseString(param);

		String start = element.getAsJsonObject().get("start").getAsString();
		String end = element.getAsJsonObject().get("end").getAsString();
		String scheduleNo = element.getAsJsonObject().get("scheduleNo").getAsString();

		// fullCalander 시간을 DB형식에 맞게 Format
		DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
		DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yy/MM/dd HH:mm");
		// fullCalander가 미국시라서 시차 9시간 더해주기ㅏ.minusHours(15)
		LocalDateTime startDateTime = LocalDateTime.parse(start, inputFormatter);
		LocalDateTime endDateTime = LocalDateTime.parse(end, inputFormatter);

		String startOutput = startDateTime.format(outputFormatter);
		String endOutput = endDateTime.format(outputFormatter);

		int result = service.updateSchedule(startOutput, endOutput, scheduleNo);

		return String.valueOf(result);
	}

	@ResponseBody
	@RequestMapping(value = "/deleteSchedule.do")
	public String deleteSchedule(@RequestBody String param) {
		JsonElement element = JsonParser.parseString(param);

		String scheduleNo = element.getAsJsonObject().get("scheduleNo").getAsString();

		int result = service.deleteSchedule(scheduleNo);

		return String.valueOf(result);
	}

	@RequestMapping(value = "/adminConsultation.do")
	public String adminConsultation(Model model) {
		ArrayList<Consultation> consultationsList = service.selectConsultation();

		model.addAttribute("consultationsList", consultationsList);

		return "admin/adminConsultation";
	}

	@ResponseBody
	@RequestMapping(value = "/registerConsultation.do", produces = "application/json;charset=utf-8")
	public String registerConsultation(Consultation consultation) {
		int result = service.insertConsultation(consultation);

		return String.valueOf(consultation.getConsultationNo());
	}

	@RequestMapping(value = "/adminChat.do")
	public String adminChat(Chat chat, Model model) {
		model.addAttribute("chat", chat);

		return "admin/adminChat";
	}

	@RequestMapping(value = "/adminCenter.do")
	public String adminCenter() {
		return "admin/adminCenter";
	}

	@ResponseBody
	@RequestMapping(value = "/selectChat.do", produces = "application/json;charset=utf-8")
	public String selectChat(int consultationNo) {
		ArrayList<Chat> list = new ArrayList<Chat>();

		list = service.selectChat(consultationNo);

		return new Gson().toJson(list);
	}

	@ResponseBody
	@RequestMapping(value = "/deleteConsultation.do", produces = "application/json;charset=utf-8")
	public String deleteConsultation(String consultationNo) {
		int result = service.deleteConsultation(Integer.parseInt(consultationNo));

		return String.valueOf(result);
	}

	@ResponseBody
	@RequestMapping(value = "/selectSalesPerDay.do", produces = "application/json;charset=utf-8")
	public String selectSalesPerDay() {
		ArrayList<SalesPerDay> list = new ArrayList<SalesPerDay>();

		list = service.selectSalesPerDay();

		return new Gson().toJson(list);
	}
}