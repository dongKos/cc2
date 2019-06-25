package com.kh.cc.mypage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.mypage.model.dao.MypgDao;
import com.kh.cc.mypage.model.exception.MypgException;
import com.kh.cc.mypage.model.vo.MypgPhoto;
import com.kh.cc.mypage.model.vo.MypgProfile;

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
	@Override
	public int insertmypgProfile(MypgProfile mp, MypgPhoto mphoto) {

		int result = 0;
		
		int result1 = md.insertmypgProfile(sqlSession, mp);
		int result2 = md.insertmypgPhoto(sqlSession, mphoto);
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}
}
