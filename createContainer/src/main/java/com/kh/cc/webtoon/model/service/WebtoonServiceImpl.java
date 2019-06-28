package com.kh.cc.webtoon.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webtoon.model.dao.WebtoonDao;
import com.kh.cc.webtoon.model.vo.Webtoon;
import com.kh.cc.webtoon.model.vo.WebtoonPageInfo;
import com.kh.cc.webtoon.model.vo.WebtoonPhoto;
import com.kh.cc.webtoon.model.vo.WebtoonRound;

@Service
public class WebtoonServiceImpl implements WebtoonService{
	
	@Autowired
	private WebtoonDao wd;
	@Autowired
	private SqlSessionTemplate sqlSession;

	//작품등록 메소드
	@Override
	public int insertWebtoon(Webtoon wt, WebtoonPhoto wp) {
		int result = 0;
		
		int result1 = wd.insertWebtoon(sqlSession, wt);
		
		int result2 = wd.insertWtPhoto(sqlSession, wp);
		
		
		if (result1 > 0 && result2 > 0) {
			result = 1;
		} else {
			result = 0;
		}
		 
		return result;
	}

	//작품등록전 기존에있던 작품 리스트 조회
	@Override
	public int selectListCount(Member m) {
		System.out.println("작품리스트카운트 서비스 들어옴");
		return wd.selectListCount(sqlSession, m);
	}

	@Override
	public ArrayList<Webtoon> selectWtList(WebtoonPageInfo pi, Member m) {
		System.out.println("작품 리스트조회 서비스 ");
		return wd.selectWtList(sqlSession,pi,m);
	}


	//회차 등록
	@Override
	public int insertWorkRound(WebtoonRound wr, WebtoonPhoto wp, WebtoonPhoto wp1) {
		int result = 0;
		
		int result1 = wd.insertWorkRound(sqlSession, wr);
		
		int result2 = wd.insertRoundThumbnail(sqlSession, wp);
		
		int result3 = wd.insertRoundMain(sqlSession, wp1);
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
		
	}

	@Override
	public int selectListCount(WebtoonRound wr) {
		System.out.println("회차 리스트 조회 서비스");
		return wd.selectWrList(sqlSession, wr);
	}

	

	

	

}
