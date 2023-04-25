package kr.or.gift.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductOption {
	private int poNo;
	private int productNo;
	private String poName;
	private int poPrice;
}
