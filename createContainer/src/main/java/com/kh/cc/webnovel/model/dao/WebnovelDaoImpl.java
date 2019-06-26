package com.kh.cc.webnovel.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;
import com.kh.cc.webnovel.model.vo.WebnovelPhoto;
import com.kh.cc.webnovel.model.vo.WebnovelRound;

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
	public int selectListCount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Webnovel.selectListCount", m.getUserId());
	}
	//웹소설 메인 목록 리스트
	@Override
	public ArrayList<Webnovel> selectWnList(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Member m) {
		ArrayList<Webnovel> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Webnovel.selectWnList", m.getUserId(), rowBounds);
		
		return list;
	}
	//웹소설, 사진 정보
	@Override
	public Webnovel selectWnOne(SqlSessionTemplate sqlSession, int wid) {
		return sqlSession.selectOne("Webnovel.selectWnOne", wid);
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
	

}
