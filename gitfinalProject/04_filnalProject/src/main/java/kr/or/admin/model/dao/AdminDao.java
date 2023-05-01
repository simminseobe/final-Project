package kr.or.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.admin.model.vo.Chat;
import kr.or.admin.model.vo.Consultation;
import kr.or.admin.model.vo.Schedule;
import kr.or.admin.model.vo.Theater;
import kr.or.member.model.vo.Member;
import kr.or.movie.model.vo.Movie;
import kr.or.movie.model.vo.MovieFile;
import kr.or.movie.model.vo.MovieVideo;

@Repository
public class AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectAllMember() {
		List list = sqlSession.selectList("member.selectAllMember");

		return (ArrayList<Member>) list;
	}

	public int updateMemberLevel(Member m) {
		int result = sqlSession.update("member.updateMemberLevel", m);

		return result;
	}

	public int insertMovie(Movie movie) {
		int result = sqlSession.insert("movie.insertMovie", movie);

		return result;
	}

	public int insertMainFile(MovieFile mainFile) {
		int result = sqlSession.insert("movie.insertMainFile", mainFile);

		return result;
	}

	public int insertPostFile(MovieFile file) {
		int result = sqlSession.insert("movie.insertPostFile", file);

		return result;
	}

	public int insertmovieVideo(MovieVideo video) {
		int result = sqlSession.insert("movie.insertmovieVideo", video);

		return result;
	}

	public ArrayList<MovieFile> selectFileList(int movieNo) {
		List list = sqlSession.selectList("movie.selectFileList", movieNo);

		return (ArrayList<MovieFile>) list;
	}

	public int delteMovie(int movieNo) {
		int result = sqlSession.delete("movie.delteMovie", movieNo);

		return result;
	}

	public ArrayList<String> selectTheaterAddrList(String theaterLocal) {
		List list = sqlSession.selectList("theater.selectTheaterAddr", theaterLocal);

		return (ArrayList<String>) list;
	}

	public ArrayList<String> selectOnemovieVideo(int movieNo) {
		List list = sqlSession.selectList("theater.selectOnemovieVideo", movieNo);

		return (ArrayList<String>) list;
	}

	public int insertTheater(Theater theater) {
		int result = sqlSession.insert("theater.insertTheater", theater);

		return result;
	}

	public int deleteTheater(int theaterNo) {
		int result = sqlSession.delete("theater.deleteTheater", theaterNo);

		return result;
	}

	public int updateTheater(Theater theater) {
		int result = sqlSession.update("theater.updateTheater", theater);

		return result;
	}

	public ArrayList<Theater> selectTheaterList() {
		List list = sqlSession.selectList("theater.selectTheaterList");

		return (ArrayList<Theater>) list;
	}

	public Movie selectOneUpdateMovie(int movieNo) {
		Movie movie = sqlSession.selectOne("movie.selectOneUpdateMovie", movieNo);

		return movie;
	}

	public int updateMovie(Movie movie) {
		int result = sqlSession.update("movie.updateMovie", movie);

		return result;
	}

	public int deleteFile(int[] fileNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("fileArray", fileNo);

		int result = sqlSession.delete("movie.deleteFile", map);

		return result;
	}

	public Theater selectOneTheater(int theaterNo) {
		Theater theater = sqlSession.selectOne("theater.selectOneTheater", theaterNo);
		return theater;
	}

	public ArrayList<Theater> selectBranchList(String theaterLocal) {
		List list = sqlSession.selectList("theater.selectBranchList", theaterLocal);
		return (ArrayList<Theater>) list;
	}

	public int deleteVideo(int[] videoNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("fileArray", videoNo);

		int result = sqlSession.delete("movie.deleteVideo", map);

		return result;
	}

	public List<Schedule> selectScheduleCalendar(String theaterBranch) {
		List list = sqlSession.selectList("schedule.selectScheduleCalendar", theaterBranch);

		return (List) list;
	}

	public int insertSchedule(HashMap<String, Object> map) {
		int result = sqlSession.insert("schedule.insertSchedule", map);

		return result;
	}

	public int updateSchedule(HashMap<String, Object> map) {
		int result = sqlSession.update("schedule.updateSchedule", map);

		return result;
	}

	public int selectscheduleNo(HashMap<String, Object> map) {
		int scheduleNo = sqlSession.selectOne("schedule.selectscheduleNo", map);

		return scheduleNo;
	}

	public int deleteSchedule(String scheduleNo) {
		int result = sqlSession.delete("schedule.deleteSchedule", scheduleNo);

		return result;
	}

	public int insertConsultation(Consultation consultation) {
		int result = sqlSession.insert("consultation.insertConsultation", consultation);

		return result;
	}

	public ArrayList<Consultation> selectConsultation() {
		List list = sqlSession.selectList("consultation.selectConsultation");

		return (ArrayList<Consultation>) list;
	}

	public int insertChat(Chat chat) {
		int result = sqlSession.insert("chat.insertChat", chat);

		return result;
	}

	public ArrayList<Chat> selectChat(int consultationNo) {
		List list = sqlSession.selectList("chat.selectChat", consultationNo);

		System.out.println(consultationNo);

		return (ArrayList<Chat>) list;
	}

	public int deleteConsultation(int consultationNo) {
		int result = sqlSession.delete("consultation.deleteConsultation", consultationNo);

		return result;
	}

}
