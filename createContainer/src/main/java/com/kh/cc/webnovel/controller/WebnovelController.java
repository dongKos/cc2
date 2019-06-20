package com.kh.cc.webnovel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebnovelController {
	//웹소설 메인홈 이동
	@RequestMapping(value="webnovelMain.wn")
	public String webnovelMain() {
		return "webnovel/webnovelMain/webnovelMain";
	}
	//웹소설 메인홈 이동
	@RequestMapping(value="webnovelCategory.wn")
	public String webnovelCategory() {
		return "webnovel/webnovelCategory/webnovelCategory";
	}
	//웹소설 Top5 이동
		@RequestMapping(value="webnovelTop5.wn")
		public String webnovelTop5() {
			return "webnovel/webnovelTop5/webnovelTop5";
		}
}
