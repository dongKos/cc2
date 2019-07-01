
package com.kh.cc.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cc.admin.model.vo.AdminPageInfo;
import com.kh.cc.admin.model.vo.Refund;
import com.kh.cc.admin.model.vo.Report;
import com.kh.cc.illustrator.model.vo.Illustrator;
import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webnovel.model.vo.Webnovel;

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
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		String str = "";
		if(statusVal.equals("1")) {
			str = "댓글";
		}else if(statusVal.equals("2")){
			str = "작품";
		}else if(statusVal.equals("3")){
			str = "회차";
		}else if(statusVal.equals("4")){
			str= "게시판";
		}else {
			return (ArrayList)sqlSession.selectList("admin.selectReportList", null, rowBounds);
		}
		
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
		}else if(statusVal.equals("4")){
			str= "게시판";
		}else {
			return sqlSession.selectOne("admin.selectReportCount");
		}
		
		return sqlSession.selectOne("admin.selectReportAjaxCount", str);
	}
	
	//신고 내역 처리
	@Override
	public int completeReport(SqlSessionTemplate sqlSession, int reportId) {
		return sqlSession.update("admin.complteReport", reportId);
	}
	
	//신고 관리 페이지 상세보기
	@Override
	public Report selectOneReport(SqlSessionTemplate sqlSession, int reportId) {
		return sqlSession.selectOne("admin.selectOneReport", reportId);
	}
	
	//올린 작품이 있는지 조회
	@Override
	public int workCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("admin.workCount", userId);
	}
	
	//올린 일러스트가 있는지 조회
	@Override
	public int illustCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("admin.illustCount", userId);
	}
	
	//회원이 올린 작품 전체 조회
	@Override
	public ArrayList<Webnovel> selectWorkList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("admin.selectWorkList", userId);
	}
	
	//회원이 올린 일러스트 전체 조회
	@Override
	public ArrayList<Illustrator> selectIllustList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("admin.selectIllustList", userId);
	}
	
	//회원 강퇴 하기
	@Override
	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("admin.deleteMember", userId);
	}
	
	//회원 조건검색 결과 수 조회
	@Override
	public int getMemberTypeListCount(SqlSessionTemplate sqlSession, int type) {
		switch(type) {
		case 1: case 2 : return sqlSession.selectOne("admin.selectMemberTypeListCount", type);
		case 4 : return sqlSession.selectOne("admin.selectBlackMemberCount");
		case 5 : return sqlSession.selectOne("admin.selectDeleteMember");
		default: return sqlSession.selectOne("admin.selectMemberListCount");
		}
	}
	
	//회원 조건 검색 전체 조회
	@Override
	public ArrayList<HashMap<String, Object>> selectMemberTypeList(SqlSessionTemplate sqlSession, AdminPageInfo pi, int type) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		switch(type) {
		case 1: case 2 : return (ArrayList)sqlSession.selectList("admin.selectMemberTypeList", type, rowBounds);
		case 4 : return (ArrayList)sqlSession.selectList("admin.selectBlackMemberList", null, rowBounds);
		case 5 : return (ArrayList)sqlSession.selectList("admin.selectDeleteMemberList", null, rowBounds);
		default: return (ArrayList)sqlSession.selectList("admin.selectMemberList", null, rowBounds);
		}
	}

	//게시판 관리 - 게시글 관리 페이지
	@Override
	public int getBoardListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin.selectBoardCount");
	}

	//전체 게시글 조회
	@Override
	public ArrayList<Member> selectBoardList(SqlSessionTemplate sqlSession, AdminPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("admin.selectBoardList", null, rowBounds);
	}

	//게시글 조건검색 개수 조회
	@Override
	public int getBoardTypeListCount(SqlSessionTemplate sqlSession, int select1, int select2) {
		String str = "";
		
		//1:1 문의
		if(select1 == 2) {
			switch(select2) {
		/*전체*/		
			case 1 : 
				str = "%";
				return sqlSession.selectOne("admin.selectOTOBoardTypeListCount",str);
		/*웹툰*/	
			case 2 : 
				str = "WT";
				return sqlSession.selectOne("admin.selectOTOBoardTypeListCount",str);
		/*웹소설*/
			case 3 : 
				str = "WN";
				return sqlSession.selectOne("admin.selectOTOBoardTypeListCount",str);
		/*일러스트*/
			case 4 :
				str = "ILL";
				return sqlSession.selectOne("admin.selectOTOBoardTypeListCount",str);
		/*기타*/
			 default :
				str = "ETC";
				return sqlSession.selectOne("admin.selectOTOBoardTypeListCount",str);
			}
		//공지사항
		}else {
			switch(select2) {
			/*전체*/		
				case 1 : 
					str = "%";
					return sqlSession.selectOne("admin.selectNoticeBoardTypeListCount",str);
			/*웹툰*/	
				case 2 : 
					str = "WT";
					return sqlSession.selectOne("admin.selectNoticeBoardTypeListCount",str);
			/*웹소설*/
				case 3 : 
					str = "WN";
					return sqlSession.selectOne("admin.selectNoticeBoardTypeListCount",str);
			/*일러스트*/
				case 4 :
					str = "ILL";
					return sqlSession.selectOne("admin.selectNoticeBoardTypeListCount",str);
			/*기타*/
				default :
					str = "ETC";
					return sqlSession.selectOne("admin.selectNoticeBoardTypeListCount",str);
				}
		}
	}
	
	
}
