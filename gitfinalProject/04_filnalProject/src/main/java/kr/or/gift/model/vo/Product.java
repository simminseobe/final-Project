package kr.or.gift.model.vo;

import java.io.Serializable;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@Data
@NoArgsConstructor
@AllArgsConstructor
//직렬화를 위해 상속받음
public class Product implements Serializable {
	private int productNo;
	private int pcNo;
	private String productName;
	private int productPrice;
	private String productDetail;
	private String productCompany;
	private int shipping;
	private int productStatus;
	private String simpleInfo;
	
	private int totalOrder;
	private boolean productLikeStatus;
	
	private ArrayList<ProductCategory> categorys;
	private ArrayList<ProductOption> productOptions;
	private ProductPhoto mainImage;
	private ArrayList<ProductPhoto> images;
	
	private int productLikeCount;
}
