package com.kh.cc.webtoon.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cc.webtoon.model.vo.Webtoon;
import com.kh.cc.webtoon.model.vo.WebtoonPhoto;

@Repository
public class WebtoonDaoImpl implements WebtoonDao {

	//작품등록 메소드
	@Override
	public int insertWebtoon(SqlSessionTemplate sqlSession, Webtoon wt) {
		System.out.println("웹툰 등록 DaoImpl들어옴");
		return sqlSession.insert("Webtoon.insertWebtoon",wt);
	}

	//작품 메인사진 등록
	@Override
	public int insertWtPhoto(SqlSessionTemplate sqlSession, WebtoonPhoto wp) {
		System.out.println("웹툰 메인사진 DaoImpl들어옴");
		return sqlSession.insert("Webtoon.insertWtPhoto",wp);
	}

}
