package com.kh.cc.webnovel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webnovel.model.dao.WebnovelDao;
import com.kh.cc.webnovel.model.vo.AttentionAuthor;
import com.kh.cc.webnovel.model.vo.Board;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelAttention;
import com.kh.cc.webnovel.model.vo.WebnovelCoin;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;
import com.kh.cc.webnovel.model.vo.WebnovelPhoto;
import com.kh.cc.webnovel.model.vo.WebnovelReply;
import com.kh.cc.webnovel.model.vo.WebnovelReport;
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
	//웹소설 도전/프리미엄 메인 목록 카운트
	@Override
	public int selectListCount(Webnovel wn) {
		return wd.selectListCount(sqlSession, wn);
	}
	//웹소설 도전/프리미엄 메인 목록 리스트
	@Override
	public ArrayList<Webnovel> selectWnList(WebnovelPageInfo pi, Webnovel wn) {
		return wd.selectWnList(sqlSession, pi, wn);
	}
	//웹소설, 사진 정보
	@Override
	public Webnovel selectWnOne(Webnovel wn) {
		return wd.selectWnOne(sqlSession, wn);
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
		ArrayList<WebnovelRound> list = null;
		
		int result = wd.selectCheckwRound(sqlSession, wnr);
		if(result > 0) {
			list = wd.selectWnRoundList(sqlSession, pi, wnr);
		}else {
			list = wd.selectWnRoundListAll(sqlSession, pi, wnr);
		}
		return list;
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
		int result2 = wd.updateWorkStatus(sqlSession, wn);
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
		int result2 = wd.deleteWnRound(sqlSession, wn);
		int result3 = wd.deleteWebnovelPhoto(sqlSession, wn);
		
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
		int result2 = wd.deleteWnrPhoto(sqlSession, wnr);
		
		if(result1 > 0 && result2 >= 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		
		return result;
	}
	//웹소설 도전 장르 목록 카운트
	@Override
	public int webNovelGenreCount(Webnovel wn) {
		return wd.webNovelGenreCount(sqlSession, wn);
	}
	//웹소설 도전 장르 목록 리스트
	@Override
	public ArrayList<HashMap<String, Object>> webNovelGenreList(WebnovelPageInfo pi, Webnovel wn) {
		return wd.webNovelGenreList(sqlSession, pi, wn);
	}
	//웹소설 도전/프리미엄 완결 목록 카운트
	@Override
	public int webnovelCompCount(Webnovel wn) {
		return wd.webnovelCompCount(sqlSession, wn);
	}
	//웹소설 도전/프리미엄 완결 목록 카운트
	@Override
	public ArrayList<HashMap<String, Object>> webnovelCompList(WebnovelPageInfo pi, Webnovel wn) {
		return wd.webnovelCompList(sqlSession, pi, wn);
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
	//도전 추천 베스트 추천 리스트
	@Override
	public ArrayList<HashMap<String, Object>> selectRecommendGenreList(WebnovelPageInfo pi, Webnovel wn) {
		return wd.selectRecommendGenreList(sqlSession, pi, wn);
	}
	//도전 추천 최신 리스트
	@Override
	public ArrayList<HashMap<String, Object>> selectNewRecommendList(WebnovelPageInfo pi, Webnovel wn) {
		return wd.selectNewRecommendList(sqlSession, pi, wn);
	}
	//댓글 등록
	@Override
	public int insertWebnovelReply(WebnovelReply wReply) {
		return wd.insertWebnovelReply(sqlSession, wReply);
	}
	//댓글 리스트 카운트
	@Override
	public int selectWebnovelReplyCount(WebnovelReply wReply) {
		return wd.selectWebnovelReplyCount(sqlSession, wReply);
	}
	//댓글 리스트
	@Override
	public ArrayList<HashMap<String, Object>> selectWebnovelReplyList(WebnovelPageInfo pi, WebnovelReply wReply) {
		return wd.selectWebnovelReplyList(sqlSession, pi, wReply);
	}
	//신고등록
	@Override
	public int insertReport(WebnovelReport wReport) {
		return wd.insertReport(sqlSession, wReport);
	}
	//신고 로그인/비로그인, 등록인/미등록인 구분
	@Override
	public WebnovelReport selectwReportOne(WebnovelReport wReport) {
		return  wd.selectwReportOne(sqlSession, wReport);
	}
	//작품 신고 로그인/비로그인, 등록인/미등록인 구분
	@Override
	public WebnovelReport selectWorkReportOne(WebnovelReport wReport) {
		return  wd.selectWorkReportOne(sqlSession, wReport);
	}
	//댓글 삭제
	@Override
	public int deleteReply(WebnovelReply wReply) {
		return  wd.deleteReply(sqlSession, wReply);
	}
	//유료작품 구매 -2 CC개
	@Override
	public int updatePayWallet(int mno, WebnovelCoin wc) {
		int result = 0;
		int result1 = wd.updatePayWallet(sqlSession, mno);
		int result2 = wd.insertCoin(sqlSession, wc);
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}else {
			result = 0 ;
		}
		
		return result;
	}
	//재로그인용 
	@Override
	public Member loginMember(Member m) {
		Member loginUser = wd.selectMember(sqlSession, m);
		return loginUser;
	}
	//상세보기 페이징 유료작품 구분
	@Override
	public WebnovelRound selectCheckWnr(WebnovelRound wnr) {
		return  wd.selectCheckWnr(sqlSession, wnr);
	}
	//관심 작가 등록
	@Override
	public int insertAttentionAuthor(AttentionAuthor aa) {
		return  wd.insertAttentionAuthor(sqlSession, aa);
	}
	//관심 작가 정보
	@Override
	public AttentionAuthor selectAttionAuthor(AttentionAuthor aa) {
		return  wd.selectAttionAuthor(sqlSession, aa);
	}
	@Override
	public ArrayList<HashMap<String, Object>> selectmainNotice(WebnovelPageInfo pi) {
		return wd.selectmainNotice(sqlSession, pi);
	}
	@Override
	public Board selectDetailedNotice(int bId) {
		return wd.selectDetailedNotice(sqlSession, bId);
	}
	@Override
	public int selectmainNoticeCount() {
		return wd.selectmainNoticeCount(sqlSession);
	}
	
	
}

























