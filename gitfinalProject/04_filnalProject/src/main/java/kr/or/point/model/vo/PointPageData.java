package kr.or.point.model.vo;

import java.util.ArrayList;

import kr.or.point.model.vo.Point;
import kr.or.point.model.vo.PointPageData;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PointPageData {
	private ArrayList<Point> list;
	private String pageNavi;

}
