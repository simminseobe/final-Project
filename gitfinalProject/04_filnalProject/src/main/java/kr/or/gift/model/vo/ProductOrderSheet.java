package kr.or.gift.model.vo;

import java.util.ArrayList;

import kr.or.member.model.vo.ShippingAddress;
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
	private int memberNo;

	private ArrayList<ShippingAddress> sas;
	private Product product;
	private ProductOption productOption;
}
