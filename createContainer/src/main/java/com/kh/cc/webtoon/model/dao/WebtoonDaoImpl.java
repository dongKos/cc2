package com.kh.cc.webtoon.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webtoon.model.vo.Webtoon;
import com.kh.cc.webtoon.model.vo.WebtoonPhoto;

@Repository
public class WebtoonDaoImpl implements WebtoonDao {

	//웹툰 작품 등록
	@Override
	public int insertWebtoon(SqlSessionTemplate sqlSession, Webtoon wt) {
		System.out.println("웹툰 등록 DaoImpl들어옴");
		System.out.println("wt : " + wt);
		return sqlSession.insert("Webtoon.insertWebtoon", wt);

	}

	//웹툰 작품에 들어갈 사진 인서트
	@Override
	public int insertWtPhoto(SqlSessionTemplate sqlSession, WebtoonPhoto wp) {
		System.out.println("웹툰 메인사진 DaoImpl들어옴");
		System.out.println("wp : " + wp);
		return sqlSession.insert("Webtoon.insertWtPhoto", wp);

	}

	//웹툰 작품리스트
	@Override
	public int selectListCount(SqlSessionTemplate sqlSession, Member m) {
		System.out.println("웹툰 작품 리스트 조회Dao들어옴");
		return sqlSession.selectOne("Webtoon.selectListCount", m.getUserId());
	}

}
