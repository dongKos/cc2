package com.kh.cc.webtoon.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webtoon.model.vo.Webtoon;
import com.kh.cc.webtoon.model.vo.WebtoonPageInfo;
import com.kh.cc.webtoon.model.vo.WebtoonPhoto;
import com.kh.cc.webtoon.model.vo.WebtoonRound;

public interface WebtoonDao {

	int insertWebtoon(SqlSessionTemplate sqlSession, Webtoon wt);

	 int insertWtPhoto(SqlSessionTemplate sqlSession, WebtoonPhoto wp);

	int selectListCount(SqlSessionTemplate sqlSession, Member m);

	ArrayList<Webtoon> selectWtList(SqlSessionTemplate sqlSession, WebtoonPageInfo pi, Member m);

	int insertWorkRound(SqlSessionTemplate sqlSession, WebtoonRound wr);

	int insertRoundThumbnail(SqlSessionTemplate sqlSession, WebtoonPhoto wp);

	int insertRoundMain(SqlSessionTemplate sqlSession, WebtoonPhoto wp1);

	int selectWrList(SqlSessionTemplate sqlSession, int wid);

	ArrayList<WebtoonRound> selectWtRoundList(SqlSessionTemplate sqlSession, WebtoonPageInfo pi, Webtoon wt);

	Webtoon selectMainPhoto(SqlSessionTemplate sqlSession, int wid);

	Webtoon selectWork(SqlSessionTemplate sqlSession, int wid);

	int updateWorkWt(SqlSessionTemplate sqlSession, Webtoon wt);

	int updateWorkWp(SqlSessionTemplate sqlSession, WebtoonPhoto wp);

	int updateWork(SqlSessionTemplate sqlSession, Webtoon wt);

	WebtoonRound selectOneRound(SqlSessionTemplate sqlSession, int rid);

	ArrayList<WebtoonPhoto> selectOneRoundPhoto(SqlSessionTemplate sqlSession, int rid);

	int updateRoundWr(SqlSessionTemplate sqlSession, WebtoonRound wr);

	int updateRoundWp(SqlSessionTemplate sqlSession, WebtoonPhoto wp);

	int updateWorkRound(SqlSessionTemplate sqlSession, WebtoonRound wr);


	



}
