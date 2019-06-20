package com.kh.cc.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.cc.member.model.exception.LoginException;
import com.kh.cc.member.model.vo.Member;

public interface MemberDao {
	//로그인용 메소드
	Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginException;
	
	//회원가입용 메소드
	int insertMember(SqlSessionTemplate sqlSession, Member m);
	//로그인용 메소드
	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);
	//로그인용 메소드
	Member selectMember(SqlSessionTemplate sqlSession, Member m);

}
