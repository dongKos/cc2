package com.kh.cc.mypage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.mypage.model.vo.WriterPhoto;
import com.kh.cc.mypage.model.vo.WriterProfile;
import com.kh.cc.mypage.model.vo.WriterPhoto;
import com.kh.cc.mypage.model.vo.WriterProfile;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;

@Repository
public class MypgDaoImpl implements MypgDao{
	//암호화된 비밀번호 조회용
	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.selectPwd", m.getUserId());
	}
	
	@Override
	public Member updateMember(SqlSessionTemplate sqlSession, Member m) {
		Member nmem;
		nmem = sqlSession.selectOne("Member.updateMember", m);
		nmem = sqlSession.selectOne("Member.selectLoginUser", m);
		
		return nmem;
		
	}
	
	@Override
	public Webnovel selectWork(SqlSessionTemplate sqlSession, int wid) {
		return sqlSession.selectOne("Mypage.selectWork", wid);
	}
	//작품회차 카운팅
	@Override
	public int countRound(SqlSessionTemplate sqlSession, int wid) {
		return sqlSession.selectOne("Mypage.countRound", wid);
	}
	@Override
	public String getChangeName(SqlSessionTemplate sqlSession, int wid) {
		return sqlSession.selectOne("Mypage.getChangeName", wid);
	}
	
	
	//작가페이지 프로필설정
    
    //정보
    @Override
    public int updateWriterProfile(SqlSessionTemplate sqlSession, WriterProfile mp) {
       
       //System.out.println("dao접근성공??");
       //System.out.println(mp);
       return sqlSession.update("WriterProfile.updateIntro", mp);
    }
    //사진
    @Override
    
    public int insertWriterPhoto(SqlSessionTemplate sqlSession, WriterPhoto mphoto) {
       System.out.println("사진 dao 접근성공");
       return sqlSession.insert("WriterProfile.writerInformation", mphoto);
    }
    
    //삭제
    @Override
    public int deletePhoto(SqlSessionTemplate sqlSession, String userId) {
       int result = sqlSession.delete("WriterProfile.deletePhoto", userId);
       System.out.println("dao result " + result);
       return result;
    }

    @Override
    public String deletePhotoPath(SqlSessionTemplate sqlSession, String userId) {
       return sqlSession.selectOne("WriterProfile.deletePhotoPath", userId);
    }
    
    
    //탈퇴
 @Override
 public int resign(SqlSessionTemplate sqlSession, int mno) {

    
    return sqlSession.update("WriterProfile.resignMember", mno);
 }
 
 
 //프로필설정(왼쪽 사진 바꾸기)
 @Override
 public String selectPhoto(SqlSessionTemplate sqlSession, Member m) {

    
    return sqlSession.selectOne("WriterProfile.selectMember", m.getUserId());
 }
//관심작품 목록
@Override
public ArrayList attentionListWt(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Member m) {
	int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
	
	RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
	return (ArrayList) sqlSession.selectList("Mypage.attentionListWt", m.getUserId(), rowBounds);
}


	   
	   
}