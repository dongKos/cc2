package com.kh.cc.webnovel.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelAttention;
import com.kh.cc.webnovel.model.vo.WebnovelCoin;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;
import com.kh.cc.webnovel.model.vo.WebnovelPhoto;
import com.kh.cc.webnovel.model.vo.WebnovelReply;
import com.kh.cc.webnovel.model.vo.WebnovelReport;
import com.kh.cc.webnovel.model.vo.WebnovelRound;
import com.kh.cc.webnovel.model.vo.WebnovelStarPoint;

public interface WebnovelDao {
	//작품등록 메소드
	int insertWebnovel(SqlSessionTemplate sqlSession, Webnovel wn);
	//작품 메인 사진 등록 메소드
	int insertWnPhoto(SqlSessionTemplate sqlSession, WebnovelPhoto wp);
	//웹소설 메인 목록 카운트
	int selectListCount(SqlSessionTemplate sqlSession, Webnovel wn);
	//웹소설 메인 목록 리스트
	ArrayList<Webnovel> selectWnList(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Webnovel wn);
	//웹소설, 사진 정보
	Webnovel selectWnOne(SqlSessionTemplate sqlSession, Webnovel wn);
	//웹소설 메인 수정
	int updateWebnovel(SqlSessionTemplate sqlSession, Webnovel wn);
	//웹소설 메인 사진 수정
	int updateWnPhoto(SqlSessionTemplate sqlSession, WebnovelPhoto wp);
	//웹소설 회차 등록
	int insertWnRound(SqlSessionTemplate sqlSession, WebnovelRound wnr);
	//웹소설 사진 등록
	int insertWnrPhoto(SqlSessionTemplate sqlSession, WebnovelPhoto wp);
	//웹소설 완결 상태
	int updateWorkStatus(SqlSessionTemplate sqlSession, Webnovel wn);
	//웹소설 회차 목록 카운트
	int selectWnrListCount(SqlSessionTemplate sqlSession, WebnovelRound wnr);
	//웹소설 회차 목록 리스트
	ArrayList<WebnovelRound> selectWnRoundList(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, WebnovelRound wnr);
	//웹소설 회차, 사진 정보
	WebnovelRound selectWnrOne(SqlSessionTemplate sqlSession, int rid);
	//웹소설 작품 회차 수정
	int updateWnRound(SqlSessionTemplate sqlSession, WebnovelRound wnr);
	//웹소설 작품 회차 사진 수정
	int updateWnrPhoto(SqlSessionTemplate sqlSession, WebnovelPhoto wp);
	//웹소설 삭제
	int deleteWebnovel(SqlSessionTemplate sqlSession, Webnovel wn);
	//웹소설 회차 삭제
	int deleteWnRound(SqlSessionTemplate sqlSession, Webnovel wn);
	//웹소설 사진 삭제
	int deleteWebnovelPhoto(SqlSessionTemplate sqlSession, Webnovel wn);
	//웹소설 회차 리스트
	ArrayList<WebnovelRound> selectWnRoundList(SqlSessionTemplate sqlSession, WebnovelRound wnr);
	//웹소설 회차 삭제
	int deleteWnRoundOne(SqlSessionTemplate sqlSession, WebnovelRound wnr);
	//웹소설 회차 사진 삭제
	int deleteWnrPhoto(SqlSessionTemplate sqlSession, WebnovelRound wnr);
	//웹소설 도전/프리미엄 장르 목록 카운트
	int webNovelGenreCount(SqlSessionTemplate sqlSession, Webnovel wn);
	//웹소설 도전/프리미엄 장르 목록 리스트
	ArrayList<HashMap<String, Object>> webNovelGenreList(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Webnovel wn);
	//웹소설 도전/프리미엄 완결 목록 카운트
	int webnovelCompCount(SqlSessionTemplate sqlSession, Webnovel wn);
	//웹소설 도전/프리미엄 완결 목록 카운트
	ArrayList<HashMap<String, Object>> webnovelCompList(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Webnovel wn);
	//조회수 증가용 메소드
	int updateCount(SqlSessionTemplate sqlSession, WebnovelRound wnr);
	//관심등록 메소드
	int insertAttention(SqlSessionTemplate sqlSession, WebnovelAttention wa);
	//관심등록 정보 메소드
	WebnovelAttention selectAttention(SqlSessionTemplate sqlSession, WebnovelAttention wa);
	//별점주기 메소드
	int insertStarPoint(SqlSessionTemplate sqlSession, WebnovelStarPoint wnsp);
	//별점 정보
	WebnovelStarPoint selectWnSpOne(SqlSessionTemplate sqlSession, WebnovelStarPoint wnsp);
	//회차 별점 평균
	double selectWnrStarPointAvg(SqlSessionTemplate sqlSession, int rid);
	//회차 별점 평가인원 수
	int selectstarPointCount(SqlSessionTemplate sqlSession, int rid);
	//작품 별점 평균
	double selectAllWnrStarPointAvg(SqlSessionTemplate sqlSession, int wid);
	//작품 전체 평가인원수
	int selectAllStarPointCount(SqlSessionTemplate sqlSession, int wid);
	//베스트 도전 작품 카운트
	int selectBestWnListCount(SqlSessionTemplate sqlSession, int gradeType);
	//베스트 도전 작품 리스트
	ArrayList<HashMap<String, Object>> selectBestWnList(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, int gradeType);
	//도전 추천 베스트 추천 리스트
	ArrayList<HashMap<String, Object>> selectRecommendGenreList(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Webnovel wn);
	//도전 추천 최신 리스트
	ArrayList<HashMap<String, Object>> selectNewRecommendList(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Webnovel wn);
	//댓글등록
	int insertWebnovelReply(SqlSessionTemplate sqlSession, WebnovelReply wReply);
	//댓글 리스트 카운트
	int selectWebnovelReplyCount(SqlSessionTemplate sqlSession, WebnovelReply wReply);
	//댓글 리스트
	ArrayList<HashMap<String, Object>> selectWebnovelReplyList(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, WebnovelReply wReply);
	//신고등록
	int insertReport(SqlSessionTemplate sqlSession, WebnovelReport wReport);
	//신고 로그인/비로그인, 등록인/미등록인 구분
	WebnovelReport selectwReportOne(SqlSessionTemplate sqlSession, WebnovelReport wReport);
	//작품 신고 로그인/비로그인, 등록인/미등록인 구분
	WebnovelReport selectWorkReportOne(SqlSessionTemplate sqlSession, WebnovelReport wReport);
	//댓글 삭제
	int deleteReply(SqlSessionTemplate sqlSession, WebnovelReply wReply);
	//유료작품 구매 -2 CC개
	int updatePayWallet(SqlSessionTemplate sqlSession, int mno);
	//코인 내역 입력
	int insertCoin(SqlSessionTemplate sqlSession, WebnovelCoin wc);
	//재로그인용
	Member selectMember(SqlSessionTemplate sqlSession, Member m);
	//상세보기 페이징 유료작품 구분
	WebnovelRound selectCheckWnr(SqlSessionTemplate sqlSession, WebnovelRound wnr);
	//회차보기 구분하기
	int selectCheckwRound(SqlSessionTemplate sqlSession, WebnovelRound wnr);
	ArrayList<WebnovelRound> selectWnRoundListAll(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, WebnovelRound wnr);
	
	
}
