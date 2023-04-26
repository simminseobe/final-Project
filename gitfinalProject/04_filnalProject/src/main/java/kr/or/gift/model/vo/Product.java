package kr.or.gift.model.vo;

import java.util.ArrayList;

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
	private int productStatus;
	private String simpleInfo;
	
	private ArrayList<ProductCategory> categorys;
	private ArrayList<ProductOption> productOptions;
	private ProductPhoto mainImage;
	private ArrayList<ProductPhoto> images;
	
	
	
	private int productLikeCount;
}
