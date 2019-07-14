package com.kh.cc.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cc.member.model.exception.LoginException;
import com.kh.cc.member.model.vo.Member;

@Repository 

public class MemberDaoImpl implements MemberDao{
	
	//로그인용 메소드
	@Override
	public Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginException {
		Member loginUser = sqlSession.selectOne("Member.loginCheck", m);
		
		if(loginUser == null) {
			throw new LoginException("로그인 정보가 존재하지 않습니다.");
		}
		
		return loginUser;
	}
	
	//회원가입용 메소드
	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("Member.insertMember", m);
	}
	//암호화된 비밀번호 조회용
	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.selectPwd", m.getUserId());
	}
	//비밀번호 일치 시 회원정보 조회용 메소드
	@Override
	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.selectLoginUser", m);
	}

	@Override
	public int selectCheckId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.selectCheckId", m);
	}

	@Override
	public int duplicationCheckNick(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.duplicationCheckNick", m);
	}


}
