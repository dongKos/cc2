package com.kh.cc.admin.controller;

import java.text.SimpleDateFormat;
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
import org.springframework.web.servlet.ModelAndView;

import com.kh.cc.admin.model.service.AdminService;
import com.kh.cc.admin.model.vo.AdminPageInfo;
import com.kh.cc.admin.model.vo.Approve;
import com.kh.cc.admin.model.vo.Board;
import com.kh.cc.admin.model.vo.Refund;
import com.kh.cc.admin.model.vo.Report;
import com.kh.cc.common.Pagination;
import com.kh.cc.illustrator.model.vo.Illustrator;
import com.kh.cc.illustrator.model.vo.Support;
import com.kh.cc.member.model.vo.Member;
import com.kh.cc.mypage.model.vo.Closed;
import com.kh.cc.webnovel.model.vo.Webnovel;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService as;
	
	//관리자 메인페이지로 이동시켜주는 메소드
	@RequestMapping(value="adminMain.ad")
	public String showAdminMain() {
		return "admin/adminMain";
	}
	
	//환불 관리 페이지로 이동
	@RequestMapping("showRefund.ad")
	public String showRefund(HttpServletRequest request, Model model) {
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getRefundListCount();
		
		AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Refund> list = as.selectRefundList(pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/adminRefund";
	}
	
	//환불 관리 페이지 처리대기 / 완료 조건검색 ajax
	@RequestMapping(value="refundStatus.ad")
	public ModelAndView refundStatus(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		ArrayList<Refund> list = null;
		response.setContentType("text/html; charset=UTF-8");
		String statusVal = request.getParameter("statusVal");
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = 0;
		
		listCount = as.getRefundAjaxCount(statusVal);
		AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		list = as.refundStatus(statusVal, pi);
		
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		ArrayList<HashMap<String, Object>> list2 = new ArrayList<HashMap<String, Object>>();
		for(int i = 0; i < list.size(); i++) {
			HashMap<String, Object> hmap = new HashMap<String, Object>();
			
			String rDate = fmt.format(list.get(i).getRequestDate());
			String cDate = fmt.format(list.get(i).getCompleteDate());
			
			hmap.put("refundCode", list.get(i).getRefundCode());
			hmap.put("requestDate", rDate);
			hmap.put("completeDate", cDate);
			hmap.put("price", list.get(i).getPrice());
			hmap.put("status", list.get(i).getStatus());
			hmap.put("refundReason", list.get(i).getRefundReason());
			hmap.put("userId", list.get(i).getUserId());
			
			list2.add(hmap);
		}
		
		mv.addObject("list", list2);
		mv.addObject("pi", pi);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	//환불 관리 페이지 상세보기
	@RequestMapping("showRefundDetail.ad")
	public String showRefundDetail(HttpServletRequest request, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));
		
		Refund reqRefund = as.selectOneRefund(num);
		
		model.addAttribute("reqRefund", reqRefund);
		
		return "admin/adminRefundDetail";
	}
	
	//환불 처리 기능
	@RequestMapping("refundComplete.ad")
	public String refundComplete(HttpServletRequest request) {
		int refundCode = Integer.parseInt(request.getParameter("refundCode"));
		
		int result = as.refundComplte(refundCode);
		
		return "redirect:showRefund.ad";
	}
	
	//회원 관리 페이지
	@RequestMapping(value="showMember.ad")
	public String showMember(HttpServletRequest request, Model model) {
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getMemberListCount();
		
		AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		ArrayList<Member> list = as.selectMemberList(pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/adminMember";
	}
	
	//회원 관리 페이지 조건 검색 ajax
	@RequestMapping(value="memberType.ad")
	public ResponseEntity<HashMap<String, Object>> memberType(HttpServletRequest request) {
		int type = Integer.parseInt(request.getParameter("type"));
		
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getMemberTypeListCount(type);
		
		AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		System.out.println("listCount : " + listCount);
		System.out.println("pi : " + pi);
		
		ArrayList<HashMap<String, Object>> list = as.selectmemberTypeList(pi, type);
		HashMap<String, Object> list2 = new HashMap<String, Object>();
		System.out.println("type : " + type);
		System.out.println("조건 따라 받아온 맴버 list : " + list.size());
		list2.put("list", list);
		list2.put("pi", pi);
		
		
		return new ResponseEntity<HashMap<String, Object>>(list2,HttpStatus.OK);
		
	}
	
	//회원 관리 페이지 상세보기
	@RequestMapping("showMemberDetail.ad")
	public String showMemberDetail(HttpServletRequest request, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));
		
		Member reqMember = as.selectOneMember(num);
		
		model.addAttribute("userId", reqMember.getUserId());
		System.out.println(reqMember.getUserId());
		//올린 작품이 있는지 조회
		int work = as.workCount(reqMember.getUserId());
		
		if(work > 0) {
			//작품이 있다면 그 작품을 조회해온다
			//작품은 컬럼이 다 같아서 그냥 웹소설로 다 조회해옴
			ArrayList<Webnovel> list = as.selectWorkList(reqMember.getUserId());
			System.out.println("작품 조회 : " + list);
			model.addAttribute("list", list);
		}
		//올린 일러스트가 있는지 조회
		int ill = as.illustCount(reqMember.getUserId());
		
		if(ill > 0) {
			//일러스트가 있으면 일러스트 조회
			//일러스트 VO수정 의뢰 할것 - 광섭
			//ArrayList<Illustrator> list2 = as.selectIllustList(reqMember.getUserId());
		}
		
		System.out.println("work : " + work);
		System.out.println("ill : " + ill);
		model.addAttribute("reqMember", reqMember);
		return "admin/adminMemberDetail";
	}
	
	//회원 강퇴하기
	@RequestMapping(value="deleteMember.ad")
	public String deleteMember(String userId) {
		int result = as.deleteMember(userId);
		
		return "redirect:showMember.ad";
	}
	
	//게시판 관리 - 게시글 관리 페이지
	@RequestMapping("showBoard.ad")
	public String showBoard(HttpServletRequest request, Model model) {
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getBoardListCount();
		
		System.out.println("게시물 전체 개수 : " + listCount);
		AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		ArrayList<Member> list = as.selectBoardList(pi);
		
		System.out.println("boardList : " + list);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		
		return "admin/adminBoard";
	}
	
	//게시판 관리 - 게시글 관리  페이지 조건 검색 ajax
	@RequestMapping(value="boardType.ad")
	public ResponseEntity<HashMap<String, Object>> boardType(HttpServletRequest request) {
		//1:1문의 인지 공지사항 인지
		int select1 = Integer.parseInt(request.getParameter("select1"));
		//웹툰, 웹소설, 일러스트, 기타 인지
		int select2 = Integer.parseInt(request.getParameter("select2"));
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getBoardTypeListCount(select1, select2);
		
		AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		ArrayList<HashMap<String, Object>> list = as.selectBoardTypeList(pi, select1,  select2);
		HashMap<String, Object> list2 = new HashMap<String, Object>();
		list2.put("list", list);
		list2.put("pi", pi);
		
		return new ResponseEntity<HashMap<String, Object>>(list2,HttpStatus.OK);
		
	}
	
	//게시판 관리 - 댓글 관리 페이지
	@RequestMapping("showBoardReply.ad")
	public String showBoardReply(HttpServletRequest request, Model model) {
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getBoardReplyListCount();
		
		System.out.println("댓글 전체 개수 : " + listCount);
		AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		ArrayList<Member> list = as.selectBoardReplyList(pi);
		
		System.out.println("boardReplyList : " + list);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		
		return "admin/adminBoardReply";
	}
	
	
	//게시판 관리 - 게시글 관리 페이지 조건 검색 ajax
	
	@RequestMapping(value="boardReplyType.ad") 
	public ResponseEntity<HashMap<String,Object>> boardReplyType(HttpServletRequest request) { 
		//1:1문의 인지 공지사항 인지 
		int select1 = Integer.parseInt(request.getParameter("select1")); 
		//웹툰, 웹소설, 일러스트,기타 인지 
		int select2 = Integer.parseInt(request.getParameter("select2"));
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) { 
			currentPage =Integer.parseInt(request.getParameter("currentPage")); 
		}
		
		int listCount = as.getBoardTypeListCount(select1, select2);
		
		AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<HashMap<String, Object>> list = as.selectBoardTypeList(pi, select1,
				select2); HashMap<String, Object> list2 = new HashMap<String, Object>();
				list2.put("list", list); list2.put("pi", pi);
				
				return new ResponseEntity<HashMap<String, Object>>(list2,HttpStatus.OK);
				
	}
	
	
	
	//통계관리 - 작가통계 페이지
	@RequestMapping("showStatistic.ad")
	public String showStatistic(HttpServletRequest request, Model model) {
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getPriMemberListCount();
		
		System.out.println("프리미엄 회원 전체 수  : " + listCount);
		AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Member> list = as.selectPriMemberList(pi);
		System.out.println("list : " + list);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		
		return "admin/adminStatistic";
	}
	
	//통계관리 - 작가통계 상세 페이지
	@RequestMapping("showStatisticDetail.ad")
	public String showStatisticDetail(HttpServletRequest request, Model model) {
		int mno = Integer.parseInt(request.getParameter("mno"));
		
		Member reqMember = as.selectOneMember(mno);
		
		System.out.println("해당 회원 정보 : " + reqMember);
		
		int workCtn = as.workCount(reqMember.getUserId());
		int illCtn = as.illustCount(reqMember.getUserId());
		
		//작가의 해당작품
		ArrayList<Webnovel> work = null;
		ArrayList<Illustrator> ill = null;
		
		//해당 작가의 월별 매출 평균
		ArrayList<Integer> list = as.selectPurchaseAvg(mno);
		
		//전체 매출 평균
		ArrayList<Integer> wholeList = as.selectAllPurchaseAvg();
		
		if(workCtn > 0) {
			//작가의 작품 조회
			work = as.selectWorkList(reqMember.getUserId());
			model.addAttribute("work", work);
			System.out.println("작품 조회 : " + work);
			
			System.out.println("월별 통계 : " + list);
		}
		if(illCtn > 0) {
			ill = as.selectIllustList(reqMember.getUserId());
			model.addAttribute("ill", ill);
			System.out.println("일러스트 조회 : " + ill);
		}
		
		model.addAttribute("reqMember", reqMember);
		model.addAttribute("wholeList", wholeList);
		model.addAttribute("list", list);
		
		return "admin/adminStatisticDetail";
	}
	
	//통계관리 - 포인트 내역 
	@RequestMapping("showStatisticPoint.ad")
	public String showStatisticPoint(HttpServletRequest request, Model model) {
		
		
		
		
		return "admin/adminStatisticPoint";
	}
	
	//통계관리 - 정산내역
	@RequestMapping("showStatisticCalculate.ad")
	public String showStatisticCalculate(Model model) {
		//전체 매출 평균 조회
		HashMap<String, Object> hmap = as.selectAllAvg();
		
		System.out.println(hmap);
		model.addAttribute("hmap", hmap);
		
		return "admin/adminStatisticCalculate";
	}
	
	//신고 관리 페이지
	@RequestMapping(value="showReport.ad")
	public String showReport(HttpServletRequest request, Model model) {
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getReportListCount();
		
		AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Report> list = as.selectReportList(pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/adminReport";
	}
	
	//신고 관리 페이지 처리대기 / 완료 조건검색 ajax
	@RequestMapping(value="reportStatus.ad")
	public ModelAndView reportStatus(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		ArrayList<Report> list = null;
		response.setContentType("text/html; charset=UTF-8");
		String statusVal = request.getParameter("statusVal");
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = 0;
		
		listCount = as.getReportAjaxCount(statusVal);
		
		System.out.println(listCount);
		AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		list = as.reportStatus(statusVal, pi);
		System.out.println(list);
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		ArrayList<HashMap<String, Object>> list2 = new ArrayList<HashMap<String, Object>>();
		for(int i = 0; i < list.size(); i++) {
			HashMap<String, Object> hmap = new HashMap<String, Object>();
			
			String rDate = fmt.format(list.get(i).getReportDate());
			
			hmap.put("reportId", list.get(i).getReportId());
			hmap.put("reportType", list.get(i).getReportType());
			hmap.put("reportDate", rDate);
			hmap.put("reportReason", list.get(i).getReportReason());
			hmap.put("reportCategory", list.get(i).getReportCategory());
			hmap.put("status", list.get(i).getStatus());
			hmap.put("userId", list.get(i).getUserId());
			hmap.put("wid", list.get(i).getWid());
			hmap.put("rid", list.get(i).getRid());
			hmap.put("commentId", list.get(i).getCommentId());
			hmap.put("bid", list.get(i).getBid());
			
			list2.add(hmap);
		}
		
		mv.addObject("list", list2);
		mv.addObject("pi", pi);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	//신고 내역 전체 처리
	@RequestMapping(value="complteAllReport.ad")
	public String completeAllReport(HttpServletRequest request) {
		
		//전체 처리인경우
		if(request.getParameter("reportIdArr") != null) {
			String reportIdArr[] = request.getParameter("reportIdArr").split(",");
			int iArr[] = new int [reportIdArr.length];
			
			for(int i = 0; i < reportIdArr.length; i++) {
				
				iArr[i] = Integer.parseInt(reportIdArr[i]);
				as.completeReport(iArr[i]);
			}
			//개별 처리인 경우
		}else {
			
		}
		
		return "redirect:showReport.ad";
	}
	
	//신고 관리 페이지 상세보기
	@RequestMapping("showReportDetail.ad")
	public String showReportDetail(HttpServletRequest request, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));
		
		Report reqReport = as.selectOneReport(num);
		
		model.addAttribute("reqReport", reqReport);
		System.out.println("reqReport" + reqReport);
		
		return "admin/adminReportDetail";
	}
	
	//작품 관리 페이지 - 작품 조회
	@RequestMapping("showWork.ad")
	public String showWork(HttpServletRequest request, Model model) {
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getWorkListCount();
		
		AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Webnovel> list = as.selectAllWorkList(pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		System.out.println("전체 작품  list : " + list);
		
		return "admin/adminWork";
	}
	
	//작품 관리 페이지 - 작품 조회  조건검색 ajax
	@RequestMapping(value="workType.ad") 
	public ResponseEntity<HashMap<String,Object>> workType(HttpServletRequest request) { 
		//웹툰인지 일러스트인지
		int select1 = Integer.parseInt(request.getParameter("select1")); 
		//일반인지 프리미엄 인지
		int select2 = Integer.parseInt(request.getParameter("select2"));
		
		System.out.println("작품 관리 에이잭스 조건 값 : " + select1 + "" + select2);
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) { 
			currentPage =Integer.parseInt(request.getParameter("currentPage")); 
		}
		
		int listCount = as.getWorkTypeListCount(select1, select2);
		
		System.out.println("조건 따라 가져온 결과 수 : " + listCount);
		
		AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<HashMap<String, Object>> list = as.selectWorkTypeList(pi, select1, select2); 
		HashMap<String, Object> list2 = new HashMap<String, Object>();
		System.out.println("작품 리스트 : " + list);
		list2.put("list", list); 
		list2.put("pi", pi);
				
		return new ResponseEntity<HashMap<String, Object>>(list2,HttpStatus.OK);
				
	}
	
	//작품 관리 페이지 - 일러스트 조회
	@RequestMapping(value="showIllust.ad")
	public String showIllust(HttpServletRequest request, Model model) {
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getIllustListCount();
		System.out.println("일러스트 작품 전체 개수 : " + listCount);
		
		AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Illustrator> list = as.selectIllustList(pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		System.out.println("전체 일러스트 list : " + list);
		
		return "admin/adminWorkIllust";
	}
	
	//작품 관리 페이지 - 일러스트 조회 조건검색 ajax
	@RequestMapping(value="illType.ad")
	public ResponseEntity<HashMap<String,Object>> illType(HttpServletRequest request) {
		//일반인지 프리미엄 인지
		int select1 = Integer.parseInt(request.getParameter("select1")); 
		
		System.out.println("작품 관리 에이잭스 조건 값 : " + select1);
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) { 
			currentPage =Integer.parseInt(request.getParameter("currentPage")); 
		}
		
		int listCount = as.getIllustTypeListCount(select1);
		
		System.out.println("조건 따라 가져온 결과 수 : " + listCount);
		
		AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<HashMap<String, Object>> list = as.selectIllustTypeList(pi, select1); 
		HashMap<String, Object> list2 = new HashMap<String, Object>();
		System.out.println("일러스트 리스트 : " + list);
		list2.put("list", list); 
		list2.put("pi", pi);
				
		return new ResponseEntity<HashMap<String, Object>>(list2,HttpStatus.OK);
	}
	
	//작품 관리 페이지 - 승인 대기 내역 조회
	@RequestMapping("showWorkApprove.ad")
	public String showWorkApprove(HttpServletRequest request, Model model) {
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getApproveListCount();
		System.out.println("승인 대기 내역전체 개수 : " + listCount);
		
		AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Approve> list = as.selectApproveList(pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		System.out.println("전체 승인대기 내역 list : " + list);
		
		return "admin/adminWorkApprove";
	}
	
	//작품 관리 페이지 - 승인 대기 내역 조건 검색 ajax
	@RequestMapping(value="approveType.ad")
	public ResponseEntity<HashMap<String,Object>> approveType(HttpServletRequest request) {
		//일반인지 프리미엄 인지
		int select1 = Integer.parseInt(request.getParameter("select1")); 
		
		System.out.println("승인 대기 에이잭스 조건 값 : " + select1);
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) { 
			currentPage =Integer.parseInt(request.getParameter("currentPage")); 
		}
		
		int listCount = as.getApproveTypeListCount(select1);
		
		System.out.println("조건 따라 가져온 결과 수 : " + listCount);
		
		AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<HashMap<String, Object>> list = as.selectApproveTypeList(pi, select1); 
		HashMap<String, Object> list2 = new HashMap<String, Object>();
		System.out.println("승인대기 리스트 : " + list);
		list2.put("list", list); 
		list2.put("pi", pi);
				
		return new ResponseEntity<HashMap<String, Object>>(list2,HttpStatus.OK);
	}
	
	//작품 관리 페이지 - 승인 대기 내역 상세 보기
	@RequestMapping(value="approveDetailSearch.ad")
	public String approveDetailSearch(HttpServletRequest request, Model model) {
		int id = Integer.parseInt(request.getParameter("aCode"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		ArrayList<Approve> list = as.selectApproveDetailList(id);		
		
		System.out.println("승인 대기 상세 보기 리스트 : " + list);
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		
		return "admin/adminWorkApproveDetail";
	}
	
	//승인 완료 하기
	@RequestMapping(value="completeApprove.ad")
	public ResponseEntity<Integer> completeApprove(String aCode) {
		int approvalCode = Integer.parseInt(aCode);
		
		System.out.println("승인 내역 코드 : " + approvalCode);
		
		int result = as.completeApprove(approvalCode);
		
		System.out.println("승인 결과  : " + result);
		
		if(result > 0) {
			int result2 = as.completeApprove2(approvalCode);
			
			System.out.println("워크 테이블 grade_type 변경 : " + result2);
		}
		
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	//작품 관리 페이지 - 후원 대기 내역 조회
	@RequestMapping("showWorkDormant.ad")
	public String showWorkDormant(HttpServletRequest request, Model model) {
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getDormantListCount();
		System.out.println("후원 대기 내역전체 개수 : " + listCount);
		
		AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Support> list = as.selectDormantList(pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		System.out.println("전체 후원대기 내역 list : " + list);
		
		return "admin/adminWorkDormant";
	}
	
	//작품 관리 페이지 - 후원대기 내역 조회 상세 페이지
	@RequestMapping("showWorkDormantDetail.ad")
	public String showWorkDormantDetail(HttpServletRequest request, Model model) {
		int sCode = Integer.parseInt(request.getParameter("scode"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		System.out.println(sCode);
		
		Support reqSup = as.selectOneDormant(sCode);
		
		System.out.println("요청한 후원 : " + reqSup);
		
		model.addAttribute("reqSup", reqSup);
		model.addAttribute("currentPage", currentPage);
		
		return "admin/adminWorkDormantDetail";
	}
	
	//작품 관리 페이지 - 후원 신청 승인
	@RequestMapping(value="completeDormant.ad")
	public String completeDormant(HttpServletRequest request) {
		int sCode = Integer.parseInt(request.getParameter("sCode"));
		
		System.out.println("후원 코드 : " + sCode);
		
		int result = as.completeDormant(sCode);
		
		System.out.println("후원 승인 결과 : " + result);
		
		
		return "admin/adminWorkDormant";
	}
	
	
	
	//게시글 관리에서 게시글 작성 폼으로 이동
	@RequestMapping(value="boardWrite.ad")
	public String boardWrite() {
		return "admin/adminBoardWrite";
	}
	
	//공지사항 글 작성
	@RequestMapping(value="writeBoard.ad")
	public String insertNotice(HttpServletRequest request, Board b, HttpSession session) {
		System.out.println(b);
		Member m = (Member) session.getAttribute("loginUser");
		
		b.setUserId(m.getUserId());
		b.setBoardCategory("NTC");
		
		int result = as.insertBoard(b);
		
		System.out.println("공지사항 작성 결과 : " + result);
		
		
		return "redirect:showBoard.ad";
	}
	
	//공지사항 상세보기
	@RequestMapping(value="showBoardDetail.ad")
	public String showBoardDetail(HttpServletRequest request, Model model) {
		int bId = Integer.parseInt(request.getParameter("bId"));
		Board b = as.selectOneBoard(bId);
			
		
		System.out.println("조회 해온 게시판 글 : " + b);
		model.addAttribute("b", b);
		
		return "admin/adminBoardDetail";
	}
	
	//휴재 신청 내역 조회
	@RequestMapping(value="showWorkClose.ad")
	public String showWorkClose(HttpServletRequest request, Model model) {
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getCloseListCount();
		AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		System.out.println("휴재 신청 내역 개수 : " + listCount);
		
		ArrayList<Closed> list = as.selectCloseList(pi);
		
		System.out.println("휴재신청 내역 : " + list);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "admin/adminWorkClose";	
	}
	
	//휴재신청 내역 상세보기
	@RequestMapping(value="showWorkCloseDetail.ad")
	public String showWorkCloseDetail(HttpServletRequest request, Model model) {
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int cCode = Integer.parseInt(request.getParameter("cCode"));
		
		System.out.println("휴재 신청 코드 : " + cCode);
		Closed c = as.selectOneClosed(cCode);
		
		System.out.println("조회해온 휴재내역  : " + c);
		
		model.addAttribute("c", c);
		model.addAttribute("currentPage", currentPage);		
		
		return "admin/adminWorkCloseDetail";
	}
	
	//휴재 신청 승인완료
	@RequestMapping("completeClosed.ad")
	public String completeClosed(HttpServletRequest request) {
		int cCode = Integer.parseInt(request.getParameter("cCode"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		int result = as.completeClosed(cCode);
		
		System.out.println("휴재 승인 결과  : " + result);
		
		
		
		return "redirect:showWorkClose.ad?currentPage=" + currentPage;
	}
	
	//휴재 신청 내역 조건 검색 ajax
	@RequestMapping(value="closeType.ad")
	public ResponseEntity<HashMap<String, Object>> closeType(HttpServletRequest request) {
		int type = Integer.parseInt(request.getParameter("type"));
		
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = as.getCloseListCount(type);
		
		AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		System.out.println("listCount : " + listCount);
		System.out.println("pi : " + pi);
		
		ArrayList<HashMap<String, Object>> list = as.selectClosedTypeList(pi, type);
		HashMap<String, Object> list2 = new HashMap<String, Object>();
		System.out.println("type : " + type);
		System.out.println("조건 따라 받아온 휴재 list : " + list);
		list2.put("list", list);
		list2.put("pi", pi);
		
		
		return new ResponseEntity<HashMap<String, Object>>(list2,HttpStatus.OK);
		
	}
	
	//공지사항 수정하기
	@RequestMapping(value="noticeChange.ad")
	public String noticeChange(HttpServletRequest request) {
		int bId = Integer.parseInt(request.getParameter("bId"));
		String bContent = request.getParameter("bContent");
		
		System.out.println("bid : " + bId);
		System.out.println("bContent : " + bContent);
		
		int result = as.noticeChange(bId, bContent);
		
		System.out.println("게시글 수정 결과 : " + result);
		
		return "redirect:showBoard.ad";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
