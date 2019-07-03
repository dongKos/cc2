package com.kh.cc.webnovel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webnovel.model.dao.WebnovelDao;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelAttention;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;
import com.kh.cc.webnovel.model.vo.WebnovelPhoto;
import com.kh.cc.webnovel.model.vo.WebnovelRound;
import com.kh.cc.webnovel.model.vo.WebnovelStarPoint;

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
	public ArrayList<HashMap<String, Object>> challengeGenreLIst(WebnovelPageInfo pi, String genre) {
		return wd.challengeGenreLIst(sqlSession, pi, genre);
	}
	//웹소설 도전 완결 목록 카운트
	@Override
	public int challengeCloseCount(String genre) {
		return wd.challengeCloseCount(sqlSession, genre);
	}
	//웹소설 도전 완결 목록 카운트
	@Override
	public ArrayList<HashMap<String, Object>> challengeCloseList(WebnovelPageInfo pi, String genre) {
		return wd.challengeCloseList(sqlSession, pi, genre);
	}
	//조회수 증가 메소드
	@Override
	public int updateCount(WebnovelRound wnr) {
		return  wd.updateCount(sqlSession, wnr);
	}
	//관심 등록 메소드
	@Override
	public int insertAttention(WebnovelAttention wa) {
		return  wd.insertAttention(sqlSession, wa);
	}
	//관심등록 정보 메소드
	@Override
	public WebnovelAttention selectAttention(WebnovelAttention wa) {
		return  wd.selectAttention(sqlSession, wa);
	}
	//별점주기 메소드
	@Override
	public int insertStarPoint(WebnovelStarPoint wnsp) {
		return wd.insertStarPoint(sqlSession, wnsp);
	}
	//별점 정보
	@Override
	public WebnovelStarPoint selectWnSpOne(WebnovelStarPoint wnsp) {
		return  wd.selectWnSpOne(sqlSession, wnsp);
	}
	//회차 별점 평균
	@Override
	public double selectWnrStarPointAvg(int rid) {
		return  wd.selectWnrStarPointAvg(sqlSession, rid);
	}
	//회차 별점 평가인원 수
	@Override
	public int selectstarPointCount(int rid) {
		return  wd.selectstarPointCount(sqlSession, rid);
	}
	//작품 별점 평균
	@Override
	public double selectAllWnrStarPointAvg(int wid) {
		return  wd.selectAllWnrStarPointAvg(sqlSession, wid);
	}
	//작품 전체 평가인원수
	@Override
	public int selectAllStarPointCount(int wid) {
		return  wd.selectAllStarPointCount(sqlSession, wid);
	}
	//베스트 도전 작품 카운트
	@Override
	public int selectBestWnListCount(int gradeType) {
		return wd.selectBestWnListCount(sqlSession, gradeType);
	}
	//베스트 도전 작품 리스트
	@Override
	public ArrayList<HashMap<String, Object>> selectBestWnList(WebnovelPageInfo pi, int gradeType) {
		return wd.selectBestWnList(sqlSession, pi, gradeType);
	}
	
	
}

























