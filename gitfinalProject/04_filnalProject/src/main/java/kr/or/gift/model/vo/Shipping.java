package kr.or.gift.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Shipping {
	private int shippingNo, orderNo, courierNo, shippingStatus;
	private String shipmentDate, arriveDate;
}
