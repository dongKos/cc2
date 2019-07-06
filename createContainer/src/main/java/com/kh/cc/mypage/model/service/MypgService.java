package com.kh.cc.mypage.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.kh.cc.approval.model.vo.Approval;
import com.kh.cc.illustrator.model.vo.Support;
import com.kh.cc.member.model.vo.Member;
import com.kh.cc.mypage.model.exception.MypgException;
import com.kh.cc.mypage.model.vo.PaymentCC;
import com.kh.cc.mypage.model.vo.WriterPhoto;
import com.kh.cc.mypage.model.vo.WriterProfile;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;
import com.kh.cc.webnovel.model.vo.WebnovelPhoto;

public interface MypgService {

	int checkPwd(Member m) throws MypgException;

	Member updateMember(Member m);
	
	//프로필설정
   int insertWriterProfile(WriterProfile mp, WriterPhoto mphoto);
	   
	   
	//프로필 삭제
   int deletePhoto(String userId);

   String deletePhotoPath(String userId);

   Webnovel selectWork(int wid);

	int countRound(int wid);

	String getChangeName(int wid);
	//유료작품 신청 인서트
	int insertDocument(Member m, WriterPhoto file1, WriterPhoto file2, Approval appro);
	//결제완료
	int payComplete(PaymentCC pc);
	//탈퇴
	int resign(int mno);
	   
	//프로필설정(왼쪽 사진 바꾸기)
	String selectPhoto(Member m);
	
	//관심작품 목록
	ArrayList attentionListWt(WebnovelPageInfo pi, Member m);
	//관심작품 목록(웹소설)
	ArrayList attentionListWn(WebnovelPageInfo pi, Member m);
	//관심작가 목록(웹툰)
	ArrayList attentionArtistWt(WebnovelPageInfo pi, Member m);
	//관심작가 목록(웹소설)
	ArrayList attentionWnArtist(WebnovelPageInfo pi, Member m);
	//관심작가 목록(일러스트)
	ArrayList attentionWlArtist(WebnovelPageInfo pi, Member m);
	//작가프로필사진 카운트
	int countProfilePic(WriterProfile mp);
	//후원insert
	int insertSupport(Member m, WriterPhoto mphoto, Support sp);
		
}











