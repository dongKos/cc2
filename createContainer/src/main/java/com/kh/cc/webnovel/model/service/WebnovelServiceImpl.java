package com.kh.cc.webnovel.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webnovel.model.dao.WebnovelDao;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;
import com.kh.cc.webnovel.model.vo.WebnovelPhoto;
import com.kh.cc.webnovel.model.vo.WebnovelRound;

@Service
public class WebnovelServiceImpl implements WebnovelService{
	
	@Autowired
	private WebnovelDao wd;
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	//작품 등록 메소드
	@Override
	public int insertWebnovel(Webnovel wn, WebnovelPhoto wp) {
		int result = 0;
		
		int result1 = wd.insertWebnovel(sqlSession, wn);
		int result2 = wd.insertWnPhoto(sqlSession, wp);
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}
	//웹소설 메인 수정(사진 수정 O)
	@Override
	public int updateWebnovel(Webnovel wn, WebnovelPhoto wp) {
		int result = 0;
		
		int result1 = wd.updateWebnovel(sqlSession, wn);
		int result2 = wd.updateWnPhoto(sqlSession, wp);
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}
	//웹소설 메인 수정(사진 수정 X)
	@Override
	public int updateWebnovel(Webnovel wn) {
		return wd.updateWebnovel(sqlSession, wn);
	}
	//웹소설 메인 목록 카운트
	@Override
	public int selectListCount(Member m) {
		return wd.selectListCount(sqlSession, m);
	}
	//웹소설 메인 목록 리스트
	@Override
	public ArrayList<Webnovel> selectWnList(WebnovelPageInfo pi, Member m) {
		return wd.selectWnList(sqlSession, pi, m);
	}
	//웹소설, 사진 정보
	@Override
	public Webnovel selectWnOne(int wid) {
		return wd.selectWnOne(sqlSession, wid);
	}
	//웹소설 회차 등록
	@Override
	public int insertWnRound(WebnovelRound wnr, WebnovelPhoto wp, Webnovel wn) {
		int result = 0;
		int result1 = wd.insertWnRound(sqlSession, wnr);
		int result2 = wd.insertWnrPhoto(sqlSession, wp);
		int result3 = wd.updateWorkStatus(sqlSession, wn);
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		return result;
	}
	//웹소설 회차 목록 카운트
	@Override
	public int selectWnrListCount(WebnovelRound wnr) {
		return wd.selectWnrListCount(sqlSession, wnr);
	}
	//웹소설 회차 목록 리스트
	@Override
	public ArrayList<WebnovelRound> selectWnRoundList(WebnovelPageInfo pi, WebnovelRound wnr) {
		return wd.selectWnRoundList(sqlSession, pi, wnr);
	}
	//웹소설 회차, 사진 정보
	@Override
	public WebnovelRound selectWnrOne(int rid) {
		return wd.selectWnrOne(sqlSession, rid);
	}
	//웹소설 회차 수정(사진 수정 O)
	@Override
	public int updateWnRound(WebnovelRound wnr, WebnovelPhoto wp, Webnovel wn) {
		int result = 0;
		int result1 = wd.updateWnRound(sqlSession, wnr);
		int result2 = wd.updateWnrPhoto(sqlSession, wp);
		int result3 = wd.updateWorkStatus(sqlSession, wn);
		
		System.out.println("작품회차 리저트 1 : " + result1);
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}
	//웹소설 회차 수정(사진 수정 X)
	@Override
	public int updateWnRound(WebnovelRound wnr, Webnovel wn) {
		int result = 0;
		int result1 = wd.updateWnRound(sqlSession, wnr);
		System.out.println("result1 : " + result1);
		int result2 = wd.updateWorkStatus(sqlSession, wn);
		System.out.println("result2 : " + result2);
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		return result;
		
	}
	//웹소설 삭제
	@Override
	public int deleteWebnovel(Webnovel wn) {
		int result = 0;
		int result1 = wd.deleteWebnovel(sqlSession, wn);
		System.out.println("result1 : " + result1);
		int result2 = wd.deleteWnRound(sqlSession, wn);
		System.out.println("result2 : " + result2);
		int result3 = wd.deleteWebnovelPhoto(sqlSession, wn);
		System.out.println("result3 : " + result3);
		
		if(result1 > 0 && result2 >= 0 && result3 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}
	//웹소설 회차 리스트
	@Override
	public ArrayList<WebnovelRound> selectWnRoundList(WebnovelRound wnr) {
		return wd.selectWnRoundList(sqlSession, wnr);
	}
	//웹소설 회차 삭제
	@Override
	public int deleteWnRound(WebnovelRound wnr) {
		int result = 0;
		int result1 = wd.deleteWnRoundOne(sqlSession, wnr);
		System.out.println("result1 : " + result1);
		int result2 = wd.deleteWnrPhoto(sqlSession, wnr);
		System.out.println("result2 : " + result2);
		
		if(result1 > 0 && result2 >= 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		
		return result;
	}
	//웹소설 도전 장르 목록 카운트
	@Override
	public int challengeGenreCount(String genre) {
		return wd.challengeGenreCount(sqlSession, genre);
	}
	//웹소설 도전 장르 목록 리스트
	@Override
	public ArrayList<Webnovel> challengeGenreLIst(WebnovelPageInfo pi, String genre) {
		return wd.challengeGenreLIst(sqlSession, pi, genre);
	}
	
	
}

























