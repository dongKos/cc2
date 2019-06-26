package com.kh.cc.webnovel.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;
import com.kh.cc.webnovel.model.vo.WebnovelPhoto;
import com.kh.cc.webnovel.model.vo.WebnovelRound;

public interface WebnovelDao {
	//작품등록 메소드
	int insertWebnovel(SqlSessionTemplate sqlSession, Webnovel wn);
	//작품 메인 사진 등록 메소드
	int insertWnPhoto(SqlSessionTemplate sqlSession, WebnovelPhoto wp);
	//웹소설 메인 목록 카운트
	int selectListCount(SqlSessionTemplate sqlSession, Member m);
	//웹소설 메인 목록 리스트
	ArrayList<Webnovel> selectWnList(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Member m);
	//웹소설, 사진 정보
	Webnovel selectWnOne(SqlSessionTemplate sqlSession, int wid);
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
	
	
}
