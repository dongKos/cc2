
package com.kh.cc.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.cc.admin.model.vo.Board;
import com.kh.cc.admin.model.vo.Refund;
import com.kh.cc.approval.model.vo.Approval;
import com.kh.cc.common.CommonUtils;
import com.kh.cc.common.WebnovelPagination;
import com.kh.cc.common.WebtoonPagination;
import com.kh.cc.member.model.vo.Member;
import com.kh.cc.mypage.model.exception.MypgException;
import com.kh.cc.mypage.model.service.MypgService;
import com.kh.cc.mypage.model.vo.Closed;
import com.kh.cc.mypage.model.vo.Coin;
import com.kh.cc.mypage.model.vo.PaymentCC;
import com.kh.cc.mypage.model.vo.Support;
import com.kh.cc.mypage.model.vo.WriterPhoto;
import com.kh.cc.mypage.model.vo.WriterProfile;
import com.kh.cc.webnovel.model.service.WebnovelService;
import com.kh.cc.webnovel.model.vo.Webnovel;
import com.kh.cc.webnovel.model.vo.WebnovelPageInfo;
import com.kh.cc.webtoon.model.service.WebtoonService;
import com.kh.cc.webtoon.model.vo.Webtoon;
import com.kh.cc.webtoon.model.vo.WebtoonPageInfo;

@SessionAttributes("loginUser")
@Controller
public class MypgController {
	
	@Autowired
	private MypgService ms;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private WebnovelService ws;
	@Autowired
	private WebtoonService wts;
	
	
	
	//마이페이지 이동
	@RequestMapping("mypgMain.mg")
	public String showLoginForm() {
		return "member/mypage/mypage";
	}
	
	//CC 리스트 이동
	@RequestMapping("mypgCredit.mg")
	public String showCreditPage(HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model, Member m) {
		m = (Member) session.getAttribute("loginUser");
		ArrayList list = ms.coinChargeList(m.getMno());
		ArrayList list2 = ms.coinUseList(m.getMno());
		model.addAttribute("chargeList", list);
		model.addAttribute("useList", list2);
		return "member/mypage/mypageCredit";
	}
	//CC 페이지 - 충전
	@RequestMapping("mypgCreditCharge.mg")
	public String showCreditCharge() {
		return "member/mypage/mypageCreditCharge";
	}
	//개인정보관리 페이지이동 - 패스워드
	@RequestMapping("mypgInfoPass.mg")
	public String showInfoPassPage() {
		return "member/mypage/mypageInformationPass";
	}
	//개인정보관리 페이지이동
	@RequestMapping("mypgInfo.mg")
	public String showInfo(Member m, Model model, HttpSession session) {
		int result = 0;
		try {
			result = ms.checkPwd(m);
			
			if(result > 0) {
				
				return "member/mypage/mypageInformation";
			}else {
				
				return "redirect:index.jsp";
			}
			
		} catch (MypgException e) {
			model.addAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}
	}
	
	//ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
	   
	   
	   //개인정보관리 페이지이동(작가프로필 비번)
	   @RequestMapping("writerPgInfo.mg")
	   public String showWriterPgInfo(Member m, Model model, HttpSession session) {
	      int result = 0;
	      try {
	         result = ms.checkPwd(m);
	         
	         if(result > 0) {
	            
	            return "member/mypage/writerInformation";
	         }else {
	            
	            return "redirect:index.jsp";
	         }
	         
	      } catch (MypgException e) {
	         model.addAttribute("msg", e.getMessage());
	         
	         return "common/errorPage";
	      }
	   }
	   
	   
	   
	   //ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
	//개인정보 수정하는 기능
	@RequestMapping("memberUpdate2.mg")
	public String memberUpdate(Member m, Model model, HttpSession session, SessionStatus status) {
		Member upm;
		
		upm = ms.updateMember(m);
		status.setComplete();
		session.setAttribute("loginUser", upm);
		return "main/loginPage";
	}
	
	//회원탈퇴 페이지 이동
	@RequestMapping("mypgResign.mg")
	public String showResign() {
		return "member/mypage/mypageResign";
	}
	//작가페이지
	@RequestMapping("writerMain.mg")
	public String showWriter() {
		return "member/mypage/writerpage";
	}
	//작가페이지 - 작가프로필 비밀번호 확인
	@RequestMapping("writerInfoPass.mg")
	public String showWriterInfoPass() {
		return "member/mypage/WriterInformationPass";
	}
	//작가페이지 - 작가프로필
	@RequestMapping("writerInfo.mg")
	public String showWriterInfo() {
		return "member/mypage/writerInformation";
	}
	//작가페이지 - 유료작품 신청
	@RequestMapping("writerReqPremium2.mg")
	public String selectWnList(HttpServletRequest request, HttpSession session, Webnovel m, Member mm, Model model) {
		mm = (Member) session.getAttribute("loginUser");
		m.setUserId(mm.getUserId());
		int currentPage = 1;
		int buttonCount = 10;
		
		int limit = 12;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = ws.selectListCount(m);
		
		
		WebnovelPageInfo pi = WebnovelPagination.getPageInfo(currentPage, listCount, limit, buttonCount);
		
		ArrayList<Webnovel> list = ws.selectWnList(pi, m);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "member/mypage/writerReqPremium2";
	}
	
	//작가페이지 - 유료작품 신청 웹툰
	@RequestMapping("writerReqPremium.mg")
	public String selectWtList(HttpServletRequest request, HttpSession session, Member m, Model model) {
		m = (Member) session.getAttribute("loginUser");
		
		int currentPage = 1;
		//int limit = 12;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = wts.selectListCount(m);
		
		WebtoonPageInfo pi = WebtoonPagination.getPageInfo(currentPage , listCount);
		
		ArrayList<Webtoon> list = wts.selectWtList(pi, m);
		model.addAttribute("list",list);
		model.addAttribute("pi", pi);
		
		return "member/mypage/writerReqPremium";
	}
	//작가페이지 - 정식 포트폴리오 신청
	@RequestMapping("writerReqPortfolio.mg")
	public String showReqPortfolio() {
		return "member/mypage/writerReqPortfolio";
	}
	//작가페이지 - 일러스트 요청 목록
	@RequestMapping("writerReqIllust.mg")
	public String showReqIllust() {
		return "member/mypage/writerReqIllust";
	}
	//작가페이지 - 휴재 내역
	@RequestMapping("writerRest.mg")
	public String showRest() {
		return "member/mypage/writerRest";
	}
	//작가페이지 - 유료등록폼
	@RequestMapping("selectReqForm.mg")
	public String selectWnRoundList(HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model, Webnovel work) {
		int wid = Integer.parseInt(request.getParameter("wid"));
		int Rcount = ms.countRound(wid);
		String changeName = ms.getChangeName(wid);
		work = ms.selectWork(wid);
		
		model.addAttribute("Thumnail", changeName);
		model.addAttribute("work", work);
		model.addAttribute("round", Rcount);
		return "member/mypage/writerReqPremiumForm";
	}
	//작가페이지 - 유료등록 insert
    @RequestMapping("insertRequest.mg")
    public String insertRequest(HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model, Approval appro, WriterPhoto mphoto, Member m,
          @RequestParam(name = "do1", required = false) MultipartFile do1,
          @RequestParam(name = "do2", required = false) MultipartFile do2) {
    	 System.out.println("do1 : ");
       int wid = appro.getWid();
       m = (Member) session.getAttribute("loginUser");
       String root = request.getSession().getServletContext().getRealPath("resources");
       
       String filePath = root + "\\uploadFiles\\writerProfile\\document";
          String originFileName = do1.getOriginalFilename();
          System.out.println("do1 : " + originFileName);
          String originFileName2 = do2.getOriginalFilename();
          String ext = originFileName.substring(originFileName.lastIndexOf("."));
          String ext2 = originFileName2.substring(originFileName2.lastIndexOf("."));
          String changeFileName = CommonUtils.getRandomString();
          String changeFileName2 = CommonUtils.getRandomString();
       
          WriterPhoto file1 = new WriterPhoto();
          WriterPhoto file2 = new WriterPhoto(); 
          
          file1.setOriginName(originFileName);
          file1.setChangeName(changeFileName + ext);
          file1.setFilePath(filePath);
          file1.setUserId(m.getUserId());
          file1.setWid(wid);
          file2.setOriginName(originFileName2);
          file2.setChangeName(changeFileName2 + ext2);
          file2.setFilePath(filePath);
          file2.setUserId(m.getUserId());
          file2.setWid(wid);
          try {
          do1.transferTo(new File(filePath + "\\" + changeFileName + ext));
          do2.transferTo(new File(filePath + "\\" + changeFileName2 + ext2));
          
          System.out.println("try부분 접근성공?");
          
          int result = ms.insertDocument(m, file1, file2, appro);
          
          
       } catch (IllegalStateException | IOException e) {
          e.printStackTrace(); 
       }
          
       return "redirect:writerReqPremium.mg";
       
    }
	
    //코인 결제
    @RequestMapping("paycomplete.mg")
    public String paycomplete( HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model, Member m, PaymentCC pc) {
    	String userId = request.getParameter("userId");
    	int price = Integer.parseInt(request.getParameter("price"));
    	
    	System.out.println(userId + price);
    	pc.setUserId(userId);
    	pc.setpAmount(price/100);
    	
    	int result = ms.payComplete(pc);
    	return "redirect:mypgCreditCharge.mg";
    }
    
    //코인 환불 신청
    @RequestMapping("refundRequest.mg")
    public String refundReq(HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model, Member m, Refund refund) {
    	m = (Member) session.getAttribute("loginUser");
    	System.out.println("환불객체 : " + refund);
    	refund.setUserId(m.getUserId());
    	int result = ms.refundReq(refund);
    	model.addAttribute("msg","환불 신청이 완료 되었습니다.");
    	model.addAttribute("url", "mypgCreditCharge.mg");
		return "common/redirect";
    	
    }
  //신고내역 리스트 이동
  	@RequestMapping("mypgReport.mg")
  	public String showReportPage(HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model, Member m) {
  		m = (Member) session.getAttribute("loginUser");
  		ArrayList list = ms.showReportPage(m.getMno());
  		
  		model.addAttribute("chargeList", list);
  		return "member/mypage/mypageReport";
  	}
	
	
	
 // 소희
    // 마이페이지 관심작품 - 웹툰으로 이동
    @RequestMapping("mypgIterestWt.mg")
    public String showInterestWt() {
       
       return "member/mypage/mypageInterestWt";
    }
    
    // 마이페이지 관심작품 - 웹소설로 이동
    @RequestMapping("mypgInterestWn.mg")
    public String showInterestWn() {
       
       return "member/mypage/mypageInterestWn";
    }
    
    // 마이페이지 관심작가 - 웹툰으로 이동
    @RequestMapping("mypgInterestWa.mg")
    public String showInterestWa() {
       
       return "member/mypage/mypageInterestWtArtist";
    }
    
    // 마이페이지 관심작가 - 웹소설로 이동
    @RequestMapping("mypgInterestWna.mg")
    public String showInterestWna() {
       return "member/mypage/mypageInterestWnArtist";
    }
    
    // 마이페이지 관심작가 - 일러스트로로 이동
    @RequestMapping("mypgInterestIa.mg")
    public String showInterestIa() {
       return "member/mypage/mypageInterestIArtist";
    }
    
    // 마이페이지 일러스트 - 신청내역으로 이동
    @RequestMapping("mypgIllustAf.mg")
    public String showIllustAf() {
       return "member/mypage/mypageIllustApplicationList";
    }
    
    // 마이페이지 일러스트 - 후원내역으로 이동
    @RequestMapping("mypgIllustSl.mg")
    public String showIllustSl() {
       return "member/mypage/mypageIllustSupportList";
    }
    
    // 작가페이지 - My웹툰 - 무료
    @RequestMapping("writeWtFree.mg")
    public String showWriteWt() {
       return "member/mypage/writeWt";
    }
    
    // 작가페이지 - My웹툰 - 유료
    @RequestMapping("writeWtPay.mg")
    public String showWriteWt2() {
       return "member/mypage/writeWt2";
    }
    
    // 작가페이지 - My 웹소설 - 무료
    @RequestMapping("writeWnoFree.mg")
    public String showWriteWnoFree() {
       return "member/mypage/writeWno";
    }
    
    // 작가페이지 - My 웹소설 - 유료
    @RequestMapping("writeWnoPay.mg")
    public String showWriteWnoPay() {
       return "member/mypage/writeWnoPay";
    }
    
    // 작가페이지 - 정산관리
    @RequestMapping("Administration.mg")
    public String showAdministration() {
       return "member/mypage/writeAdministration";
    }
    
    // 작가페이지 - 후원신청
    @RequestMapping("Support.mg")
    public String showSupport() {
       return "member/mypage/writeSupport";
    }
    
    // RequestParam name =
    // 작가페이지 - 작가프로필설정
    @RequestMapping(value = "memberUpdate.mg")
    public String insertNovel(Model model, WriterProfile mp, HttpServletRequest request, HttpSession session,
          WriterPhoto mphoto, Member m, @RequestParam(name = "photo", required = false) MultipartFile photo) {
       System.out.println("성공했나");
       m = (Member) session.getAttribute("loginUser");
       String userId = m.getUserId();
       mp.setUserId(userId);
       System.out.println(userId);
       System.out.println(mp);
       
       String root = request.getSession().getServletContext().getRealPath("resources");
       
       String filePath = root + "\\uploadFiles\\writerProfile";
       String originFileName = photo.getOriginalFilename();
       String ext = originFileName.substring(originFileName.lastIndexOf("."));
       String changeFileName = CommonUtils.getRandomString();
       
       System.out.println("filePath : " + filePath);
       System.out.println("originFileName : " + originFileName);
       System.out.println("changeFileName : " + changeFileName + ext);
       
       mphoto.setOriginName(originFileName);
       mphoto.setChangeName(changeFileName + ext);
       mphoto.setFilePath(filePath);
       mphoto.setUserId(userId);
       
       try {
          photo.transferTo(new File(filePath + "\\" + changeFileName + ext));
          System.out.println("try부분 접근성공?");
          ms.insertWriterProfile(mp, mphoto);
          
          int count = ms.countProfilePic(mp);
          
          if(count > 1) {
          changeFileName = ms.deletePhotoPath(userId);
          System.out.println("파일 이름 : " + changeFileName);
          new File(filePath + "\\" + changeFileName).delete();
          System.out.println(filePath + "\\" + changeFileName);
          ms.deletePhoto(userId);
          }
          return "member/mypage/writeWt"; // 성공했을 때 돌아가야하는곳
       } catch (Exception e) {
          System.out.println(e.getMessage());
          new File(filePath + "\\" + changeFileName + ext).delete();
          
          model.addAttribute("msg", "프로필 설정 실패!!");
          
          return "common/errorPage";
       }
       
    }
    
    
    
    //프로필설정(왼쪽 사진 바꾸기)
    @RequestMapping(value = "selectMember.mg")
    public void chagePhoto(@RequestParam("userId")String id,Member m ,HttpServletRequest request,
          HttpServletResponse response) {
       ObjectMapper mapper = new ObjectMapper();
       System.out.println("mapper성공했나");
       String userId = request.getParameter("userId");
       m.setUserId(userId);
       System.out.println("사진 가져오는거 접근성공했니");
       
       String changeName =  ms.selectPhoto(m);
       System.out.println("${contextPath}/resources/uploadFiles/writerProfile/"+changeName);
       try {
          response.getWriter().print(mapper.writeValueAsString(changeName));
       } catch (IOException e) {
          
          
          e.printStackTrace();
       }
       // session.setAttribute("changeName", chageName);
       //return "member/mypage/writeWt"; 
       
    }
    //   //2. ObjectMapper를 이용한 ajax 처리(jackson lib사용)
    //   @RequestMapping(value="duplicationCheck.me")
    //   public void duplicationCheck(@RequestParam("userId")String id,
//                               HttpServletResponse response) {
//                
//                ObjectMapper mapper = new ObjectMapper();
//                
//                Member m = new Member();
//                m.setUserId(id);
//                
//                try {
//                   response.getWriter().print(mapper.writeValueAsString(m));
//                } catch (IOException e) {
//                   e.printStackTrace();
//                }
    //   }
    
    
    //마이페이지 - 회원탈퇴
    @RequestMapping(value = "memberResign.mg")
    public String resign(Model model, Member mp, HttpServletRequest request, HttpSession session) {
       mp = (Member) session.getAttribute("loginUser");
       
       int result = ms.resign(mp.getMno());
       System.out.println("result : " + result);
       session.invalidate();
       return "index";
    }
    
    
    
    
    //관심작품 목록
    @RequestMapping("attentionListWt.mg")
    public String attentionListWt(Model model, Member m, HttpServletRequest request, HttpSession session) {
       m = (Member) session.getAttribute("loginUser");
       
       int currentPage = 1;
       int buttonCount = 10;
       
       int limit = 12;
       if(request.getParameter("currentPage") != null) {
          currentPage = Integer.parseInt(request.getParameter("currentPage"));
       }
       
       int listCount = wts.selectListCount(m);
       
       
       WebnovelPageInfo pi = WebnovelPagination.getPageInfo(currentPage, listCount, limit, buttonCount);
       
       ArrayList list = ms.attentionListWt(pi, m);
       model.addAttribute("list", list);
       model.addAttribute("pi", pi);
       
       return "member/mypage/mypageInterestWt";
    }
    
    
    //관심작가 목록(웹툰)
    @RequestMapping("attentionArtist.mg")
    public String attentionArtist(Model model, Member m, HttpServletRequest request, HttpSession session) {
       
       m = (Member) session.getAttribute("loginUser");
       
       int currentPage = 1;
       int buttonCount = 10;
       
       int limit = 12;
       if(request.getParameter("currentPage") != null) {
          currentPage = Integer.parseInt(request.getParameter("currentPage"));
       }
       
       int listCount = wts.selectListCount(m);
       
       
       WebnovelPageInfo pi = WebnovelPagination.getPageInfo(currentPage, listCount, limit, buttonCount);
       
       ArrayList list = ms.attentionArtistWt(pi, m);
       model.addAttribute("list", list);
       model.addAttribute("pi", pi);
       
       return "member/mypage/mypageInterestWtArtist";
       
    }
    
    ////관심작가 목록(웹소설)
    
    @RequestMapping("attentionWnArtist.mg")
    public String attentionWnArtist(Model model, Webnovel m, Member mm, HttpServletRequest request, HttpSession session) {
       
       mm = (Member) session.getAttribute("loginUser");
       m.setUserId(mm.getUserId());
       int currentPage = 1;
       int buttonCount = 10;
       
       int limit = 12;
       if(request.getParameter("currentPage") != null) {
          currentPage = Integer.parseInt(request.getParameter("currentPage"));
       }
       
       int listCount = ws.selectListCount(m);
       
       
       WebnovelPageInfo pi = WebnovelPagination.getPageInfo(currentPage, listCount, limit, buttonCount);
       
       ArrayList list = ms.attentionWnArtist(pi, mm);
       model.addAttribute("list", list);
       model.addAttribute("pi", pi);
       
       return "member/mypage/mypageInterestWnArtist";
       
    }
    
    //관심작가 목록(일러스트)
    @RequestMapping("attentionWlArtist.mg")
    public String attentionWlArtist(Model model, Webnovel m, Member mm, HttpServletRequest request, HttpSession session) {
       
       mm = (Member) session.getAttribute("loginUser");
       m.setUserId(mm.getUserId());
       int currentPage = 1;
       int buttonCount = 10;
       
       int limit = 12;
       if(request.getParameter("currentPage") != null) {
          currentPage = Integer.parseInt(request.getParameter("currentPage"));
       }
       
       int listCount = ws.selectListCount(m);
       
       
       WebnovelPageInfo pi = WebnovelPagination.getPageInfo(currentPage, listCount, limit, buttonCount);
       
       ArrayList list = ms.attentionWnArtist(pi, mm);
       model.addAttribute("list", list);
       model.addAttribute("pi", pi);
       
       return "member/mypage/mypageInterestWlArtist";
       
    }
    //작가페이지 - 후원신청
       @RequestMapping(value = "writerSupport.mg")
       public String writerSupport(Model model, HttpServletRequest request, HttpSession session, Support sp,
             WriterPhoto mphoto, Member m, @RequestParam(name = "rewardFile", required = false) MultipartFile photo) {
          System.out.println("후원 성공했나");
          m = (Member) session.getAttribute("loginUser");
          String userId = m.getUserId();
          System.out.println("sp : " + sp);
          
          
          String root = request.getSession().getServletContext().getRealPath("resources");
          
          String filePath = root + "\\uploadFiles\\support";
          String originFileName = photo.getOriginalFilename();
          String ext = originFileName.substring(originFileName.lastIndexOf("."));
          String changeFileName = CommonUtils.getRandomString();
          
          System.out.println("filePath : " + filePath);
          System.out.println("originFileName : " + originFileName);
          System.out.println("changeFileName : " + changeFileName + ext);
          
          mphoto.setOriginName(originFileName);
          mphoto.setChangeName(changeFileName + ext);
          mphoto.setFilePath(filePath);
          mphoto.setUserId(userId);
          
          try {
             photo.transferTo(new File(filePath + "\\" + changeFileName + ext));
             System.out.println("후원 try부분 접근성공?");
             int result = ms.insertSupport(m, mphoto, sp);
             
             
             /*int count = ms.countProfilePic(mp);
             
             if(count > 1) {
             changeFileName = ms.deletePhotoPath(userId);
             System.out.println("파일 이름 : " + changeFileName);
             new File(filePath + "\\" + changeFileName).delete();
             System.out.println(filePath + "\\" + changeFileName);
             ms.deletePhoto(userId);
             }*/
             return "member/mypage/writeSupport"; // 성공했을 때 돌아가야하는곳
          } catch (Exception e) {
             System.out.println(e.getMessage());
             new File(filePath + "\\" + changeFileName + ext).delete();
             
             model.addAttribute("msg", "프로필 설정 실패!!");
             
             return "common/errorPage";
          }
          
       }
         
       
       
       
       //공지사항으로 이동
       @RequestMapping("NoticeList.mg")
       public String showNoticeList() {
          return "cs/notice";
       }
       //faq로 이동
       @RequestMapping("Faq.mg")
       public String showFaqList() {
          return "cs/faq";
       }   
       
       //여기부터
       
       
       //사이트 이용안내(약관)로 이동
       @RequestMapping("Guide.mg")
       public String showGuideList() {
          return "cs/guide";
       }
       //사이트 이용안내로 이동
       @RequestMapping("Guide2.mg")
       public String showGuideList2() {
          return "cs/guide2";
       }

       //공지사항 상세페이지 
       @RequestMapping("NoticeDetail.mg")
          public String showNoticeDetail() {
          return "cs/noticeList";
       }
       //일대일문의
       @RequestMapping("mtmQue.mg")
       public String showmtmQue() {
          return "cs/mtmQue";
       }
       
       //일대일문의 상세보기
       @RequestMapping("queList.mg")
       public String showQueList() {
          return "cs/queList";
       }
     //내 문의 내역 페이지 이동
       @RequestMapping("mypgQue.mg")
       public String showQue(HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model, Member m, Board board) {
          
          m = (Member) session.getAttribute("loginUser"); 
          String userId = m.getUserId();
          
          ArrayList<Board> bList = ms.showQue(userId);
          
          model.addAttribute("list",bList);
          
          return "member/mypage/mypageQuestion";
       }
       
       
      //일대일문의 insert
       @RequestMapping("insertMtmQue.mg")
       public String insertMtmQue(HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model, Member m, Board board) {
          
          m = (Member) session.getAttribute("loginUser"); 
          
          board.setUserId(m.getUserId());
          System.out.println("board : " + board);
          
          int result = ms.insertMtmQue(board);
          
          
          
          return "redirect:mypgQue.mg";
          
       }
       
     //휴재신청 폼
       @RequestMapping("reqDormant.mg")
       public String showReqDormant(HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model, Member m, Closed c, Webnovel work) {
          
          int wid = Integer.parseInt(request.getParameter("wid"));
          m = (Member) session.getAttribute("loginUser");
          
          work = ms.selectWork(wid);
          model.addAttribute("work", work);
          
          return "member/mypage/reqClosed";
       }
       
       
      //휴재신청insert
       @RequestMapping("insertClosed.mg")
       public String showInsertClosed(HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model, Member m, Closed c, Webnovel work) {
          
          int result = ms.insertClosed(c);
          if(result > 0) {
             
             model.addAttribute("msg","휴재 신청이 완료 되었습니다.");
             model.addAttribute("url", "writerRest.mg");
             return "common/redirect";
          }else {
             model.addAttribute("msg", "휴재 신청 실패!!");
               
               return "common/errorPage";
          }
          
       }
}