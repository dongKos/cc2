package com.kh.cc.webtoon.model.service;

import java.util.ArrayList;

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



}
