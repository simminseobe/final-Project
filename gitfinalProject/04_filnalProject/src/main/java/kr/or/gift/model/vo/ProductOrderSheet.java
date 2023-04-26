package kr.or.gift.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductOrderSheet {
	private int posNo;
	private int orderNo;
	private int productNo;
	private int poNo;
	private int orderCount;
}
