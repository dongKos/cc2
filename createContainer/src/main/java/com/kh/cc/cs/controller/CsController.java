package com.kh.cc.cs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CsController {

	//공지사항으로 이동
			@RequestMapping("NoticeList.mg")
			public String showNoticeList() {
				return "cs/notice";
			}
	//faq로 이동
			@RequestMapping("Faq.mg")
			public String showFaqList() {
				return "cs/faq";
			}	
			
			
	//사이트 이용안내로 이동
			@RequestMapping("Guide.mg")
			public String showGuideList() {
				return "cs/guide";
			}
	
	
}
