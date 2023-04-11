package kr.or.gift.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductCategory {
	private int pcNo;
	private String pcCategory;
	private int pcStep;
	private int pcDepth;
}
