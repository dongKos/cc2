package com.kh.cc.webtoon.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webtoon.model.vo.Webtoon;
import com.kh.cc.webtoon.model.vo.WebtoonPageInfo;
import com.kh.cc.webtoon.model.vo.WebtoonPhoto;

public interface WebtoonDao {

	int insertWebtoon(SqlSessionTemplate sqlSession, Webtoon wt);

	 int insertWtPhoto(SqlSessionTemplate sqlSession, WebtoonPhoto wp);

	int selectListCount(SqlSessionTemplate sqlSession, Member m);

	ArrayList<Webtoon> selectWtList(SqlSessionTemplate sqlSession, WebtoonPageInfo pi, Member m);


}
