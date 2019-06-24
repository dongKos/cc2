package com.kh.cc.webnovel.model.service;

import java.util.ArrayList;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;
import com.kh.cc.webnovel.model.vo.WebnovelPhoto;
import com.kh.cc.webnovel.model.vo.WebnovelRound;

public interface WebnovelService {
	
	//작품 등록 메소드
	int insertWebnovel(Webnovel wn, WebnovelPhoto wp);
	//전체 목록 카운트
	int selectListCount(Member m);
	//웹소설 메인 목록 리스트
	ArrayList<Webnovel> selectWnList(WebnovelPageInfo pi, Member m);
	//웹소설 수정폼 이동
	Webnovel selectWnOne(int wid);
	//웹소설 메인 수정(사진 수정 O)
	int updateWebnovel(Webnovel wn, WebnovelPhoto wp);
	//웹소설 메인 수정(사진 수정 X)
	int updateWebnovel(Webnovel wn);
	//웹소설 회차 등록
	int insertWnRound(WebnovelRound wnr, WebnovelPhoto wp);
}
