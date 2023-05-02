package kr.or.gift.model.vo;

import lombok.Data;

@Data
public class Amount {
	private Integer total, tax_free, vat, point, discount, green_deposit;
}
