package com.kh.cc.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypgController {

	
	
	
	//마이페이지 이동
		@RequestMapping("mypgMain.mg")
		public String showLoginForm() {
			return "member/mypage/mypage";
		}
		
	//CC 페이지 이동
		@RequestMapping("mypgCredit.mg")
		public String showCreditPage() {
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
		public String showInfo() {
			return "member/mypage/mypageInformation";
		}
	//내 문의 내역 페이지 이동
		@RequestMapping("mypgQue.mg")
		public String showQue() {
			return "member/mypage/mypageQuestion";
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
		
		
		
		
		
		
		
		  //소희
		   //마이페이지 관심작품 - 웹툰으로 이동 
		   @RequestMapping("mypgIterestWt.mg")
		   public String showInterestWt() {
		      
		      return "member/mypage/mypageInterestWt";
		   }
		   
		   
		   
		   //마이페이지 관심작품 - 웹소설로 이동
		   @RequestMapping("mypgInterestWn.mg")
		   public String showInterestWn() {
		      
		      return "member/mypage/mypageInterestWn";
		   }
		   //마이페이지 관심작가 - 웹툰으로 이동
		   @RequestMapping("mypgInterestWa.mg")
		   public String showInterestWa() {
		      
		      return "member/mypage/mypageInterestWtArtist";
		   }
		   
		   //마이페이지 관심작가 - 웹소설로 이동
		   @RequestMapping("mypgInterestWna.mg")
		   public String showInterestWna() {
		      return "member/mypage/mypageInterestWnArtist";
		   }
		   
		   //마이페이지 관심작가 - 일러스트로로 이동
		      @RequestMapping("mypgInterestIa.mg")
		      public String showInterestIa() {
		         return "member/mypage/mypageInterestIArtist";
		      }
		      

		   //마이페이지 일러스트 - 신청내역으로 이동
		      @RequestMapping("mypgIllustAf.mg")
		      public String showIllustAf() {
		         return "member/mypage/mypageIllustApplicationList";
		      }
		      
		   //마이페이지 일러스트 - 후원내역으로 이동
		      @RequestMapping("mypgIllustSl.mg")
		      public String showIllustSl() {
		         return "member/mypage/mypageIllustSupportList";
		      }
}

