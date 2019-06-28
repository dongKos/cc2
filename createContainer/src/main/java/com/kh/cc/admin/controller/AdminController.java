package com.kh.cc.admin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cc.admin.model.service.AdminService;
import com.kh.cc.admin.model.vo.AdminPageInfo;
import com.kh.cc.admin.model.vo.Refund;
import com.kh.cc.admin.model.vo.Report;
import com.kh.cc.common.Pagination;
import com.kh.cc.illustrator.model.vo.Illustrator;
import com.kh.cc.member.model.vo.Member;
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
	public String showBoard() {
		return "admin/adminBoard";
	}
	
	//게시판 관리 - 댓글 관리 페이지
	@RequestMapping("showBoardReply.ad")
	public String showBoardReply() {
		return "admin/adminBoardReply";
	}
	
	//통계관리 - 작가통계 페이지
	@RequestMapping("showStatistic.ad")
	public String showStatistic() {
		return "admin/adminStatistic";
	}
	
	//통계관리 - 작가통계 상세 페이지
	@RequestMapping("showStatisticDetail.ad")
	public String showStatisticDetail() {
		return "admin/adminStatisticDetail";
	}
	
	//통계관리 - 포인트 내역 
	@RequestMapping("showStatisticPoint.ad")
	public String showStatisticPoint() {
		return "admin/adminStatisticPoint";
	}
	
	//통계관리 - 정산내역
	@RequestMapping("showStatisticCalculate.ad")
	public String showStatisticCalculate() {
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
			AdminPageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			list = as.reportStatus(statusVal, pi);
			
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
	public String showWork() {
		return "admin/adminWork";
	}
	
	//작품 관리 페이지 - 승인 대기 내역 조회
	@RequestMapping("showWorkApprove.ad")
	public String showWorkApprove() {
		return "admin/adminWorkApprove";
	}
	
	//작품 관리 페이지 - 승인 대기 내역 상세 보기
	@RequestMapping(value="showWorkApproveDetail.ad")
	public String showWorkApproveDetail() {
		return "admin/adminWorkApproveDetail";
	}
	
	//작품 관리 페이지 - 후원 대기 내역 조회
	@RequestMapping("showWorkDormant.ad")
	public String showWorkDormant() {
		return "admin/adminWorkDormant";
	}
	
	//작품 관리 페이지 - 후원대기 내역 조회 상세 페이지
	@RequestMapping("showWorkDormantDetail.ad")
	public String showWorkDormantDetail() {
		return "admin/adminWorkDormantDetail";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
