package com.kh.cc.illustrator.model.dao;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.cc.illustrator.model.vo.Illustrator;
import com.kh.cc.illustrator.model.vo.IllustratorPageInfo;
import com.kh.cc.illustrator.model.vo.IllustratorPhoto;

public interface IllustratorDao {
	
	//일러스트 포트폴리오 작품등록 메소드
	int insertIllustrator(SqlSessionTemplate sqlSession, Illustrator ill);
	
	//일러스트 포트폴리오 작품사진 등록 메소드
	int insertIllPhoto(SqlSessionTemplate sqlSession, IllustratorPhoto ip, IllustratorPhoto ip1, IllustratorPhoto ip2, IllustratorPhoto ip3, IllustratorPhoto ip4);

	//일러스트 포트폴리오 리스트 카운트
	int selectIllPortfolioListCount(SqlSessionTemplate sqlSession);

	//일러스트 포트폴리오 리스트 조회
	ArrayList<Illustrator> selectIllPortfolioList(SqlSessionTemplate sqlSession, IllustratorPageInfo pi, Illustrator ill);

	//일러스트 도전하기 작품등록 메소드
	int insertIllustratorChallenge(SqlSessionTemplate sqlSession, Illustrator ill);

	//일러스트 도전하기 리스트 카운트
	int selectIllChallengeListCount(SqlSessionTemplate sqlSession);

	//일러스트 도전하기 리스트 조회
	ArrayList<Illustrator> selectIllChallengeList(SqlSessionTemplate sqlSession, IllustratorPageInfo pi,
			Illustrator ill);

	//일러스트 포트폴리오 상세페이지 조회
	ArrayList<Illustrator> selectIllPortfolioDetail(SqlSessionTemplate sqlSession, Illustrator ill);

	//일러스트 도전하기 상세페이지 조회
	ArrayList<Illustrator> selectIllChallengeDetail(SqlSessionTemplate sqlSession, Illustrator ill);

	//일러스트 작가 상세페이지 조회
	ArrayList<Illustrator> selectIllustratorDetail(SqlSessionTemplate sqlSession, Illustrator ill);

	//일러스트 후원 리스트 조회
	ArrayList<Illustrator> selectIllSupportList(SqlSessionTemplate sqlSession, Illustrator ill);
	
	//일러스트 후원 상세페이지 조회
	ArrayList<Illustrator> selectIllSupportDetail(SqlSessionTemplate sqlSession, Illustrator ill);

	//일러스트 의뢰하기 조회
	ArrayList<Illustrator> selectIllRequest(SqlSessionTemplate sqlSession, Illustrator ill);
	
	//일러스트 후원하기 리워드 조회
	ArrayList<Illustrator> selectIllSupportReward(SqlSessionTemplate sqlSession, Illustrator ill);

	//일러스트 도전하기 추천수 증가
	int updateRecommendCount(SqlSessionTemplate sqlSession, int ill);
	

	
	
	
	


}
