package com.kh.cc.mypage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.mypage.model.dao.MypgDao;
import com.kh.cc.mypage.model.exception.MypgException;
import com.kh.cc.mypage.model.vo.WriterPhoto;
import com.kh.cc.mypage.model.vo.WriterProfile;

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
	
	
	
	
	
	//소희
	//작가페이지 - 프로필설정
	@Override
	public int insertWriterProfile(WriterProfile mp, WriterPhoto mphoto) {

		int result = 0;
		System.out.println("서비스 접근 성공");
		int result1 = md.updateWriterProfile(sqlSession, mp);
		int result2 = md.insertWriterPhoto(sqlSession, mphoto);
		
		System.out.println("photo접근");
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		System.out.println("result1 : " + result1);
		return result;
	}
}
