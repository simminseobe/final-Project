package kr.or.gift.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private int productNo;
	private int pcNo;
	private String productName;
	private int productPrice;
	private String productDetail;
	private String productCompany;
	private int shipping;
}
