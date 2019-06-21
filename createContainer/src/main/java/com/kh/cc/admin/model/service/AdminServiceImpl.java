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
}
