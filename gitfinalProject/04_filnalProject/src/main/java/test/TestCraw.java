package test;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class TestCraw {

	public static void main(String[] args) {
		//String URL = "https://megabox.co.kr/movie-detail?rpstMovieNo=21003800";
		String URL = "https://www.kobis.or.kr/kobis/business/main/main.do";
		Document doc = null;
		try {
			doc = Jsoup.connect(URL).get();
			Elements elements = doc.select(".wrap_tbl table tbody td");
			System.out.println(elements.text());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/*
		 //누적관객수
		try {
			Document doc = Jsoup.connect(URL).get();
			Elements elements = doc.select(".cont>em");
			System.out.println(elements.get(1).text());
//			for( Element element : elements ) {
//			    System.out.println(element.text());
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}*/
		//System.out.println(doc);
	}

}
