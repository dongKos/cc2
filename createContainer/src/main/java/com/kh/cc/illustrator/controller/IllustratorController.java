package com.kh.cc.illustrator.controller;


import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kh.cc.admin.model.vo.Report;
import com.kh.cc.common.CommonUtils;
import com.kh.cc.common.IllustratorPagination;
import com.kh.cc.illustrator.model.service.IllustratorService;
import com.kh.cc.illustrator.model.vo.IllBoard;
import com.kh.cc.illustrator.model.vo.IllReq;
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
	public String illustMain(HttpServletRequest request, HttpSession session, Illustrator ill, Member m, Model model) {
		
		////System.out.println("컨트롤러 접근?");
		
		int currentPage = 1;
		int limit = 3;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = is.selectListCount();
		
		  IllustratorPageInfo pi = IllustratorPagination.getPageInfo(currentPage, listCount, limit);
		  
		  ArrayList<Illustrator> list = is.selectIllPortfolioList(pi, ill);
		  model.addAttribute("list", list);
		  model.addAttribute("pi", pi);
		  
		  ArrayList<Illustrator> clist = is.selectIllChallengeList(pi, ill);
		  model.addAttribute("clist", clist);
		  
		  ////System.out.println("listCount" + listCount);
		  ////System.out.println("list" + list);
		
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
	public String illustSupport(HttpServletRequest request, HttpSession session, Illustrator ill, Model model, Member m) {
		////System.out.println("ill : " + ill);
		ArrayList<Illustrator> slist = is.selectIllSupportList(ill);
		////System.out.println("후원 목록 조회 : " + slist);
		model.addAttribute("slist", slist);
		
		return "illustrator/illust_Support";
	}
	
	//일러스트 작가 상세페이지로 이동
	@RequestMapping(value="illustratorDetail.ill")
	public String illustratorDatail(String userId) {
		
		////System.out.println("userId : " + userId);
		
		
		return "redirect:selectIllustratorDetail.ill";
	}
	
	//일러스트 포트폴리오 상세페이지로 이동
	@RequestMapping(value="illustPortpolioDetail.ill")
	public String illustPortpolioDetail() {
		return "illustrator/illustPortpolioDetail";
	}
	
	//일러스트 도전하기 상세페이지로 이동
	@RequestMapping(value="illustChallengeDetail.ill")
	public String illustChallengeDetail(HttpServletRequest request, HttpSession session) {
		String userId = request.getParameter("userId");
		return "selectIllChallengeDetail.ill?userId=" + userId;
	}
	
	//일러스트 후원 페이지로 이동
	@RequestMapping("illustSupportDetail.ill")
	public String illustSupportDetail (String userId, HttpServletRequest request, HttpSession session, Illustrator ill, Member m, Model model) {
		
		////System.out.println("supportDetail userId : " + userId);
		
		ArrayList<Illustrator> sdlist = is.selectIllSupportDetail(ill);
		model.addAttribute("sdlist", sdlist);
		
		return "illustrator/illustSupport";
	}
	
	//일러스트 후원 리워드 페이지 이동
	@RequestMapping("illustSupportReward.ill")
	public String illustSupportReward(String userId, HttpServletRequest request, HttpSession session, Illustrator ill, Member m, Model model) {
		
		////System.out.println("SupportReward userId : " + userId);
		
		ArrayList<Illustrator> srlist = is.selectIllSupportReward(ill);
		model.addAttribute("srlist", srlist);
		
		return "illustrator/illustSupportReward";
	}
	
	//일러스트 후원 신청 페이지 이동
	@RequestMapping("illustRewardApply.ill")
	public String illustRewardApply(String scode, Model model, HttpSession session) {
		Member m = (Member) session.getAttribute("loginUser");
		////System.out.println("세션의 로그인 유저" + m);
		////System.out.println("보유 코인 : " + m.getWallet());
		model.addAttribute("scode", scode);
		return "illustrator/illustSupportApply";
	}
	
	//일러스트 포트폴리오 의뢰하기 페이지 이동
	@RequestMapping("illustRequest.ill")
	public String illustRequest(String userId, HttpServletRequest request, HttpSession session, Illustrator ill, Member m, Model model) {
		
		ArrayList<Illustrator> rlist = is.selectIllRequest(ill);
		model.addAttribute("rlist", rlist);
		
		return "illustrator/illustRequest";
	}
	
	//일러스트 포트폴리오 의뢰하기 페이지 이동
	@RequestMapping("illChallengeRequest.ill")
	public String illChallengeRequest(String userId, HttpServletRequest request, HttpSession session, Illustrator ill, Member m, Model model) {
			
		ArrayList<Illustrator> rclist = is.selectIllChallengeRequest(ill);
		model.addAttribute("rclist", rclist);
			
		return "illustrator/illChallengeRequest";
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
			////System.out.println(e.getMessage());
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
	public String selectIllPortfolioList(HttpServletRequest request, HttpSession session, Illustrator ill, Model model) {
		
		int currentPage = 1;
		int limit = 60;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = is.selectListCount();
		
		  IllustratorPageInfo pi = IllustratorPagination.getPageInfo(currentPage, listCount, limit);
		  
		  ArrayList<Illustrator> list = is.selectIllPortfolioList(pi, ill);
		  model.addAttribute("list", list);
		  model.addAttribute("pi", pi);
		  
		  ////System.out.println("listCount" + listCount);
		  ////System.out.println("list" + list);
		 
		
		
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
				////System.out.println(e.getMessage());
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
			////System.out.println("컨트롤러 접근?");
			
			int currentPage = 1;
			int limit = 60;
			
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			int listCount = is.selectChallengeListCount();
			
			  IllustratorPageInfo pi = IllustratorPagination.getPageInfo(currentPage, listCount, limit);
			  
			  ArrayList<Illustrator> clist = is.selectIllChallengeList(pi, ill);
			  model.addAttribute("clist", clist);
			  model.addAttribute("pi", pi);
			  
			  ////System.out.println("listCount" + listCount);
			  ////System.out.println("list" + clist);
			 
			
			
			return "illustrator/illust_Challenge";
		}
		
		//일러스트 포트폴리오 상세페이지 조회
		@RequestMapping(value="selectIllPortfolioDetail.ill")
		public String selectIllPortfolioDetail(HttpServletRequest request, HttpSession session, Illustrator ill, Model model) {
			Member m = (Member) session.getAttribute("loginUser");
			if(session.getAttribute("loginUser") != null) {
				String userId = m.getUserId();
				ill.setUserId(userId);
			}
			ArrayList<Illustrator> list = is.selectIllPortfolioDetail(ill);
			ArrayList<Illustrator> blist = is.selectIllChallengeBoard(ill);
			model.addAttribute("list", list);
			model.addAttribute("blist", blist);
			
			System.out.println("포트폴리오 상세페이지 : " + list);
			
			
			return "illustrator/illustPortpolioDetail";
		}
		
		//일러스트 도전하기 상세페이지 조회
		@RequestMapping(value="selectIllChallengeDetail.ill")
		public String selectIllChallengeDetail(HttpServletRequest request, HttpSession session, Illustrator ill, Model model) {
			Member m = (Member) session.getAttribute("loginUser");
			if(session.getAttribute("loginUser") != null) {
				String userId = m.getUserId();
				ill.setUserId(userId);
			}
			ill.setIllCode(Integer.parseInt(request.getParameter("illCode")));
			
			ArrayList<Illustrator> clist = is.selectIllChallengeDetail(ill);
			
			ArrayList<Illustrator> blist = is.selectIllChallengeBoard(ill);
			
			System.out.println("bList : " + blist);
			////System.out.println("도전하기 상세 : " + clist);
			model.addAttribute("clist", clist);
			model.addAttribute("blist", blist);

			return "illustrator/illustChallengeDetail";
		}
		
		//일러스트 작가 상세페이지 조회
		@RequestMapping(value="selectIllustratorDetail.ill")
		public String selectIllustratorDetail(HttpServletRequest request, HttpSession session, Illustrator ill, Model model) {
			////System.out.println("Controller 작가상세페이지로 넘어옴 ");
			String userId = request.getParameter("userId");
			ill.setUserId(userId);
			ArrayList<Illustrator> ilist = is.selectIllustratorDetail(ill);
			model.addAttribute("ilist", ilist);
			
			////System.out.println("작가의 작품 조회 : " + ilist );
			
			return "illustrator/illustratorDetail";
		}
	
		//일러스트 후원 목록 조회
		@RequestMapping(value="selectIllSupportList")
		public String selectIllSupportList(HttpServletRequest request, HttpSession session, Illustrator ill, Model model, Member m) {
			
			ArrayList<Illustrator> slist = is.selectIllSupportList(ill);
			model.addAttribute("slist", slist);
			
			return "illustrator/illust_Support";
		}
		
		//일러스트 도전하기 추천 카운트
		@RequestMapping(value="IllRecommendCount.ill")
		public ResponseEntity<Integer> updateIllRecommendCount(int illCode, String userId, HttpServletRequest request, HttpSession session, Illustrator ill, Model model, Member m) {
//			int RecommendCount = Integer.parseInt(request.getParameter("recommendCount"));
//			ill.setRecommendCount(RecommendCount);
			////System.out.println("컨트롤러!!!!!!!!!!!!!!!!!!!!" + illCode);
			
			is.updateRecommendCount(illCode);
			int recommend = is.selectRecommend(illCode);
			
			////System.out.println("recommend : " + recommend);
			model.addAttribute("userId" , userId);
			
			return new ResponseEntity<Integer>(recommend, HttpStatus.OK);
		}
		
		//일러스트 포트폴리오 의뢰하기
		@RequestMapping("IllRequest.ill")
		public String IllRequest(IllReq illReq, HttpServletRequest request, HttpSession session, Illustrator ill, Model model, Member m, String totalPrice) {
			////System.out.println(totalPrice);
			m = (Member) session.getAttribute("loginUser");
			illReq.setUserId(m.getUserId());
			////System.out.println("illReq : " + illReq);
			int result = is.IllRequest(illReq);
			////System.out.println("result1 : " + result);
			
			if(result > 0) {
				int result2 = IllRequestCoin(m, totalPrice);
				////System.out.println("result2 : " + result2);
			}
			
			model.addAttribute("msg","의뢰 신청이 완료 되었습니다.");
	    	model.addAttribute("url", "illustRequest.ill?illCode="+illReq.getIllCode());
			return "common/redirect";
		}
		
		//일러스트 도전하기 의뢰하기
		@RequestMapping("IllChallengeRequest.ill")
		public String IllChallengeRequest(IllReq illReq, HttpServletRequest request, HttpSession session, Illustrator ill, Model model, Member m) {
			m = (Member) session.getAttribute("loginUser");
			illReq.setUserId(m.getUserId());
			////System.out.println("illReq : " + illReq);
			int result = is.IllRequest(illReq);
			////System.out.println("result1 : " + result);
			
			model.addAttribute("msg","의뢰 신청이 완료 되었습니다.");
	    	model.addAttribute("url", "illChallengeRequest.ill?illCode="+illReq.getIllCode());
			return "common/redirect";
		}
		
		//포트폴리오 의뢰하기 코인 감소
		@RequestMapping(value="IllRequestCoin")
		public int IllRequestCoin(Member m, String totalPrice) {
			int result = is.IllRequestCoin(m, totalPrice);
			return result;
		}
		
		//후원 하기
	      @RequestMapping("insertSponsor.ill")
	      public String insertSponsor(HttpServletRequest request, Model model, HttpSession session) {
	         Member m = (Member) session.getAttribute("loginUser");
	         
	         int sPrice = Integer.parseInt(request.getParameter("sPrice"));
	         int mno = Integer.parseInt(request.getParameter("mno"));
	         int sCode = Integer.parseInt(request.getParameter("sCode"));
	         
	         String sPrice2 = sPrice + "";
	         
	         int result = is.insertSponsor(sPrice, mno, sCode);
	         int result2 = IllRequestCoin(m, sPrice2);
	         
	         model.addAttribute("msg","후원이 완료 되었습니다. 리워드는 마이페이지에서 확인 가능합니다.");
	         model.addAttribute("url", "illustRewardApply.ill");
	         return "common/redirect";
	      }
		
		//포트폴리오 신고하기
		@RequestMapping(value="IllPortfolioReport.ill")
		public String IllPortfolioReport(HttpServletRequest request, Model model, HttpSession session, Illustrator ill) {
			Member m = (Member) session.getAttribute("loginUser");
			String rType = request.getParameter("rType");
			String rReason = request.getParameter("rReason");
			int illCode = Integer.parseInt(request.getParameter("illCode"));
			
			String userId = request.getParameter("userId");
			ill.setUserId(userId);
			
			////System.out.println(rType + rReason);
			////System.out.println(illCode);
			
			Report r = new Report();
			
			r.setReportCategory(rType);
			r.setReportType("WORK");
			r.setUserId(m.getUserId());
			r.setReportReason(rReason);
			r.setIllCode(illCode);
			
			model.addAttribute("userId", userId);
			
			int result = is.IllustReport(r);
			
			////System.out.println("신고 결과 : " + result);
			
			
			return "redirect:selectIllPortfolioDetail.ill?illCode=" + illCode;
		}
		
		//도전하기 신고하기
		@RequestMapping(value="IllChallengeReport.ill")
		public String IllChallengeReport(HttpServletRequest request, Model model, HttpSession session, Illustrator ill) {
			Member m = (Member) session.getAttribute("loginUser");
			String rType = request.getParameter("rType");
			String rReason = request.getParameter("rReason");
			int illCode = Integer.parseInt(request.getParameter("illCode"));
			
			String userId = request.getParameter("userId");
			ill.setUserId(userId);
					
			////System.out.println(rType + rReason);
			////System.out.println(illCode);
				
			Report r = new Report();
			
			r.setReportCategory(rType);
			r.setReportType("WORK");
			r.setUserId(m.getUserId());
			r.setReportReason(rReason);
			r.setIllCode(illCode);
					
			model.addAttribute("userId", userId);
				
			int result = is.IllustReport(r);
				
			////System.out.println("신고 결과 : " + result);
					
					
			return "redirect:selectIllChallengeDetail.ill?illCode=" + illCode;
		}
		
		//일러스트 게시판 글쓰기 이동
		@RequestMapping(value="insertIllBoard.ill")
		public String insertIllBoard(HttpServletRequest request, Model model, HttpSession session, Illustrator ill, IllBoard ib) {
			Member m = (Member) session.getAttribute("loginUser");
			int illCode = Integer.parseInt(request.getParameter("illCode"));
			String userId = request.getParameter("userId");
			ill.setUserId(userId);
			
			model.addAttribute("illCode", illCode);
			
			return "illustrator/illInsertBoard";
		}
		
		//일러스트 게시판 글쓰기
		@RequestMapping(value="insertIllChallBoard.ill")
		public String insertIllChallBoard(HttpServletRequest request, Member m, Model model, HttpSession session, Illustrator ill, IllBoard ib) {
			m = (Member) session.getAttribute("loginUser");
			String userId = m.getUserId();
			int illCode = Integer.parseInt(request.getParameter("illCode"));
			//System.out.println(userId);
			ib.setUserId(userId);
			//System.out.println(ib);
			
			model.addAttribute("userId", userId);
			
			int result = is.insertIllBoard(ib);
			
			//System.out.println("동록 결과 : " + result);
					
			return "redirect:selectIllChallengeDetail.ill?illCode="+illCode;
		}
		
		//일러스트 게시판 상세 조회
		@RequestMapping(value="selectIllBoard.ill")
		public String selectIllBoard(HttpServletRequest request, Member m, Model model, HttpSession session, IllBoard ib) {
			String bTitle = request.getParameter("bTitle");
			ib.setbTitle(bTitle);
			
			ArrayList<Illustrator> rlist = is.selectIllBoard(ib);
			model.addAttribute("rlist", rlist);
			
			return "illustrator/illSelectBoard";
		}
		
}
