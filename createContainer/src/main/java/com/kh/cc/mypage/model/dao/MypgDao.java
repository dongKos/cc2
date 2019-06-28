package com.kh.cc.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.mypage.model.vo.WriterProfile;
import com.kh.cc.mypage.model.vo.WriterProfile;
import com.kh.cc.mypage.model.vo.WriterPhoto;
import com.kh.cc.mypage.model.vo.WriterProfile;

public interface MypgDao {

	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);

	Member updateMember(SqlSessionTemplate sqlSession, Member m);

	//작가페이지 프로필 설정
	   int updateWriterProfile(SqlSessionTemplate sqlSession, WriterProfile mp);

	   int insertWriterPhoto(SqlSessionTemplate sqlSession, WriterPhoto mphoto);

	   int deletePhoto(SqlSessionTemplate sqlSession, String userId);

	   String deletePhotoPath(SqlSessionTemplate sqlSession, String userId);

}
