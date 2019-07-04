package com.kh.cc.webnovel.controller;

import java.io.File;
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
import com.kh.cc.common.WebnovelPagination;
import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webnovel.model.service.WebnovelService;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelAttention;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;
import com.kh.cc.webnovel.model.vo.WebnovelPhoto;
import com.kh.cc.webnovel.model.vo.WebnovelRound;
import com.kh.cc.webnovel.model.vo.WebnovelStarPoint;

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
	//웹소설 삭제
	@RequestMapping(value="deleteWebnovel.wn")
	public String deleteWebnovel(Model model, Webnovel wn, WebnovelPhoto wp, WebnovelRound wnr, HttpServletRequest request, HttpSession session) {
		int wid = Integer.parseInt(request.getParameter("wid"));
		wn = ws.selectWnOne(wid);
		wnr.setRid(wn.getRid());
		ArrayList<WebnovelRound> list = ws.selectWnRoundList(wnr);
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String mainChangeName = wn.getChangeName();
		String mainFilePath = root + "\\uploadFiles\\webnovelMain";
		String subFilePath = root + "\\uploadFiles\\webnovelSub";
		
		int result = ws.deleteWebnovel(wn);
		
		if(result > 0) {
			new File(mainFilePath + "\\" + mainChangeName).delete();
			for(int i = 0; i < list.size(); i++) {
				String subChangeName = list.get(i).getChangeName();
				new File(subFilePath + "\\" + subChangeName).delete();
			}
		}
		return "redirect:selectWnList.wn";
	}
	//웹소설 회차 삭제
		@RequestMapping(value="deleteWnRound.wn")
		public String deleteWnRound(Model model, WebnovelPhoto wp, WebnovelRound wnr, HttpServletRequest request, HttpSession session) {
			int rid = Integer.parseInt(request.getParameter("rid"));
			
			wnr = ws.selectWnrOne(rid);
			int wid = wnr.getWid();
			
			String root = request.getSession().getServletContext().getRealPath("resources");
			String subFilePath = root + "\\uploadFiles\\webnovelSub";
			String subChangeName = wnr.getChangeName();
			int result = ws.deleteWnRound(wnr);
			if(result > 0) {
				new File(subFilePath + "\\" + subChangeName).delete();
			}
			return "redirect:selectWnRoundList.wn?wid=" + wid;
		}
	
	
	//웹소설 목록
	@RequestMapping(value="selectWnList.wn")
	public String selectWnList(HttpServletRequest request, HttpSession session, Member m, Model model) {
		m = (Member) session.getAttribute("loginUser");
		
		int buttonCount = 10;
		int currentPage = 1;
		int limit = 5;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = ws.selectListCount(m);
		
		
		WebnovelPageInfo pi = WebnovelPagination.getPageInfo(currentPage, listCount, limit, buttonCount);
		
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
	public String selectWnRoundList(Member m, WebnovelAttention wa, HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model, Webnovel wn, WebnovelRound wnr) {
		m = (Member) session.getAttribute("loginUser");
		int wid = Integer.parseInt(request.getParameter("wid"));
		
		wnr.setWid(wid);
		int buttonCount = 10;
		int limit = 10;
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = ws.selectWnrListCount(wnr);
		
		WebnovelPageInfo pi = WebnovelPagination.getPageInfo(currentPage, listCount, limit, buttonCount);
		
		wn = ws.selectWnOne(wid);
		
		if(session.getAttribute("loginUser") != null) {
			if(!m.getUserId().equals(wn.getUserId())) {
				ws.updateCount(wnr);
				
				wa.setUserId(m.getUserId());
				wa.setWid(wid);
				
				wa = ws.selectAttention(wa);
			}
		}
		
		
		ArrayList<WebnovelRound> list = ws.selectWnRoundList(pi, wnr);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("wn", wn);
		model.addAttribute("wa", wa);
		
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
			workStatus = "RUN";
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
			
			try {
				photo.transferTo(new File(filePath + "\\" + changeFileName + ext));
				if(wn.getWorkStatus() == null) {
					wn.setWorkStatus("RUN");
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
				wn.setWorkStatus("RUN");
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
	
	//웹소설 회차 상세보기
	@RequestMapping("selectDetailedWebnovel.wn")
	public String selectDetailedWebnovel(HttpServletRequest request,Member m, WebnovelStarPoint wnsp, Webnovel wn, HttpSession session, HttpServletResponse response, Model model, WebnovelRound wnr) {
		m = (Member) session.getAttribute("loginUser");
		int wid = Integer.parseInt(request.getParameter("wid"));
		
		wn = ws.selectWnOne(wid);
		wnr.setWid(wid);
		int buttonCount = 0;
		int limit = 1;
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		if(session.getAttribute("loginUser") != null) {
			if(!m.getUserId().equals(wn.getUserId())) {
				ws.updateCount(wnr);
			}
		}
		int listCount = ws.selectWnrListCount(wnr);
		
		WebnovelPageInfo pi = WebnovelPagination.getPageInfo(currentPage, listCount, limit, buttonCount);
		
		ArrayList<WebnovelRound> list = ws.selectWnRoundList(pi, wnr);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		//model.addAttribute("wnr", wnr);
		model.addAttribute("wn", wn);
//		model.addAttribute("wnsp", wnsp);
		
		return "webnovel/webnovelContents/selectDetailedWebnovel";
		
	}
	//도전웹소설 장르 리스트
	@RequestMapping("challengeGenre.wn")
	public ResponseEntity<HashMap<String, Object>> challengeGenre(WebnovelRound wnr, HttpServletRequest request, HttpServletResponse response, Model model, Webnovel wn) {
		String genre = request.getParameter("genre");
		if(genre.equals("CLOSE")) {
			int buttonCount = 10;
			int limit = 12;
			int currentPage = 1;
			
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			int listCount = ws.challengeCloseCount(genre);
			WebnovelPageInfo pi = WebnovelPagination.getPageInfo(currentPage, listCount, limit, buttonCount);
			
			
			ArrayList<HashMap<String, Object>> list = ws.challengeCloseList(pi, genre);
			HashMap<String, Object> wnList = new HashMap<String, Object>();
			
//			System.out.println("list : " + list);
			/*for(int i = 0; i < list.size(); i++) {
				wnr.setWid(list);
				int wnrListCount = ws.selectWnrListCount(wnr);
				System.out.println("wnrListCount : " + wnrListCount);
			}*/
			
			wnList.put("list", list);
			wnList.put("pi", pi);
			return new ResponseEntity<HashMap<String, Object>>(wnList,HttpStatus.OK);
		}else {
			
			int buttonCount = 10;
			int limit = 12;
			int currentPage = 1;
			
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			int listCount = ws.challengeGenreCount(genre);
			
			WebnovelPageInfo pi = WebnovelPagination.getPageInfo(currentPage, listCount, limit, buttonCount);
			
			ArrayList<HashMap<String, Object>> list = ws.challengeGenreLIst(pi, genre);
			HashMap<String, Object> wnList = new HashMap<String, Object>();
//			for(int i = 0; i < list.size(); i++) {
//				System.out.println("list : " + list.get(i));
//				//wnr.setWid();
//				//int wnrListCount = ws.selectWnrListCount(wnr);
//				//System.out.println("wnrListCount : " + wnrListCount);
//			}
			
			wnList.put("list", list);
			wnList.put("pi", pi);
			return new ResponseEntity<HashMap<String, Object>>(wnList,HttpStatus.OK);
		}
		
	}
	//관심등록 메소드
	@RequestMapping(value="insertAttention.wn")
	public String insertAttention(HttpServletRequest request, HttpSession session, Member m, WebnovelAttention wa) {
		m = (Member) session.getAttribute("loginUser");
		int wid = Integer.parseInt(request.getParameter("wid"));
		wa.setUserId(m.getUserId());
		wa.setWid(wid);
		
		ws.insertAttention(wa);
		
		return "redirect:selectWnRoundList.wn?wid=" + wid;
	}
	//별점주기 메소드
	@RequestMapping(value="insertStarPoint.wn")
	public String insertStarPoint(Model model, WebnovelStarPoint wnsp, HttpServletRequest request, WebnovelRound wnr, HttpSession session, Member m) {
		m = (Member) session.getAttribute("loginUser");
		int rid = Integer.parseInt(request.getParameter("rid"));
		int starPoint = Integer.parseInt(request.getParameter("starPoint"));
		wnr = ws.selectWnrOne(rid);
		int wid = wnr.getWid();
		
		wnsp.setStarPoint(starPoint);
		wnsp.setRid(rid);
		wnsp.setUserId(m.getUserId());
		
		ws.insertStarPoint(wnsp);
		
		return "redirect:selectDetailedWebnovel.wn?wid=" + wid + "&rid=" + rid;
	}
	//별점 평균, 별점준 인원
	@RequestMapping(value="selectStarAvgCnt.wn")
	public ResponseEntity<HashMap<String, Object>> selectStarAvgCnt(Model model, WebnovelStarPoint wnsp, HttpServletRequest request, WebnovelRound wnr, HttpSession session, Member m) {
		int rid = Integer.parseInt(request.getParameter("rid"));
		
		double wnrStarPointAvg = ws.selectWnrStarPointAvg(rid);
		int starPointCount = ws.selectstarPointCount(rid);
		
		HashMap<String, Object> wnrAvgcnt = new HashMap<String, Object>();
		wnrAvgcnt.put("wnrStarPointAvg", wnrStarPointAvg);
		wnrAvgcnt.put("starPointCount", starPointCount);
		
		return new ResponseEntity<HashMap<String, Object>>(wnrAvgcnt,HttpStatus.OK);
	}
	//별점 로그인/비로그인, 등록인/미등록인 구분
	@RequestMapping(value="selectWnspOne.wn")
	public ResponseEntity<HashMap<String, Object>> selectWnspOne(Model model, Webnovel wn, WebnovelStarPoint wnsp, HttpServletRequest request, WebnovelRound wnr, HttpSession session, Member m) {
		m = (Member) session.getAttribute("loginUser");
		int rid = Integer.parseInt(request.getParameter("rid"));
		
		if(session.getAttribute("loginUser") != null) {
			if(!m.getUserId().equals(wn.getUserId())) {
				
				wnsp.setRid(rid);
				wnsp.setUserId(m.getUserId());
				
				wnsp = ws.selectWnSpOne(wnsp);
			}
		}
		HashMap<String, Object> starOk = new HashMap<String, Object>();
		starOk.put("wnsp", wnsp);
		
		return new ResponseEntity<HashMap<String, Object>>(starOk,HttpStatus.OK);
	}
	//전체 별점 평군, 별점 카운트
	@RequestMapping(value="selectAllStarAvgCnt.wn")
	public ResponseEntity<HashMap<String, Object>> selectAllStarAvgCnt(Model model, WebnovelStarPoint wnsp, HttpServletRequest request, WebnovelRound wnr, HttpSession session, Member m) {
		int wid = Integer.parseInt(request.getParameter("wid"));
		
		double wnrStarPointAvg = ws.selectAllWnrStarPointAvg(wid);
		int starPointCount = ws.selectAllStarPointCount(wid);
		
		HashMap<String, Object> wnrAvgcnt = new HashMap<String, Object>();
		wnrAvgcnt.put("wnrStarPointAvg", wnrStarPointAvg);
		wnrAvgcnt.put("starPointCount", starPointCount);
		
		return new ResponseEntity<HashMap<String, Object>>(wnrAvgcnt,HttpStatus.OK);
	}
	//베스트 도전 작품
	@RequestMapping(value="selectBestWnList.wn")
	public ResponseEntity<HashMap<String, Object>> selectBestWnList(Model model, WebnovelStarPoint wnsp, HttpServletRequest request, WebnovelRound wnr, HttpSession session, Member m) {
		int gradeType =  Integer.parseInt(request.getParameter("gradeType"));
		int buttonCount = 10;
		int limit = 5;
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = ws.selectBestWnListCount(gradeType);
		WebnovelPageInfo pi = WebnovelPagination.getPageInfo(currentPage, listCount, limit, buttonCount);
		
		ArrayList<HashMap<String, Object>> list = ws.selectBestWnList(pi, gradeType);
		HashMap<String, Object> wnList = new HashMap<String, Object>();
		
		wnList.put("list", list);
		wnList.put("pi", pi);
		
		return new ResponseEntity<HashMap<String, Object>>(wnList,HttpStatus.OK);
	}
	//도전 메인 베스트 추천작품
	@RequestMapping(value="selectMainBestWnList.wn")
	public ResponseEntity<HashMap<String, Object>> selectMainBestWnList(Model model, WebnovelStarPoint wnsp, HttpServletRequest request, Webnovel wn, HttpSession session, Member m) {
		int gradeType =  Integer.parseInt(request.getParameter("gradeType"));
		int buttonCount = 10;
		int limit = 1;
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = 5;
		WebnovelPageInfo pi = WebnovelPagination.getPageInfo(currentPage, listCount, limit, buttonCount);
		
		ArrayList<HashMap<String, Object>> list = ws.selectBestWnList(pi, gradeType);
		HashMap<String, Object> wnList = new HashMap<String, Object>();
		
		wnList.put("list", list);
		wnList.put("pi", pi);
		
		return new ResponseEntity<HashMap<String, Object>>(wnList, HttpStatus.OK);
	}
	
	//도전 추천 베스트 추천 리스트
	@RequestMapping(value="selectRecommendGenreList.wn")
	public ResponseEntity<HashMap<String, Object>> selectRecommendGenreList(Model model, HttpServletRequest request, Webnovel wn, HttpSession session, Member m) {
		
		String genre = request.getParameter("genre");
		int gradeType =  Integer.parseInt(request.getParameter("gradeType"));
		
		System.out.println("장르 : " + genre);
		System.out.println("무료작품임 ? : " + gradeType);
		
		wn.setGenre(genre);
		wn.setGradeType(gradeType);
		
		int buttonCount = 10;
		int limit = 3;
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = 12;
		
		WebnovelPageInfo pi = WebnovelPagination.getPageInfo(currentPage, listCount, limit, buttonCount);
		
		ArrayList<HashMap<String, Object>> list = ws.selectRecommendGenreList(pi, wn);
		
		System.out.println(list);
		
		HashMap<String, Object> wnList = new HashMap<String, Object>();
		
		wnList.put("list", list);
		wnList.put("pi", pi);
		
		return new ResponseEntity<HashMap<String, Object>>(wnList, HttpStatus.OK);
	}
	
	//도전 추천 최신 리스트
	@RequestMapping(value="selectNewRecommendList.wn")
	public ResponseEntity<HashMap<String, Object>> selectNewRecommendList(Model model, HttpServletRequest request, Webnovel wn, HttpSession session, Member m) {
		
		int gradeType =  Integer.parseInt(request.getParameter("gradeType"));
		
		System.out.println("무료작품임 ? : " + gradeType);
		
		wn.setGradeType(gradeType);
		
		int buttonCount = 5;
		int limit = 6;
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = 18;
		
		WebnovelPageInfo pi = WebnovelPagination.getPageInfo(currentPage, listCount, limit, buttonCount);
		
		ArrayList<HashMap<String, Object>> list = ws.selectNewRecommendList(pi, wn);
		
		System.out.println(list);
		
		HashMap<String, Object> wnList = new HashMap<String, Object>();
		
		wnList.put("list", list);
		wnList.put("pi", pi);
		
		return new ResponseEntity<HashMap<String, Object>>(wnList, HttpStatus.OK);
	}
	
	
	//웹소설 Top5 이동
	@RequestMapping("webnovelTop5.wn")
	public String webnovelTop5() {
		return "webnovel/webnovelTop5/webnovelTop5";
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
