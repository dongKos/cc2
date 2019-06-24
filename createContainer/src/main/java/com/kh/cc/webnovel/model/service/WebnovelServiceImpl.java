package com.kh.cc.webnovel.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.webnovel.model.dao.WebnovelDao;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;
import com.kh.cc.webnovel.model.vo.WebnovelPhoto;

@Service
public class WebnovelServiceImpl implements WebnovelService{
	
	@Autowired
	private WebnovelDao wd;
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	//작품 등록 메소드
	@Override
	public int insertWebnovel(Webnovel wn, WebnovelPhoto wp) {
		int result = 0;
		
		int result1 = wd.insertWebnovel(sqlSession, wn);
		int result2 = wd.insertWnPhoto(sqlSession, wp);
		
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}
	//웹소설 메인 수정(사진 수정 O)
	@Override
	public int updateWebnovel(Webnovel wn, WebnovelPhoto wp) {
		int result = 0;
		
		int result1 = wd.updateWebnovel(sqlSession, wn);
		int result2 = wd.updateWnPhoto(sqlSession, wp);
		
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}
	//웹소설 메인 수정(사진 수정 X)
	@Override
	public int updateWebnovel(Webnovel wn) {
		int result = wd.updateWebnovel(sqlSession, wn);
		return result;
	}
	//웹소설 메인 목록 카운트
	@Override
	public int selectListCount(Member m) {
		return wd.selectListCount(sqlSession, m);
	}
	//웹소설 메인 목록 리스트
	@Override
	public ArrayList<Webnovel> selectWnList(WebnovelPageInfo pi, Member m) {
		return wd.selectWnList(sqlSession, pi, m);
	}
	//웹소설 수정폼 이동
	@Override
	public Webnovel selectWnUpdateOne(int wid) {
		return wd.selectWnUpdateOne(sqlSession, wid);
	}
	

}
