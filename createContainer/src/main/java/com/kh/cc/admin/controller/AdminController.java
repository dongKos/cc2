package com.kh.cc.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.cc.admin.model.service.AdminService;
import com.kh.cc.admin.model.vo.AdminPageInfo;
import com.kh.cc.admin.model.vo.Refund;
import com.kh.cc.common.Pagination;

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
	
	//환불 관리 페이지 상세보기
	@RequestMapping("showRefundDetail.ad")
	public String showRefundDetail() {
		return "admin/adminRefundDetail";
	}
	
	//회원 관리 페이지
	@RequestMapping(value="showMember.ad")
	public String showMember() {
		return "admin/adminMember";
	}
	
	//회원 관리 페이지 상세보기
	@RequestMapping("showMemberDetail.ad")
	public String showMemberDetail() {
		return "admin/adminMemberDetail";
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
	public String showReport() {
		return "admin/adminReport";
	}
	
	//신고 관리 페이지 상세보기
	@RequestMapping("showReportDetail.ad")
	public String showReportDetail() {
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
