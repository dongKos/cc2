package com.kh.cc.illustrator.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cc.admin.model.vo.Report;
import com.kh.cc.illustrator.model.vo.IllBoard;
import com.kh.cc.illustrator.model.vo.IllReq;
import com.kh.cc.illustrator.model.vo.Illustrator;
import com.kh.cc.illustrator.model.vo.IllustratorPageInfo;
import com.kh.cc.illustrator.model.vo.IllustratorPhoto;
import com.kh.cc.member.model.vo.Member;

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
	
	//일러스트 포트폴리오 리스트 카운트
	@Override
	public int selectIllPortfolioListCount(SqlSessionTemplate sqlSession) {
		System.out.println("dao로 넘어옴!");
		return sqlSession.selectOne("Illustrator.selectIllPortfolioListCount");
	}

	//일러스트 포트폴리오 리스트 조회
	@Override
	public ArrayList<Illustrator> selectIllPortfolioList(SqlSessionTemplate sqlSession, IllustratorPageInfo pi, Illustrator ill) {
		ArrayList<Illustrator> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Illustrator.selectIllPortfolioList", ill, rowBounds);
		
		return list;
	}

	//일러스트 도전하기 글등록 메소드
	@Override
	public int insertIllustratorChallenge(SqlSessionTemplate sqlSession, Illustrator ill) {
		return sqlSession.insert("Illustrator.insertIllustratorChallenge", ill);
	}

	//일러스트 도전하기 리스트 카운트
	@Override
	public int selectIllChallengeListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Illustrator.selectIllChallengeListCount");
	}

	//일러스트 도전하기 리스트 조회
	@Override
	public ArrayList<Illustrator> selectIllChallengeList(SqlSessionTemplate sqlSession, IllustratorPageInfo pi,
			Illustrator ill) {
		ArrayList<Illustrator> clist = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		clist = (ArrayList) sqlSession.selectList("Illustrator.selectIllChallengeList", ill, rowBounds);
		
		return clist;
	}

	//일러스트 포트폴리오 상세페이지 조회
	@Override
	public ArrayList<Illustrator> selectIllPortfolioDetail(SqlSessionTemplate sqlSession, Illustrator ill) {
		System.out.println("상세페이지 Dao로 넘어옴?");
		
		ArrayList<Illustrator> list = null;
		
		list = (ArrayList) sqlSession.selectList("Illustrator.selectIllPortfolioDetail", ill);
		
		System.out.println("상세페이지 Dao : " + list);
		
		return list;
	}

	//일러스트 도전하기 상세페이지 조회
	@Override
	public ArrayList<Illustrator> selectIllChallengeDetail(SqlSessionTemplate sqlSession, Illustrator ill) {
		System.out.println("dao ill : " + ill);
		
		ArrayList<Illustrator> clist = null;
		
		clist = (ArrayList) sqlSession.selectList("Illustrator.selectIllChallengeDetail", ill);
		
		System.out.println("Dao clist : " + clist);
		
		return clist;
	}

	//일러스트 작가페이지 상세 조회
	@Override
	public ArrayList<Illustrator> selectIllustratorDetail(SqlSessionTemplate sqlSession, Illustrator ill) {
		System.out.println("Dao 작가상세페이지로 넘어옴 ");
		ArrayList<Illustrator> ilist = null;
		
		ilist = (ArrayList) sqlSession.selectList("Illustrator.selectIllustratorDetail", ill);
		
		return ilist;
	}

	//일러스트 후원 리스트 조회
	@Override
	public ArrayList<Illustrator> selectIllSupportList(SqlSessionTemplate sqlSession, Illustrator ill) {
		ArrayList<Illustrator> slist = null;
		
		slist = (ArrayList) sqlSession.selectList("Illustrator.selectIllSupportList", ill);
		
		return slist;
	}

	//일러스트 후원 상세페이지 조회
	@Override
	public ArrayList<Illustrator> selectIllSupportDetail(SqlSessionTemplate sqlSession, Illustrator ill) {
		ArrayList<Illustrator> sdlist = null;
		
		sdlist = (ArrayList) sqlSession.selectList("Illustrator.selectIllSupportDetail", ill);
		
		
		return sdlist;
	}

	

	//일러스트 후원하기 리워드 조회
	@Override
	public ArrayList<Illustrator> selectIllSupportReward(SqlSessionTemplate sqlSession, Illustrator ill) {

		ArrayList<Illustrator> srlist = null;
		
		srlist = (ArrayList) sqlSession.selectList("Illustrator.selectIllSupportReward", ill);
		
		return srlist;
	}

	//일러스트 도전하기 증가
	@Override
	public int updateRecommendCount(SqlSessionTemplate sqlSession, int ill) {
		return sqlSession.update("Illustrator.updateRecommendCount", ill);
	}

	//일러스트 의뢰하기 조회
	@Override
	public ArrayList<Illustrator> selectIllRequest(SqlSessionTemplate sqlSession, Illustrator ill) {
		ArrayList<Illustrator> rlist = null;
		
		rlist = (ArrayList) sqlSession.selectList("Illustrator.selectIllRequest", ill);
		
		
		return rlist;
	}

	
	//일러스트 의뢰하기 신청
	@Override
	public int IllRequest(SqlSessionTemplate sqlSession, IllReq illReq) {
		return sqlSession.insert("Illustrator.InsertIllRequest", illReq);
	}

	@Override
	public int IllRequestCoin(SqlSessionTemplate sqlSession, String totalPrice, Member m) {
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("userId", m.getUserId());
		hmap.put("totalPrice", totalPrice);
		
		return sqlSession.update("Illustrator.IllRequestCoin", hmap);
	}

	//추천수 가져오기
	@Override
	public int selectRecommend(SqlSessionTemplate sqlSession, int illCode) {
		return sqlSession.selectOne("Illustrator.selectRecommend", illCode);
	}

	@Override
	public int insertSponsor(SqlSessionTemplate sqlSession, int sPrice, int mno, int sCode) {
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("sPrice", sPrice);
		hmap.put("mno", mno);
		hmap.put("sCode", sCode);
		
		
		return sqlSession.insert("Illustrator.insertSponsor", hmap);
	}

	//일러스트 신고하기
	@Override
	public int IllustReport(SqlSessionTemplate sqlSession, Report r) {
		return sqlSession.insert("Illustrator.insertReport", r);
	}

	@Override
	public ArrayList<Illustrator> selectIllChallengeRequest(SqlSessionTemplate sqlSession, Illustrator ill) {
		
		ArrayList<Illustrator> rclist = null;
		
		rclist = (ArrayList) sqlSession.selectList("Illustrator.selectIllChallengeRequest", ill);
		
		return rclist;
	}

	@Override
	public int insertIllBoard(SqlSessionTemplate sqlSession, IllBoard ib) {
		return sqlSession.insert("Illustrator.insertIllBoard", ib);
	}

	@Override
	public ArrayList<Illustrator> selectIllChallengeBoard(SqlSessionTemplate sqlSession, Illustrator ill) {
		System.out.println("상세페이지 Dao로 넘어옴?");
		
		ArrayList<Illustrator> list = null;
		
		list = (ArrayList) sqlSession.selectList("Illustrator.selectIllChallengeBoard", ill);
		
		System.out.println("상세페이지 Dao : " + list);
		
		return list;
	}

	@Override
	public ArrayList<Illustrator> selectIllBoard(SqlSessionTemplate sqlSession, IllBoard ib) {
		ArrayList<Illustrator> rlist = null;
		
		rlist = (ArrayList) sqlSession.selectList("Illustrator.selectIllBoard", ib);
		
		return rlist;
	}
	
	


	
	
	

}
