
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
		return sqlSession.selectOne("admin.selectRefundListCount");
	}
	
	//전체 환불내역 조회하는 메소드
	@Override
	public ArrayList<Refund> selectRefundList(SqlSessionTemplate sqlSession, AdminPageInfo pi) {
		ArrayList<Refund> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("admin.selectRefundList", null, rowBounds);
		
		return list;
	}
	
	//환불내역 페이지 상세조회
	@Override
	public Refund selectOneRefund(SqlSessionTemplate sqlSession, int refundCode) {
		return sqlSession.selectOne("admin.selectOneRefund", refundCode);
	}
	
	//환불 내역 처리 메소드
	@Override
	public int refundComplete(SqlSessionTemplate sqlSession, int refundCode) {
		return sqlSession.update("admin.refundComplete", refundCode);
	}
	
	//환불 관리 페이지 처리대기 / 완료 조건검색 ajax
	@Override
	public ArrayList<Refund> refundStatus(SqlSessionTemplate sqlSession, String statusVal, AdminPageInfo pi) {
		String str = "";
		if(statusVal.equals("1")) {
			str = "N";
		}else {
			str = "Y";
		}
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("admin.refundStatus", str, rowBounds);
	}
	
	//환불내역 애이젝스로 분기한거 개수 조회
	@Override
	public int getRefundAjaxCount(SqlSessionTemplate sqlSession, String statusVal) {
		
		String str = "";
		if(statusVal.equals("1")) {
			str = "N";
		}else {
			str = "Y";
		}
		
		return sqlSession.selectOne("admin.selectRefundAjaxCount", str);
	}
	
	
}