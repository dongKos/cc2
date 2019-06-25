package com.kh.cc.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.mypage.model.vo.MypgPhoto;
import com.kh.cc.mypage.model.vo.MypgProfile;

public interface MypgDao {

	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);

	Member updateMember(SqlSessionTemplate sqlSession, Member m);

	int insertmypgProfile(SqlSessionTemplate sqlSession, MypgProfile mp);

	int insertmypgPhoto(SqlSessionTemplate sqlSession, MypgPhoto mphoto);

}
