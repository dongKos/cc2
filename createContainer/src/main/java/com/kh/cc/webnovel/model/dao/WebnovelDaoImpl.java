package com.kh.cc.webnovel.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelAttention;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;
import com.kh.cc.webnovel.model.vo.WebnovelPhoto;
import com.kh.cc.webnovel.model.vo.WebnovelReply;
import com.kh.cc.webnovel.model.vo.WebnovelReport;
import com.kh.cc.webnovel.model.vo.WebnovelRound;
import com.kh.cc.webnovel.model.vo.WebnovelStarPoint;

@Repository
public class WebnovelDaoImpl implements WebnovelDao{
	//작품등록 메소드
	@Override
	public int insertWebnovel(SqlSessionTemplate sqlSession, Webnovel wn) {
		return sqlSession.insert("Webnovel.insertWebnovel", wn);
	}
	//작품 메인 사진 등록 메소드
	@Override
	public int insertWnPhoto(SqlSessionTemplate sqlSession, WebnovelPhoto wp) {
		return sqlSession.insert("Webnovel.insertWnPhoto", wp);
	}
	//웹소설 메인 목록 카운트
	@Override
	public int selectListCount(SqlSessionTemplate sqlSession, Webnovel wn) {
		return sqlSession.selectOne("Webnovel.selectListCount", wn);
	}
	//웹소설 메인 목록 리스트
	@Override
	public ArrayList<Webnovel> selectWnList(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Webnovel wn) {
		ArrayList<Webnovel> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Webnovel.selectWnList", wn, rowBounds);
		
		return list;
	}
	//웹소설, 사진 정보
	@Override
	public Webnovel selectWnOne(SqlSessionTemplate sqlSession, Webnovel wn) {
		return sqlSession.selectOne("Webnovel.selectWnOne", wn);
	}
	//웹소설 메인 수정
	@Override
	public int updateWebnovel(SqlSessionTemplate sqlSession, Webnovel wn) {
		return sqlSession.update("Webnovel.updateWebnovel", wn);
	}
	//웹소설 메인 사진 수정
	@Override
	public int updateWnPhoto(SqlSessionTemplate sqlSession, WebnovelPhoto wp) {
		return sqlSession.update("Webnovel.updateWnPhoto", wp);
	}
	//웹소설 회차 등록
	@Override
	public int insertWnRound(SqlSessionTemplate sqlSession, WebnovelRound wnr) {
		return sqlSession.insert("Webnovel.insertWnRound", wnr);
	}
	//웹소설 회차 사진 등록
	@Override
	public int insertWnrPhoto(SqlSessionTemplate sqlSession, WebnovelPhoto wp) {
		return sqlSession.insert("Webnovel.insertWnrPhoto", wp);
	}
	//웹소설 완결 상태
	@Override
	public int updateWorkStatus(SqlSessionTemplate sqlSession, Webnovel wn) {
		return sqlSession.update("Webnovel.updateWorkStatus", wn);
	}
	//웹소설 회차 목록 카운트
	@Override
	public int selectWnrListCount(SqlSessionTemplate sqlSession, WebnovelRound wnr) {
		return sqlSession.selectOne("Webnovel.selectWnrListCount", wnr);
	}
	//웹소설 회차 목록 리스트
	@Override
	public ArrayList<WebnovelRound> selectWnRoundList(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, WebnovelRound wnr) {
		ArrayList<WebnovelRound> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Webnovel.selectWnRoundList", wnr, rowBounds);
		
		return list;
	}
	//웹소설 회차, 정보
	@Override
	public WebnovelRound selectWnrOne(SqlSessionTemplate sqlSession, int rid) {
		return sqlSession.selectOne("Webnovel.selectWnrOne", rid);
	}
	//웹소설 작품 회차 수정
	@Override
	public int updateWnRound(SqlSessionTemplate sqlSession, WebnovelRound wnr) {
		return sqlSession.update("Webnovel.updateWnRound", wnr);
	}
	//웹소설 작품 회차 사진 수정
	@Override
	public int updateWnrPhoto(SqlSessionTemplate sqlSession, WebnovelPhoto wp) {
		return sqlSession.update("Webnovel.updateWnPhoto", wp);
	}
	//웹소설 삭제
	@Override
	public int deleteWebnovel(SqlSessionTemplate sqlSession, Webnovel wn) {
		return sqlSession.update("Webnovel.deleteWebnovel", wn);
	}
	//웹소설 회차 삭제
	@Override
	public int deleteWnRound(SqlSessionTemplate sqlSession, Webnovel wn) {
		return sqlSession.update("Webnovel.deleteWnRound", wn);
	}
	//웹소설 메인, 서브 사진 삭제
	@Override
	public int deleteWebnovelPhoto(SqlSessionTemplate sqlSession, Webnovel wn) {
		return sqlSession.update("Webnovel.deleteWebnovelPhoto", wn);
	}
	//웹소설 회차 리스트
	@Override
	public ArrayList<WebnovelRound> selectWnRoundList(SqlSessionTemplate sqlSession, WebnovelRound wnr) {
		ArrayList<WebnovelRound> list = null;
		
		list = (ArrayList) sqlSession.selectList("Webnovel.selectWnRoundList", wnr);
		
		return list;
	}
	//웹소설 회차 선택 삭제
	@Override
	public int deleteWnRoundOne(SqlSessionTemplate sqlSession, WebnovelRound wnr) {
		return sqlSession.update("Webnovel.deleteWnRoundOne", wnr);
	}
	//웹소설 회차 사진 삭제
	@Override
	public int deleteWnrPhoto(SqlSessionTemplate sqlSession, WebnovelRound wnr) {
		return sqlSession.update("Webnovel.deleteWnrPhoto", wnr);
	}
	//웹소설 도전/프리미엄 장르 목록 카운트
	@Override
	public int webNovelGenreCount(SqlSessionTemplate sqlSession, Webnovel wn) {
		return sqlSession.selectOne("Webnovel.webNovelGenreCount", wn);
	}
	//웹소설 도전/프리미엄 장르 목록 리스트
	@Override
	public ArrayList<HashMap<String, Object>> webNovelGenreList(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Webnovel wn) {
		ArrayList<HashMap<String, Object>> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Webnovel.webNovelGenreList", wn, rowBounds);
		
		return list;
	}
	//웹소설 도전/프리미엄 완결 목록 카운트
	@Override
	public int webnovelCompCount(SqlSessionTemplate sqlSession, Webnovel wn) {
		return sqlSession.selectOne("Webnovel.webnovelCompCount", wn);
	}
	//웹소설 도전/프리미엄 완결 목록 리스트
	@Override
	public ArrayList<HashMap<String, Object>> webnovelCompList(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Webnovel wn) {
		ArrayList<HashMap<String, Object>> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Webnovel.webnovelCompList", wn, rowBounds);
		
		return list;
	}
	//조회수 업데이트
	@Override
	public int updateCount(SqlSessionTemplate sqlSession, WebnovelRound wnr) {
		return sqlSession.update("Webnovel.updateCount", wnr);
	}
	//관심등록 메소드
	@Override
	public int insertAttention(SqlSessionTemplate sqlSession, WebnovelAttention wa) {
		return sqlSession.insert("Webnovel.insertAttention", wa);
	}
	//관심등록 정보 메소드
	@Override
	public WebnovelAttention selectAttention(SqlSessionTemplate sqlSession, WebnovelAttention wa) {
		return sqlSession.selectOne("Webnovel.selectAttention", wa);
	}
	//별점주기 메소드
	@Override
	public int insertStarPoint(SqlSessionTemplate sqlSession, WebnovelStarPoint wnsp) {
		return sqlSession.insert("Webnovel.insertStarPoint", wnsp);
	}
	//별점정보
	@Override
	public WebnovelStarPoint selectWnSpOne(SqlSessionTemplate sqlSession, WebnovelStarPoint wnsp) {
		return sqlSession.selectOne("Webnovel.selectWnSpOne", wnsp);
	}
	//회차 별점 평균
	@Override
	public double selectWnrStarPointAvg(SqlSessionTemplate sqlSession, int rid) {
		
		double result = 0;
		if(sqlSession.selectOne("Webnovel.selectWnrStarPointAvg", rid) == null) {
			result = 0;
		}else {
			result = sqlSession.selectOne("Webnovel.selectWnrStarPointAvg", rid);
		}
		return result;
	}
	//회차 별점 평가인원 수
	@Override
	public int selectstarPointCount(SqlSessionTemplate sqlSession, int rid) {
		return sqlSession.selectOne("Webnovel.selectstarPointCount", rid);
	}
	//작품 별점 평군
	@Override
	public double selectAllWnrStarPointAvg(SqlSessionTemplate sqlSession, int wid) {
		double result = 0;
		if(sqlSession.selectOne("Webnovel.selectAllWnrStarPointAvg", wid) == null) {
			result = 0;
		}else {
			result = sqlSession.selectOne("Webnovel.selectAllWnrStarPointAvg", wid);
		}
		return result;
	}
	//작품 전체 평가인원수
	@Override
	public int selectAllStarPointCount(SqlSessionTemplate sqlSession, int wid) {
		return sqlSession.selectOne("Webnovel.selectAllStarPointCount", wid);
	}
	//베스트 도전 작품 카운트
	@Override
	public int selectBestWnListCount(SqlSessionTemplate sqlSession, int gradeType) {
		return sqlSession.selectOne("Webnovel.selectBestWnListCount", gradeType);
	}
	//베스트 도전 작품 리스트
	@Override
	public ArrayList<HashMap<String, Object>> selectBestWnList(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, int gradeType) {
		ArrayList<HashMap<String, Object>> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Webnovel.selectBestWnList", gradeType, rowBounds);
		
		return list;		
	}
	//도전 추천 베스트 추천 리스트
	@Override
	public ArrayList<HashMap<String, Object>> selectRecommendGenreList(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Webnovel wn) {
		ArrayList<HashMap<String, Object>> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Webnovel.selectRecommendGenreList", wn, rowBounds);
		
		return list;	
	}
	//도전 추천 최신 리스트
	@Override
	public ArrayList<HashMap<String, Object>> selectNewRecommendList(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Webnovel wn) {
		ArrayList<HashMap<String, Object>> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Webnovel.selectNewRecommendList", wn, rowBounds);
		
		return list;	
	}
	//댓글등록
	@Override
	public int insertWebnovelReply(SqlSessionTemplate sqlSession, WebnovelReply wReply) {
		return sqlSession.insert("Webnovel.insertWebnovelReply", wReply);
	}
	//댓글 리스트 카운트
	@Override
	public int selectWebnovelReplyCount(SqlSessionTemplate sqlSession, WebnovelReply wReply) {
		return sqlSession.selectOne("Webnovel.selectWebnovelReplyCount", wReply);
	}
	//댓글 리스트
	@Override
	public ArrayList<HashMap<String, Object>> selectWebnovelReplyList(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, WebnovelReply wReply) {
		ArrayList<HashMap<String, Object>> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Webnovel.selectWebnovelReplyList", wReply, rowBounds);
		
		return list;	
	}
	//신고등록
	@Override
	public int insertReport(SqlSessionTemplate sqlSession, WebnovelReport wReport) {
		return sqlSession.insert("Webnovel.insertReport", wReport);
	}
	//신고 로그인/비로그인, 등록인/미등록인 구분
	@Override
	public WebnovelReport selectwReportOne(SqlSessionTemplate sqlSession, WebnovelReport wReport) {
		return sqlSession.selectOne("Webnovel.selectwReportOne", wReport);
	}
	//작품 신고 로그인/비로그인, 등록인/미등록인 구분
	@Override
	public WebnovelReport selectWorkReportOne(SqlSessionTemplate sqlSession, WebnovelReport wReport) {
		return sqlSession.selectOne("Webnovel.selectWorkReportOne", wReport);
	}
	

}
