package kr.or.giftticket.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GiftTicketPageData {
	private ArrayList<GiftTicket> list;
	private String pageNavi;
}
