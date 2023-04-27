package kr.or.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Consultation {
	private int consultationNo;
	private String consultationTitle;
	private String consultationStatus;
	private String consultationDate;
	private String consultationMember;
}
