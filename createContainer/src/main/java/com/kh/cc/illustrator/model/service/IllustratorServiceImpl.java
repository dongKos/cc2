package com.kh.cc.illustrator.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cc.illustrator.model.dao.IllustratorDao;
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

	@Override
	public int selectChallengeListCount() {
		// TODO Auto-generated method stub
		return id.selectIllChallengeListCount(sqlSession);
	}

	@Override
	public ArrayList<Illustrator> selectIllChallengeList(IllustratorPageInfo pi, Illustrator ill) {
		// TODO Auto-generated method stub
		return id.selectIllChallengeList(sqlSession, pi, ill);
	}
	
	


	

	
	
	
	
}
