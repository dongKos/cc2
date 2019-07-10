package com.kh.cc.illustrator.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cc.illustrator.model.dao.IllustratorDao;
import com.kh.cc.illustrator.model.vo.IllReq;
import com.kh.cc.illustrator.model.vo.Illustrator;
import com.kh.cc.illustrator.model.vo.IllustratorPageInfo;
import com.kh.cc.illustrator.model.vo.IllustratorPhoto;

@Service
public class IllustratorServiceImpl implements IllustratorService{
	@Autowired
	private IllustratorDao id;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//작품 등록 메소드
	@Override
	public int insertIllustratorPortfolio(Illustrator ill, IllustratorPhoto ip, IllustratorPhoto ip1,
			IllustratorPhoto ip2, IllustratorPhoto ip3, IllustratorPhoto ip4) {
		System.out.println("Service로 접근성공");
		
		int result = 0;
		
		int result1 = id.insertIllustrator(sqlSession, ill);
		int result2 = id.insertIllPhoto(sqlSession, ip, ip1, ip2, ip3, ip4);
		
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
		
	}

	//일러스트 포트폴리오 리스트 카운트
	@Override
	public int selectListCount() {
		System.out.println("ListCount 서비스로 넘어옴?");
		return id.selectIllPortfolioListCount(sqlSession);
	}

	//일러스트 포트폴리오 리스트 조회
	@Override
	public ArrayList<Illustrator> selectIllPortfolioList(IllustratorPageInfo pi, Illustrator ill) {
		return id.selectIllPortfolioList(sqlSession, pi, ill);
	}

	//일러스트 도전하기 글등록
	@Override
	public int insertIllustratorChallenge(Illustrator ill, IllustratorPhoto ip, IllustratorPhoto ip1, IllustratorPhoto ip2, IllustratorPhoto ip3, IllustratorPhoto ip4) {
		int result = 0;
		
		int result1 = id.insertIllustratorChallenge(sqlSession, ill);
		int result2 = id.insertIllPhoto(sqlSession, ip, ip1, ip2, ip3, ip4);
		
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}

	//일러스트 도전하기 리스트 카운트
	@Override
	public int selectChallengeListCount() {
		return id.selectIllChallengeListCount(sqlSession);
	}

	//일러스트 도전하기 리스트 조회
	@Override
	public ArrayList<Illustrator> selectIllChallengeList(IllustratorPageInfo pi, Illustrator ill) {
		return id.selectIllChallengeList(sqlSession, pi, ill);
	}

	//일러스트 포트폴리오 상세페이지 조회
	@Override
	public ArrayList<Illustrator> selectIllPortfolioDetail(Illustrator ill) {
		System.out.println("상세페이지 서비스로 넘어옴?");
		
		return id.selectIllPortfolioDetail(sqlSession, ill);
	}

	//일러스트 도전하기 상세페이지 조회
	@Override
	public ArrayList<Illustrator> selectIllChallengeDetail(Illustrator ill) {
		System.out.println("service : " + ill);
		return id.selectIllChallengeDetail(sqlSession, ill);
	}

	//일러스트 작가 상세페이지 조회
	@Override
	public ArrayList<Illustrator> selectIllustratorDetail(Illustrator ill) {
		System.out.println("Service 작가상세페이지로 넘어옴 ");
		return id.selectIllustratorDetail(sqlSession, ill);
	}

	//일러스트 후원페이지 목록 조회
	@Override
	public ArrayList<Illustrator> selectIllSupportList(Illustrator ill) {
		
		return id.selectIllSupportList(sqlSession, ill);
	}

	
	//일러스트 후원상세페이지 조회
	@Override
	public ArrayList<Illustrator> selectIllSupportDetail(Illustrator ill) {
		
		return id.selectIllSupportDetail(sqlSession, ill);
	}

	//일러스트 후원하기 리워드 조회
	@Override
	public ArrayList<Illustrator> selectIllSupportReward(Illustrator ill) {
		
		return id.selectIllSupportReward(sqlSession, ill);
	}
	
	
	//일러스트 도전하기 추천수 증가
	@Override
	public int updateRecommendCount(int ill) {
		return id.updateRecommendCount(sqlSession, ill);
	}
	
	//일러스트 의뢰하기 조회
	@Override
	public ArrayList<Illustrator> selectIllRequest(Illustrator ill) {
		// TODO Auto-generated method stub
		return id.selectIllRequest(sqlSession, ill);
	}

	
	//일러스트 의뢰하기 신청
	@Override
	public int IllRequest(IllReq illReq) {
		return id.IllRequest(sqlSession, illReq);
	}
	


	
	
	


	

	
	
	
	
}
