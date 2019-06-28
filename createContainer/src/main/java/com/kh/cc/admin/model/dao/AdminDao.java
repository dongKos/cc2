package com.kh.cc.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.cc.admin.model.vo.AdminPageInfo;
import com.kh.cc.admin.model.vo.Refund;
import com.kh.cc.admin.model.vo.Report;
import com.kh.cc.illustrator.model.vo.Illustrator;
import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webnovel.model.vo.Webnovel;

public interface AdminDao {
	
	int getRefundListCount(SqlSessionTemplate sqlSession);
	
	ArrayList<Refund> selectRefundList(SqlSessionTemplate sqlSession, AdminPageInfo pi);
	
	Refund selectOneRefund(SqlSessionTemplate sqlSession, int num);
	
	int refundComplete(SqlSessionTemplate sqlSession, int refundCode);
	
	ArrayList<Refund> refundStatus(SqlSessionTemplate sqlSession, String statusVal, AdminPageInfo pi);
	
	int getRefundAjaxCount(SqlSessionTemplate sqlSession, String statusVal);
	
	int getMemberListCount(SqlSessionTemplate sqlSession);
	
	ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, AdminPageInfo pi);
	
	Member selectOneMember(SqlSessionTemplate sqlSession, int num);
	
	int getReportListCount(SqlSessionTemplate sqlSession);
	
	ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession, AdminPageInfo pi);
	
	ArrayList<Report> reportStatus(SqlSessionTemplate sqlSession, String statusVal, AdminPageInfo pi);
	
	int getReportAjaxCount(SqlSessionTemplate sqlSession, String statusVal);

	int completeReport(SqlSessionTemplate sqlSession, int reportId);

	Report selectOneReport(SqlSessionTemplate sqlSession, int reportId);

	int workCount(SqlSessionTemplate sqlSession, String userId);

	int illustCount(SqlSessionTemplate sqlSession, String userId);

	ArrayList<Webnovel> selectWorkList(SqlSessionTemplate sqlSession, String userId);

	ArrayList<Illustrator> selectIllustList(SqlSessionTemplate sqlSession, String userId);

	int deleteMember(SqlSessionTemplate sqlSession, String userId);
	
}
