package com.kh.cc.illustrator.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cc.illustrator.model.vo.Illustrator;
import com.kh.cc.illustrator.model.vo.IllustratorPhoto;

@Repository
public class IllustratorDaoImpl implements IllustratorDao{
	
	//작품등록 메소드
	@Override
	public int insertIllustrator(SqlSessionTemplate sqlSession, Illustrator ill) {
		return sqlSession.insert("Illustrator.insertIllustrator", ill);
	}
	
	//작품 사진 등록 메소드
	@Override
	public int insertIllPhoto(SqlSessionTemplate sqlSession, IllustratorPhoto ip, IllustratorPhoto ip1,
			IllustratorPhoto ip2, IllustratorPhoto ip3, IllustratorPhoto ip4) {
			System.out.println(ip);
		int result1 = sqlSession.insert("Illustrator.insertIllMainPhoto", ip);
		int result2 = sqlSession.insert("Illustrator.insertIllPhoto", ip1);
		int result3 = sqlSession.insert("Illustrator.insertIllPhoto", ip2);
		int result4 = sqlSession.insert("Illustrator.insertIllPhoto", ip3);
		int result5 = sqlSession.insert("Illustrator.insertIllPhoto", ip4);
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0 && result5 > 0) {
			return 1;
		}else {
			return 0;
		}
			
	}

}