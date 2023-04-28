package kr.or.ticketing.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReservationPageData {
	private ArrayList<Reservation> list;
	private String pageNavi;
}
