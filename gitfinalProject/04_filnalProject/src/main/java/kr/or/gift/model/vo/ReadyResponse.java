package kr.or.gift.model.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//Jackson json object controller가 존재하지 않는 필드를 무시하는 annotation
@JsonIgnoreProperties(ignoreUnknown = true)
public class ReadyResponse {
	private String tid, next_redirect_pc_url, next_redirect_mobile_url, android_app_scheme, ios_app_scheme, created_at;
}