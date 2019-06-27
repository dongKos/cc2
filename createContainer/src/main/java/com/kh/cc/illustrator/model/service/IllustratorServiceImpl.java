package com.kh.cc.illustrator.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cc.illustrator.model.dao.IllustratorDao;
import com.kh.cc.illustrator.model.vo.Illustrator;
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
	
	
	
}
