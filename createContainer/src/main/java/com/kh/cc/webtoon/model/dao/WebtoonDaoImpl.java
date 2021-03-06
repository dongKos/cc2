package com.kh.cc
.webtoon.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webtoon.model.vo.Webtoon;
import com.kh.cc.webtoon.model.vo.WebtoonPageInfo;
import com.kh.cc.webtoon.model.vo.WebtoonPhoto;
import com.kh.cc.webtoon.model.vo.WebtoonReply;
import com.kh.cc.webtoon.model.vo.WebtoonReport;
import com.kh.cc.webtoon.model.vo.WebtoonRound;
import com.kh.cc.webtoon.model.vo.WebtoonStarPoint;

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

	@Override
	public Webtoon content1(SqlSessionTemplate sqlSession, int wid) {
		return sqlSession.selectOne("Webtoon.content1", wid);
	}

	@Override
	public ArrayList<Webtoon> genreList(SqlSessionTemplate sqlSession, WebtoonPageInfo pi, Webtoon wt) {
		
		ArrayList<Webtoon> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Webtoon.genreList",wt, rowBounds);
		
		return list;
	}

	@Override
	public int genreListCount(SqlSessionTemplate sqlSession, Webtoon wt) {
		return sqlSession.selectOne("Webtoon.genreListCount", wt);
	}

	@Override
	public int updateComp(SqlSessionTemplate sqlSession, Webtoon wt3) {
		return sqlSession.update("Webtoon.updateComp", wt3);
	}

	@Override
	public int updateRest(SqlSessionTemplate sqlSession, Webtoon wt) {
		return sqlSession.update("Webtoon.updateRest", wt);
	}

	@Override
	public int completeListCount(SqlSessionTemplate sqlSession, Webtoon wt) {
		System.out.println("완결 리스트카운트 dao옴");
		return sqlSession.selectOne("Webtoon.completeListCount", wt);
	}

	@Override
	public ArrayList<Webtoon> completeListCount(SqlSessionTemplate sqlSession, WebtoonPageInfo pi, Webtoon wt) {
		System.out.println("완결리스트 받으러 dao옴");
		ArrayList<Webtoon> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Webtoon.completeList",wt, rowBounds);
		
		return list;
	}

	@Override
	public ArrayList<Webtoon> monList(SqlSessionTemplate sqlSession) {
		ArrayList<Webtoon> list = null;
		list = (ArrayList) sqlSession.selectList("Webtoon.monList");
		return list; }
	@Override
	public ArrayList<Webtoon> tuesList(SqlSessionTemplate sqlSession) {
		ArrayList<Webtoon> list = null;
		list = (ArrayList) sqlSession.selectList("Webtoon.tuesList");
		return list; }
	@Override
	public ArrayList<Webtoon> wedList(SqlSessionTemplate sqlSession) {
		ArrayList<Webtoon> list = null;
		list = (ArrayList) sqlSession.selectList("Webtoon.wedList");
		return list; }
	@Override
	public ArrayList<Webtoon> thurList(SqlSessionTemplate sqlSession) {
		ArrayList<Webtoon> list = null;
		list = (ArrayList) sqlSession.selectList("Webtoon.thurList");
		return list; }
	@Override
	public ArrayList<Webtoon> friList(SqlSessionTemplate sqlSession) {
		ArrayList<Webtoon> list = null;
		list = (ArrayList) sqlSession.selectList("Webtoon.friList");
		return list; }
	@Override
	public ArrayList<Webtoon> satList(SqlSessionTemplate sqlSession) {
		ArrayList<Webtoon> list = null;
		list = (ArrayList) sqlSession.selectList("Webtoon.satList");
		return list; }
	@Override
	public ArrayList<Webtoon> sunList(SqlSessionTemplate sqlSession) {
		ArrayList<Webtoon> list = null;
		list = (ArrayList) sqlSession.selectList("Webtoon.sunList");
		return list; }

	@Override
	public ArrayList<Webtoon> newList(SqlSessionTemplate sqlSession) {
		ArrayList<Webtoon> list = null;
		list = (ArrayList) sqlSession.selectList("Webtoon.newList");
		return list;
	}

	@Override
	public int challengeListCount(SqlSessionTemplate sqlSession) {
		return 0;
	}

	@Override
	public ArrayList<Webtoon> topList(SqlSessionTemplate sqlSession) {
		ArrayList<Webtoon> topList = null;
		topList = (ArrayList) sqlSession.selectList("Webtoon.top5");
		return topList;
	}

	@Override
	public int anothorListCount(SqlSessionTemplate sqlSession, int wid) {
		return sqlSession.selectOne("Webtoon.anthorListCount", wid);
	}

	@Override
	public ArrayList<Webtoon> anthorWork(SqlSessionTemplate sqlSession, WebtoonPageInfo pi, Webtoon wt) {
		ArrayList<Webtoon> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Webtoon.anthorWork", wt, rowBounds);
		
		return list;
	}

	@Override
	public int attentionWork(SqlSessionTemplate sqlSession, Webtoon wt) {
		return sqlSession.insert("Webtoon.insertAttention",wt);
	}

	@Override
	public int challengeListCount(SqlSessionTemplate sqlSession, Webtoon wt) {
		return sqlSession.selectOne("Webtoon.challengeListCount", wt);
	}

	@Override
	public ArrayList<Webtoon> challengeList(SqlSessionTemplate sqlSession, WebtoonPageInfo pi, Webtoon wt) {
		ArrayList<Webtoon> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Webtoon.challengeList", wt, rowBounds);
				
		
		return list;
	}
	//도전 장르 리스트 카운트
	@Override
	public int WebtoonGenreCount(SqlSessionTemplate sqlSession, Webtoon wt) {
		int result = sqlSession.selectOne("Webtoon.WebtoonGenreCount", wt);
		return result;
	}
	//도전 장르 리스트
	@Override
	public ArrayList<HashMap<String, Object>> WebtoonGenreList(SqlSessionTemplate sqlSession, Webtoon wt, WebtoonPageInfo pi) {
		ArrayList<HashMap<String, Object>> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		System.out.println("장르리스트 wt : " + wt);
		list = (ArrayList) sqlSession.selectList("Webtoon.WebtoonGenreList", wt, rowBounds);
		System.out.println("Daolist : " + list);
		
		return list;
	}

	@Override
	public ArrayList<Webtoon> WebtoonNewChallenge(SqlSessionTemplate sqlSession, Webtoon wt) {
		ArrayList<Webtoon> newList = null;
		
		newList = (ArrayList) sqlSession.selectList("Webtoon.WebtoonNewChallenge", wt);
		
		return newList;
	}

	@Override
	public int premiumListCount(SqlSessionTemplate sqlSession, Webtoon wt) {
		return sqlSession.selectOne("Webtoon.premiumListCount", wt);
				
	}

	@Override
	public ArrayList<Webtoon> totalList(SqlSessionTemplate sqlSession, WebtoonPageInfo pi, Webtoon wt) {
		ArrayList<Webtoon> totalList = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		totalList = (ArrayList) sqlSession.selectList("Webtoon.totalList", wt, rowBounds);
				
		
		return totalList;
	}

	@Override
	public int insertWorkReport(SqlSessionTemplate sqlSession, WebtoonReport wtre) {
		return sqlSession.insert("Webtoon.insertWorkReport", wtre);
	}

	@Override
	public int insertWebtoonReply(SqlSessionTemplate sqlSession, WebtoonReply wtReply) {
		return sqlSession.insert("Webtoon.insertWebtoonReply", wtReply);
	}

	@Override
	public int webtoonReplyListCount(SqlSessionTemplate sqlSession, WebtoonReply wtReply) {
		return sqlSession.selectOne("Webtoon.webtoonReplyListCount", wtReply);
	}

	@Override
	public ArrayList<WebtoonReply> selectReplyList(SqlSessionTemplate sqlSession,  WebtoonPageInfo pi, WebtoonReply wtReply) {
		ArrayList<WebtoonReply> replyList = null;

		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		replyList = (ArrayList) sqlSession.selectList("Webtoon.replyList", wtReply, rowBounds);

		return replyList;
	}

	@Override
	public int insertStarPoint(SqlSessionTemplate sqlSession, WebtoonStarPoint wsp) {
		return sqlSession.insert("Webtoon.webtoonStarPoint", wsp);
	}

	

	

	

	

	
}



















