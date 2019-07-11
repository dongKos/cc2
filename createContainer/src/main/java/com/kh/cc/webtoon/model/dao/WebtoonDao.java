package com.kh.cc.webtoon.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

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
	
	int updateRoundWp1(SqlSessionTemplate sqlSession, WebtoonPhoto wp1);


	int updateWorkRound(SqlSessionTemplate sqlSession, WebtoonRound wr);

	WebtoonRound content(SqlSessionTemplate sqlSession, int rid);

	Webtoon content1(SqlSessionTemplate sqlSession, int wid);

	ArrayList<Webtoon> genreList(SqlSessionTemplate sqlSession, WebtoonPageInfo pi,  Webtoon wt);

	int genreListCount(SqlSessionTemplate sqlSession, Webtoon wt);

	int updateComp(SqlSessionTemplate sqlSession, Webtoon wt3);

	int updateRest(SqlSessionTemplate sqlSession, Webtoon wt);

	int completeListCount(SqlSessionTemplate sqlSession, Webtoon wt);

	ArrayList<Webtoon> completeListCount(SqlSessionTemplate sqlSession, WebtoonPageInfo pi, Webtoon wt);

	ArrayList<Webtoon> monList(SqlSessionTemplate sqlSession);

	ArrayList<Webtoon> tuesList(SqlSessionTemplate sqlSession);

	ArrayList<Webtoon> wedList(SqlSessionTemplate sqlSession);

	ArrayList<Webtoon> thurList(SqlSessionTemplate sqlSession);

	ArrayList<Webtoon> friList(SqlSessionTemplate sqlSession);

	ArrayList<Webtoon> satList(SqlSessionTemplate sqlSession);

	ArrayList<Webtoon> sunList(SqlSessionTemplate sqlSession);

	ArrayList<Webtoon> newList(SqlSessionTemplate sqlSession);

	int challengeListCount(SqlSessionTemplate sqlSession);

	ArrayList<Webtoon> topList(SqlSessionTemplate sqlSession);

	int anothorListCount(SqlSessionTemplate sqlSession, int wid);

	ArrayList<Webtoon> anthorWork(SqlSessionTemplate sqlSession, WebtoonPageInfo pi, Webtoon wt);

	int attentionWork(SqlSessionTemplate sqlSession, Webtoon wt);

	int challengeListCount(SqlSessionTemplate sqlSession, Webtoon wt);

	ArrayList<Webtoon> challengeList(SqlSessionTemplate sqlSession, WebtoonPageInfo pi, Webtoon wt);
	//도전 장르 리스트 카운트
	int WebtoonGenreCount(SqlSessionTemplate sqlSession, Webtoon wt);
	//도전 장르 리스트
	ArrayList<HashMap<String, Object>> WebtoonGenreList(SqlSessionTemplate sqlSession, Webtoon wt,
			WebtoonPageInfo pi);

	ArrayList<Webtoon> WebtoonNewChallenge(SqlSessionTemplate sqlSession, Webtoon wt);



	



}
