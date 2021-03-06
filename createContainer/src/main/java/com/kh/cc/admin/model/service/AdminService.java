
package com.kh.cc.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.cc.admin.model.vo.AdminPageInfo;
import com.kh.cc.admin.model.vo.Approve;
import com.kh.cc.admin.model.vo.Board;
import com.kh.cc.admin.model.vo.Purchase;
import com.kh.cc.admin.model.vo.Refund;
import com.kh.cc.admin.model.vo.Report;
import com.kh.cc.illustrator.model.vo.Illustrator;
import com.kh.cc.member.model.vo.Member;
import com.kh.cc.mypage.model.vo.Closed;
import com.kh.cc.mypage.model.vo.Coin;
import com.kh.cc.mypage.model.vo.Support;
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

	int getMemberTypeListCount(int type);

	ArrayList<HashMap<String, Object>> selectmemberTypeList(AdminPageInfo pi, int type);

	int getBoardListCount();

	ArrayList<Member> selectBoardList(AdminPageInfo pi);

	int getBoardTypeListCount(int select1, int select2);

	ArrayList<HashMap<String, Object>> selectBoardTypeList(AdminPageInfo pi, int select1, int select2);

	int getBoardReplyListCount();

	ArrayList<Member> selectBoardReplyList(AdminPageInfo pi);

	int getWorkListCount();

	ArrayList<Webnovel> selectAllWorkList(AdminPageInfo pi);

	int getWorkTypeListCount(int select1, int select2);

	ArrayList<HashMap<String, Object>> selectWorkTypeList(AdminPageInfo pi, int select1, int select2);

	int getIllustListCount();

	ArrayList<Illustrator> selectIllustList(AdminPageInfo pi);

	int getIllustTypeListCount(int select1);

	ArrayList<HashMap<String, Object>> selectIllustTypeList(AdminPageInfo pi, int select1);

	int getApproveListCount();

	ArrayList<Approve> selectApproveList(AdminPageInfo pi);

	int getApproveTypeListCount(int select1);

	ArrayList<HashMap<String, Object>> selectApproveTypeList(AdminPageInfo pi, int select1);

	ArrayList<Approve> selectApproveDetailList(int id);

	int completeApprove(int approvalCode);

	int getPriMemberListCount();

	ArrayList<Member> selectPriMemberList(AdminPageInfo pi);

	ArrayList<Integer> selectPurchaseAvg(int mno);

	ArrayList<Integer> selectAllPurchaseAvg();

	int completeApprove2(int approvalCode);

	int getDormantListCount();

	ArrayList<com.kh.cc.illustrator.model.vo.Support> selectDormantList(AdminPageInfo pi);

	com.kh.cc.illustrator.model.vo.Support selectOneDormant(int sCode);

	int completeDormant(int sCode);

	int insertBoard(Board b);

	Board selectOneBoard(int bId);

	int getCloseListCount();

	ArrayList<Closed> selectCloseList(AdminPageInfo pi);

	Closed selectOneClosed(int cCode);

	int completeClosed(int cCode);

	int getCloseListCount(int type);

	ArrayList<HashMap<String, Object>> selectClosedTypeList(AdminPageInfo pi, int type);

	int noticeChange(int bId, String bContent);

	HashMap<String, Object> selectAllAvg();

	int getCoinListCount();

	ArrayList<Coin> selectCoinList(AdminPageInfo pi);

	ArrayList<Member> selectMemberRankList();

	ArrayList<Webnovel> selectWorkRankList();

	ArrayList<Integer> selectWtAvg();

	ArrayList<Integer> selectWnAvg();

	ArrayList<Integer> selectIllAvg();

	int respondOto(HashMap<String, Object> hmap);


	
}