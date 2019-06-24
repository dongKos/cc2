package com.kh.cc.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.cc.admin.model.vo.AdminPageInfo;
import com.kh.cc.admin.model.vo.Refund;

public interface AdminDao {
	
	int getRefundListCount(SqlSessionTemplate sqlSession);
	
	ArrayList<Refund> selectRefundList(SqlSessionTemplate sqlSession, AdminPageInfo pi);
	
	Refund selectOneRefund(SqlSessionTemplate sqlSession, int num);
	
	int refundComplete(SqlSessionTemplate sqlSession, int refundCode);
	
	ArrayList<Refund> refundStatus(SqlSessionTemplate sqlSession, String statusVal, AdminPageInfo pi);

	int getRefundAjaxCount(SqlSessionTemplate sqlSession, String statusVal);
	
}
