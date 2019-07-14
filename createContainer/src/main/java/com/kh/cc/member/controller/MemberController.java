package com.kh.cc.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.cc.common.WebnovelPagination;
import com.kh.cc.member.model.exception.LoginException;
import com.kh.cc.member.model.service.MemberService;
import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;
@SessionAttributes("loginUser")
@Controller
public class MemberController {

	@Autowired
	private MemberService ms;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	//로그인용 메소드
	@RequestMapping("login.me")
	public String loginCheck(Member m, Model model, HttpSession session) {
		
		Member loginUser;
		try {
			loginUser = ms.loginMember(m);
			
			
			session.setAttribute("loginUser", loginUser);
	
			return "redirect:index.jsp";
		} catch (LoginException e) {
			model.addAttribute("msg", e.getMessage());
			
			
			return "common/errorPage";
		}
	}
	//로그아웃용 컨트롤러
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		
		return "redirect:index.jsp";
	}
	//회원가입 메소드
	@RequestMapping("insertMember.me")
	public String insertMember(Member m, Model model) {
		
		String encPassword = passwordEncoder.encode(m.getUserPwd());
		
		m.setUserPwd(encPassword);
		
		int result = ms.insertMember(m);
		
		if(result > 0) {
			return "redirect:index.jsp";
		}else {
			model.addAttribute("msg", "회원 가입 실패!!!");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="duplicationCheck.me")
	public void duplicationCheck(@RequestParam("userId")String id, HttpServletResponse response) {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Member m = new Member();
		m.setUserId(id);
		int result = ms.selectCheckId(m);
		
		try {
			response.getWriter().print(mapper.writeValueAsString(result));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="duplicationCheckNick.me")
	public void duplicationCheckNick(HttpServletRequest request, HttpServletResponse response) {
		String nickName = request.getParameter("nickName");
		ObjectMapper mapper = new ObjectMapper();
		
		Member m = new Member();
		m.setNickName(nickName);
		int result = ms.duplicationCheckNick(m);
		
		try {
			response.getWriter().print(mapper.writeValueAsString(result));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	
	//로그인 홈페이지 이동
	@RequestMapping("loginForm.me")
	public String showLoginForm() {
		return "main/loginPage";
	}
	//회원가입 페이지 이동
	@RequestMapping("showStepForm.me")
	public String showStepFrom(@ModelAttribute Member m) {
		return "main/insertMember";
	}
	//메인 페이지 이동
	@RequestMapping("mainHome.me")
	public String mainHome(@ModelAttribute Member m) {
		return "main/main";
	}

}



























