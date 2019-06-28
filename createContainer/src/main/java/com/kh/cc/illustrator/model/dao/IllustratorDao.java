package com.kh.cc.illustrator.model.dao;


import org.mybatis.spring.SqlSessionTemplate;

import com.kh.cc.illustrator.model.vo.Illustrator;
import com.kh.cc.illustrator.model.vo.IllustratorPhoto;

public interface IllustratorDao {
	
	//작품등록 메소드
	int insertIllustrator(SqlSessionTemplate sqlSession, Illustrator ill);
	
	//작품사진 등록 메소드
	int insertIllPhoto(SqlSessionTemplate sqlSession, IllustratorPhoto ip, IllustratorPhoto ip1, IllustratorPhoto ip2,
			IllustratorPhoto ip3, IllustratorPhoto ip4);

	int selectIllPortfolioList(SqlSessionTemplate sqlSession);
	
	
	


}
