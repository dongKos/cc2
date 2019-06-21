package com.kh.cc.webnovel.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.cc.webnovel.model.vo.Webnovel;

public interface WebnovelDao {
	//작품등록 메소드
	int insertWebnovel(SqlSessionTemplate sqlSession, Webnovel wn);


}
