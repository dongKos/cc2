package com.kh.cc.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cc.member.model.vo.Member;

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
}
