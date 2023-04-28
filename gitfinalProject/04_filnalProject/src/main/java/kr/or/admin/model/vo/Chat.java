package kr.or.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Chat {
	private int chatNo;
	private String chatContent;
	private String chatDate;
	private int memberLevel;
	private String chatMember;
	private int consultationNo;
}
