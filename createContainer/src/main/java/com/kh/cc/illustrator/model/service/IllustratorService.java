package com.kh.cc.illustrator.model.service;


import java.util.ArrayList;

import com.kh.cc.illustrator.model.vo.Illustrator;
import com.kh.cc.illustrator.model.vo.IllustratorPageInfo;
import com.kh.cc.illustrator.model.vo.IllustratorPhoto;

public interface IllustratorService {

	//일러스트 포트폴리오 작품 등록
	int insertIllustratorPortfolio(Illustrator ill, IllustratorPhoto ip, IllustratorPhoto ip1, IllustratorPhoto ip2, IllustratorPhoto ip3, IllustratorPhoto ip4);
	
	//일러스트 포틀폴리오 작품 리스트 카운트
	int selectListCount();

	//일러스트 포트폴리오 작품 리스트 조회
	ArrayList<Illustrator> selectIllPortfolioList(IllustratorPageInfo pi, Illustrator ill);

	//일러스트 도전하기 작품 등록
	int insertIllustratorChallenge(Illustrator ill, IllustratorPhoto ip, IllustratorPhoto ip1, IllustratorPhoto ip2, IllustratorPhoto ip3, IllustratorPhoto ip4);

	int selectChallengeListCount();

	ArrayList<Illustrator> selectIllChallengeList(IllustratorPageInfo pi, Illustrator ill);


	


	
}
