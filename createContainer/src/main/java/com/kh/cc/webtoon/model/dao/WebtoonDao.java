package com.kh.cc.webtoon.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.cc.webtoon.model.vo.Webtoon;
import com.kh.cc.webtoon.model.vo.WebtoonPhoto;

public interface WebtoonDao {

	int insertWebtoon(SqlSessionTemplate sqlSession, Webtoon wt);

	int insertWtPhoto(SqlSessionTemplate sqlSession, WebtoonPhoto wp);

}
