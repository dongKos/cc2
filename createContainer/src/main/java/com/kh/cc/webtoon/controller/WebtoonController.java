package com.kh.cc.webtoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebtoonController {
	@RequestMapping(value="webtoonMain.wt")
	public String webtoonMain() {
		return "webtoon/webtoonMain";
	}
	
	@RequestMapping(value="webtoonTop5.wt")
	public String webtoonTop5() {
		return "webtoon/webtoonTop5";
	}
	
	@RequestMapping(value="webtoonHome.wt")
	public String webtoonHome() {
		return "webtoon/webtoonHome";
	}
	
	@RequestMapping(value="webtoonChallenge.wt")
	public String webtoonChallenge() {
		return "webtoon/webtoonChallenge";
	}
	
	@RequestMapping(value="webtoonMypage.wt")
	public String webtoonMypage() {
		return "webtoon/webtoonMypage";
	}
	

}
