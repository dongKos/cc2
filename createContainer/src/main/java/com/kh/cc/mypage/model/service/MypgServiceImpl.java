package com.kh.cc.mypage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.mypage.model.dao.MypgDao;
import com.kh.cc.mypage.model.exception.MypgException;
import com.kh.cc.mypage.model.vo.WriterPhoto;
import com.kh.cc.mypage.model.vo.WriterProfile;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;

@Service
public class MypgServiceImpl implements MypgService{

	@Autowired 
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MypgDao md;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public int checkPwd(Member m) throws MypgException {
		int result = 0;
		
		String encPassword = md.selectEncPassword(sqlSession, m);
		
		if(!passwordEncoder.matches(m.getUserPwd(), encPassword)) {
			throw new MypgException("비밀번호가 틀립니다!");
		}else {
			result = 1;
		}
		
		return result;
	}

	@Override
	public Member updateMember(Member m) {
		Member upm;
		
		upm = md.updateMember(sqlSession, m);
		return upm;
	}
	//작품 정보 가져오기
	@Override
	public Webnovel selectWork(int wid) {
		
		return md.selectWork(sqlSession, wid);
	}
	//작품회차 카운팅
	@Override
	public int countRound(int wid) {
		return md.countRound(sqlSession, wid);
	}
	@Override
	public String getChangeName(int wid) {
		return md.getChangeName(sqlSession, wid);
	}
	
	
	
	
	
	   //소희
    //작가페이지 - 프로필설정
    @Override
    public int insertWriterProfile(WriterProfile mp, WriterPhoto mphoto) {
       System.out.println("서비스포토" + mphoto);
       
       int result = 0;
       System.out.println("서비스 접근 성공");
       int result1 = md.updateWriterProfile(sqlSession, mp);
       int result2 = md.insertWriterPhoto(sqlSession, mphoto);
       //int result3 = md.deletePhoto(sqlSession,mp.getUserId());
       //System.out.println("service result3" + result3);
       //System.out.println("photo접근");
       //if(result1 > 0 && result2 > 0) {
       //   result = 1;
       //}else {
       //   result = 0;
       //}
       //System.out.println("result1 : " + result1);
       System.out.println("result2 : " + result2);
       return result2;
    }
    
    //작가페이지 - 프로필 삭제
    @Override
    public int deletePhoto(String userId) {
       int result = md.deletePhoto(sqlSession,userId);
       
       
       return result;
    }

    @Override
    public String deletePhotoPath(String userId) {
       String cpath = md.deletePhotoPath(sqlSession, userId);
       return cpath;
    }
    
    
    //탈퇴
 @Override
 public int resign(int mno) {

    return md.resign(sqlSession, mno);
 }
 //프로필설정(왼쪽 사진 바꾸기)
 @Override
 public String selectPhoto(Member m) {

    
    return md.selectPhoto(sqlSession, m);
 }
//관심작품 목록
@Override
public ArrayList attentionListWt(WebnovelPageInfo pi, Member m) {
	
	return md.attentionListWt(sqlSession,pi, m);
}


//관심작가 목록(웹툰)
@Override
public ArrayList attentionArtistWt(WebnovelPageInfo pi, Member m) {

	return md.attentionArtistWt(sqlSession,pi, m);
}
//관심작가 목록(웹소설)
public ArrayList attentionWnArtist(WebnovelPageInfo pi, Member m) {

	return md.attentionWnArtist(sqlSession,pi, m);
}
//관심작가 목록(일러스트)
public ArrayList attentionWlArtist(WebnovelPageInfo pi, Member m) {

	return md.attentionWlArtist(sqlSession,pi, m);
}

}

