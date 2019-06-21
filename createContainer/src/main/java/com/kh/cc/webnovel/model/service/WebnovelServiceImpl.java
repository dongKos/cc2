package com.kh.cc.webnovel.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cc.webnovel.model.dao.WebnovelDao;
import com.kh.cc.webnovel.model.vo.Webnovel;

@Service
public class WebnovelServiceImpl implements WebnovelService{
	
	@Autowired
	private WebnovelDao wd;
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	//작품 등록 메소드
	@Override
	public int insertWebnovel(Webnovel wn) {
//		int result = 0;
//		
//		int result1 = wd.insertWebnovel(sqlSession, wn);
//		
//		if(result1 > 0) {
//			result = 1;
//		}else {
//			result = 0;
//		}
//		
//		return result;
		return wd.insertWebnovel(sqlSession, wn);
	}

}
