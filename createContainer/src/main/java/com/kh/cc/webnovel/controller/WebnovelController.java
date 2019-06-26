package com.kh.cc.webnovel.controller;

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
import com.kh.cc.common.WebnovelPagination;
import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webnovel.model.service.WebnovelService;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;
import com.kh.cc.webnovel.model.vo.WebnovelPhoto;
import com.kh.cc.webnovel.model.vo.WebnovelRound;

@Controller
public class WebnovelController {
	
	@Autowired
	private WebnovelService ws;
	
	//웹소설 등록insertNovel.wn
	@RequestMapping(value="insertNovel.wn")
	public String insertNovel(Model model, Webnovel wn, HttpServletRequest request, HttpSession session, WebnovelPhoto wp, Member m,
			@RequestParam(name="photo", required=false) MultipartFile photo) {
		m = (Member) session.getAttribute("loginUser");
		String userId = m.getUserId();
		wn.setUserId(userId); 
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String filePath = root + "\\uploadFiles\\webnovelMain";
		String originFileName = photo.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String changeFileName = CommonUtils.getRandomString();
		
		wp.setOriginName(originFileName);
		wp.setChangeName(changeFileName + ext);
		wp.setFilePath(filePath);
		wp.setUserId(userId);
		
		try {
			photo.transferTo(new File(filePath + "\\" + changeFileName + ext));
			
			ws.insertWebnovel(wn, wp);
			
			return "redirect:selectWnList.wn";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			new File(filePath + "\\" + changeFileName + ext).delete();
			
			model.addAttribute("msg", "작품 등록 실패!!");
			
			return "common/errorPage";
		}
		
	}
	
	//웹소설 메인 수정
	@RequestMapping(value="updateNovel.wn")
	public String updateNovel(Model model, Webnovel wn, HttpServletRequest request, HttpSession session, WebnovelPhoto wp, Member m,
			@RequestParam(name="photo", required=false) MultipartFile photo) {
		m = (Member) session.getAttribute("loginUser");
		int wid = (int) session.getAttribute("wid");
		int fid = (int) session.getAttribute("fid");
		String userId = m.getUserId();
		wn.setUserId(userId);
		wn.setWid(wid);
		
		wp.setFid(fid);
		
		String changeName = request.getParameter("changeName");
		
		System.out.println(wn);
		if(!photo.isEmpty()) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			String filePath = root + "\\uploadFiles\\webnovelMain";
			String originFileName = photo.getOriginalFilename();
			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			String changeFileName = CommonUtils.getRandomString();
			
			wp.setOriginName(originFileName);
			wp.setChangeName(changeFileName + ext);
			wp.setFilePath(filePath);
			wp.setUserId(userId);
			
			try {
				photo.transferTo(new File(filePath + "\\" + changeFileName + ext));
				
				ws.updateWebnovel(wn, wp);
				
				new File(filePath + "\\" + changeName).delete();
				
				session.removeAttribute("wid");
				session.removeAttribute("fid");
				
				return "redirect:selectWnList.wn";
			} catch (Exception e) {
				System.out.println(e.getMessage());
				new File(filePath + "\\" + changeFileName + ext).delete();
				
				model.addAttribute("msg", "작품 등록 실패!!");
				
				return "common/errorPage";
			}
		}else {
			
			ws.updateWebnovel(wn);
			
			return "redirect:selectWnList.wn";
		}
	}
	
	//웹소설 목록
	@RequestMapping(value="selectWnList.wn")
	public String selectWnList(HttpServletRequest request, HttpSession session, Member m, Model model) {
		m = (Member) session.getAttribute("loginUser");
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = ws.selectListCount(m);
		
		
		WebnovelPageInfo pi = WebnovelPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Webnovel> list = ws.selectWnList(pi, m);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "webnovel/webnovelContents/selectWebnovelList";
	}
	
	
	//웹소설 수정폼 이동
	@RequestMapping("selectWnUpdateOne.wn")
	public String updateWebnovel(HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model, Webnovel wn) {
		int wid = Integer.parseInt(request.getParameter("wid"));
		
		wn = ws.selectWnOne(wid);
		
		session.setAttribute("wid", wn.getWid());
		session.setAttribute("fid", wn.getFid());
		
		model.addAttribute("wn", wn);
		
		return "webnovel/updateWebnovel/updateWebnovel";
	}

	//웹소설 회차 리스트 이동WORK_ROUND
	@RequestMapping("selectWnRoundList.wn")
	public String selectWnRoundList(HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model, Webnovel wn, WebnovelRound wnr) {
		int wid = Integer.parseInt(request.getParameter("wid"));
		
		wnr.setWid(wid);
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		
		int listCount = ws.selectWnrListCount(wnr);
		
		WebnovelPageInfo pi = WebnovelPagination.getPageInfo(currentPage, listCount);
		
		wn = ws.selectWnOne(wid);
		
		ArrayList<WebnovelRound> list = ws.selectWnRoundList(pi, wnr);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("wn", wn);
		
		return "webnovel/webnovelContents/selectWnRoundList";
	}
	//웹소설 회차 등록 폼 이동
	@RequestMapping("insertWnRoundForm.wn")
	public String insertWnRoundForm(HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model, Webnovel wn) {
		int wid = Integer.parseInt(request.getParameter("wid"));
		
		wn = ws.selectWnOne(wid);
		
		session.setAttribute("wid", wn.getWid());
		
		model.addAttribute("wn", wn);
		
		return "webnovel/insertWebnovel/insertWnRound";
	}
	
	//웹소설 신규 회차 등록
	@RequestMapping(value="insertWnRound.wn")
	public String insertWnRound(Model model, Webnovel wn, Member m, WebnovelRound wnr, HttpServletRequest request, HttpSession session, WebnovelPhoto wp, 
			@RequestParam(name="photo", required=false) MultipartFile photo) {
		m = (Member) session.getAttribute("loginUser");
		int wid = (int) session.getAttribute("wid");
		String userId = m.getUserId();
		String workStatus = request.getParameter("workStatus");
		if(workStatus == null) {
			workStatus = "COMPLTE";
		}
		
		wn.setWid(wid);
		wn.setWorkStatus(workStatus);
		wnr.setWid(wid);
		wp.setWid(wid);
		wp.setUserId(userId);
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String filePath = root + "\\uploadFiles\\webnovelSub";
		String originFileName = photo.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String changeFileName = CommonUtils.getRandomString();
		
		wp.setOriginName(originFileName);
		wp.setChangeName(changeFileName + ext);
		wp.setFilePath(filePath);
		wp.setWid(wid);
		
		try {
			photo.transferTo(new File(filePath + "\\" + changeFileName + ext));
			ws.insertWnRound(wnr, wp, wn);
			
			return "redirect:selectWnRoundList.wn?wid=" + wid;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			new File(filePath + "\\" + changeFileName + ext).delete();
			
			model.addAttribute("msg", "신규 회차 등록 실패!!");
			
			return "common/errorPage";
		}
		
	}
	
	//웹소설 회차 수정
	@RequestMapping(value="updateWnRound.wn")
	public String updateWnRound(Model model, Webnovel wn, Member m, WebnovelRound wnr, HttpServletRequest request, HttpSession session, WebnovelPhoto wp, 
			@RequestParam(name="photo", required=false) MultipartFile photo) {
		String changeName = request.getParameter("changeName");
		int rid = Integer.parseInt(request.getParameter("rid"));
		int fid = Integer.parseInt(request.getParameter("fid"));
		int wid = Integer.parseInt(request.getParameter("wid"));

		wnr.setRid(rid);
		wnr.setChangeName(changeName);
		wp.setFid(fid);
		
		if(!photo.isEmpty()) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String filePath = root + "\\uploadFiles\\webnovelSub";
			String originFileName = photo.getOriginalFilename();
			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			String changeFileName = CommonUtils.getRandomString();
			
			wp.setOriginName(originFileName);
			wp.setChangeName(changeFileName + ext);
			wp.setFilePath(filePath);
			
			System.out.println(wnr);
			System.out.println(wp);
			System.out.println(wn);
			try {
				photo.transferTo(new File(filePath + "\\" + changeFileName + ext));
				if(wn.getWorkStatus() == null) {
					wn.setWorkStatus("COMPLTE");
				}
				ws.updateWnRound(wnr, wp, wn);
				
				new File(filePath + "\\" + changeName).delete();
				
				return "redirect:selectWnRoundList.wn?wid=" + wid;
			} catch (Exception e) {
				System.out.println(e.getMessage());
				new File(filePath + "\\" + changeFileName + ext).delete();
				
				model.addAttribute("msg", "회차 정보 수정 실패!!");
				
				return "common/errorPage";
			}
		}else {
			if(wn.getWorkStatus() == null) {
				wn.setWorkStatus("COMPLTE");
			}
			ws.updateWnRound(wnr, wn);
			return "redirect:selectWnRoundList.wn?wid=" + wid;
		}
		
	}

	//웹소설 회차 수정폼 이동
	@RequestMapping("selectWnrUpdateForm.wn")
	public String updateWnRound(HttpServletRequest request, Webnovel wn, HttpSession session, HttpServletResponse response, Model model, WebnovelRound wnr) {
		int rid = Integer.parseInt(request.getParameter("rid"));
		wnr = ws.selectWnrOne(rid);
		int wid = wnr.getWid();
		
		wn = ws.selectWnOne(wid);
		String workStatus = wn.getWorkStatus();
		
		wnr.setWorkStatus(workStatus);
		
		model.addAttribute("wnr", wnr);
		
		return "webnovel/updateWebnovel/updateWebnovelRound";
		
	}
	
	//웹소설 회차 수정폼 이동
	@RequestMapping("selectDetailedWebnovel.wn")
	public String selectDetailedWebnovel(HttpServletRequest request, Webnovel wn, HttpSession session, HttpServletResponse response, Model model, WebnovelRound wnr) {
		int rid = Integer.parseInt(request.getParameter("rid"));
		wnr = ws.selectWnrOne(rid);
		int wid = wnr.getWid();
		wn = ws.selectWnOne(wid);
		System.out.println(wnr);
		System.out.println(wn);
		model.addAttribute("wnr", wnr);
		model.addAttribute("wn", wn);
		
		return "webnovel/webnovelContents/selectDetailedWebnovel";
		
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
		return "webnovel/webnovelContents/selectWebnovelList";
	}
	//웹소설 등록 이동
	@RequestMapping("insertWebnovel.wn")
	public String insertWebnovel() {
		return "webnovel/insertWebnovel/insertWebnovel";
	}
	//웹소설 취소 이동
	@RequestMapping("cancelWebnovel.wn")
	public String cancelWebnovel() {
		return "webnovel/webnovelContents/selectWebnovelList";
	}
	
	
}
