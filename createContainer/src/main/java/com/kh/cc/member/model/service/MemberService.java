package com.kh.cc.member.model.service;

import com.kh.cc.member.model.exception.LoginException;
import com.kh.cc.member.model.vo.Member;

public interface MemberService {
	//로그인용 메소드
	Member loginMember(Member m) throws LoginException;
	
	//회원가입용 메소드
	int insertMember(Member m);

}
