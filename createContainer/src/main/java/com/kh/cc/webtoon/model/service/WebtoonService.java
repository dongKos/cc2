package com.kh.cc.webtoon.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webtoon.model.vo.Webtoon;
import com.kh.cc.webtoon.model.vo.WebtoonPageInfo;
import com.kh.cc.webtoon.model.vo.WebtoonPhoto;
import com.kh.cc.webtoon.model.vo.WebtoonRound;

public interface WebtoonService {

	int insertWebtoon(Webtoon wt, WebtoonPhoto wp);

	int selectListCount(Member m);

	ArrayList<Webtoon> selectWtList(WebtoonPageInfo pi, Member m);

	int insertWorkRound(WebtoonRound wr, WebtoonPhoto wp, WebtoonPhoto wp1);

	int selectListCount(int wid);

	ArrayList<WebtoonRound> selectWtRoundList(WebtoonPageInfo pi, Webtoon wt);

	Webtoon selectMainPhoto(int wid);

	Webtoon selectWork(int wid);

	int updateWork(Webtoon wt, WebtoonPhoto wp);

	int updateWork(Webtoon wt);

	WebtoonRound selectOneRound(int rid);

	ArrayList<WebtoonPhoto> selectOneRoundPhoto(int rid);

	int updateWorkRound(WebtoonRound wr, WebtoonPhoto wp);

	int updateWorkRound(WebtoonRound wr);

	int updateRoundWps(WebtoonRound wr, WebtoonPhoto wp, WebtoonPhoto wp1);

	WebtoonRound content(int rid);

	Webtoon content1(int wid);

	ArrayList<Webtoon> genreList (WebtoonPageInfo pi, Webtoon wt);

	int genreListCount(Webtoon wt);

	int updateComp(Webtoon wt3);

	int updateRest(Webtoon wt);

	int completeListCount(Webtoon wt);

	ArrayList<Webtoon> completeWtList(WebtoonPageInfo pi, Webtoon wt);

	ArrayList<Webtoon> monList();
	ArrayList<Webtoon> tuesList();
	ArrayList<Webtoon> wedList();
	ArrayList<Webtoon> thurList();
	ArrayList<Webtoon> friList();
	ArrayList<Webtoon> satList();
	ArrayList<Webtoon> sunList();

	ArrayList<Webtoon> newList();

	int challengeListCount();

	ArrayList<Webtoon> topList();

	int anothorListCount(int wid);

	ArrayList<Webtoon> anthorWork(WebtoonPageInfo pi, Webtoon wt);

	int attentionWork(Webtoon wt);

	int challengeListCount(Webtoon wt);

	ArrayList<Webtoon> challengeList(WebtoonPageInfo pi, Webtoon wt);
	//도전 장르 리스트 카운트
	int WebtoonGenreCount(Webtoon wt);
	//도전 장르 리스트 카운트
	ArrayList<HashMap<String, Object>> WebtoonGenreList(WebtoonPageInfo pi, Webtoon wt);

	ArrayList<Webtoon> newChallenge(Webtoon wt);




}
