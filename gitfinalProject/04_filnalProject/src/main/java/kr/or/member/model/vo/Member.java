package kr.or.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberPhone;
	private String memberBirTh;
	private String memberEmail;
	private int memberLevel;
	private String enrollDate;
	private String memberGender;
	private String memberFilename;
	private String memberFilepath;
}
