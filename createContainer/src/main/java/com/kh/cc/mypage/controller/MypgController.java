package com.kh.cc.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.cc.member.model.vo.Member;
import com.kh.cc.mypage.model.exception.MypgException;
import com.kh.cc.mypage.model.service.MypgService;

@SessionAttributes("loginUser")
@Controller
public class MypgController {

	@Autowired
	private MypgService ms;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
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
		@RequestMapping("writerReqPremium.mg")
		public String showReqPremium() {
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
           
         
           
           
           
         //작가페이지 - My웹툰 - 무료
           @RequestMapping("writeWtFree.mg")
           public String showWriteWt() {
              return "member/mypage/writeWt";
           }
           
         //작가페이지 - My웹툰 - 유료
           @RequestMapping("writeWtPay.mg")
           public String showWriteWt2() {
              return "member/mypage/writeWt2";
           }
           
         //작가페이지 - My 웹소설 - 무료
           @RequestMapping("writeWnoFree.mg")
           public String showWriteWnoFree() {
              return "member/mypage/writeWno";
           }
           
           //작가페이지 - My 웹소설 - 유료
           @RequestMapping("writeWnoPay.mg")
           public String showWriteWnoPay() {
              return "member/mypage/writeWnoPay";
           }
           //작가페이지 - 정산관리
           @RequestMapping("Administration.mg")
           public String showAdministration() {
              return "member/mypage/writeAdministration";
           }
         //작가페이지 - 후원신청  
           @RequestMapping("Support.mg")
           public String showSupport() {
              return "member/mypage/writeSupport";
           }
           
           
  /*
   * //공지사항
   * 
   * @RequestMapping("Notice.mg") public String showNoticeList() { return
   * "cs/notice"; }
   */
}

