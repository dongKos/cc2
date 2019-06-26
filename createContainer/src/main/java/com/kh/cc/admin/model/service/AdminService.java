
package com.kh.cc.admin.model.service;

import java.util.ArrayList;

import com.kh.cc.admin.model.vo.AdminPageInfo;
import com.kh.cc.admin.model.vo.Refund;
import com.kh.cc.admin.model.vo.Report;
import com.kh.cc.member.model.vo.Member;

public interface AdminService {
	
	ArrayList<Refund> selectRefundList(AdminPageInfo pi);
	
	int getRefundListCount();
	
	Refund selectOneRefund(int num);
	
	int refundComplte(int refundCode);
	
	ArrayList<Refund> refundStatus(String statusVal, AdminPageInfo pi);
	
	ArrayList<Member> selectMemberList(AdminPageInfo pi);
	
	int getMemberListCount();
	
	int getRefundAjaxCount(String statusVal);

	Member selectOneMember(int num);

	int getReportListCount();

	ArrayList<Report> selectReportList(AdminPageInfo pi);

	ArrayList<Report> reportStatus(String statusVal, AdminPageInfo pi);

	int getReportAjaxCount(String statusVal);
	
}