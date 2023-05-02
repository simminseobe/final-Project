package kr.or.gift.model.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
//Jackson json object controller가 존재하지 않는 필드를 무시하는 annotation
@JsonIgnoreProperties(ignoreUnknown = true)
public class KakaoPay {
	private int gpNo,  totalAmount, taxFree;
	private String tid, cid;
	private Amount amount;
}
