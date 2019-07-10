package com.kh.cc.illustrator.model.service;


import java.util.ArrayList;

import com.kh.cc.illustrator.model.vo.IllReq;
import com.kh.cc.illustrator.model.vo.Illustrator;
import com.kh.cc.illustrator.model.vo.IllustratorPageInfo;
import com.kh.cc.illustrator.model.vo.IllustratorPhoto;

public interface IllustratorService {

	//일러스트 포트폴리오 작품 등록
	int insertIllustratorPortfolio(Illustrator ill, IllustratorPhoto ip, IllustratorPhoto ip1, IllustratorPhoto ip2, IllustratorPhoto ip3, IllustratorPhoto ip4);
	
	//일러스트 포트폴리오 작품 리스트 카운트
	int selectListCount();

	//일러스트 포트폴리오 작품 리스트 조회
	ArrayList<Illustrator> selectIllPortfolioList(IllustratorPageInfo pi, Illustrator ill);

	//일러스트 도전하기 작품 등록
	int insertIllustratorChallenge(Illustrator ill, IllustratorPhoto ip, IllustratorPhoto ip1, IllustratorPhoto ip2, IllustratorPhoto ip3, IllustratorPhoto ip4);

	//일러스트 도전하기 작품 리스트 카운트
	int selectChallengeListCount();

	//일러스트 도전하기 작품 리스트 조회
	ArrayList<Illustrator> selectIllChallengeList(IllustratorPageInfo pi, Illustrator ill);

	//일러스트 포트폴리오 상세페이지 조회
	ArrayList<Illustrator> selectIllPortfolioDetail(Illustrator ill);

	//일러스트 도전하기 상세페이지 조회
	ArrayList<Illustrator> selectIllChallengeDetail(Illustrator ill);

	//일러스트 작가 상세페이지 조회
	ArrayList<Illustrator> selectIllustratorDetail(Illustrator ill);

	//일러스트 후원페이지 목록 조회
	ArrayList<Illustrator> selectIllSupportList(Illustrator ill);

	//일러스트 후원 상세페이지 조회
	ArrayList<Illustrator> selectIllSupportDetail(Illustrator ill);

	//일러스트 의뢰하기 조회
	ArrayList<Illustrator> selectIllRequest(Illustrator ill);

	//일러스트 후원하기 리워드 조회
	ArrayList<Illustrator> selectIllSupportReward(Illustrator ill);

	//일러스트 도전하기 추천 카운트 업데이트
	int updateRecommendCount(int illCode);

	//일러스트 의뢰하기 신청
	int IllRequest(IllReq illReq);
	


	


	
}
