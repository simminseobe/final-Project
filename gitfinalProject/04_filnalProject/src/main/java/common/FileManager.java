package common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {
	public String upload(String savePath, MultipartFile file) {
		String filename = file.getOriginalFilename();

		String onlyFilename = filename.substring(0, filename.lastIndexOf(".")); // test
		String extention = filename.substring(filename.lastIndexOf(".")); // .txt
		// 실제 업로드할 파일명
		String filepath = null;
		// 파일명 중복 시 뒤에 붙일 숫자
		int count = 0;
		// 파일 중복이 아닐때 까지 검사
		while (true) {
			if (count == 0) {
				// 첫번째 검증일 경우 숫자 붙이지 않음
				filepath = onlyFilename + extention; // text.txt
			} else {
				filepath = onlyFilename + "_" + count + extention; // text_1.txt
			}

			File checkFile = new File(savePath + filepath);

			if (!checkFile.exists()) { // 파일 중복이 아닐때
				break; // "_" + count 안붙이고 그냥 나감
			}

			count++;
		}

		// 파일명 중복체크 끝 -> 파일 업로드
		try {
			// 파일 업로드 주 스트림
			FileOutputStream fos = new FileOutputStream(savePath + filepath);
			// 속도 향상을 위해 보조 스트림 생성
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			// 파일 업로드
			byte[] bytes = file.getBytes();

			bos.write(bytes);

			bos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return filepath;
	}

	public boolean deleteFile(String savePath, String filepath) {
		File delFile = new File(savePath + filepath);

		return delFile.delete();
	}

	public void downloadFile(String filename, String downFile, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			FileInputStream fis = new FileInputStream(downFile);
			// 속도 빠르게
			BufferedInputStream bis = new BufferedInputStream(fis);
			// 읽어온 파일을 사용자에게 내보낼 스트림 생성
			ServletOutputStream sos = response.getOutputStream();
			// 보조 스트림
			BufferedOutputStream bos = new BufferedOutputStream(sos);
			// 파일명 처리
			String resFilename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");

			// response: 파일 다운로드 로직 구현
			// 파일 다운로드를 위한 HTTP 헤더 설정
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment;filename=" + resFilename);

			// 파일 전송
			while (true) {
				int read = bis.read();

				if (read != -1) {
					bos.write(read);
				} else {
					break;
				}
			}

			bos.close();
			bis.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
