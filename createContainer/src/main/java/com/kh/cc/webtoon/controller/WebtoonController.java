package com.kh.cc.webtoon.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.cc.common.CommonUtils;
import com.kh.cc.common.WebtoonPagination;
import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webtoon.model.service.WebtoonService;
import com.kh.cc.webtoon.model.vo.Webtoon;
import com.kh.cc.webtoon.model.vo.WebtoonPageInfo;
import com.kh.cc.webtoon.model.vo.WebtoonPhoto;
import com.kh.cc.webtoon.model.vo.WebtoonRound;

@Controller
public class WebtoonController {

	@Autowired
	private WebtoonService ws;

	// 웹툰 메인페이지로 이동
	@RequestMapping(value = "webtoonMain.wt")
	public String webtoonMain() {
		
		return "webtoon/webtoonMain";
	}
	
	
	//메인페이지에서 장르카테고리 에서 구별 해주는것
	  @RequestMapping(value="genrecategory.wt") public String
	  genrecategory(HttpServletRequest request, HttpSession session, Webtoon wt, Model model) {
	  
	  String genre = request.getParameter("genre");
	  wt.setGenre(genre);
	  
	  System.out.println("genre : " + genre);
	  
	  int currentPage = 1;
	  int limit = 3;
	  int buttonCount = 5;
		
		if(request.getParameter("currentPage")!= null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = ws.genreListCount(wt);
		System.out.println("genrelistCount : " + listCount);
		
		WebtoonPageInfo pi = WebtoonPagination.getPageInfo(currentPage, listCount, limit, buttonCount);
	  
	  ArrayList<Webtoon> list = ws.genreList(pi, wt);
	  
	  System.out.println("pi : " + pi);
	  System.out.println("장르 list확인 : " + list);
	  
	  model.addAttribute("pi", pi);
	  model.addAttribute("list", list);
	  
	  return "webtoon/webtoonMain";
	  
	  }
	 

	// 웹툰 TOP5페이지로 이동
	@RequestMapping(value = "webtoonTop5.wt")
	public String webtoonTop5(HttpServletRequest request, HttpSession session, Model model, Webtoon wt) {
		
		ArrayList<Webtoon> topList = ws.topList();
		
		
		model.addAttribute("topList", topList);
		
		return "webtoon/webtoonTop5";
	}

	
	// 웹툰 홈으로 이동
	@RequestMapping(value = "webtoonHome.wt")
	public String webtoonHome() {
		return "webtoon/webtoonHome";
	}
	

	// 웹툰 도전페이지로 이동
	@RequestMapping(value = "webtoonChallenge.wt")
	public String webtoonChallenge(HttpServletRequest request, HttpSession session, Model model, Webtoon wt) {
		
		wt.setGradeType(1);
		
		int currentPage = 1;
		int limit = 8;
		int buttonCount = 10;
		
		if(request.getParameter("currentPage")!= null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = ws.challengeListCount(wt);
		WebtoonPageInfo pi = WebtoonPagination.getPageInfo(currentPage, listCount, limit, buttonCount);
		ArrayList<Webtoon> list = ws.challengeList(pi, wt);
		
		ArrayList<Webtoon> newList = ws.newChallenge(wt);
		 
		System.out.println("newList : " + newList);
		
		
		
		
		model.addAttribute("newList", newList);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "webtoon/webtoonChallenge";
	}

	// 웹툰 마이페이지로 이동
	@RequestMapping(value = "webtoonMypage.wt")
	public String webtoonMypage() {
		return "webtoon/webtoonMypage";
	}

	// 웹툰 요일별페이지로 이동
	@RequestMapping(value = "webtoonDaily.wt")
	public String webtoonDaily(HttpServletRequest request, HttpSession session, Model model, Webtoon wt) {
		
		ArrayList<Webtoon> newList = ws.newList();
		
		ArrayList<Webtoon> list1 = ws.monList();
		ArrayList<Webtoon> list2 = ws.tuesList();
		ArrayList<Webtoon> list3 = ws.wedList();
		ArrayList<Webtoon> list4 = ws.thurList();
		ArrayList<Webtoon> list5 = ws.friList();
		ArrayList<Webtoon> list6 = ws.satList();
		ArrayList<Webtoon> list7 = ws.sunList();
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("list4", list4);
		model.addAttribute("list5", list5);
		model.addAttribute("list6", list6);
		model.addAttribute("list7", list7);
		model.addAttribute("newList", newList);
		
		
		
		
		return "webtoon/webtoonDaily";
	}

	// 완결 조회
	@RequestMapping(value = "webtoonComplete.wt")
	public String webtoonComplete(HttpServletRequest request, HttpSession session, Model model, Webtoon wt) {
		
		wt.setWorkStatus("COMP");
		
		int currentPage = 1;
		int limit = 5;
		int buttonCount = 10;
		
		if(request.getParameter("currentPage")!= null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = ws.completeListCount(wt);
		
		System.out.println("완결리스트카운트 : " + listCount);
		
		
		  WebtoonPageInfo pi = WebtoonPagination.getPageInfo(currentPage , listCount, limit, buttonCount);
		  
		  ArrayList<Webtoon> list = ws.completeWtList(pi, wt);
		  
		  System.out.println("완결작품list : " + list);
		  
		  model.addAttribute("pi", pi);
		  model.addAttribute("list", list);
		  
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

	// 웹툰 작품등록폼 으로 가는 메소드
	@RequestMapping(value = "webtoonUpload.wt")
	public String insertWebtoon(HttpServletRequest request, HttpSession session, Member m, Model model) {
		
		m = (Member) session.getAttribute("loginUser");
		
		if(m == null) {
			model.addAttribute("msg","로그인이 필요한 서비스입니다");
			return "common/errorPage";
		}
		
		return "webtoon/webtoonUpload";
		
	}

	// 메뉴바에서 눌렀을떄 웹툰 Work등록폼으로 가기
	@RequestMapping(value = "insertWork.wt")
	public String webtoonWorkInsert(HttpServletRequest request, HttpSession session, Member m, Model model) {
		System.out.println("웹툰 작품등록포 가기전 리스트 셀렉트");
		
		m = (Member) session.getAttribute("loginUser");
		
		if(m == null) {
			model.addAttribute("msg","로그인이 필요한 서비스입니다");
			return "common/errorPage";
		}
		
		int currentPage = 1;
		int limit = 5;
		int buttonCount = 10;
		
		if(request.getParameter("currentPage")!= null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = ws.selectListCount(m);
		System.out.println("listCount : " + listCount);
		
		WebtoonPageInfo pi = WebtoonPagination.getPageInfo(currentPage , listCount, limit, buttonCount);
		
		ArrayList<Webtoon> list = ws.selectWtList(pi, m);
		System.out.println("pi : " + pi);
		System.out.println("list : " + list);
		
		model.addAttribute("list",list);
		model.addAttribute("pi", pi);
		
		return "webtoon/webtoonUpload";
	}
	
	
	//새작품버튼을 누르면 작품등록 폼 이동하는 메소드
	@RequestMapping(value="inserWorkForm.wt")
	public String webtoonInsertWorkForm(HttpServletRequest request, HttpSession session, Member m) {
		
		m = (Member) session.getAttribute("loginUser");
		
		return "webtoon/webtoonWorkInsert";
	}

	
	// 웹툰 등록 초기 작품등록
	@RequestMapping(value = "insertWebtoon.wt")
	public String InsertWork(Model model, Webtoon wt, HttpServletRequest request, HttpSession session, Member m,
			WebtoonPhoto wp, @RequestParam(name = "photo", required = false) MultipartFile photo) {

		m = (Member) session.getAttribute("loginUser");

		String userId = m.getUserId();
		wt.setUserId(userId);
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String filePath = root + "\\uploadFiles\\webtoonMain";
		String originFileName = photo.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String changeFileName = CommonUtils.getRandomString();
		
		  wp.setOriginName(originFileName); 
		  wp.setChangeName(changeFileName + ext);
		  wp.setFilePath(filePath); 
		  wp.setUserId(userId);
		
		try {
			
			ws.insertWebtoon(wt, wp);
			
			photo.transferTo(new File(filePath + "\\" + changeFileName + ext));
			System.out.println("UploadFile");
			System.out.println("작품 사진이랑 work등록 완료");
			
			return "redirect:insertWork.wt";
			
		} catch (Exception e) {
			new File(filePath + "\\" + changeFileName + ext).delete();
			
			model.addAttribute("msg","작품등록실패");
			
			return "common/errorPage";
		} 
	}
	
	//작품 리스트에서 회차등록을 누를시 페이지 이동 시키는 메소드
	@RequestMapping(value = "insertRoundFrom.wt")
	public String insertRoundForm(Model model,HttpServletRequest request, HttpSession session, Webtoon wt ) {
		System.out.println("리스트에서 회차등록 버튼을 눌렀을때 wid");
		int wid = Integer.parseInt(request.getParameter("wid"));
		System.out.println("wid : " + wid);
		
		model.addAttribute("wid", wid);
		
		return "webtoon/insertRoundForm";
	}
	
	
	//회차 등록폼에서 등록버튼 누를시 동작하는 메소드
	@RequestMapping(value = "insertWtRound.wt")
	public String insertWnRound(Model model, Webtoon wt, WebtoonRound wr, HttpServletRequest request, HttpSession session, 
			 Member m, 
			 	@RequestParam(name = "photo", required = false) MultipartFile photo,
				@RequestParam(name = "photo1", required = false) MultipartFile photo1){
		
		m = (Member) session.getAttribute("loginUser");
		
		String userId = m.getUserId();
		
		System.out.println("회차 컨트롤러 들어옴");
		
		int wid = Integer.parseInt(request.getParameter("wid"));
		
		String workStatus = request.getParameter("workStatus");
		
		//완결기능
		wr.setWorkStatus(workStatus);
		if(workStatus == null) {
			workStatus = "RUN";
		} else if(workStatus != null){
			//마지막회차 체크 했을때
			workStatus = "COMP";
			
			Webtoon wt3 = new Webtoon();
			
			wt3.setWorkStatus(workStatus);
			wt3.setWid(wid);
			
			ws.updateComp(wt3);
			System.out.println("완결 ws : " + ws);
		}
		
		System.out.println("workStatus : " + workStatus);
		System.out.println("wid : " + wid);
		System.out.println("wt : " + wt);
		System.out.println("wr : " + wr);
		System.out.println("userId : " + userId);
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String filePath1 = root + "\\uploadFiles\\webtoonSub";
		String filePath2 = root + "\\uploadFiles\\webtoonContent";
		System.out.println("filePath1 : " + filePath1);
		
		
		String originFileName = photo.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String changeFileName = CommonUtils.getRandomString();
		
		String originFileName1 = photo1.getOriginalFilename();
		String ext1 = originFileName.substring(originFileName1.lastIndexOf("."));
		String changeFileName1 = CommonUtils.getRandomString();

		WebtoonPhoto wp = new WebtoonPhoto();
		WebtoonPhoto wp1 = new WebtoonPhoto();
		//썸내일
		wp.setOriginName(originFileName);
		wp.setChangeName(changeFileName + ext);
		wp.setFilePath(filePath1);
		wp.setWid(wid);
		wp.setUserId(userId);
		
		//웹툰 내용 사진
		wp1.setOriginName(originFileName1);
		wp1.setChangeName(changeFileName1 + ext1);
		wp1.setFilePath(filePath2);
		wp1.setWid(wid);
		wp1.setUserId(userId);
		
		try {
			photo.transferTo(new File(filePath1 + "\\" + changeFileName + ext));
			photo1.transferTo(new File(filePath2 + "\\" + changeFileName1 + ext1));
			
			ws.insertWorkRound(wr, wp, wp1);
			System.out.println("wr : " + wr);
			System.out.println("wp : " + wp);
			System.out.println("wp1 : " + wp1);
			System.out.println("회차 썸내일, 내용 등록완료");
			return "redirect:insertWork.wt";

		} catch (Exception e) {
			System.out.println(e.getMessage());
			new File(filePath1 + "\\" + changeFileName + ext).delete();
			new File(filePath2 + "\\" + changeFileName1 + ext1).delete();

			model.addAttribute("msg", "작품 등록 실패!");

			return "common/errorPage";
		}
		
	}
	
	//회차 리스트에서 휴재신청을 했을때 실행하는 메소드
	@RequestMapping(value="updateRest.wt")
	public String updateRest(Model model,HttpServletRequest request, HttpSession session, Webtoon wt) {
		System.out.println("휴재 신청 메소드 실행");
		
		
		
		int wid = Integer.parseInt(request.getParameter("wid"));
		
		wt.setWid(wid);
		
		ws.updateRest(wt);
		
		
		return "redirect:insertWork.wt";
	}
	
	//리스트에서 회차 등록버튼을 눌렀을때 동작되는 메소드
	@RequestMapping(value = "roundList.wt")
	public String roundList(Model model,HttpServletRequest request, HttpSession session, Webtoon wt, Member m) {
		System.out.println("리스트에서 회차등록 버튼을 눌렀을때 wid");
		
		 //m = (Member) session.getAttribute("loginUser"); 
		 
		 System.out.println("userId : " + m.getUserId());
		
		int wid = Integer.parseInt(request.getParameter("wid"));
		System.out.println("wid : " + wid);
		
		wt = ws.selectMainPhoto(wid);
		
		int currentPage = 1;
		int limit = 5;
		int buttonCount = 10;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		System.out.println("wr : " + wid);
		int listCount = ws.selectListCount(wid);
		WebtoonPageInfo pi = WebtoonPagination.getPageInfo(currentPage , listCount, limit, buttonCount);
		
		
		ArrayList<WebtoonRound> list = ws.selectWtRoundList(pi, wt);
		System.out.println("list : " + list);
		
		System.out.println("listCount :" + listCount);
		System.out.println("wt : " + wt);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("wt", wt);
		
		return "webtoon/webtoonRoundList";
	}
	
	//잦품정보수정 폼으로 이동하는 메소드
	@RequestMapping(value="workUpdateForm.wt")
	public String workUpdate(Model model,HttpServletRequest request, HttpSession session, Webtoon wt, Member m) {
		int wid = Integer.parseInt(request.getParameter("wid"));
		m = (Member) session.getAttribute("loginUser");
		
		wt = ws.selectWork(wid);
		System.out.println("수정버튼눌렀을떄wt : " + wt);
		
		model.addAttribute("wt", wt);
		model.addAttribute("m", m);
		
		return "webtoon/updateWorkForm";
	}
	
	//작품정보 수정 메소드
	@RequestMapping(value="updateWork.wt")
	public String updateWork(Model model,HttpServletRequest request, HttpSession session, Webtoon wt, WebtoonPhoto wp, Member m,
			@RequestParam(name="photo", required=false) MultipartFile photo) {
		m = (Member) session.getAttribute("loginUser");
		String userId = m.getUserId();

		int wid = Integer.parseInt(request.getParameter("wid"));
		int fid = Integer.parseInt(request.getParameter("fid"));

		wt.setWid(wid);
		wt.setFid(fid);
		wt.setUserId(userId);

		System.out.println("@wt@ : " + wt);

		
		String changeName = request.getParameter("changeName");
		
		if(!photo.isEmpty()) {
			System.out.println("사진정보 수정할떄");
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			String filePath = root + "\\uploadFiles\\webtoonMain";
			String originFileName = photo.getOriginalFilename();
			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			String changeFileName = CommonUtils.getRandomString();
			
			wp.setOriginName(originFileName);
			wp.setChangeName(changeFileName + ext);
			wp.setFilePath(filePath);
			wp.setUserId(userId);
			
			try {
				photo.transferTo(new File(filePath + "\\" + changeFileName + ext));
				
				
				ws.updateWork(wt,wp);
				
				new File(filePath + "\\" + changeName).delete();
				
				session.removeAttribute("wid");
				session.removeAttribute("fid");
				
				return "redirect:insertWork.wt";
				
			} catch (Exception e) {
				
				new File(filePath + "\\" + changeName + ext).delete();
				
				model.addAttribute("msg","작품 등록 실패!!");
				
				return "common/errorPage";
						
			} 
			
		}else {
				System.out.println("사진변경 안할떄");
				
				ws.updateWork(wt);
				System.out.println("result : " + ws);
				
						
				return "redirect:insertWork.wt";
		}
	}
	
	//회차 리스트에서 정보 수정을 누르면 동작하는 메소드
	@RequestMapping(value="updateRoundForm.wt")
	public String updateRoundForm(Model model,HttpServletRequest request, HttpSession session, Member m, WebtoonRound wr) {
		System.out.println("회차 폼이동 컨트롤러");
		int rid = Integer.parseInt(request.getParameter("rid"));
		
		System.out.println("rid : " + rid);
		
		wr = ws.selectOneRound(rid);
		ArrayList<WebtoonPhoto> list = ws.selectOneRoundPhoto(rid);
		
		System.out.println("wr : " + wr);
		System.out.println("list : " + list);
		
		WebtoonPhoto subChangeName = list.get(0);
		
		WebtoonPhoto contChangeName = list.get(1);
		
		
		model.addAttribute("wr", wr);
		model.addAttribute("subChangeName", subChangeName);
		model.addAttribute("contChangeName", contChangeName);
		
		
		return "webtoon/updateRoundForm";
		
	}
	
	// 회차폼에서 수정버튼을누르면 동작하는 메소드
	@RequestMapping(value = "updateRound.wt")
	public String updateRound(Model model, HttpServletRequest request, HttpSession session, Webtoon wt, 
			Member m, WebtoonRound wr, @RequestParam(name = "photo", required = false) MultipartFile photo,
			@RequestParam(name = "photo1", required = false) MultipartFile photo1) {
		
		WebtoonPhoto wp = new WebtoonPhoto();
		WebtoonPhoto wp1 = new WebtoonPhoto();

		m = (Member) session.getAttribute("loginUser");
		String userId = m.getUserId();

		int rid = Integer.parseInt(request.getParameter("rid"));
		int wid = Integer.parseInt(request.getParameter("wid"));
		int subFid = Integer.parseInt(request.getParameter("subFid"));
		int contFid = Integer.parseInt(request.getParameter("contFid"));
		System.out.println("rid : " + rid);
		System.out.println("wid : " + wid);
		System.out.println("subFid : " + subFid);
		System.out.println("contFid : " + contFid);

		wr.setRid(rid);
		wr.setWid(wid);
		
		
		wp.setWid(wid);
		//wp.setFid(subFid);
		
		wp1.setWid(wid);
		//wp1.setFid(contFid);


		// 안바꿨을때 띄울려고
		String subChangeName = request.getParameter("subChangeName");
		// 안바꿨을때 띄울려고
		String contChangeName = request.getParameter("contChangeName");

		System.out.println("subChangeName : " + subChangeName);
		System.out.println("contChangeName : " + contChangeName);

		// 회차썸내일 을 바꿨을때
		if ((!photo1.isEmpty()) && (!photo.isEmpty())) {
			
			
			
			
			System.out.println("썸내일과 내용 이미지를 둘다 수정");
			String root = request.getSession().getServletContext().getRealPath("resources");

			String filePath1 = root + "\\uploadFiles\\webtoonSub";
			String filePath2 = root + "\\uploadFiles\\webtoonContent";
			System.out.println("filePath1 : " + filePath1);

			String originFileName = photo.getOriginalFilename();
			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			String changeFileName = CommonUtils.getRandomString();

			String originFileName1 = photo1.getOriginalFilename();
			String ext1 = originFileName.substring(originFileName1.lastIndexOf("."));
			String changeFileName1 = CommonUtils.getRandomString();
			
			wp.setFid(subFid);
			System.out.println("wp(fid) : " + wp);
			wp1.setFid(contFid);
			System.out.println("wp1(fid) : " + wp1);

			// 썸내일
			wp.setOriginName(originFileName);
			wp.setChangeName(changeFileName + ext);
			wp.setFilePath(filePath1);
			wp.setWid(wid);
			wp.setUserId(userId);
			System.out.println("파일정보 잘들어갔나 wp : " + wp);

			// 웹툰 내용 사진
			wp1.setOriginName(originFileName1);
			wp1.setChangeName(changeFileName1 + ext1);
			wp1.setFilePath(filePath2);
			wp1.setWid(wid);
			wp1.setUserId(userId);
			System.out.println("파일정보 잘들어갔나 wp1 : " + wp1);
			

			try {
				
				
				photo.transferTo(new File(filePath1 + "\\" + changeFileName + ext));
				photo1.transferTo(new File(filePath2 + "\\" + changeFileName1 + ext1));
				
				System.out.println("커트롤에서 서비스로 보내는 wp : " + wp.getFid());
				System.out.println("커트롤에서 서비스로 보내는 wp1 : " + wp1.getFid());
				ws.updateRoundWps(wr, wp, wp1);
				System.out.println("wr : " + wr);
				System.out.println("wp : " + wp);
				System.out.println("wp1 : " + wp1);

				new File(filePath1 + "\\" + subChangeName).delete();
				new File(filePath2 + "\\" + contChangeName).delete();
				
				model.addAttribute("wid", wid);
				model.addAttribute("fid", contFid);
				model.addAttribute("fid", contFid);

				return "redirect:roundList.wt";

			} catch (Exception e) {
				
				System.out.println(e.getMessage());
				new File(filePath1 + "\\" + changeFileName + ext).delete();
				new File(filePath2 + "\\" + changeFileName1 + ext1).delete();

				model.addAttribute("msg", "작품 등록 실패!");

				return "common/errorPage";
				 
			}

			

			}else if(!photo1.isEmpty()) {
				wp1.setFid(contFid);
				
				System.out.println("켄텐츠사진정보 수정할떄 fid :" + wp1.getFid());
				String root = request.getSession().getServletContext().getRealPath("resources");

				String filePath = root + "\\uploadFiles\\webtoonContent";
				String originFileName = photo1.getOriginalFilename();
				String ext = originFileName.substring(originFileName.lastIndexOf("."));
				String changeFileName = CommonUtils.getRandomString();

				wp1.setOriginName(originFileName);
				wp1.setChangeName(changeFileName + ext);
				wp1.setFilePath(filePath);
				wp1.setUserId(userId);

				try {
					photo1.transferTo(new File(filePath + "\\" + changeFileName + ext));

					ws.updateWorkRound(wr, wp1);
					System.out.println("wp : " + wp1);

					new File(filePath + "\\" + contChangeName).delete();

					
					model.addAttribute("wid", wid);
					model.addAttribute("fid", contFid);

					return "redirect:roundList.wt";

				} catch (Exception e) {

					new File(filePath + "\\" + contChangeName + ext).delete();

					model.addAttribute("msg", "회차 등록  실패!!");

					return "common/errorPage";
					
				}
				
				
				
				
				
				
		} else if (!photo.isEmpty()) {
			wp.setFid(subFid);
			
			String root = request.getSession().getServletContext().getRealPath("resources");

			String filePath = root + "\\uploadFiles\\webtoonSub";
			String originFileName = photo.getOriginalFilename();
			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			String changeFileName = CommonUtils.getRandomString();

			wp.setOriginName(originFileName);
			wp.setChangeName(changeFileName + ext);
			wp.setFilePath(filePath);
			wp.setUserId(userId);
			System.out.println("썸내일사진정보 수정할떄 fid :" + wp.getFid());
			System.out.println("썸내일 수정 wp : " + wp);

			try {
				photo.transferTo(new File(filePath + "\\" + changeFileName + ext));

				ws.updateWorkRound(wr, wp);

				new File(filePath + "\\" + subChangeName).delete();

				model.addAttribute("wid", wid);
				model.addAttribute("fid", subFid);

				return "redirect:roundList.wt";

			} catch (Exception e) {

				new File(filePath + "\\" + subChangeName + ext).delete();

				model.addAttribute("msg", "회차 등록  실패!!");

				return "common/errorPage";
				
			}
			
		} else {
			System.out.println("사진변경 안할떄");

			ws.updateWorkRound(wr);
			System.out.println("result : " + ws);

			return "redirect:insertWork.wt";
		}

	}
	
	@RequestMapping(value="contentView.wt")
	public String contentView(Model model, HttpServletRequest request, HttpSession session, Member m, WebtoonRound wr, Webtoon wt) {
		System.out.println("웹툰 보기페이지 옴");

		m = (Member) session.getAttribute("loginUser");

		int rid = Integer.parseInt(request.getParameter("rid"));
		System.out.println("rid : " + rid);

		int wid = Integer.parseInt(request.getParameter("wid"));
		System.out.println("wid : " + wid);

		wr = ws.content(rid);
		wt = ws.content1(wid);
		
		System.out.println("wr : " + wr);
		
		model.addAttribute("wr", wr);
		model.addAttribute("wt", wt);
		
		
		
		return "webtoon/ContentForm";
		
	}
	
	//일반사용자가 썸내일을 누를시 회차 를  보여주는 메소드
	@RequestMapping(value="anthorWork.wt")
	public String anothorWork(Model model, HttpServletRequest request, HttpSession session, Webtoon wt) {
		
		int wid = Integer.parseInt(request.getParameter("wid"));
		System.out.println("wid : " + wid);
		
		wt.setWid(wid);
		
		int currentPage = 1;
		int limit = 5;
		int buttonCount = 10;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		System.out.println("wr : " + wid);
		int listCount = ws.anothorListCount(wid);
		WebtoonPageInfo pi = WebtoonPagination.getPageInfo(currentPage , listCount, limit, buttonCount);
		System.out.println("listCount(다른작품 조회) : " + listCount);
		
		ArrayList<Webtoon> list = ws.anthorWork(pi, wt);
		list.get(0);
		System.out.println("list: " + list);
		
		model.addAttribute("list1", list.get(0));
		
		model.addAttribute("list",list);
		
		model.addAttribute("pi",pi);
		
		return "webtoon/anthorWork";
		
	}
	
	@RequestMapping(value="attention.wt")
	public String attention(Model model, HttpServletRequest request, HttpSession session, Webtoon wt, Member m) {
		
		m = (Member) session.getAttribute("loginUser");
		
		int wid = Integer.parseInt(request.getParameter("wid"));
		
		wt.setWid(wid);
		wt.setUserId(m.getUserId());
		
		ws.attentionWork(wt);
		
		System.out.println("관심등록 ws : " + ws);
		
		return null;
		
	}
	
	//도전 장르 리스트
	@RequestMapping(value="challengeGenre.wt")
	public ResponseEntity<HashMap<String, Object>> challengeGenre(Webtoon wt, HttpServletRequest request, HttpServletResponse response, Model model) {
		int gradeType = Integer.parseInt(request.getParameter("gradeType"));
		String genre = request.getParameter("genre");
		wt.setGradeType(gradeType);
		wt.setGenre(genre);
		
		int buttonCount = 10;
		int limit = 12;
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = ws.WebtoonGenreCount(wt);
		WebtoonPageInfo pi = WebtoonPagination.getPageInfo(currentPage , listCount, limit, buttonCount);
		
		ArrayList<HashMap<String, Object>> list = ws.WebtoonGenreList(pi, wt);
		HashMap<String, Object> wtList = new HashMap<String, Object>();
		
		wtList.put("list", list);
		wtList.put("pi", pi);
		
		
		return new ResponseEntity<HashMap<String, Object>>(wtList,HttpStatus.OK);
	}
	 
}






















