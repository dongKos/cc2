package com.kh.cc.illustrator.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IllustratorController {
	@RequestMapping(value="illustMain.ill")
	public String illustMain() {
		return "illustrator/illust_main";
	}
	
}
