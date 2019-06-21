package com.kh.cc.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cc.admin.model.vo.AdminPageInfo;
import com.kh.cc.admin.model.vo.Refund;

@Repository
public class AdminDaoImpl implements AdminDao{

	//전체 환불내역 게시글 수 조회 메소드
	@Override
	public int getRefundListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Refund.selectRefundListCount");
	}

	//전체 환불내역 조회하는 메소드
	@Override
	public ArrayList<Refund> selectRefundList(SqlSessionTemplate sqlSession, AdminPageInfo pi) {
		ArrayList<Refund> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Refund.selectRefundList", null, rowBounds);
		
		return list;
	}

}
