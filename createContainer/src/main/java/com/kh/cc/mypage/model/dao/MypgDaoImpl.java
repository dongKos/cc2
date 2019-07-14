package com.kh.cc.mypage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cc.admin.model.vo.Board;
import com.kh.cc.admin.model.vo.Refund;
import com.kh.cc.approval.model.vo.Approval;
import com.kh.cc.member.model.vo.Member;
import com.kh.cc.mypage.model.vo.PaymentCC;
import com.kh.cc.mypage.model.vo.Support;
import com.kh.cc.mypage.model.vo.WriterPhoto;
import com.kh.cc.mypage.model.vo.WriterProfile;
import com.kh.cc.mypage.model.vo.WriterPhoto;
import com.kh.cc.mypage.model.vo.WriterProfile;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;
import com.kh.cc.mypage.model.vo.Closed;

@Repository
public class MypgDaoImpl implements MypgDao{
	//암호화된 비밀번호 조회용
	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.selectPwd", m.getUserId());
	}
	
	@Override
	public Member updateMember(SqlSessionTemplate sqlSession, Member m) {
		Member nmem;
		nmem = sqlSession.selectOne("Member.updateMember", m);
		nmem = sqlSession.selectOne("Member.selectLoginUser", m);
		
		return nmem;
		
	}
	
	@Override
	public Webnovel selectWork(SqlSessionTemplate sqlSession, int wid) {
		return sqlSession.selectOne("Mypage.selectWork", wid);
	}
	//작품회차 카운팅
	@Override
	public int countRound(SqlSessionTemplate sqlSession, int wid) {
		return sqlSession.selectOne("Mypage.countRound", wid);
	}
	@Override
	public String getChangeName(SqlSessionTemplate sqlSession, int wid) {
		return sqlSession.selectOne("Mypage.getChangeName", wid);
	}
	
	
	//작가페이지 프로필설정
    
    //정보
    @Override
    public int updateWriterProfile(SqlSessionTemplate sqlSession, WriterProfile mp) {
       
       //System.out.println("dao접근성공??");
       //System.out.println(mp);
       return sqlSession.update("WriterProfile.updateIntro", mp);
    }
    //사진
    @Override
    
    public int insertWriterPhoto(SqlSessionTemplate sqlSession, WriterPhoto mphoto) {
       System.out.println("사진 dao 접근성공");
       return sqlSession.insert("WriterProfile.writerInformation", mphoto);
    }
    
    //삭제
    @Override
    public int deletePhoto(SqlSessionTemplate sqlSession, String userId) {
       int result = sqlSession.delete("WriterProfile.deletePhoto", userId);
       System.out.println("dao result " + result);
       return result;
    }

    @Override
    public String deletePhotoPath(SqlSessionTemplate sqlSession, String userId) {
       return sqlSession.selectOne("WriterProfile.deletePhotoPath", userId);
    }
    //코인환불
    @Override
    public int refundReq(SqlSessionTemplate sqlSession, Refund refund) {
    	return sqlSession.insert("Mypage.refundReq",refund);
    }
    //코인충전리스트
    @Override
    public ArrayList coinChargeList(SqlSessionTemplate sqlSession, int mno) {
    	return (ArrayList) sqlSession.selectList("Mypage.coinChargeList", mno);
    }
//코인 사용 리스트
    @Override
    public ArrayList coinUseList(SqlSessionTemplate sqlSession, int mno) {
    	return (ArrayList) sqlSession.selectList("Mypage.coinUseList", mno);
    }
    //신고내역
    @Override
    public ArrayList showReportPage(SqlSessionTemplate sqlSession, int mno) {
    	return (ArrayList) sqlSession.selectList("Mypage.showReportPage", mno);
    }
    //탈퇴
 @Override
 public int resign(SqlSessionTemplate sqlSession, int mno) {

    
    return sqlSession.update("WriterProfile.resignMember", mno);
 }
 
 
 //프로필설정(왼쪽 사진 바꾸기)
 @Override
 public String selectPhoto(SqlSessionTemplate sqlSession, Member m) {
	 String changeName = sqlSession.selectOne("WriterProfile.selectMember", m.getUserId());
	 if(changeName == null) {
		 return "defaultProfile.jpg";
	 }else {
    return changeName;
	 }
 }
//관심작품 목록
@Override
public ArrayList attentionListWt(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Member m) {
	int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
	
	RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
	return (ArrayList) sqlSession.selectList("Mypage.attentionListWt", m.getUserId(), rowBounds);
}
//관심작품 목록(웹소설)
@Override
public ArrayList attentionListWn(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Member m) {
 int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
 
 RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
 return (ArrayList) sqlSession.selectList("Mypage.attentionListWn", m.getUserId(), rowBounds);
}

//관심작가 목록(웹툰)
@Override
public ArrayList attentionArtistWt(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Member m) {
	int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
	
	RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
	
	return (ArrayList) sqlSession.selectList("Mypage.attentionArtistWt", m.getUserId(), rowBounds);
}

//관심작가 목록(웹소설)
@Override
public ArrayList attentionWnArtist(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Member m) {
	int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
	
	RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
	
	return (ArrayList) sqlSession.selectList("Mypage.attentionWnArtist", m.getUserId(), rowBounds);
}

//관심작가 목록(일러스트)
@Override
public ArrayList attentionWlArtist(SqlSessionTemplate sqlSession, WebnovelPageInfo pi, Member m) {
int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
	
	RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
	
	return (ArrayList) sqlSession.selectList("Mypage.attentionWlArtist", m.getUserId(), rowBounds);
}

@Override
public int countProfilePic(SqlSessionTemplate sqlSession, WriterProfile mp) {
	return sqlSession.selectOne("Mypage.countProfilePic", mp.getUserId());
}
//결제완료
@Override
public int payComplete(SqlSessionTemplate sqlSession, PaymentCC pc) {
 int result1 = sqlSession.insert("Mypage.payComplete", pc);
 int result2 = sqlSession.update("Mypage.updateCoin", pc);
 int result3 = sqlSession.update("Mypage.coinCharge", pc);
 if(result1 > 0) {
    if(result2 > 0) {
       return result2;
    }
 }
  return 0;
}
 //유료작품신청 인서트
 @Override
 public int insertDocument(SqlSessionTemplate sqlSession, Member m, WriterPhoto file1, WriterPhoto file2, Approval appro) {
    file1.setUserId(m.getUserId());
    file2.setUserId(m.getUserId());
    int result = sqlSession.insert("Mypage.insertDocu", file1);
    if(result > 0) {
    int result2 = sqlSession.insert("Mypage.insertDocu", file1);
       if(result2 > 0) {
          int result3 = sqlSession.insert("Mypage.insertApproval", appro);
          if(result3 > 0) {
             int result4 = sqlSession.update("Mypage.updateWork", appro);
             return result4;
          }
    }
    
 }
    return 0;
 
 }
 //후원insert
 @Override
 public int insertSupport(SqlSessionTemplate sqlSession, Member m, WriterPhoto mphoto, Support sp) {
    
    mphoto.setUserId(m.getUserId());
    sp.setUserId(m.getUserId());

    int result = sqlSession.insert("Mypage.insertSupport", mphoto);
    if(result >0) {
       
       int result2 = sqlSession.insert("Mypage.insertSupportContent",sp);
       return result2;
    }
    return 0;
 }
 //일대일 문의 insert
 @Override
 public int insertMtmQue(SqlSessionTemplate sqlSession, Board board) {
    return sqlSession.insert("Mypage.insertMtmQue", board);
 }
 
 
	 //내 문의내역
	 @Override
	 public ArrayList<Board> showQue(SqlSessionTemplate sqlSession, String userId) {
	    ArrayList list = (ArrayList) sqlSession.selectList("Mypage.showQue", userId);
	    return list;
	 }
	//휴재신청insert
	@Override
	public int insertClosed(SqlSessionTemplate sqlSession, Closed c) {
	  System.out.println("c : " + c);
	  return sqlSession.insert("Mypage.insertClosed", c);
	}
	//맴버가져오기
	@Override
	public Member selectMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("Member.selectLoginUser", userId);
	}
	//일러스트 요청 목록
	@Override
	public ArrayList showReqIllust(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList) sqlSession.selectList("Mypage.showReqIllust", userId);
	}
}