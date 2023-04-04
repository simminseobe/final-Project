package common;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

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
}
