package kr.or.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Theater {
	private int theaterNo;
	private String theaterCode;
	private String theaterLocal;
	private String theaterAddr;
}
