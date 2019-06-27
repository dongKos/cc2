package com.kh.cc.mypage.model.service;

import javax.servlet.http.HttpSession;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.mypage.model.exception.MypgException;
import com.kh.cc.mypage.model.vo.WriterPhoto;
import com.kh.cc.mypage.model.vo.WriterProfile;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelPhoto;

public interface MypgService {

	int checkPwd(Member m) throws MypgException;

	Member updateMember(Member m);
	
	//프로필설정
	int insertWriterProfile(WriterProfile mp, WriterPhoto mphoto);

}
