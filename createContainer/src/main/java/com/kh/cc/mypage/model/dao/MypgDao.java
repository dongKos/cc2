package com.kh.cc.mypage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.cc.admin.model.vo.Board;
import com.kh.cc.admin.model.vo.Refund;
import com.kh.cc.approval.model.vo.Approval;
import com.kh.cc.member.model.vo.Member;
import com.kh.cc.mypage.model.vo.WriterProfile;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;
import com.kh.cc.mypage.model.vo.WriterProfile;
import com.kh.cc.mypage.model.vo.PaymentCC;
import com.kh.cc.mypage.model.vo.Support;
import com.kh.cc.mypage.model.vo.WriterPhoto;
import com.kh.cc.mypage.model.vo.WriterProfile;
import com.kh.cc.mypage.model.vo.Closed;

public interface MypgDao {

	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);

	Member updateMember(SqlSessionTemplate sqlSession, Member m);

	//작가페이지 프로필 설정
	   int updateWriterProfile(SqlSessionTemplate sqlSession, WriterProfile mp);

	   int insertWriterPhoto(SqlSessionTemplate sqlSession, WriterPhoto mphoto);

	   int deletePhoto(SqlSessionTemplate sqlSession, String userId);

	   String deletePhotoPath(SqlSessionTemplate sqlSession, String userId);

	Webnovel selectWork(SqlSessionTemplate sqlSession, int wid);

	int countRound(SqlSessionTemplate sqlSession, int wid);

	String getChangeName(SqlSessionTemplate sqlSession, int wid);
	//결제완료
	int payComplete(SqlSessionTemplate sqlSession, PaymentCC pc);
	//유료작품신청 인서트 
	int insertDocument(SqlSessionTemplate sqlSession, Member m, WriterPhoto file1, WriterPhoto file2, Approval appro);
	//코인환불
	int refundReq(SqlSessionTemplate sqlSession, Refund refund);
	//코인 충전 리스트
	ArrayList coinChargeList(SqlSessionTemplate sqlSession, int mno);
	//신고 내역
	ArrayList showReportPage(SqlSessionTemplate sqlSession, int mno);
	//코인 사용 내역
	ArrayList coinUseList(SqlSessionTemplate sqlSession, int mno);
	
	//탈퇴
    int resign(SqlSessionTemplate sqlSession, int mno);
	   
	//프로필설정(왼쪽사진 바꾸기)
	String selectPhoto(SqlSessionTemplate sqlSession, Member m);
	
	//마이 - 관심작품 목록
	   ArrayList attentionListWt(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Member m);
	   //마이 - 관심작품 목록(웹소설)
	   ArrayList attentionListWn(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Member m);
	   
	   //마이 - 관심작가 목록(웹툰)
	   ArrayList attentionArtistWt(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Member m);
	   //마이 - 관심작가 목록(웹소설)
	   ArrayList attentionWnArtist(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Member m);
	   //마이 - 관심작가 목록(일러스트)
	   ArrayList attentionWlArtist(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Member m);
	   //작가 프로필 사진 카운팅
	   int countProfilePic(SqlSessionTemplate sqlSession, WriterProfile mp);
	   //후원insert
	   int insertSupport(SqlSessionTemplate sqlSession, Member m, WriterPhoto mphoto, Support sp);
	   //insert 일대일문의
	   int insertMtmQue(SqlSessionTemplate sqlSession, Board board);
	   //내 문의내역
	   ArrayList<Board> showQue(SqlSessionTemplate sqlSession, String userId);
	   //휴재신청insert
	   int insertClosed(SqlSessionTemplate sqlSession, Closed c);
	   //멤버가져오기
	Member selectMember(SqlSessionTemplate sqlSession, String userId);
	//일러스트 의뢰 요청 목록
	ArrayList showReqIllust(SqlSessionTemplate sqlSession, String userId);
	//휴재 내역 리스트
	ArrayList showClosedPage(SqlSessionTemplate sqlSession, int mno);
	//일대일 상세
	Board getBoard(SqlSessionTemplate sqlSession, int bno);
}


