
package com.kh.cc.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cc.admin.model.vo.AdminPageInfo;
import com.kh.cc.admin.model.vo.Refund;
import com.kh.cc.admin.model.vo.Report;
import com.kh.cc.member.model.vo.Member;

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
	//전체 회원 수 조회
	@Override
	public int getMemberListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin.selectMemberListCount");
	}
	
	//전체 회원 목록 조회
	@Override
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, AdminPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("admin.selectMemberList", null, rowBounds);
		
	}
	
	//회원 관리 페이지 상세보기
	@Override
	public Member selectOneMember(SqlSessionTemplate sqlSession, int num) {
		return sqlSession.selectOne("admin.selectOneMember", num);
	}
	
	//전체 신고목록 수 조회
	@Override
	public int getReportListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin.selectReportCount");
	}
	
	//전체 신고 내역 목록 조회
	@Override
	public ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession, AdminPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("admin.selectReportList", null, rowBounds);
	}
	
	//신고내역 조회 페이지 REPORT_TYPE 조건검색 AJAX
	@Override
	public ArrayList<Report> reportStatus(SqlSessionTemplate sqlSession, String statusVal, AdminPageInfo pi) {
		String str = "";
		if(statusVal.equals("1")) {
			str = "댓글";
		}else if(statusVal.equals("2")){
			str = "작품";
		}else if(statusVal.equals("3")){
			str = "회차";
		}else {
			str= "게시판";
		}
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("admin.reportStatus", str, rowBounds);
	}
	
	//신고내역 애이젝스 조건 검색 개수 조회
	@Override
	public int getReportAjaxCount(SqlSessionTemplate sqlSession, String statusVal) {
		String str = "";
		if(statusVal.equals("1")) {
			str = "댓글";
		}else if(statusVal.equals("2")){
			str = "작품";
		}else if(statusVal.equals("3")){
			str = "회차";
		}else {
			str= "게시판";
		}
		
		return sqlSession.selectOne("admin.selectReportAjaxCount", str);
	}
	
	
}
