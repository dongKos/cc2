package com.kh.cc.mypage.model.service;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.mypage.model.exception.MypgException;

public interface MypgService {

	int checkPwd(Member m) throws MypgException;

}
