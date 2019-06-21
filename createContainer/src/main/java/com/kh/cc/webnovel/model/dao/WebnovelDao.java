package com.kh.cc.webnovel.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelPhoto;

public interface WebnovelDao {
	//작품등록 메소드
	int insertWebnovel(SqlSessionTemplate sqlSession, Webnovel wn);
	//작품 메인 사진 등록 메소드
	int insertWnPhoto(SqlSessionTemplate sqlSession, WebnovelPhoto wp);
	//
	int selectListCount(SqlSessionTemplate sqlSession);


}
