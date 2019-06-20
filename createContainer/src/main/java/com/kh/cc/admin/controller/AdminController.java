package com.kh.cc.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	//관리자 메인페이지로 이동시켜주는 메소드
	@RequestMapping(value="adminMain.ad")
	public String showAdminMain() {
		return "admin/adminMain";
	}
	
	//환불 관리 페이지로 이동
	@RequestMapping("showRefund.ad")
	public String showRefund() {
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
	@RequestMapping("showAdminStatistic.ad")
	public String showAdminStatistic() {
		return "admin/adminStatistic";
	}
	
	//통계관리 - 작가통계 상세 페이지
	@RequestMapping("showAdminStatisticDetail.ad")
	public String showAdminStatisticDetail() {
		return "admin/adminStatisticDetail";
	}
	
	//통계관리 - 포인트 내역 
	@RequestMapping("showAdminStatisticPoint.ad")
	public String showAdminStatisticPoint() {
		return "admin/adminStatisticPoint";
	}
	
	//통계관리 - 정산내역
	@RequestMapping("showAdminStatisticCalculate.ad")
	public String showAdminStatisticCalculate() {
		return "admin/adminStatisticCalculate";
	}
	
}
