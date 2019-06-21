package com.kh.cc.webtoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebtoonController {
	
	//웹툰 메인페이지로 이동
	@RequestMapping(value="webtoonMain.wt")
	public String webtoonMain() {
		return "webtoon/webtoonMain";
	}
	
	//웹툰 TOP5페이지로 이동
	@RequestMapping(value="webtoonTop5.wt")
	public String webtoonTop5() {
		return "webtoon/webtoonTop5";
	}
	
	//웹툰 홈으로 이동
	@RequestMapping(value="webtoonHome.wt")
	public String webtoonHome() {
		return "webtoon/webtoonHome";
	}
	
	//웹툰 도전페이지로 이동
	@RequestMapping(value="webtoonChallenge.wt")
	public String webtoonChallenge() {
		return "webtoon/webtoonChallenge";
	}
	
	//웹툰 마이페이지로 이동
	@RequestMapping(value="webtoonMypage.wt")
	public String webtoonMypage() {
		return "webtoon/webtoonMypage";
	}
	
	//웹툰 요일별페이지로 이동
	@RequestMapping(value="webtoonDaily.wt")
	public String webtoonDaily() {
		return "webtoon/webtoonDaily";
	}

	//완결 조회
	@RequestMapping(value="webtoonComplete.wt")
	public String webtoonComplete() {
		return "webtoon/webtoonComplete";
	}
	
	//장르별 조회
	@RequestMapping(value="webtoonGenre.wt")
	public String webtoonGenre() {
		return "webtoon/webtoonGenre";
	}
}











