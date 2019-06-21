package com.kh.cc.illustrator.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IllustratorController {
	//일러스트 메인 페이지로 이동
	@RequestMapping(value="illustMain.ill")
	public String illustMain() {
		return "illustrator/illust_main";
	}
	
	//일러스트 포트폴리오 페이지로 이동
	@RequestMapping(value="illustPortpolio.ill")
	public String illustPortpolio() {
		return "illustrator/illust_Portpolio";
	}
	
	//일러스트 도전하기 페이지로 이동
	@RequestMapping(value="illustChallenge.ill")
	public String illustChallenge() {
		return "illustrator/illust_Challenge";
	}
	
	//일러스트 후원하기 페이지로 이동
	@RequestMapping(value="illustSupport.ill")
	public String illustSupport() {
		return "illustrator/illust_Support";
	}
	
	//일러스트 작가 상세페이지로 이동
	@RequestMapping(value="illustratorDetail.ill")
	public String illustratorDatail() {
		return "illustrator/illustratorDetail";
	}
	
}
