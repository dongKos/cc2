package com.kh.cc.webnovel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelAttention;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;
import com.kh.cc.webnovel.model.vo.WebnovelPhoto;
import com.kh.cc.webnovel.model.vo.WebnovelRound;
import com.kh.cc.webnovel.model.vo.WebnovelStarPoint;

public interface WebnovelService {
	
	//작품 등록 메소드
	int insertWebnovel(Webnovel wn, WebnovelPhoto wp);
	//전체 목록 카운트
	int selectListCount(Member m);
	//웹소설 메인 목록 리스트
	ArrayList<Webnovel> selectWnList(WebnovelPageInfo pi, Member m);
	//웹소설, 사진 정보
	Webnovel selectWnOne(int wid);
	//웹소설 메인 수정(사진 수정 O)
	int updateWebnovel(Webnovel wn, WebnovelPhoto wp);
	//웹소설 메인 수정(사진 수정 X)
	int updateWebnovel(Webnovel wn);
	//웹소설 회차 등록
	int insertWnRound(WebnovelRound wnr, WebnovelPhoto wp, Webnovel wn);
	//작품 회차 목록 카운트
	int selectWnrListCount(WebnovelRound wnr);
	//작품 회차 목록 리스트
	ArrayList<WebnovelRound> selectWnRoundList(WebnovelPageInfo pi, WebnovelRound wnr);
	//웹소설 회차, 사진 정보
	WebnovelRound selectWnrOne(int rid);
	//웹소설 회차 수정(사진 수정 O)
	int updateWnRound(WebnovelRound wnr, WebnovelPhoto wp, Webnovel wn);
	//웹소설 회차 수정(사진 수정 X)
	int updateWnRound(WebnovelRound wnr, Webnovel wn);
	//웹소설 삭제
	int deleteWebnovel(Webnovel wn);
	//웹소설 회차 리스트
	ArrayList<WebnovelRound> selectWnRoundList(WebnovelRound wnr);
	//웹소설 회차 삭제
	int deleteWnRound(WebnovelRound wnr);
	//웹소설 도전 장르 목록 카운트
	int challengeGenreCount(String genre);
	//웹소설 도전 장르 목록 리스트
	ArrayList<HashMap<String, Object>> challengeGenreLIst(WebnovelPageInfo pi, String genre);
	//웹소설 도전 완결 목록 카운트
	int challengeCloseCount(String genre);
	//웹소설 도전 완결 목록 리스트
	ArrayList<HashMap<String, Object>> challengeCloseList(WebnovelPageInfo pi, String genre);
	//조회수 증가 메소드
	int updateCount(WebnovelRound wnr);
	//관심 등록 메소드
	int insertAttention(WebnovelAttention wa);
	//관심등록 정보
	WebnovelAttention selectAttention(WebnovelAttention wa);
	//별점주기 메소드
	int insertStarPoint(WebnovelStarPoint wnsp);
	//별점 정보
	WebnovelStarPoint selectWnSpOne(WebnovelStarPoint wnsp);
	//회차 별점 평균
	double selectWnrStarPointAvg(int rid);
	//회차 별점 평가인원 수
	int selectstarPointCount(int rid);
	//작품 별점 평균
	double selectAllWnrStarPointAvg(int wid);
	//작품 평가인원 수
	int selectAllStarPointCount(int wid);
}
