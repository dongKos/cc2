<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의뢰 페이지</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/5.7.0/css/font-awesome.min.css">
<style>
.main-image {
   width: 100%;
   background: black;
   height: 300px;
}

.main-text {
   width: 100%;
   height: 300px;
}

.main-text textarea {
   width: 100%;
   height: 300px;
}
.form-group label{
   font-size: 16px;
   weight: bold;
}
</style>
</head>
<body>
   <jsp:include page="common/IllustTopNavbar.jsp" />
   <form action="IllRequest.ill" method="get" id="illRequest">
      <input type="hidden" name="illCode" value="${rlist[0].illCode}">
      <input type="hidden" id="userCoin" value="0">
      <div class="container">
         <br>
         <br>
         <div class="row">
            <div class="col-lg-4 main-image">
               <c:forEach var="illRequest" items="${ rlist }">
                  <c:if test="${illRequest.aCategory eq 'ma' }">
                     <img class="img-fluid"
                        src="${contextPath }/resources/uploadFiles/illustrator/illPortfolio/${ illRequest.changeName }"
                        style="width: 100%; height: 100%">
                  </c:if>
               </c:forEach>
            </div>
            <div class="col-lg-8 main-text">
               <textarea style="resize: none; height: 300px; font-size: 16px;"
                  id="illContent" name="illContent" placeholder="자세히 입력해주세요"
                  class="form-control"></textarea>
            </div>
         </div>
         <hr style="border-color: black;">
         <div class="row">
            <div class="col-lg-12">
               <h2>가격정보</h2>
               <br>
               <br>
               <br>
               <br>
            </div>
            <table class="table table-bordered table-striped" id="priceTable">
               <thead align="center">
                  <tr style="background: lightgray; font-size: 13px;">
                     <th></th>
                     <th>STANDARD<br>+700CC
                     </th>
                     <th>DELUXE<br>+1500CC
                     </th>
                     <th>PREMIUM<br>+3000CC
                     </th>
                  </tr>
               </thead>
               <tbody align="center" style="font-size: 12px;">
                  <tr>
                     <td>패키지설명</td>
                     <td>소장용 일러스트(배경 X)<br>
                     <br> 상업적 이용을 하지 않는 목적<br> 기본 A4/600dpi<br> * 사이즈
                        제시 가능 *<br> *원본 편집 및 기타 사용 불가*
                     </td>
                     <td>소장용 일러스트(배경 O)<br>
                     <br> 상업적 이용을 하지 않는 목적<br> 기본 A4/600dpi<br> * 사이즈
                        제시 가능 *<br> *원본 편집 및 기타 사용 불가*
                     </td>
                     <td>상업적 이용<br>
                     <br> 상업적 이용 목적<br> A4/300~600dpi<br> * 사이즈 제시 가능 *<br>
                        * 계약서 작성 *
                     </td>
                  </tr>
                  <tr>
                     <td>고해상도 파일 제공</td>
                     <td>V</td>
                     <td>V</td>
                     <td>V</td>
                  </tr>
                  <tr>
                     <td>채색</td>
                     <td>V</td>
                     <td>V</td>
                     <td>V</td>
                  </tr>
                  <tr>
                     <td>전신</td>
                     <td>V</td>
                     <td>-</td>
                     <td>V</td>
                  </tr>
                  <tr>
                     <td>원본파일 제공</td>
                     <td>-</td>
                     <td>-</td>
                     <td>V</td>
                  </tr>
                  <tr>
                     <td>배경</td>
                     <td>-</td>
                     <td>V</td>
                     <td>V</td>
                  </tr>
                  <tr>
                     <td>상업적 이용 가능</td>
                     <td>-</td>
                     <td>-</td>
                     <td>V</td>
                  </tr>
                  <tr>
                     <td>시안 개수</td>
                     <td>2</td>
                     <td>2</td>
                     <td>2</td>
                  </tr>
                  <tr>
                     <td>피사체 개수</td>
                     <td>1</td>
                     <td>-</td>
                     <td>-</td>
                  </tr>
                  <tr>
                     <td>수정 횟수</td>
                     <td>1</td>
                     <td>3</td>
                     <td>3</td>
                  </tr>
               </tbody>
            </table>
         </div>
         <br><br>
         <div class="row form-inline">
            <div class="form-group" align="center" style="width: 100%;">
               <label for="requestPackage">옵션을 선택해 주세요 : </label> <select
                  id="requestPackage" style="font-size: 20px; margin-left: 1%;"
                  class="form-control">
                  <option value="20000">-------------</option>
                  <option value="700">STANDARD +700CC</option>
                  <option value="1500">DELUXE +1500CC</option>
                  <option value="3000">PREMIUM +3000CC</option>
               </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label for="totalPrice">최종결제CC : </label> <input type="text"
                  id="totalPrice" name="totalPrice" value="${rlist[0].illPrice}"
                  style="font-size: 20px; margin-left: 1%;" class="form-control">
            </div>
         </div>
         <br>
         <br>
         <br>

         <br>
         <br>
         
         <hr>
         <h2 class="mt-5">이용약관</h2>
         <br>
         <br> <input type="checkbox" required>&nbsp;&nbsp;&nbsp;<label style="font-size: 16px; weight: bold;">내용에
            동의 합니다</label> <br>
         <br>

         <textarea style="resize: none; width: 100%;" rows="10" class="form-control">제 1조 목적

 

이 약관은 (주)크리에이트 컨테이너(이하 “회사”)가 제공하는 회사의 제반 서비스 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.

 

제 2조 정의

 

이 약관에서 사용하는 용어의 정의는 다음과 같습니다.

 

① 서비스 : 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 회원이 이용할 수 있는 회사의 제반 서비스를 의미함

② 이용자 : 회사의 서비스에 접속하여 이 약관에 따라 회사가 제공하는 서비스를 받는 회원 및 비회원을 말함

③ 회원 : 회사의 서비스에 접속하여 이 약관에 따라 회사와 이용계약을 체결하고 회사가 제공하는 서비스를 이용하는 고객을 말함

④ 비회원 : 회원에 가입하지 않고 회사의 서비스를 이용하는 자를 말함. 회사가 제공하는 서비스는 비회원의 경우에도 이용할 수 있으나 일부 서비스에 대해서는 이용이 제한될 수 있음. 또한, 비회원은 원칙적으로 본 약관의 적용을 받지 않지만 관계법에 근거하여 본 약관이 금지하는 행위를 할 경우 관련법령에 의한 제재를 받을 수 있음

⑤ 아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 회사가 승인하는 이메일 주소를 의미함

⑥ 비밀번호 : 회원이 부여 받은 아이디와 일치되는 회원임을 확인하고 비밀보호를 위해 회원 자신이 정한 문자 또는 숫자의 조합을 의미함

 

제 3조 약관의 게시와 개정

 

① 회사는 이 약관의 내용을 회원이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.

② 회사는 약관의규제에관한법률, 정보통신망이용촉진및정보보호등에관한법률(이하 정보통신망법) 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.

③ 회사가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일자 7일 전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 회사는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.

④ 회사가 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 30일 기간 내에 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 않은 경우 회원이 개정약관에 동의한 것으로 봅니다.

⑤ 회원이 개정약관의 적용에 동의하지 않는 경우 회사는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 회사는 이용계약을 해지할 수 있습니다.

⑥ 새로운 서비스가 개설될 경우 별도의 명시된 설명이 없는 한 이 약관에 따라 제공합니다.

 

제 4조 이용계약 체결

 

① 이용계약은 회원이 되고자 하는 자(이하 가입신청자)가 약관의 내용에 대하여 동의를 한 다음 회원가입신청을 하고 회사가 이러한 신청에 대하여 승낙함으로써 체결됩니다.

② 회사는 가입신청자의 신청에 대하여 서비스 이용을 승낙함을 원칙으로 합니다. 다만, 회사는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다.

      1. 가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 단 회사의 회원 재가입 승낙을 얻은 경우에는 예외로 함.

2. 실명이 아니거나 타인의 명의를 이용한 경우

3. 허위의 정보를 기재하거나, 회사가 제시하는 내용을 기재하지 않은 경우

4. 14세 미만 아동이 법정대리인(부모 등)의 동의를 얻지 아니한 경우

5. 이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우

③ 제1항에 따른 신청에 있어 회사는 회원의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다.

④ 회사는 서비스관련설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.

⑤ 제2항과 제4항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, 회사는 원칙적으로 이를 가입신청자에게 알리도록 합니다.

⑥ 이용계약의 성립 시기는 회사가 가입완료를 신청절차 상에서 표시한 시점으로 합니다.

⑦ 회사는 회원에 대해 회사정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.

 

제 5조 회원정보의 변경

 

① 회원은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위해 필요한 실명, 아이디 등은 수정이 불가능합니다.

② 회원은 회원가입신청 시 기재한 사항이 변경되었을 경우 즉시 온라인으로 수정해야하며, 변경 사항을 수정하지 않아 발생한 불이익에 대하여 회사는 책임지지 않습니다.

 

제 6조 개인정보보호 의무

 

회사는 정보통신망법 등 관계 법령이 정하는 바에 따라 회원의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 회사의 개인정보처리방침이 적용됩니다. 다만, 회사의 공식 사이트 이외의 링크된 사이트에서는 회사의 개인정보처리방침이 적용되지 않습니다.

 

제 7조 회원의 아이디 및 비밀번호의 관리에 대한 의무

 

① 회원의 아이디와 비밀번호에 관한 관리책임은 회원에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다.

② 회사는 회원의 아이디가 개인정보 유출 우려가 있거나, 반사회적 또는 미풍양속에 어긋나거나 회사 및 회사의 운영자로 오인한 우려가 있는 경우, 해당 아이디의 이용을 제한할 수 있습니다.

③ 회원은 아이디 및 비밀번호가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 회사에 통지하고 회사의 안내에 따라야 합니다.

④ 제3항의 경우에 해당 회원이 회사에 그 사실을 통지하지 않거나, 통지한 경우에도 회사의 안내에 따르지 않아 발생한 불이익에 대하여 회사는 책임지지 않습니다.

 

제 8조 연결서비스와 피연결서비스 간의 관계

 

① 상위 서비스와 하위 서비스가 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결서비스(웹 사이트)이라고 하고 후자를 피연결서비스(웹사이트)이라고 합니다.

② 연결서비스는 피연결서비스가 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않는다는 뜻을 연결서비스의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증책임을 지지 않습니다.

 

제 9조 회원에 대한 통지

 

① 회사가 회원에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 회원이 회사와 미리 약정하여 지정한 전자우편주소로 할 수 있습니다.

② 회사는 회원 전체에 대한 통지의 경우 7일 이상 회사의 게시판에 게시함으로써 제1항의 통지에 갈음할 수 있습니다.

 

제 10조 회사의 의무

 

① 회사는 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 서비스를 제공하기 위하여 최선을 다하여 노력합니다.

② 회사는 회원이 안전하게 서비스를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보처리방침을 공시하고 준수합니다.

③ 회사는 서비스이용과 관련하여 발생하는 이용자의 불만 또는 피해구제요청을 적절하게 처리할 수 있도록 필요한 인력 및 시스템을 구비합니다.

④ 회사는 서비스이용과 관련하여 회원으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. 회원이 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 회원에게 처리일정 및 결과를 전달합니다.

 

제 11조 회원의 의무

 

① 회원은 다음 행위를 하여서는 안 됩니다.

1. 신청 또는 변경 시 허위내용의 등록

2. 타인의 정보도용

3. 회사가 게시한 정보의 변경

4. 회사가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시

5. 회사와 기타 제3자의 저작권 등 지적재산권에 대한 침해

6. 회사 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위

7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 서비스에 공개 또는 게시하는  행위

8. 회사의 동의 없이 영리를 목적으로 서비스를 사용하는 행위

9. 기타 불법적이거나 부당한 행위

② 회원은 관계법, 이 약관의 규정, 이용안내 및 서비스와 관련하여 공지한 주의사항, 회사가 통지하는 사항 등을 준수하여야 하며, 기타 회사의 업무에 방해되는 행위를 하여서는 안 됩니다.

 

제 12조 서비스의 제공 등

 

① 회사는 회원에게 아래와 같은 서비스를 제공합니다.

1. 제품 관련 서비스 (제품 소개, 체험판, 보안/기능 패치 외)

2. 커뮤니티 서비스

3. 전자상거래 서비스

4. 기타 회사가 추가 개발하거나 다른 회사와의 제휴계약 등을 통해 회원에게 제공하는 일체의 서비스

② 회사는 서비스를 일정범위로 분할하여 각 범위 별로 이용가능시간을 별도로 지정할 수 있습니다. 다만, 이러한 경우에는 그 내용을 사전에 공지합니다.

③ 회사는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 서비스의 제공을 일시적으로 중단할 수 있습니다. 이 경우 회사는 제9조[회원에 대한 통지]에 정한 방법으로 회원에게 통지합니다. 다만, 회사가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.

④ 회사는 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면에 공지한 바에 따릅니다.

⑤ 회사는 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다.

⑥ 회사가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.

⑦ 전항의 경우 회사는 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, 회사가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.

 

제 13조 서비스의 변경

 

① 회사는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 서비스를 변경할 수 있습니다.

② 서비스의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 서비스의 내용 및 제공일자 등은 그 변경 전에 해당 서비스 초기화면에 게시하여야 합니다.

③ 회사는 무료로 제공되는 서비스의 일부 또는 전부를 회사의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 관련법에 특별한 규정이 없는 한 회원에게 별도의 보상을 하지 않습니다.

 

제 14조 정보의 제공 및 광고의 게재

 

① 회사는 회원이 서비스 이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 전자우편 등의 방법으로 회원에게 제공할 수 있습니다. 다만, 회원은 관련법에 따른 거래관련 정보 및 고객문의 등에 대한 답변 등을 제외하고는 언제든지 전자우편에 대해서 수신 거절을 할 수 있습니다.

② 제1항의 정보를 전화 및 모사전송기기에 의하여 전송하려고 하는 경우에는 회원의 사전 동의를 받아서 전송합니다. 다만, 회원의 거래관련 정보 및 고객문의 등에 대한 회신에 있어서는 제외됩니다.

③ 회사는 서비스의 운영과 관련하여 서비스 화면, 홈페이지, 전자우편 등에 광고를 게재할 수 있습니다. 광고가 게재된 전자우편을 수신한 회원은 수신거절을 회사에게 할 수 있습니다.

④ 이용자(회원, 비회원 포함)는 회사가 제공하는 서비스와 관련하여 게시물 또는 기타 정보를 변경, 수정, 제한하는 등의 조치를 취하지 않습니다.

 

제 15조 게시물의 저작권

 

① 회원이 회사의 서비스 내에 게시한 게시물의 저작권은 해당 게시물의 저작자에게 귀속됩니다.

② 회원이 회사의 서비스 내에 게시하는 게시물은 검색결과 내지 서비스 및 관련 프로모션 등에 노출될 수 있으며, 해당 노출을 위해 필요한 범위 내에서는 일부 수정, 복제, 편집되어 게시될 수 있습니다. 이 경우, 회사는 저작권법 규정을 준수하며, 회원은 언제든지 고객센터 또는 서비스 내 관리기능을 통해 해당 게시물에 대해 삭제, 비공개 등의 조치를 취할 수 있습니다.

③ 회사는 제2항 이외의 방법으로 회원의 게시물을 이용하고자 하는 경우에는 전화, 팩스, 전자우편 등을 통해 사전에 회원의 동의를 얻어야 합니다.

 

제 16조 할인 쿠폰의 사용

 

① 회사는 구매서비스를 이용하는 회원에게 상품 구매 시 일정금액 또는 일정비율을 할인 받을 수 있는 할인 쿠폰을 발급할 수 있습니다.

② 할인 쿠폰은 회원 본인의 구매에만 사용할 수 있으며, 어떠한 경우에도 타인에게 매매하거나 양도할 수 없습니다.

③ 할인 쿠폰은 일부 품목이나 금액에 따라 사용이 제한될 수 있으며 유효기간이 지난 후에는 사용할 수 없고, 상품구매 후 취소나 반품으로 환불이 이루어졌을 때에는 경우에 따라 재사용을 할 수 없습니다.

④ 구매자에게 제공된 할인 쿠폰은 한 상품 구매 때 중복으로 사용할 수 없습니다. 단, 할인 쿠폰의 발행자가 서로 다르면 중복으로 사용할 수도 있습니다.

⑤ 할인 쿠폰은 그 사용대상. 방법. 기한 및 제한사항 등은 회사의 관련화면(초기화면, 연결화면 포함, 이하 동일) 및 할인쿠폰 등에 개별 표시되고, 할인쿠폰의 종류 및 내용은 회사정책에 따라 달라질 수 있습니다.

 

제 17조 계약해제, 해지, 휴면 등

 

① 회원은 언제든지 마이페이지 관리 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, 회사는 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다. 다만, 기업회원의 경우 대표ID는 탈퇴할 수 없으며, ID관리 메뉴에서 담당자ID에 대표 권한을 이관하신 후에 탈퇴하실 수 있습니다.

② 회원이 계약을 해지할 경우, 관련법 및 개인정보처리방침에 따라 회사가 회원정보를 보유하는 경우를 제외하고는 일주일(7일)의 유보기간 후에 회원의 모든 데이터는 소멸됩니다.

③ 회원이 계약을 해지하는 경우, 등록된 게시물 등은 삭제되지 않으니 사전에 삭제 후 탈퇴하시기 바랍니다.

④ 회원이 다음 각호의 사유에 해당하는 경우, 회사는 회원자격을 제한 및 정지시킬 수 있습니다.

1. 가입 신청시에 허위 내용을 등록한 경우

2. 서비스를 이용하여 구입한 재화 등의 대금, 기타 서비스 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않은 경우

3. 다른 사람의 서비스 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우

4. 서비스를 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우

5. 다음 각호에 행위로서 서비스의 건전한 운영을 해하거나 업무를 방해하는 경우

    가. 서비스의 운영과 관련하여 진위가 불분명한 사실 또는 허위의 사실을 적시하거나 유포하여 회사의 명예와 신용을 훼손하는 경우

         나. 서비스의 이용과정에서 직원에게 모욕, 협박 또는 음란한 언행 등으로 운영을 방해하는 경우

         다. 서비스를 통해 구매한 재화 등을 정당한 이유 없이 상습적으로 취소 또는 반품하여 업무를 방해하는 경우 

                      라. 재판매 목적으로 재화 등을 대량으로 중복 구매하여 서비스의 거래질서를 방해하는 경우

  마. 본 약관에 따른 이용자의 의무를 위반하는 경우

⑤ 회사가 회원 자격을 제한·정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 회사는 회원자격을 상실시킬 수 있습니다.

⑥ 회원이 다음 각 호의 사유에 해당하는 경우, 회사는 회원 계정을 휴면계정으로 전환하거나 계정을 삭제할 수 있습니다.

     1. 최근 1년간 로그인 기록이 없고, 제품등록/제품구매 이력이 존재하는 경우 휴면 계정으로 전환

     2. 최근 1년간 로그인 기록이 없고, 제품등록/제품구매 이력이 없는 경우 계정 삭제

 

제 18조 이용제한 등

 

① 회사는 회원이 이 약관의 의무를 위반하거나 서비스의 정상적인 운영을 방해한 경우, 경고, 일시정지, 영구이용정지 등으로 서비스 이용을 단계적으로 제한할 수 있습니다.

② 회사는 전항에도 불구하고, 타인의 명의(이름 및 이메일주소 등)도용 및 결제도용, 저작권법 및 컴퓨터프로그램보호법을 위반한 불법프로그램의 제공 및 운영방해, 정보통신망법을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반한 경우에는 즉시 영구이용정지를 할 수 있습니다. 본 항에 따른 영구이용정지 시 서비스 이용을 통해 획득한 쿠폰 및 기타 혜택 등도 모두 소멸되며, 회사는 이에 대해 별도로 보상하지 않습니다.

③ 회사는 회원이 계속해서 3개월 이상 로그인하지 않는 경우, 회원정보의 보호 및 운영의 효율성을 위해 이용을 제한할 수 있습니다.

④ 회사는 본 조의 이용제한 범위 내에서 제한의 조건 및 세부내용은 이용제한정책 및 개별 서비스상의 운영정책에서 정하는 바에 의합니다.

⑤ 본 조에 따라 서비스 이용을 제한하거나 계약을 해지하는 경우에는 회사는 제9조[회원에 대한 통지]에 따라 통지합니다.

⑥ 회원은 본 조에 따른 이용제한 등에 대해 회사가 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 회사가 인정하는 경우 회사는 즉시 서비스의 이용을 재개합니다.

 

제 19조 책임제한

 

① 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.

② 회사는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여는 책임을 지지 않습니다.

③ 회사는 회원이 서비스와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.

④ 회사는 회원 간 또는 회원과 제3자 상호간에 서비스를 매개로 하여 거래 등을 한 경우에는 책임이 면제됩니다.

⑤ 회사는 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다.

 

제 20조 준거법 및 재판관할

 

① 회사와 회원 간 제기된 소송은 대한민국법을 준거법으로 합니다.

② 회사와 회원간 발생한 분쟁에 관한 소송은 서울중앙지방법원으로 합니다.

 

(부칙) 이 약관은 2016년 10월 15일부터 적용됩니다. 종전의 약관은 본 약관으로 대체합니다.</textarea>
         <br><br><br><br>
         <button type="button" class="btn btn-primary form-control mt-5"
            id="submitBtn" onclick="Requestsubmit();" style="height:50px; font-size:15px;">의뢰 신청하기</button>
      </div>
   </form>
   <script>
      $("#requestPackage").change(function() {
         var selectPrice = $(this).children("option:selected").val();
         console.log(selectPrice);
         selectPrice = parseInt(selectPrice);
         var Price = ${rlist[0].illPrice};
         Price = parseInt(Price);
         $("#totalPrice").attr("value", Price + selectPrice);
         console.log($("#totalPrice").val());
      })

      function Requestsubmit() {
         var coin = Number($("#userCoin").val());
         var totalCoin = Number($("#totalPrice").val());
         if (coin >= totalCoin) {
            console.log("제출");
            $("#illRequest").submit();
         } else {
            alert("돈없음");
         }

      }

      $(document).ready(function() {
         //${contextPath}/resources/uploadFiles/writerProfile/fc430f965d9a4380aedc4eda0b4d92e0.PNG
         //var userId = ${ sessionScope.loginUser.userId };
         var userId = "<c:out value='${sessionScope.loginUser.userId}'/>";
         console.log(userId)
         $.ajax({
            url : "selectMemberMem.mg",
            type : "get",
            data : {userId : userId},
            success : function(data) {$("#userCoin").attr("value", data.wallet);},
            error : function(status) {
               console.log("status : ", status);
            }
         });

      })
   </script>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>

   <footer class="footer text-center">
      <div class="container">
         <div class="row">

            <div class="col-lg-4 mb-5 mb-lg-0">
               <h4 class="text-uppercase mb-4">ADDRESS</h4>
               <p class="lead mb-0"
                  style="font-size: 18px; font-family: 'Do Hyeon', sans-serif;">
                  서울특별시 강남구 테헤란로14길 6 <br>남도빌딩 2층, 3층, 4층
               </p>
            </div>

            <!-- Footer Social Icons -->
            <div class="col-lg-4 mb-5 mb-lg-0">
               <h4 class="text-uppercase mb-4">COMPANY</h4>
               <p class="lead mb-0"
                  style="font-size: 18px; font-family: 'Do Hyeon', sans-serif;">
                  회사명 : CreateContainer<br> 대표이사 : 김동환 <br>
               </p>
            </div>

            <!-- Footer About Text -->
            <div class="col-lg-4">
               <h4 class="text-uppercase mb-4">INFORMATION</h4>
               <p class="lead mb-0"
                  style="font-size: 18px; font-family: 'Do Hyeon', sans-serif;">
                  카카오톡 : 김동환<br> 이메일 : CreateContainer@cc.kr <br> 대표번호 :
                  010 - 0123 - 4567<br> 고객센터 : AM 10:00 ~ PM 10:00
               </p>
            </div>

         </div>
      </div>
   </footer>


   <!-- Copyright Section -->
   <section class="copyright py-4 text-center text-white">
      <div class="container">
         <small>Copyright &copy; CreateContainer 2019</small>
      </div>
   </section>
</body>
</html>