package com.kh.cc.webnovel.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cc.webnovel.model.vo.Webnovel;
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
	@Override
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Webnovel.selectListCount");
	}

}
