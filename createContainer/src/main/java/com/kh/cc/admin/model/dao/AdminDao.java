package com.kh.cc.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.cc.admin.model.vo.AdminPageInfo;
import com.kh.cc.admin.model.vo.Approve;
import com.kh.cc.admin.model.vo.Board;
import com.kh.cc.admin.model.vo.Refund;
import com.kh.cc.admin.model.vo.Report;
import com.kh.cc.illustrator.model.vo.Illustrator;
import com.kh.cc.member.model.vo.Member;
import com.kh.cc.mypage.model.vo.Support;
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

	int getMemberTypeListCount(SqlSessionTemplate sqlSession, int type);

	ArrayList<HashMap<String, Object>> selectMemberTypeList(SqlSessionTemplate sqlSession, AdminPageInfo pi, int type);

	int getBoardListCount(SqlSessionTemplate sqlSession);

	ArrayList<Member> selectBoardList(SqlSessionTemplate sqlSession, AdminPageInfo pi);

	int getBoardTypeListCount(SqlSessionTemplate sqlSession, int select1, int select2);

	ArrayList<HashMap<String, Object>> selectBoardTypeList(SqlSessionTemplate sqlSession, AdminPageInfo pi, int select1, int select2);

	int getBoardReplyListCount(SqlSessionTemplate sqlSession);

	ArrayList<Member> getBoardReplyList(SqlSessionTemplate sqlSession, AdminPageInfo pi);

	int getWorkListCount(SqlSessionTemplate sqlSession);

	ArrayList<Webnovel> selectAllWorkList(SqlSessionTemplate sqlSession, AdminPageInfo pi);

	int getWorkTypeListCount(SqlSessionTemplate sqlSession, int select1, int select2);

	ArrayList<HashMap<String, Object>> selectWorkTypeList(SqlSessionTemplate sqlSession, AdminPageInfo pi, int select1,
			int select2);

	int getIllustListCount(SqlSessionTemplate sqlSession);

	ArrayList<Illustrator> selectIllustWorkList(SqlSessionTemplate sqlSession, AdminPageInfo pi);

	int getIllustTypeListCount(SqlSessionTemplate sqlSession, int select1);

	ArrayList<HashMap<String, Object>> selectIllustTypeList(SqlSessionTemplate sqlSession, AdminPageInfo pi,
			int select1);

	int getApproveListCount(SqlSessionTemplate sqlSession);

	ArrayList<Approve> selectApproveList(SqlSessionTemplate sqlSession, AdminPageInfo pi);

	int getApproveTypeListCount(SqlSessionTemplate sqlSession, int select1);

	ArrayList<HashMap<String, Object>> selectApproveTypeList(SqlSessionTemplate sqlSession, AdminPageInfo pi,
			int select1);

	ArrayList<Approve> selectApproveDetailList(SqlSessionTemplate sqlSession, int id);

	int completeApprove(SqlSessionTemplate sqlSession, int approvalCode);

	int getPriMemberListCount(SqlSessionTemplate sqlSession);

	ArrayList<Member> selectPriMemberList(SqlSessionTemplate sqlSession, AdminPageInfo pi);

	ArrayList<Integer> selectPurchaseAvg(SqlSessionTemplate sqlSession, int mno);

	ArrayList<Integer> selectAllPurchaseAvg(SqlSessionTemplate sqlSession);

	int completeApprove2(SqlSessionTemplate sqlSession, int approvalCode);

	int getDormantListCount(SqlSessionTemplate sqlSession);

	ArrayList<com.kh.cc.illustrator.model.vo.Support> selectDormantList(SqlSessionTemplate sqlSession, AdminPageInfo pi);

	com.kh.cc.illustrator.model.vo.Support selectOneDormant(SqlSessionTemplate sqlSession, int sCode);

	int completeDormant(SqlSessionTemplate sqlSession, int sCode);

	int insertBoard(SqlSessionTemplate sqlSession, Board b);

	Board selectOneBoard(SqlSessionTemplate sqlSession, int bId);

}
