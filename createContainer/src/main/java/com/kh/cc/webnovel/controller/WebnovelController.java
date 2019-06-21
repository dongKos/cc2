package com.kh.cc.webnovel.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.cc.common.CommonUtils;
import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webnovel.model.service.WebnovelService;
import com.kh.cc.webnovel.model.vo.Webnovel;

@Controller
public class WebnovelController {
	
	@Autowired
	private WebnovelService ws;
	
	//웹소설 등록insertNovel.wn
	@RequestMapping(value="insertNovel.wn")
	public String insertNovel(Model model, Webnovel wn, HttpServletRequest request, HttpSession session,
			@RequestParam(name="photo", required=false) MultipartFile photo) {
		
		Member m = (Member) session.getAttribute("loginUser");
		String userId = m.getUserId();
		
		wn.setuserId(userId);
		
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String filePath = root + "\\uploadFiles\\webnovelMain";
		
		String originFileName = photo.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String changeFileName = CommonUtils.getRandomString();
		ws.insertWebnovel(wn);
		System.out.println("저장 경로 확인 : " + filePath + "\\" + changeFileName + ext);
		try {
			photo.transferTo(new File(filePath + "\\" + changeFileName + ext));
			
			ws.insertWebnovel(wn);
			
			return "webnovel/insertWebnovel/webnovelList";
		} catch (IllegalStateException | IOException e) {
			
			
			new File(filePath + "\\" + changeFileName + ext).delete();
			
			model.addAttribute("msg", "작품 등록 실패!!");
			
			return "common/errorPage";
		}
		//System.out.println(wn);
		//System.out.println("파일 경로 : " + filePath);
		//System.out.println("ext : " + ext);
		//System.out.println("changeFileName : " + changeFileName);
		//System.out.println("userId : " + userId);
		//System.out.println("웹소설 정보 : " + wn);
		
		//return "webnovel/insertWebnovel/webnovelList";
	}
	//웹소설 메인홈 이동
	@RequestMapping("webnovelMain.wn")
	public String webnovelMain() {
		return "webnovel/webnovelMain/webnovelMain";
	}
	//웹소설 메인홈 이동
	@RequestMapping("webnovelCategory.wn")
	public String webnovelCategory() {
		return "webnovel/webnovelCategory/webnovelCategory";
	}
	//웹소설 Top5 이동
	@RequestMapping("webnovelTop5.wn")
	public String webnovelTop5() {
		return "webnovel/webnovelTop5/webnovelTop5";
	}
	//웹소설 도전!! 이동
	@RequestMapping("webnovelChallenge.wn")
	public String webnovelChallenge() {
		return "webnovel/webnovelChallenge/webnovelChallenge";
	}
	//웹소설 리스트 이동
	@RequestMapping("webnovelList.wn")
	public String webnovelList() {
		return "webnovel/insertWebnovel/webnovelList";
	}
	//웹소설 등록 이동
	@RequestMapping("insertWebnovel.wn")
	public String insertWebnovel() {
		return "webnovel/insertWebnovel/insertWebnovel";
	}
}
