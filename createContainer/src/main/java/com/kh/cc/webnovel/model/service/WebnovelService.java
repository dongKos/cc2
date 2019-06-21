package com.kh.cc.webnovel.model.service;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelPhoto;

public interface WebnovelService {
	
	//작품 등록 메소드
	int insertWebnovel(Webnovel wn, WebnovelPhoto wp);
	
	//전체 목록 카운트
	int selectListCount(Member m);

}
