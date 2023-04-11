package kr.or.ticketing.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

public class crawlTestController {
	@Controller
	public class CrawlTestController {

		@GetMapping("/crawl")
		public String crawl(Model model) {
			try {
				// 연결 설정 및 연결 요청
				Document doc = Jsoup.connect("https://www.example.com").get();

				// 웹 페이지의 제목 추출
				String title = doc.title();
				model.addAttribute("title", title);

				// 웹 페이지의 모든 링크 추출
				Elements links = doc.select("a");
				model.addAttribute("links", links);

				// 웹 페이지에서 특정 요소의 텍스트 추출
				Element element = doc.selectFirst("#exampleId");
				if (element != null) {
					String elementText = element.text();
					model.addAttribute("elementText", elementText);
				}

			} catch (IOException e) {
				e.printStackTrace();
			}

			return "ticketing/crawlResult"; // 결과를 표시할 뷰 이름 반환
		}
	}
}
