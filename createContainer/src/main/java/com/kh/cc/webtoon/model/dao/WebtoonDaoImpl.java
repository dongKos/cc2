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

	@Override
	public int selectWrList(SqlSessionTemplate sqlSession, int wid) {
		System.out.println("회차 리스트 조회 DAO");
		System.out.println("wr : " + wid);
		return sqlSession.selectOne("Webtoon.selectWrListCount", wid);
	}

	@Override
	public ArrayList<WebtoonRound> selectWtRoundList(SqlSessionTemplate sqlSession, WebtoonPageInfo pi,
			Webtoon wt) {

		ArrayList<WebtoonRound> list = null;

		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		System.out.println("회차 리스트 받아오기 dao");
		System.out.println("wt : " + wt);
		
		list = (ArrayList) sqlSession.selectList("Webtoon.selectWrList", wt,rowBounds);
				
		
		return list;
	}

	@Override
	public Webtoon selectMainPhoto(SqlSessionTemplate sqlSession, int wid) {
		return sqlSession.selectOne("Webtoon.selectMainPhoto", wid);
	}

	@Override
	public Webtoon selectWork(SqlSessionTemplate sqlSession, int wid) {
		return sqlSession.selectOne("Webtoon.selectWork",wid);
	}

	@Override
	public int updateWorkWt(SqlSessionTemplate sqlSession, Webtoon wt) {
		return sqlSession.update("Webtoon.updateWorkWt", wt);
	}

	@Override
	public int updateWorkWp(SqlSessionTemplate sqlSession, WebtoonPhoto wp) {
		return sqlSession.update("Webtoon.updateWorkWp", wp);
	}

	@Override
	public int updateWork(SqlSessionTemplate sqlSession, Webtoon wt) {
		System.out.println("사진수정없을 dao");
		return sqlSession.update("Webtoon.updateWorkWt", wt);
	}

	@Override
	public WebtoonRound selectOneRound(SqlSessionTemplate sqlSession, int rid) {
		System.out.println("회차 수정폼 이동 dao");
		return sqlSession.selectOne("Webtoon.selectOneRound",rid);
	}

	@Override
	public ArrayList<WebtoonPhoto> selectOneRoundPhoto(SqlSessionTemplate sqlSession, int rid) {
		
		ArrayList<WebtoonPhoto> list = null;
		
		list = (ArrayList) sqlSession.selectList("Webtoon.selectOneRoundPhoto", rid);
		
		return list;
	}

	@Override
	public int updateRoundWr(SqlSessionTemplate sqlSession, WebtoonRound wr) {
		return sqlSession.update("Webtoon.updateRoundWr", wr);
	}

	@Override
	public int updateRoundWp(SqlSessionTemplate sqlSession, WebtoonPhoto wp) {
		return sqlSession.update("Webtoon.updateRoundWp", wp);
	}

	@Override
	public int updateWorkRound(SqlSessionTemplate sqlSession, WebtoonRound wr) {
		return sqlSession.update("Webtoon.updateRoundWr", wr);
	}

	@Override
	public int updateRoundWp1(SqlSessionTemplate sqlSession, WebtoonPhoto wp1) {
		return sqlSession.update("Webtoon.updateRoundWp", wp1);
	}



	@Override
	public WebtoonRound content(SqlSessionTemplate sqlSession, int rid) {
		return sqlSession.selectOne("Webtoon.content", rid); 
	}

	

	

	

	
}



















