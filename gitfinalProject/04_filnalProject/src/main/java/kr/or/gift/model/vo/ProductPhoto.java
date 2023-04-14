package kr.or.gift.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductPhoto {
	private int ppNo;
	private int productNo;
	private int pp_order;
	private String ppPath;
}
