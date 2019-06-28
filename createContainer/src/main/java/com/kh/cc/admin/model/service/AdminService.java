
package com.kh.cc.admin.model.service;

import java.util.ArrayList;

import com.kh.cc.admin.model.vo.AdminPageInfo;
import com.kh.cc.admin.model.vo.Refund;
import com.kh.cc.admin.model.vo.Report;
import com.kh.cc.illustrator.model.vo.Illustrator;
import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webnovel.model.vo.Webnovel;

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

	int completeReport(int reportId);

	Report selectOneReport(int reportId);

	int workCount(String userId);

	int illustCount(String userId);

	ArrayList<Webnovel> selectWorkList(String userId);

	ArrayList<Illustrator> selectIllustList(String userId);

	int deleteMember(String userId);
	
}