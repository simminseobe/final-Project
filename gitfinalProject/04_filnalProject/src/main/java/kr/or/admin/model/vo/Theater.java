package kr.or.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Theater {
	private int theaterNo;
	private String theaterLocal;
	private String theaterBranch;
	private String theaterAddr;
	private String theaterContent;
	private String theaterFacility;
	private String enrollMember;
}
