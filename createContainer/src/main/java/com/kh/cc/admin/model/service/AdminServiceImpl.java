
package com.kh.cc.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.cc.admin.model.dao.AdminDao;
import com.kh.cc.admin.model.vo.AdminPageInfo;
import com.kh.cc.admin.model.vo.Refund;
import com.kh.cc.admin.model.vo.Report;
import com.kh.cc.illustrator.model.vo.Illustrator;
import com.kh.cc.member.model.vo.Member;
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
}



