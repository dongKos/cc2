package com.kh.cc.mypage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.cc.admin.model.vo.Board;
import com.kh.cc.admin.model.vo.Refund;
import com.kh.cc.approval.model.vo.Approval;
import com.kh.cc.member.model.vo.Member;
import com.kh.cc.mypage.model.dao.MypgDao;
import com.kh.cc.mypage.model.exception.MypgException;
import com.kh.cc.mypage.model.vo.PaymentCC;
import com.kh.cc.mypage.model.vo.Support;
import com.kh.cc.mypage.model.vo.WriterPhoto;
import com.kh.cc.mypage.model.vo.WriterProfile;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;
import com.kh.cc.mypage.model.vo.Closed;

@Service
public class MypgServiceImpl implements MypgService{

	@Autowired 
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MypgDao md;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public int checkPwd(Member m) throws MypgException {
		int result = 0;
		
		String encPassword = md.selectEncPassword(sqlSession, m);
		
		if(!passwordEncoder.matches(m.getUserPwd(), encPassword)) {
			throw new MypgException("비밀번호가 틀립니다!");
		}else {
			result = 1;
		}
		
		return result;
	}

	@Override
	public Member updateMember(Member m) {
		Member upm;
		
		upm = md.updateMember(sqlSession, m);
		return upm;
	}
	//작품 정보 가져오기
	@Override
	public Webnovel selectWork(int wid) {
		
		return md.selectWork(sqlSession, wid);
	}
	//작품회차 카운팅
	@Override
	public int countRound(int wid) {
		return md.countRound(sqlSession, wid);
	}
	@Override
	public String getChangeName(int wid) {
		return md.getChangeName(sqlSession, wid);
	}
//유료작품 신청 인서트
	@Override
	public int insertDocument(Member m, WriterPhoto file1, WriterPhoto file2, Approval appro) {
		return md.insertDocument(sqlSession, m, file1, file2, appro);
	}
//결제완료
	@Override
	public int payComplete(PaymentCC pc) {
		return md.payComplete(sqlSession, pc);
	}
//코인환불신청
	@Override
	public int refundReq(Refund refund) {
		return md.refundReq(sqlSession, refund);
	}
	//코인충전리스트
	@Override
	public ArrayList coinChargeList(int mno) {
		return md.coinChargeList(sqlSession, mno);
	}
	//신고 내역
	@Override
	public ArrayList showReportPage(int mno) {
		return md.showReportPage(sqlSession, mno);
	}
	//코인 사용내역
	@Override
	public ArrayList coinUseList(int mno) {
		return md.coinUseList(sqlSession, mno);
	}
	
	
	
	
	
	
	   //소희
    //작가페이지 - 프로필설정
    @Override
    public int insertWriterProfile(WriterProfile mp, WriterPhoto mphoto) {
       System.out.println("서비스포토" + mphoto);
       
       int result = 0;
       System.out.println("서비스 접근 성공");
       int result1 = md.updateWriterProfile(sqlSession, mp);
       int result2 = md.insertWriterPhoto(sqlSession, mphoto);
       //int result3 = md.deletePhoto(sqlSession,mp.getUserId());
       //System.out.println("service result3" + result3);
       //System.out.println("photo접근");
       //if(result1 > 0 && result2 > 0) {
       //   result = 1;
       //}else {
       //   result = 0;
       //}
       //System.out.println("result1 : " + result1);
       System.out.println("result2 : " + result2);
       return result2;
    }
    
    //작가페이지 - 프로필 삭제
    @Override
    public int deletePhoto(String userId) {
       int result = md.deletePhoto(sqlSession,userId);
       
       
       return result;
    }

    @Override
    public String deletePhotoPath(String userId) {
       String cpath = md.deletePhotoPath(sqlSession, userId);
       return cpath;
    }
    
    
    //탈퇴
 @Override
 public int resign(int mno) {

    return md.resign(sqlSession, mno);
 }
 //프로필설정(왼쪽 사진 바꾸기)
 @Override
 public String selectPhoto(Member m) {

    
    return md.selectPhoto(sqlSession, m);
 }
//관심작품 목록
@Override
public ArrayList attentionListWt(WebnovelPageInfo pi, Member m) {
	
	return md.attentionListWt(sqlSession,pi, m);
}
//관심작품 목록(웹소설)
@Override
public ArrayList attentionListWn(WebnovelPageInfo pi, Member m) {

 return md.attentionListWn(sqlSession,pi, m);
}


//관심작가 목록(웹툰)
@Override
public ArrayList attentionArtistWt(WebnovelPageInfo pi, Member m) {

	return md.attentionArtistWt(sqlSession,pi, m);
}
//관심작가 목록(웹소설)
public ArrayList attentionWnArtist(WebnovelPageInfo pi, Member m) {

	return md.attentionWnArtist(sqlSession,pi, m);
}
//관심작가 목록(일러스트)
public ArrayList attentionWlArtist(WebnovelPageInfo pi, Member m) {

	return md.attentionWlArtist(sqlSession,pi, m);
}
//작가프로필 사진 카운트
@Override
public int countProfilePic(WriterProfile mp) {
	return md.countProfilePic(sqlSession, mp);
}
	
	//후원 insert
	   @Override
	   public int insertSupport(Member m, WriterPhoto mphoto, Support sp) {
	    return md.insertSupport(sqlSession, m, mphoto, sp);
	}
	   //insert 일대일문의
	   @Override
	   public int insertMtmQue(Board board) {
	      
	      return md.insertMtmQue(sqlSession, board);
	   }
	   
	   
	   //내 문의 내역
	   @Override
	   public ArrayList<Board> showQue(String userId) {
	
	      return md.showQue(sqlSession, userId);
	   }
	 //휴재신청insert
	   @Override
	   public int insertClosed(Closed c) {
	
	      return md.insertClosed(sqlSession,c);
	   }

	@Override
	public Member selectMember(String userId) {
		return md.selectMember(sqlSession, userId);
	}

	@Override
	public ArrayList showReqIllust(String userId) {
		
		return md.showReqIllust(sqlSession, userId);
	}
	//휴재 내역 리스트
	@Override
	public ArrayList showClosedPage(int mno) {
		return md.showClosedPage(sqlSession, mno);
	}
	//일대일 상세
	@Override
	public Board getBoard(int bno) {
		return md.getBoard(sqlSession, bno);
	}
}

