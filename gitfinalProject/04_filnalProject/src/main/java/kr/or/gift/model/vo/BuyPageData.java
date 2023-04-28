package kr.or.gift.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BuyPageData {
	private ArrayList<Buy> list;
	private String pageNavi;
}
