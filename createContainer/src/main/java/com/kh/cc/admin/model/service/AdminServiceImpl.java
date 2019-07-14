
package com.kh.cc.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.cc.admin.model.dao.AdminDao;
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
import com.kh.cc.illustrator.model.vo.Support;
import com.kh.cc.webnovel.model.vo.Webnovel;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao ad;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	
	//전체 환불내역 게시글 수 조회 메소드
	@Override
	public int getRefundListCount() {
		return ad.getRefundListCount(sqlSession);
	}
	
	//전체 환불 내역 불러오는 메소드
	@Override
	public ArrayList<Refund> selectRefundList(AdminPageInfo pi) {
		return ad.selectRefundList(sqlSession, pi);
	}
	
	//환불내역 페이지 상세조회
	@Override
	public Refund selectOneRefund(int num) {
		return ad.selectOneRefund(sqlSession, num);
	}
	
	//환불 내역 처리 하는 메소드
	@Override
	public int refundComplte(int refundCode) {
		return ad.refundComplete(sqlSession,refundCode);
	}
	
	//환불 관리 페이지 처리대기 / 완료 조건검색 ajax
	@Override
	public ArrayList<Refund> refundStatus(String statusVal, AdminPageInfo pi) {
		return ad.refundStatus(sqlSession, statusVal, pi);
	}
	
	//전체 회원 수 조회 
	@Override
	public int getMemberListCount() {
		return ad.getMemberListCount(sqlSession);
	}
	
	//전체 회원 목록 조회
	@Override
	public ArrayList<Member> selectMemberList(AdminPageInfo pi) {
		return ad.selectMemberList(sqlSession, pi);
	}
	
	//환불내역 애이젝스로 분기한거 개수 조회
	@Override
	public int getRefundAjaxCount(String statusVal) {
		return ad.getRefundAjaxCount(sqlSession, statusVal);
	}
	
	//회원 관리 페이지 상세보기
	@Override
	public Member selectOneMember(int num) {
		return ad.selectOneMember(sqlSession, num);
	}
	
	//전체 신고목록 수 조회
	@Override
	public int getReportListCount() {
		return ad.getReportListCount(sqlSession);
	}
	
	//전체 신고 내역 목록 조회
	@Override
	public ArrayList<Report> selectReportList(AdminPageInfo pi) {
		return ad.selectReportList(sqlSession, pi);
	}
	
	//신고내역 조회 페이지 REPORT_TYPE 조건검색 AJAX
	@Override
	public ArrayList<Report> reportStatus(String statusVal, AdminPageInfo pi) {
		return ad.reportStatus(sqlSession, statusVal, pi);
	}
	
	//신고내역 애이젝스 조건 검색 개수 조회
	@Override
	public int getReportAjaxCount(String statusVal) {
		return ad.getReportAjaxCount(sqlSession, statusVal);
	}
	
	//신고내역 처리
	@Override
	public int completeReport(int reportId) {
		return ad.completeReport(sqlSession, reportId);
	}
	
	//신고 관리 페이지 상세보기
	@Override
	public Report selectOneReport(int reportId) {
		return ad.selectOneReport(sqlSession, reportId);
	}
	
	//올린 작품이 있는지 조회
	@Override
	public int workCount(String userId) {
		return ad.workCount(sqlSession, userId);
	}
	
	//올린 일러스트가 있는지 조회
	@Override
	public int illustCount(String userId) {
		return ad.illustCount(sqlSession, userId);
	}
	
	//회원이 올린 작품 전체 조회
	@Override
	public ArrayList<Webnovel> selectWorkList(String userId) {
		return ad.selectWorkList(sqlSession, userId);
	}
	
	//회원이 올린 일러스트 전체 조회
	@Override
	public ArrayList<Illustrator> selectIllustList(String userId) {
		return ad.selectIllustList(sqlSession, userId);
	}
	
	//회원 강퇴하기
	@Override
	public int deleteMember(String userId) {
		return ad.deleteMember(sqlSession, userId);
	}
	
	//회원 조건검색 결과 수 조회
	@Override
	public int getMemberTypeListCount(int type) {
		return ad.getMemberTypeListCount(sqlSession, type);
	}
	
	//회원 조건검색 전체 조회
	@Override
	public ArrayList<HashMap<String, Object>> selectmemberTypeList(AdminPageInfo pi, int type) {
		return ad.selectMemberTypeList(sqlSession, pi, type);
	}
	
	//전체 게시글 수 조회
	@Override
	public int getBoardListCount() {
		return ad.getBoardListCount(sqlSession);
	}
	
	//전체 게시글 조회
	@Override
	public ArrayList<Member> selectBoardList(AdminPageInfo pi) {
		return ad.selectBoardList(sqlSession, pi);
	}
	
	//게시글 조건검색 개수 조회
	@Override
	public int getBoardTypeListCount(int select1, int select2) {
		return ad.getBoardTypeListCount(sqlSession, select1, select2);
	}
	
	//게시글 조건검색 전체 조회
	@Override
	public ArrayList<HashMap<String, Object>> selectBoardTypeList(AdminPageInfo pi, int select1, int select2) {
		return ad.selectBoardTypeList(sqlSession, pi, select1, select2);
	}
	
	//댓글 전체 개수 조회
	@Override
	public int getBoardReplyListCount() {
		return ad.getBoardReplyListCount(sqlSession);
	}
	
	//댓글 전체 조회
	@Override
	public ArrayList<Member> selectBoardReplyList(AdminPageInfo pi) {
		return ad.getBoardReplyList(sqlSession, pi);
	}
	
	//작품 전체 개수 조회
	@Override
	public int getWorkListCount() {
		return ad.getWorkListCount(sqlSession);
	}
	
	//작품 전체 조회
	@Override
	public ArrayList<Webnovel> selectAllWorkList(AdminPageInfo pi) {
		return ad.selectAllWorkList(sqlSession, pi);
	}
	
	//작품 조건검색 개수 조회
	@Override
	public int getWorkTypeListCount(int select1, int select2) {
		return ad.getWorkTypeListCount(sqlSession, select1, select2);
	}
	
	//작품 조건 검색 전체 조회
	@Override
	public ArrayList<HashMap<String, Object>> selectWorkTypeList(AdminPageInfo pi, int select1, int select2) {
		return ad.selectWorkTypeList(sqlSession, pi, select1, select2);
	}
	
	//일러스트 개수 조회
	@Override
	public int getIllustListCount() {
		return ad.getIllustListCount(sqlSession);
	}
	
	//일러스트 전체 조회
	@Override
	public ArrayList<Illustrator> selectIllustList(AdminPageInfo pi) {
		return ad.selectIllustWorkList(sqlSession, pi);
	}
	
	//일러스트 조건 검색 개수 조회
	@Override
	public int getIllustTypeListCount(int select1) {
		return ad.getIllustTypeListCount(sqlSession, select1);
	}
	
	//일러스트 조건 검색 전체 조회
	@Override
	public ArrayList<HashMap<String, Object>> selectIllustTypeList(AdminPageInfo pi, int select1) {
		return ad.selectIllustTypeList(sqlSession, pi, select1);
	}
	
	//승인대기 내역 개수 조회
	@Override
	public int getApproveListCount() {
		return ad.getApproveListCount(sqlSession);
	}

	//승인대기 내역 전체 조회
	@Override
	public ArrayList<Approve> selectApproveList(AdminPageInfo pi) {
		return ad.selectApproveList(sqlSession, pi);
	}

	//승인대기 조건 검색 개수 조회
	@Override
	public int getApproveTypeListCount(int select1) {
		return ad.getApproveTypeListCount(sqlSession, select1);
	}

	//승인대기 조건 검색 전체 조회
	@Override
	public ArrayList<HashMap<String, Object>> selectApproveTypeList(AdminPageInfo pi, int select1) {
		return ad.selectApproveTypeList(sqlSession, pi, select1);
	}

	//승인대기 	상세 페이지
	@Override
	public ArrayList<Approve> selectApproveDetailList(int id) {
		return ad.selectApproveDetailList(sqlSession, id);
	}

	//승인 완료 하기
	@Override
	public int completeApprove(int approvalCode) {
		return ad.completeApprove(sqlSession, approvalCode);
	}

	//프리미엄 작가 수 조회
	@Override
	public int getPriMemberListCount() {
		return ad.getPriMemberListCount(sqlSession);
	}

	//프리미엄 작가 전체 조회
	@Override
	public ArrayList<Member> selectPriMemberList(AdminPageInfo pi) {
		return ad.selectPriMemberList(sqlSession, pi);
	}

	//해당 작품 전체 매출통계 조회
	@Override
	public ArrayList<Integer> selectPurchaseAvg(int mno) {
		return ad.selectPurchaseAvg(sqlSession, mno);
	}

	//전체 매출통계
	@Override
	public ArrayList<Integer> selectAllPurchaseAvg() {
		return ad.selectAllPurchaseAvg(sqlSession);
	}

	//승인 완료 시 , 작품 테이블 grade_type 변경
	@Override
	public int completeApprove2(int approvalCode) {
		return ad.completeApprove2(sqlSession, approvalCode);
	}

	
	//전체 후원 목록 개수 조회
	@Override
	public int getDormantListCount() {
		return ad.getDormantListCount(sqlSession);
	}

	
	//전체 후원 목록 조회
	@Override
	public ArrayList<Support> selectDormantList(AdminPageInfo pi) {
		return ad.selectDormantList(sqlSession, pi);
	}

	//후원 상세보기 페이지
	@Override
	public Support selectOneDormant(int sCode) {
		return ad.selectOneDormant(sqlSession, sCode);
	}

	//후원 승인
	@Override
	public int completeDormant(int sCode) {
		return ad.completeDormant(sqlSession, sCode);
	}

	//공지사항 작성
	@Override
	public int insertBoard(Board b) {
		return ad.insertBoard(sqlSession, b);
	}

	//공지사항 상세보기
	@Override
	public Board selectOneBoard(int bId) {
		return ad.selectOneBoard(sqlSession, bId);
	}

	//휴재신청 내역 전체 개수 조회
	@Override
	public int getCloseListCount() {
		return ad.getCloseListCount(sqlSession);
	}

	//휴재신청 내역 전체 조회
	@Override
	public ArrayList<Closed> selectCloseList(AdminPageInfo pi) {
		return ad.selectCloseList(sqlSession, pi);
	}

	//휴재신청 내역 상세보기
	@Override
	public Closed selectOneClosed(int cCode) {
		return ad.selectOneClosed(sqlSession, cCode);
	}

	//휴재신청 승인
	@Override
	public int completeClosed(int cCode) {
		return ad.completeClosed(sqlSession, cCode);
	}

	
	//휴재신청 조건검색 개수 조회
	@Override
	public int getCloseListCount(int type) {
		return ad.getClosedListCount(sqlSession, type);
	}

	
	//휴재신청 조건검색 전체 조회
	@Override
	public ArrayList<HashMap<String, Object>> selectClosedTypeList(AdminPageInfo pi, int type) {
		return ad.selectClosedTypeList(sqlSession, pi, type);
	}

	//공지사항 수정
	@Override
	public int noticeChange(int bId, String bContent) {
		return ad.noticeChange(sqlSession, bId, bContent);
	}

	//전체 매출 통계 조회
	@Override
	public HashMap<String, Object> selectAllAvg() {
		return ad.selectAllAvg(sqlSession);
	}

	//전체 통계 내역 개수 조회
	@Override
	public int getCoinListCount() {
		return ad.getCoinListCount(sqlSession);
	}

	//전체 통계 내역 조회
	@Override
	public ArrayList<Coin> selectCoinList(AdminPageInfo pi) {
		return ad.selectCoinList(sqlSession, pi);
	}

	//작가 상위 랭킹 10명 조회
	@Override
	public ArrayList<Member> selectMemberRankList() {
		return ad.selectMemberRankList(sqlSession);
	}

	//작품 상위 랭킹 10개 조회
	@Override
	public ArrayList<Webnovel> selectWorkRankList() {
		return ad.selectWorkRankList(sqlSession);
	}

	//웹툰 월별 통계 리스트
	@Override
	public ArrayList<Integer> selectWtAvg() {
		return ad.selectWtAvg(sqlSession);
	}

	//웹소설 월별 통계 리스트
	@Override
	public ArrayList<Integer> selectWnAvg() {
		return ad.selectWnAvg(sqlSession);
	}

	//일러스트 월별 통계 리스트
	@Override
	public ArrayList<Integer> selectIllAvg() {
		return ad.selectIllAvg(sqlSession);
	}

	
}



