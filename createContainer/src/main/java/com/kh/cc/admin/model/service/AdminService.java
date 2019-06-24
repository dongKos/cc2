package com.kh.cc.admin.model.service;

import java.util.ArrayList;

import com.kh.cc.admin.model.vo.AdminPageInfo;
import com.kh.cc.admin.model.vo.Refund;

public interface AdminService {

	ArrayList<Refund> selectRefundList(AdminPageInfo pi);

	int getRefundListCount();

	Refund selectOneRefund(int num);

	int refundComplte(int refundCode);

	ArrayList<Refund> refundStatus(String statusVal, AdminPageInfo pi);

	int getMemberListCount();

	ArrayList<Refund> selectMemberList(AdminPageInfo pi);

	int getRefundAjaxCount(String statusVal);

}
