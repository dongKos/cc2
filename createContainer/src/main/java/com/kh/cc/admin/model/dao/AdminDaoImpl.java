
package com.kh.cc.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cc.admin.model.vo.AdminPageInfo;
import com.kh.cc.admin.model.vo.Approve;
import com.kh.cc.admin.model.vo.Board;
import com.kh.cc.admin.model.vo.Purchase;
import com.kh.cc.admin.model.vo.Refund;
import com.kh.cc.admin.model.vo.Report;
import com.kh.cc.illustrator.model.vo.Illustrator;
import com.kh.cc.member.model.vo.Member;
import com.kh.cc.mypage.model.vo.Closed;
import com.kh.cc.illustrator.model.vo.Support;
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
			str = "REPLY";
		}else if(statusVal.equals("2")){
			str = "WORK";
		}else if(statusVal.equals("3")){
			str = "ROUND";
		}else if(statusVal.equals("4")){
			str= "BOARD";
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
			str = "REPLY";
		}else if(statusVal.equals("2")){
			str = "WORK";
		}else if(statusVal.equals("3")){
			str = "ROUND";
		}else if(statusVal.equals("4")){
			str= "BOARD";
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
	
	//게시글 조건검색 전체 조회
	@Override
	public ArrayList<HashMap<String, Object>> selectBoardTypeList(SqlSessionTemplate sqlSession, AdminPageInfo pi,  int select1,
			int select2) {
		String str = "";
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		//1:1 문의
		if(select1 == 2) {
			switch(select2) {
			/*전체*/		
			case 1 : 
				str = "%";
				return (ArrayList)sqlSession.selectList("admin.selectOTOBoardTypeList",str, rowBounds);
				/*웹툰*/	
			case 2 : 
				str = "WT";
				return (ArrayList)sqlSession.selectList("admin.selectOTOBoardTypeList",str, rowBounds);
				/*웹소설*/
			case 3 : 
				str = "WN";
				return (ArrayList)sqlSession.selectList("admin.selectOTOBoardTypeList",str, rowBounds);
				/*일러스트*/
			case 4 :
				str = "ILL";
				return (ArrayList)sqlSession.selectList("admin.selectOTOBoardTypeList",str, rowBounds);
				/*기타*/
			default :
				str = "ETC";
				return (ArrayList)sqlSession.selectList("admin.selectOTOBoardTypeList",str, rowBounds);
			}
			//공지사항
		}else {
			switch(select2) {
			/*전체*/		
			case 1 : 
				str = "%";
				return (ArrayList)sqlSession.selectList("admin.selectNoticeBoardTypeList",str, rowBounds);
				/*웹툰*/	
			case 2 : 
				str = "WT";
				return (ArrayList)sqlSession.selectList("admin.selectNoticeBoardTypeList",str, rowBounds);
				/*웹소설*/
			case 3 : 
				str = "WN";
				return (ArrayList)sqlSession.selectList("admin.selectNoticeBoardTypeList",str, rowBounds);
				/*일러스트*/
			case 4 :
				str = "ILL";
				return (ArrayList)sqlSession.selectList("admin.selectNoticeBoardTypeList",str, rowBounds);
				/*기타*/
			default :
				str = "ETC";
				return (ArrayList)sqlSession.selectList("admin.selectNoticeBoardTypeList",str, rowBounds);
			}
		}
	}
	
	//댓글 전체 개수 조회
	@Override
	public int getBoardReplyListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin.selectBoardReplyListCount");
	}
	
	//댓글 전체 조회
	@Override
	public ArrayList<Member> getBoardReplyList(SqlSessionTemplate sqlSession, AdminPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("admin.selectBoardReplyList", null, rowBounds);
	}
	
	//작품 전체 개수 조회
	@Override
	public int getWorkListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin.selectWorkListCount");
	}
	
	//작품 전체 조회
	@Override
	public ArrayList<Webnovel> selectAllWorkList(SqlSessionTemplate sqlSession, AdminPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit()); 
		
		return (ArrayList)sqlSession.selectList("admin.selectAllWorkList", null, rowBounds);
	}
	
	//작품 조건검색 개수 조회
	@Override
	public int getWorkTypeListCount(SqlSessionTemplate sqlSession, int select1, int select2) {
		String str = "";
		
		//웹툰
		if(select1 == 2) {
			switch(select2) {
			/*전체*/		
			case 1 : 
				str = "%";
				return sqlSession.selectOne("admin.selectWebToonListCount",str);
				/*일반*/	
			case 2 : 
				str = "1";
				return sqlSession.selectOne("admin.selectWebToonListCount",str);
				/*프리미엄*/
			default :
				str = "2";
				return sqlSession.selectOne("admin.selectWebToonListCount",str);
			}
			//일러스트
		}else {
			switch(select2) {
			/*전체*/		
			case 1 : 
				str = "%";
				return sqlSession.selectOne("admin.selectWebNovelListCount",str);
				/*일반*/	
			case 2 : 
				str = "1";
				return sqlSession.selectOne("admin.selectWebNovelListCount",str);
				/*프리미엄*/
			default :
				str = "2";
				return sqlSession.selectOne("admin.selectWebNovelListCount",str);
			}
		}
		
	}
	
	//작품 조건 검색 전체 조회
	@Override
	public ArrayList<HashMap<String, Object>> selectWorkTypeList(SqlSessionTemplate sqlSession, AdminPageInfo pi,
			int select1, int select2) {
		String str = "";
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		//웹툰
		if(select1 == 2) {
			switch(select2) {
			/*전체*/		
			case 1 : 
				str = "%";
				return (ArrayList)sqlSession.selectList("admin.selectWebToonList",str, rowBounds);
				/*일반*/	
			case 2 : 
				str = "1";
				return (ArrayList)sqlSession.selectList("admin.selectWebToonList",str, rowBounds);
				/*프리미엄*/
			default :
				str = "2";
				return (ArrayList)sqlSession.selectList("admin.selectWebToonList",str, rowBounds);
			}
			//공지사항
		}else {
			switch(select2) {
			/*전체*/		
			case 1 : 
				str = "%";
				return (ArrayList)sqlSession.selectList("admin.selectWebNovelList",str, rowBounds);
				/*일반*/	
			case 2 : 
				str = "1";
				return (ArrayList)sqlSession.selectList("admin.selectWebNovelList",str, rowBounds);
				/*프리미엄*/
			default :
				str = "2";
				return (ArrayList)sqlSession.selectList("admin.selectWebNovelList",str, rowBounds);
			}
		}
	}
	
	//일러스트 전체 개수 조회
	@Override
	public int getIllustListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin.selectIllustListCount");
	}
	
	//일러스트 전체 조회
	@Override
	public ArrayList<Illustrator> selectIllustWorkList(SqlSessionTemplate sqlSession, AdminPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("admin.selectIllustWorkList", null, rowBounds);
	}

	//일러스트 조건 검색 개수 조회
	@Override
	public int getIllustTypeListCount(SqlSessionTemplate sqlSession, int select1) {
		String str = "";
		if(select1 == 1) {
			str = "%";
		}else if (select1 == 2) {
			str = "chall";
		}else {
			str = "pri";
		}
		return sqlSession.selectOne("admin.selectIllustTypeListCount", str);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectIllustTypeList(SqlSessionTemplate sqlSession, AdminPageInfo pi,
			int select1) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		String str = "";
		switch(select1) {
			case 1 : str = "%"; break;
			case 2 : str = "chall"; break;
			case 3 : str = "pri"; break;
		}
		
		return (ArrayList)sqlSession.selectList("admin.selectIllustTypeList", str, rowBounds);
	}

	//승인대기 내역 개수 조회
	@Override
	public int getApproveListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin.selectApproveListCount");
	}

	//승인 대기 내역 전체 조회
	@Override
	public ArrayList<Approve> selectApproveList(SqlSessionTemplate sqlSession, AdminPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("admin.selectApproveList", null, rowBounds);
	}

	//승인대기 조건 검색 개수 조회
	@Override
	public int getApproveTypeListCount(SqlSessionTemplate sqlSession, int select1) {
		String str = "";

		switch(select1) {
		case 1 : str = "%"; break;
		case 2 : str = "WT"; break;
		case 3 : str = "WN"; break;
		case 4 : str = "ILL"; break;
		}
		return sqlSession.selectOne("admin.selectApproveTypeListCount", str);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectApproveTypeList(SqlSessionTemplate sqlSession, AdminPageInfo pi,
			int select1) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		String str = "";
		
		switch(select1) {
		case 1 : str = "%"; break;
		case 2 : str = "WT"; break;
		case 3 : str = "WN"; break;
		case 4 : str = "ILL"; break;
		}
		
		return (ArrayList)sqlSession.selectList("admin.selectApproveTypeList", str, rowBounds);
	}

	//승인 대기 상세 조회
	@Override
	public ArrayList<Approve> selectApproveDetailList(SqlSessionTemplate sqlSession, int id) {
		return (ArrayList)sqlSession.selectList("admin.selectApproveDetailList", id);
		
	}

	//승인 완료 하기
	@Override
	public int completeApprove(SqlSessionTemplate sqlSession, int approvalCode) {
		return sqlSession.update("admin.completeApprove", approvalCode);
	}

	//프리미엄 작가 수 조회
	@Override
	public int getPriMemberListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin.selectPriMemberListCount");
	}

	//프리미엄 작가 전체 조회
	@Override
	public ArrayList<Member> selectPriMemberList(SqlSessionTemplate sqlSession, AdminPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("admin.selectPriMemberList", null, rowBounds);
	}

	//해당 작품 전체 매출 통계 구하기
	@Override
	public ArrayList<Integer> selectPurchaseAvg(SqlSessionTemplate sqlSession, int mno) {
		return (ArrayList)sqlSession.selectList("admin.selectPurchaseAvg", mno);
	}

	//전체 매출 통계
	@Override
	public ArrayList<Integer> selectAllPurchaseAvg(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("admin.selectAllPurchaseAvg");
	}

	//승인 완료 시 , 작품 테이블 grade_type 변경
	@Override
	public int completeApprove2(SqlSessionTemplate sqlSession, int approvalCode) {
		return sqlSession.update("admin.completeApprove2", approvalCode);
	}

	//전체 후원 목록 개수 조회
	@Override
	public int getDormantListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin.selectDormantListCount");
	}

	//전체 후원 목록 조회
	@Override
	public ArrayList<Support> selectDormantList(SqlSessionTemplate sqlSession, AdminPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("admin.selectDormantList", null, rowBounds);
	}

	//후원 상세 보기 페이지
	@Override
	public Support selectOneDormant(SqlSessionTemplate sqlSession, int sCode) {
		return sqlSession.selectOne("admin.selectOneDormant", sCode);
	}

	//후원 승인
	@Override
	public int completeDormant(SqlSessionTemplate sqlSession, int sCode) {
		return sqlSession.update("admin.completeDormant", sCode);
	}

	//공지사항 작성
	@Override
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("admin.insertBoard", b);
	}

	//공지사항 상세보기
	@Override
	public Board selectOneBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("admin.selectOneBoard", bId);
	}

	//휴재신청 내역 전체 개수 조회
	@Override
	public int getCloseListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin.selectCloseListCount");
	}

	//휴재신청 내역 전체 조회
	@Override
	public ArrayList<Closed> selectCloseList(SqlSessionTemplate sqlSession, AdminPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("admin.selectCloseList", null, rowBounds);
	}

	//휴재신청 내역 상세보기
	@Override
	public Closed selectOneClosed(SqlSessionTemplate sqlSession, int cCode) {
		return sqlSession.selectOne("admin.selectOneClosed", cCode);
	}

	//휴재신청 승인
	@Override
	public int completeClosed(SqlSessionTemplate sqlSession, int cCode) {
		return sqlSession.update("admin.completeClosed", cCode);
	}

	//휴재신청 조건검색 개수 조회
	@Override
	public int getClosedListCount(SqlSessionTemplate sqlSession, int type) {
		String str = "";
		
		if(type == 1)str = "%";
		else if(type == 2)str = "WT";
		else str = "WN";
		
		return sqlSession.selectOne("admin.getClosedListCount", str);
	}

	//휴재신청 조건검색 전체 조회
	@Override
	public ArrayList<HashMap<String, Object>> selectClosedTypeList(SqlSessionTemplate sqlSession, AdminPageInfo pi,
			int type) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		String str = "";
		if(type == 1)str = "%";
		else if(type == 2)str = "WT";
		else str = "WN";
		
		return (ArrayList)sqlSession.selectList("admin.selectClosedTypeList", str, rowBounds);
	}

	//공지사항 수정
	@Override
	public int noticeChange(SqlSessionTemplate sqlSession, int bId, String bContent) {
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("bId", bId);
		hmap.put("bContent", bContent);
		
		return sqlSession.update("admin.noticeChange", hmap);
	}

	//전체 매출 통계 조회
	@Override
	public HashMap<String, Object> selectAllAvg(SqlSessionTemplate sqlSession) {
		return (HashMap<String, Object>)sqlSession.selectOne("admin.selectAllAvg");
	}

}
