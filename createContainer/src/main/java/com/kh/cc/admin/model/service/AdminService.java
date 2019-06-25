
package com.kh.cc.admin.model.service;

import java.util.ArrayList;

import com.kh.cc.admin.model.vo.AdminPageInfo;
import com.kh.cc.admin.model.vo.Refund;
import com.kh.cc.member.model.vo.Member;

public interface AdminService {
	
	ArrayList<Refund> selectRefundList(AdminPageInfo pi);
	
	int getRefundListCount();
	
	Refund selectOneRefund(int num);
	
	int refundComplte(int refundCode);
	
	ArrayList<Refund> refundStatus(String statusVal, AdminPageInfo pi);
	
	int getMemberListCount();
	
	ArrayList<Member> selectMemberList(AdminPageInfo pi);
	
	int getRefundAjaxCount(String statusVal);

	Member selectOneMember(int num);
	
}