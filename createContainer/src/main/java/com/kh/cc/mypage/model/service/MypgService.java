package com.kh.cc.mypage.model.service;

import javax.servlet.http.HttpSession;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.mypage.model.exception.MypgException;

public interface MypgService {

	int checkPwd(Member m) throws MypgException;

	Member updateMember(Member m);


}
