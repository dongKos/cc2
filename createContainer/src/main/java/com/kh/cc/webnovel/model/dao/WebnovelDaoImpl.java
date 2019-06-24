package com.kh.cc.webnovel.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;
import com.kh.cc.webnovel.model.vo.WebnovelPhoto;

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
	//웹소설 수정폼 이동
	@Override
	public Webnovel selectWnUpdateOne(SqlSessionTemplate sqlSession, int wid) {
		return sqlSession.selectOne("Webnovel.selectWnUpdateOne", wid);
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
	

}
