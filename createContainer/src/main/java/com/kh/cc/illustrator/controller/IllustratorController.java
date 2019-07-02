package com.kh.cc.illustrator.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kh.cc.common.CommonUtils;
import com.kh.cc.common.IllustratorPagination;
import com.kh.cc.illustrator.model.service.IllustratorService;
import com.kh.cc.illustrator.model.vo.Illustrator;
import com.kh.cc.illustrator.model.vo.IllustratorPageInfo;
import com.kh.cc.illustrator.model.vo.IllustratorPhoto;
import com.kh.cc.member.model.vo.Member;
@SessionAttributes("loginUser")
@Controller
public class IllustratorController {
	
	  @Autowired
	  private IllustratorService is;
	 
	
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
	public String illustratorDatail(String userId) {
		
		System.out.println("userId : " + userId);
		
		
		return "redirect:selectIllustratorDetail.ill";
	}
	
	//일러스트 포트폴리오 상세페이지로 이동
	@RequestMapping(value="illustPortpolioDetail.ill")
	public String illustPortpolioDetail() {
		return "illustrator/illustPortpolioDetail";
	}
	
	//일러스트 도전하기 상세페이지로 이동
	@RequestMapping(value="illustChallengeDetail.ill")
	public String illustChallengeDetail() {
		return "illustrator/illustChallengeDetail";
	}
	
	//일러스트 후원 페이지로 이동
	@RequestMapping("illustSupportDetail.ill")
	public String illustSupportDetail () {
		return "illustrator/illustSupport";
	}
	
	//일러스트 후원 리워드 페이지 이동
	@RequestMapping("illustSupportReward.ill")
	public String illustSupportReward() {
		return "illustrator/illustSupportReward";
	}
	
	//일러스트 후원 신청 페이지 이동
	@RequestMapping("illustRewardApply.ill")
	public String illustRewardApply() {
		return "illustrator/illustSupportApply";
	}
	
	//일러스트 의뢰하기 페이지 이동
	@RequestMapping("illustRequest.ill")
	public String illustRequest() {
		return "illustrator/illustRequest";
	}
	
	//일러스트 포트폴리오 글등록 페이지 이동
	@RequestMapping("illustPortfolioWrite.ill")
	public String illustPortfolioWrite() {
		return "illustrator/illustPortfolioWrite";
	}
	
	//일러스트 포트폴리오 글등록
	@RequestMapping(value="insertPortfolioIllust.ill")
	public String insertPortfolioIllust(Model model, Illustrator ill, HttpServletRequest request, HttpSession session, Member m,
			@RequestParam(name="photo", required=false) MultipartFile photo,
			@RequestParam(name="photo1", required=false) MultipartFile photo1,
			@RequestParam(name="photo2", required=false) MultipartFile photo2,
			@RequestParam(name="photo3", required=false) MultipartFile photo3,
			@RequestParam(name="photo4", required=false) MultipartFile photo4) {
		m = (Member) session.getAttribute("loginUser");
		String userId = m.getUserId();
		ill.setUserId(userId);
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String filePath = root + "\\uploadFiles\\illustrator\\illPortfolio";
		String originFileName = photo.getOriginalFilename();
		String originFileName1 = photo1.getOriginalFilename();
		String originFileName2 = photo2.getOriginalFilename();
		String originFileName3 = photo3.getOriginalFilename();
		String originFileName4 = photo4.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String ext1 = originFileName.substring(originFileName1.lastIndexOf("."));
		String ext2 = originFileName.substring(originFileName2.lastIndexOf("."));
		String ext3 = originFileName.substring(originFileName3.lastIndexOf("."));
		String ext4 = originFileName.substring(originFileName4.lastIndexOf("."));
		String changeFileName = CommonUtils.getRandomString();
		String changeFileName1 = CommonUtils.getRandomString();
		String changeFileName2 = CommonUtils.getRandomString();
		String changeFileName3 = CommonUtils.getRandomString();
		String changeFileName4 = CommonUtils.getRandomString();
		
		IllustratorPhoto ip = new IllustratorPhoto();
		IllustratorPhoto ip1 = new IllustratorPhoto();
		IllustratorPhoto ip2 = new IllustratorPhoto();
		IllustratorPhoto ip3 = new IllustratorPhoto();
		IllustratorPhoto ip4 = new IllustratorPhoto();
		
		ip.setOriginName(originFileName);
		ip.setChangeName(changeFileName + ext);
		ip.setFilePath(filePath);
		ip.setUserId(userId);
		
		ip1.setOriginName(originFileName1);
		ip1.setChangeName(changeFileName1 + ext1);
		ip1.setFilePath(filePath);
		ip1.setUserId(userId);
		
		ip2.setOriginName(originFileName2);
		ip2.setChangeName(changeFileName2 + ext2);
		ip2.setFilePath(filePath);
		ip2.setUserId(userId);
		
		ip3.setOriginName(originFileName3);
		ip3.setChangeName(changeFileName3 + ext3);
		ip3.setFilePath(filePath);
		ip3.setUserId(userId);
		
		ip4.setOriginName(originFileName4);
		ip4.setChangeName(changeFileName4 + ext4);
		ip4.setFilePath(filePath);
		ip4.setUserId(userId);
		
		try {
			photo.transferTo(new File(filePath + "\\" + changeFileName + ext));
			photo1.transferTo(new File(filePath + "\\" + changeFileName1 + ext1));
			photo2.transferTo(new File(filePath + "\\" + changeFileName2 + ext2));
			photo3.transferTo(new File(filePath + "\\" + changeFileName3 + ext3));
			photo4.transferTo(new File(filePath + "\\" + changeFileName4 + ext4));
			
			is.insertIllustratorPortfolio(ill, ip, ip1, ip2, ip3, ip4);
			
			return "redirect:selectIllPortfolioList.ill";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			new File(filePath + "\\" + changeFileName + ext).delete();
			new File(filePath + "\\" + changeFileName1 + ext1).delete();
			new File(filePath + "\\" + changeFileName2 + ext2).delete();
			new File(filePath + "\\" + changeFileName3 + ext3).delete();
			new File(filePath + "\\" + changeFileName4 + ext4).delete();
			
			model.addAttribute("msg", "작품 등록 실패!");
			
			return "common/errorPage";
		}
		
	}
	
	//일러스트 포트폴리오 목록 조회
	@RequestMapping(value="selectIllPortfolioList.ill")
	public String selectIllPortfolioList(HttpServletRequest request, HttpSession session, Illustrator ill, Member m, Model model) {
		System.out.println("컨트롤러 접근?");
		
		int currentPage = 1;
		int limit = 5;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = is.selectListCount();
		
		  IllustratorPageInfo pi = IllustratorPagination.getPageInfo(currentPage, listCount, limit);
		  
		  ArrayList<Illustrator> list = is.selectIllPortfolioList(pi, ill);
		  model.addAttribute("list", list);
		  model.addAttribute("pi", pi);
		  
		  System.out.println("listCount" + listCount);
		  System.out.println("list" + list);
		 
		
		
		return "illustrator/illust_Portpolio";
	}
	
	//일러스트 도전하기 글등록 페이지 이동
		@RequestMapping("illustChallengeWrite.ill")
		public String illustChallengeWrite() {
			return "illustrator/illustChallengeWrite";
		}
	
	//일러스트 도전하기 글등록
		@RequestMapping(value="insertChallengeIllust.ill")
		public String insertChallengeIllust(Model model, Illustrator ill, HttpServletRequest request, HttpSession session, Member m,
				@RequestParam(name="photo", required=false) MultipartFile photo,
				@RequestParam(name="photo1", required=false) MultipartFile photo1,
				@RequestParam(name="photo2", required=false) MultipartFile photo2,
				@RequestParam(name="photo3", required=false) MultipartFile photo3,
				@RequestParam(name="photo4", required=false) MultipartFile photo4) {
			m = (Member) session.getAttribute("loginUser");
			String userId = m.getUserId();
			ill.setUserId(userId);
			
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			String filePath = root + "\\uploadFiles\\illustrator\\illChallenge";
			String originFileName = photo.getOriginalFilename();
			String originFileName1 = photo1.getOriginalFilename();
			String originFileName2 = photo2.getOriginalFilename();
			String originFileName3 = photo3.getOriginalFilename();
			String originFileName4 = photo4.getOriginalFilename();
			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			String ext1 = originFileName.substring(originFileName1.lastIndexOf("."));
			String ext2 = originFileName.substring(originFileName2.lastIndexOf("."));
			String ext3 = originFileName.substring(originFileName3.lastIndexOf("."));
			String ext4 = originFileName.substring(originFileName4.lastIndexOf("."));
			String changeFileName = CommonUtils.getRandomString();
			String changeFileName1 = CommonUtils.getRandomString();
			String changeFileName2 = CommonUtils.getRandomString();
			String changeFileName3 = CommonUtils.getRandomString();
			String changeFileName4 = CommonUtils.getRandomString();
			
			IllustratorPhoto ip = new IllustratorPhoto();
			IllustratorPhoto ip1 = new IllustratorPhoto();
			IllustratorPhoto ip2 = new IllustratorPhoto();
			IllustratorPhoto ip3 = new IllustratorPhoto();
			IllustratorPhoto ip4 = new IllustratorPhoto();
			
			ip.setOriginName(originFileName);
			ip.setChangeName(changeFileName + ext);
			ip.setFilePath(filePath);
			ip.setUserId(userId);
			
			ip1.setOriginName(originFileName1);
			ip1.setChangeName(changeFileName1 + ext1);
			ip1.setFilePath(filePath);
			ip1.setUserId(userId);
			
			ip2.setOriginName(originFileName2);
			ip2.setChangeName(changeFileName2 + ext2);
			ip2.setFilePath(filePath);
			ip2.setUserId(userId);
			
			ip3.setOriginName(originFileName3);
			ip3.setChangeName(changeFileName3 + ext3);
			ip3.setFilePath(filePath);
			ip3.setUserId(userId);
			
			ip4.setOriginName(originFileName4);
			ip4.setChangeName(changeFileName4 + ext4);
			ip4.setFilePath(filePath);
			ip4.setUserId(userId);
			
			try {
				photo.transferTo(new File(filePath + "\\" + changeFileName + ext));
				photo1.transferTo(new File(filePath + "\\" + changeFileName1 + ext1));
				photo2.transferTo(new File(filePath + "\\" + changeFileName2 + ext2));
				photo3.transferTo(new File(filePath + "\\" + changeFileName3 + ext3));
				photo4.transferTo(new File(filePath + "\\" + changeFileName4 + ext4));
				
				is.insertIllustratorChallenge(ill, ip, ip1, ip2, ip3, ip4);
				
				return "redirect:selectIllChallengeList.ill";
			} catch (Exception e) {
				System.out.println(e.getMessage());
				new File(filePath + "\\" + changeFileName + ext).delete();
				new File(filePath + "\\" + changeFileName1 + ext1).delete();
				new File(filePath + "\\" + changeFileName2 + ext2).delete();
				new File(filePath + "\\" + changeFileName3 + ext3).delete();
				new File(filePath + "\\" + changeFileName4 + ext4).delete();
				
				model.addAttribute("msg", "작품 등록 실패!");
				
				return "common/errorPage";
			}
			
		}
	
		//일러스트 챌린지 목록 조회
		@RequestMapping(value="selectIllChallengeList.ill")
		public String selectIllChallengeList(HttpServletRequest request, HttpSession session, Illustrator ill, Member m, Model model) {
			System.out.println("컨트롤러 접근?");
			
			int currentPage = 1;
			int limit = 5;
			
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			int listCount = is.selectChallengeListCount();
			
			  IllustratorPageInfo pi = IllustratorPagination.getPageInfo(currentPage, listCount, limit);
			  
			  ArrayList<Illustrator> clist = is.selectIllChallengeList(pi, ill);
			  model.addAttribute("clist", clist);
			  model.addAttribute("pi", pi);
			  
			  System.out.println("listCount" + listCount);
			  System.out.println("list" + clist);
			 
			
			
			return "illustrator/illust_Challenge";
		}
		
		//일러스트 포트폴리오 상세페이지 조회
		@RequestMapping(value="selectIllPortfolioDetail.ill")
		public String selectIllPortfolioDetail(HttpServletRequest request, HttpSession session, Illustrator ill, Model model) {
			String userId = request.getParameter("userId");
			System.out.println("컨트롤러 : " + userId);
			ill.setUserId(userId);
			ArrayList<Illustrator> list = is.selectIllPortfolioDetail(ill);
			model.addAttribute("list", list);
			
			
			return "illustrator/illustPortpolioDetail";
		}
		
		//일러스트 도전하기 상세페이지 조회
		@RequestMapping(value="selectIllChallengeDetail.ill")
		public String selectIllChallengeDetail(HttpServletRequest request, HttpSession session, Illustrator ill, Model model) {
			String userId = request.getParameter("userId");
			ill.setUserId(userId);
			ArrayList<Illustrator> clist = is.selectIllChallengeDetail(ill);
			model.addAttribute("clist", clist);
			
			return "illustrator/illustChallengeDetail";
		}
		
		//일러스트 작가 상세페이지 조회
		@RequestMapping(value="selectIllustratorDetail.ill")
		public String selectIllustratorDetail(HttpServletRequest request, HttpSession session, Illustrator ill, Model model) {
			System.out.println("Controller 작가상세페이지로 넘어옴 ");
			String userId = request.getParameter("userId");
			ill.setUserId(userId);
			ArrayList<Illustrator> ilist = is.selectIllustratorDetail(ill);
			model.addAttribute("ilist", ilist);
			
			return "illustrator/illustratorDetail";
		}
	
	
}
