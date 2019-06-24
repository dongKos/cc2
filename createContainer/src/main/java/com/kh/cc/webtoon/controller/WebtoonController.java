package com.kh.cc.webtoon.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.cc.common.CommonUtils;
import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webtoon.model.service.WebtoonService;
import com.kh.cc.webtoon.model.vo.Webtoon;
import com.kh.cc.webtoon.model.vo.WebtoonPhoto;

@Controller
public class WebtoonController {

	@Autowired
	private WebtoonService ws;

	// 웹툰 메인페이지로 이동
	@RequestMapping(value = "webtoonMain.wt")
	public String webtoonMain() {
		return "webtoon/webtoonMain";
	}

	// 웹툰 TOP5페이지로 이동
	@RequestMapping(value = "webtoonTop5.wt")
	public String webtoonTop5() {
		return "webtoon/webtoonTop5";
	}

	// 웹툰 홈으로 이동
	@RequestMapping(value = "webtoonHome.wt")
	public String webtoonHome() {
		return "webtoon/webtoonHome";
	}

	// 웹툰 도전페이지로 이동
	@RequestMapping(value = "webtoonChallenge.wt")
	public String webtoonChallenge() {
		return "webtoon/webtoonChallenge";
	}

	// 웹툰 마이페이지로 이동
	@RequestMapping(value = "webtoonMypage.wt")
	public String webtoonMypage() {
		return "webtoon/webtoonMypage";
	}

	// 웹툰 요일별페이지로 이동
	@RequestMapping(value = "webtoonDaily.wt")
	public String webtoonDaily() {
		return "webtoon/webtoonDaily";
	}

	// 완결 조회
	@RequestMapping(value = "webtoonComplete.wt")
	public String webtoonComplete() {
		return "webtoon/webtoonComplete";
	}

	// 장르별 조회
	@RequestMapping(value = "webtoonGenre.wt")
	public String webtoonGenre() {
		return "webtoon/webtoonGenre";
	}

	// 웹툰 회차목록페이지로 가기
	@RequestMapping(value = "webtoonWork.wt")
	public String webtoonWork() {
		return "webtoon/webtoonWork";
	}

	// 웹툰보는페이이 지이동
	@RequestMapping(value = "webtoonWorkRound.wt")
	public String webtoonWorkRound() {
		return "webtoon/webtoonWorkRound";
	}

	// 웹툰 공지사항 가는것
	@RequestMapping(value = "webtoonNotice.wt")
	public String webtoonNotice() {
		return "webtoon/webtoonNotice";
	}

	// 웹툰 작품등록폼
	@RequestMapping(value = "webtoonUpload.wt")
	public String insertWebtoon() {
		return "webtoon/webtoonUpload";
	}

	// 웹툰 Work등록폼으로 가기
	@RequestMapping(value = "insertWork.wt")
	public String webtoonWorkInsert() {
		return "webtoon/webtoonWorkInsert";
	}

	// 웹툰 등록

	@RequestMapping(value = "insertWebtoon.wt")
	public String InsertWork(Model model, Webtoon wt, HttpServletRequest request, HttpSession session, Member m,
			WebtoonPhoto wp, @RequestParam(name = "photo", required = false) MultipartFile photo) {

		m = (Member) session.getAttribute("loginUser");
		System.out.println("웹툰컨트롤러 들어옴");

		System.out.println("photo : " + photo);
		
		System.out.println("loginUser : " + m);
		System.out.println("webtoon : " + wt);

		String userId = m.getUserId();
		wt.setUserId(userId);
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String filePath = root + "\\uplaodFiles\\webtoonImg\\webtoonMain";
		String originFileName = photo.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String changeFileName = CommonUtils.getRandomString();
		
		
		  wp.setOriginName(originFileName); 
		  wp.setChangeName(changeFileName + ext);
		  wp.setFilePath(filePath); 
		  wp.setUserId(userId);
		  
		  System.out.println("파일 패스 : " + filePath);
		  System.out.println("WebtoonPhoto : " + wp);
		  System.out.println("MultipartFile : " + photo.getOriginalFilename());
		 
		
		try {
			System.out.println("이거 잘 작동하나?? ");
			
			ws.insertWebtoon(wt, wp);
			photo.transferTo(new File(filePath + "\\" + changeFileName + ext));
			
			
			return "webtoon/webtoonUpload";
			
		} catch (Exception e) {
			new File(filePath + "\\" + changeFileName + ext).delete();
			
			model.addAttribute("msg","작품등록실패");
			
			return "common/errorPage";
					
		} 

	}

}






















