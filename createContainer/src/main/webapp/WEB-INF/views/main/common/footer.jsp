<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#footer {
	background: #2c3e50 !important;
	padding: 15px 0;
}

#footer tr {
	background: #2c3e50 !important;
	border: none !important;
}

.copyright div {
	display: table-cell;
	vertical-align: middle;
}
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<footer id="footer">
      <div class="copyright" style="margin: 0;">
         <div class="img-content" style="width: 32%;text-align: right;">
            <img id="flogo"
                  src="${ contextPath }/resources/images/logo.png" width="100px;"
                  style="width: 150px;">
         </div>
         <div class="info-content" style="width: 42%;">
         
            <table class="footer">
   
               <tr>
                  <td>(주)CreateContainer</td>
                  <td>고객센터</td>
                  <td>(주 6일,오전 10시 ~ 저녁 10시 까지)</td>
               </tr>
               <tr>
                  <td>대표이사 : 김동환</td>
                  <td>카카오톡</td>
                  <td style="font-size: 8px;">김동환</td>
               </tr>
               <tr>
                  <td>서울 특별시 갱남 KH정보교육원</td>
                  <td>대표번호</td>
                  <td style="font-size: 8px;">010-0123-4567</td>
               </tr>
               <tr>
                  <td></td>
                  <td>이메일</td>
                  <td style="font-size: 8px;">CreateContainer@cc.kr</td>
               </tr>
               <!-- <tr>
                  <td>
                  <td colspan="3" style="font-size: 10px;">CreateContainer 이용 중
                     궁금하신 점이 있으신가요? 메일 또는 플러스친구 `CreateContainer`로 연락해주세요.<br> 최선을
                     다해 도와드리겠습니다.
                  </td>
               </tr> -->
   
            </table>
         </div>
      

         <ul class="icons">
            <li>&copy; CreateContainer. All rights reserved. Images <a
               href="https://unsplash.com">CreateContainer</a> Design <a
               href="https://templated.co">CC</a></li>
            <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
            <li><a href="#" class="icon fa-facebook"><span
                  class="label">Facebook</span></a></li>
            <li><a href="#" class="icon fa-instagram"><span
                  class="label">Instagram</span></a></li>
            <li><a href="#" class="icon fa-envelope-o"><span
                  class="label">Email</span></a></li>
         </ul>
      </div>

   </footer>
</body>
</html>