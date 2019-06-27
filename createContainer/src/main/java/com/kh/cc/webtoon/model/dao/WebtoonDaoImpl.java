package com.kh.cc
.webtoon.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webtoon.model.vo.Webtoon;
import com.kh.cc.webtoon.model.vo.WebtoonPageInfo;
import com.kh.cc.webtoon.model.vo.WebtoonPhoto;
import com.kh.cc.webtoon.model.vo.WebtoonRound;

@Repository
public class WebtoonDaoImpl implements WebtoonDao {

	//웹툰 작품 등록
	@Override
	public int insertWebtoon(SqlSessionTemplate sqlSession, Webtoon wt) {
		return sqlSession.insert("Webtoon.insertWebtoon", wt);

	}

	//웹툰 작품에 들어갈 사진 인서트
	@Override
	public int insertWtPhoto(SqlSessionTemplate sqlSession, WebtoonPhoto wp) {
		return sqlSession.insert("Webtoon.insertWtPhoto", wp);

	}

	//웹툰 작품리스트
	@Override
	public int selectListCount(SqlSessionTemplate sqlSession, Member m) {
		System.out.println("웹툰 작품 리스트카운트 조회Dao들어옴");
		return sqlSession.selectOne("Webtoon.selectListCount", m.getUserId());
	}

	@Override
	public ArrayList<Webtoon> selectWtList(SqlSessionTemplate sqlSession, WebtoonPageInfo pi, Member m) {
		System.out.println("웹툰작품 리스트조회Dao");
		ArrayList<Webtoon> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Webtoon.selectWtList", m.getUserId(), rowBounds);
		
		return list;
	}

	//회차등록
	@Override
	public int insertWorkRound(SqlSessionTemplate sqlSession, WebtoonRound wr) {
		System.out.println("회차 dao");
		return sqlSession.insert("Webtoon.insertRound", wr);
	}

	//회차 썸내일 등록
	@Override
	public int insertRoundThumbnail(SqlSessionTemplate sqlSession, WebtoonPhoto wp) {
		System.out.println("썸내일 dao");
		return sqlSession.insert("Webtoon.insertRoundThumbnail", wp);
	}

	//회차 내용사진
	@Override
	public int insertRoundMain(SqlSessionTemplate sqlSession, WebtoonPhoto wp1) {
		System.out.println("내용 사진 dao");
		return sqlSession.insert("Webtoon.insertRoundMain", wp1);
	}

	

	
}



















