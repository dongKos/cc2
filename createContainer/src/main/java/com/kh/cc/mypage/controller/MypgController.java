package com.kh.cc.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypgController {

	
	
	
	//마이페이지 이동
		@RequestMapping("mypgMain.mg")
		public String showLoginForm() {
			return "member/mypage/mypage";
		}
}
