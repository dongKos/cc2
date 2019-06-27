package com.kh.cc.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.mypage.model.vo.WriterPhoto;
import com.kh.cc.mypage.model.vo.WriterProfile;
import com.kh.cc.mypage.model.vo.WriterPhoto;
import com.kh.cc.mypage.model.vo.WriterProfile;
import com.kh.cc.webnovel.model.vo.Webnovel;

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
	
	
	//작가페이지 프로필설정
	
	
	@Override
	public int updateWriterProfile(SqlSessionTemplate sqlSession, WriterProfile mp) {
		
		System.out.println("dao접근성공??");
		System.out.println(mp);
		return sqlSession.update("WriterProfile.updateIntro", mp);
	}
	
	@Override
	public int insertWriterPhoto(SqlSessionTemplate sqlSession, WriterPhoto mphoto) {
		return sqlSession.insert("mypage.writerInformation", mphoto);
	}
}
