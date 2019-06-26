package com.kh.cc.illustrator.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kh.cc.common.CommonUtils;
import com.kh.cc.illustrator.model.vo.Illustrator;
import com.kh.cc.illustrator.model.vo.IllustratorPhoto;
import com.kh.cc.member.model.vo.Member;
@SessionAttributes("loginUser")
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
	
	//일러스트 포트폴리오 상세페이지로 이동
	@RequestMapping(value="illustPortpolioDetail.ill")
	public String illustPortpolioDetail() {
		return "illustrator/illustPortpolioDetail";
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
	public String insertPortfolioIllust(Model model, Illustrator ill, HttpServletRequest request, HttpSession session, IllustratorPhoto ip, Member m,
			@RequestParam(name="photo", required=false) MultipartFile photo) {
		m = (Member) session.getAttribute("loginUser");
		String userId = m.getUserId();
		ill.setUserId(userId);
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		ArrayList<String> saveFiles = new ArrayList<String>();
		ArrayList<String> originFiles = new ArrayList<String>();
		ArrayList<IllustratorPhoto> subPhoto = new ArrayList<IllustratorPhoto>();
		
		
		
		String filePath = root + "\\uploadFiles\\illustratorSub";
		String originFileName = photo.getOriginalFilename();
		String extSub = originFileName.substring(originFileName.lastIndexOf("."));
		String changeFileName = CommonUtils.getRandomString();
		
		for(int i = originFiles.size() - 1; i >= 0; i--) {
			
			System.out.println("for문 실행!");
			ip.setOriginName(originFiles.get(i));
			ip.setChangeName(saveFiles.get(i));
			ip.setFilePath(filePath);
			ip.setUserId(userId);
			
			subPhoto.add(ip);
			
		}
		System.out.println(ip);
		/*
		 * try { photo.transferTo(new File(filePathMain + "\\" + changeFileNameMain +
		 * extMain)); photo.transferTo(new File(filePathSub + "\\" + changeFileNameSub +
		 * extSub));
		 * 
		 * 
		 * 
		 * } catch (IllegalStateException | IOException e) { // TODO Auto-generated
		 * catch block e.printStackTrace(); }
		 */
		
		return null;
	}
	
	
	
	
	
}
