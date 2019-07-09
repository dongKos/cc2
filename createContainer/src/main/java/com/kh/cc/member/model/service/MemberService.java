package com.kh.cc.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.cc.member.model.exception.LoginException;
import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;

public interface MemberService {
	//로그인용 메소드
	Member loginMember(Member m) throws LoginException;
	
	//회원가입용 메소드
	int insertMember(Member m);
	
	//메인 공지사항
	ArrayList<HashMap<String, Object>> selectmainNotice(WebnovelPageInfo pi, Webnovel wn);

}
