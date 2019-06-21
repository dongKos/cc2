package com.kh.cc.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.cc.member.model.vo.Member;

public interface MypgDao {

	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);

}
