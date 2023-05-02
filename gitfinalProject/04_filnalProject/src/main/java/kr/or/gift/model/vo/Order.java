package kr.or.gift.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
	private int orderNo;
	private String memberId;
	private int orderPrice;
	private int orderStatus;
	private String orderRequest;
	private String shipRequest;
	private String orderDate;
	
	private String itemName;
	private int quantity;
	private ArrayList<ProductOrderSheet> posList;
}
