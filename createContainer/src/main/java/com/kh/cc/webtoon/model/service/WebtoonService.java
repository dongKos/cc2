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




}
