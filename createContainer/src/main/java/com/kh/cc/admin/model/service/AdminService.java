package com.kh.cc.admin.model.service;

import java.util.ArrayList;

import com.kh.cc.admin.model.vo.AdminPageInfo;
import com.kh.cc.admin.model.vo.Refund;

public interface AdminService {

	ArrayList<Refund> selectRefundList(AdminPageInfo pi);

	int getRefundListCount();

}
