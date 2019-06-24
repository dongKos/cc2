package com.kh.cc.webtoon.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cc.webtoon.model.dao.WebtoonDao;
import com.kh.cc.webtoon.model.vo.Webtoon;
import com.kh.cc.webtoon.model.vo.WebtoonPhoto;

@Service
public class WebtoonServiceImpl implements WebtoonService{
	
	@Autowired
	private WebtoonDao wd;
	@Autowired
	private SqlSessionTemplate sqlSession;

	//작품등록 메소드
	@Override
	public int insertWebtoon(Webtoon wt, WebtoonPhoto wp) {
		System.out.println("웹툰서비스 Impl 들어옴");
		int result = 0;
		
		int result1 = wd.insertWebtoon(sqlSession, wt);
		System.out.println("리저트1" + result1);
		int result2 = wd.insertWtPhoto(sqlSession, wp);
		System.out.println("리저트2" + result2);
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}

}
