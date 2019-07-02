package com.kh.cc.webtoon.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.cc.common.CommonUtils;
import com.kh.cc.common.WebtoonPagination;
import com.kh.cc.member.model.vo.Member;
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

	// 웹툰 작품등록폼 으로 가는 메소드
	@RequestMapping(value = "webtoonUpload.wt")
	public String insertWebtoon(HttpServletRequest request, HttpSession session, Member m, Model model) {
		
		return "webtoon/webtoonUpload";
	}

	// 메뉴바에서 눌렀을떄 웹툰 Work등록폼으로 가기
	@RequestMapping(value = "insertWork.wt")
	public String webtoonWorkInsert(HttpServletRequest request, HttpSession session, Member m, Model model) {
		System.out.println("웹툰 작품등록포 가기전 리스트 셀렉트");
		
		m = (Member) session.getAttribute("loginUser");
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage")!= null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = ws.selectListCount(m);
		System.out.println("listCount : " + listCount);
		
		WebtoonPageInfo pi = WebtoonPagination.getPageInfo(currentPage , listCount);
		
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
		
		wr.setWorkStatus(workStatus);
		if(workStatus == null) {
			workStatus = "COMPLTE";
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
	
	//리스트에서 회차 등록버튼을 눌렀을때 동작되는 메소드
	@RequestMapping(value = "roundList.wt")
	public String roundList(Model model,HttpServletRequest request, HttpSession session, Webtoon wt) {
		System.out.println("리스트에서 회차등록 버튼을 눌렀을때 wid");
		
		int wid = Integer.parseInt(request.getParameter("wid"));
		
		System.out.println("wid : " + wid);
		
		wt = ws.selectMainPhoto(wid);
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		System.out.println("wr : " + wid);
		int listCount = ws.selectListCount(wid);
		
		WebtoonPageInfo pi = WebtoonPagination.getPageInfo(currentPage,listCount);
		
		ArrayList<WebtoonRound> list = ws.selectWtRoundList(pi, wt);
		System.out.println("list : " + list);
		
		System.out.println("listCount :" +listCount);
		System.out.println("wt : " + wt);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("wt", wt);
		
		return "webtoon/webtoonRoundList";
	}
	
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
	
	@RequestMapping(value="updateWork.wt")
	public String updateWork(Model model,HttpServletRequest request, HttpSession session, Webtoon wt, WebtoonPhoto wp, Member m,
			@RequestParam(name="photo", required=false) MultipartFile photo) {
		m = (Member) session.getAttribute("loginUser");
		String userId = m.getUserId();
		
		int wid = Integer.parseInt(request.getParameter("wid"));
		int fid = Integer.parseInt(request.getParameter("fid"));

		wt.setWid(wid);
		wt.setFid(fid);
		 
		
		System.out.println("@wt@ : " + wt);
		
		/*
		 * wt.setUserId(userId); wt.setWid(wid);
		 */
		
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
	
	
}




















