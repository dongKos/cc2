package com.kh.cc.webnovel.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cc.webnovel.model.vo.Webnovel;

@Repository
public class WebnovelDaoImpl implements WebnovelDao{
	//작품등록 메소드
	@Override
	public int insertWebnovel(SqlSessionTemplate sqlSession, Webnovel wn) {
		
		System.out.println("여기까지는 접근 하나여??");
		return sqlSession.insert("Webnovel.insertWebnovel", wn);
	}

}
