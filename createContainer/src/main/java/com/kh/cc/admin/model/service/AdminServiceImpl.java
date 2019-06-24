package com.kh.cc.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.cc.admin.model.dao.AdminDao;
import com.kh.cc.admin.model.vo.AdminPageInfo;
import com.kh.cc.admin.model.vo.Refund;

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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Refund> selectMemberList(AdminPageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	//환불내역 애이젝스로 분기한거 개수 조회
	@Override
	public int getRefundAjaxCount(String statusVal) {
		return ad.getRefundAjaxCount(sqlSession, statusVal);
	}
}
