package kr.or.crawlTest.controller;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
/*
@Controller
public class crawlTestController {
	
	public static void main(String[] args) {
		String URL = "https://www.megabox.co.kr/movie";
		Document doc = null;
		try {
			doc = Jsoup.connect(URL).get();
			System.out.println(doc);

			// .movie-list-info 클래스에 해당하는 요소들의 텍스트를 가져와 출력
			Elements elements = doc.select("#movieList");
			for (Element element : elements) {
				String text = element.text();
				System.out.println(text);
			}
			
			// .movie-list-info 클래스에 해당하는 첫 번째 요소의 href 속성 값을 가져와 출력
			Element firstElement = doc.select(".movie-list-info").first();
			String href = firstElement.attr("alt");
			System.out.println(href);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
*/

@Controller
public class crawlTestController {
	
	public static void main(String[] args) {
		String URL = "https://www.megabox.co.kr/booking/selectBokdList.do";
		Document doc = null;
		try {
			doc = Jsoup.connect(URL).get();
			System.out.println(doc);
			//Elements elements = doc.select(".btn");
			//System.out.println(elements.text());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
