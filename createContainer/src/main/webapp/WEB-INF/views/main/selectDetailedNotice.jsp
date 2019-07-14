<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--
	Caminar by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Caminar by TEMPLATED</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="${contextPath }/resources/assets/css/main.css" />
		<style>
			
			.spotlight{
				transition-duration: 1s;
			}
			.spotlight:hover{
				cursor:pointer;
				transform:scale(1.05);
				transform:all 1s ease-in-out;
				transition-duration: 1s;
			}
			.noticeArea{
				text-align:center;
				padding:20px;
				background-color:black;
				cursor:pointer;
			}
			.noticeTable tr td{
				background:white;
				line-height:40px  !important;
			}
			.noticeTitle{
				margin-bottom:30px;
				color:white;
			}
			.noticeTable tr:hover{
				cursor:pointer;
				transform:scale(1.01);
				transition-duration: 1s;
			}
			.noticeTable tr>td{
				border:1px solid lightgray;
			}
			.titleTd{
				font-size:18px;
				font-weight:bold;
				background-color:#F8F8F8 !important;
			}
			
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
			.bContent{
				margin:0 auto !important;
				width:500px;
				font-size:20px;
			}
		</style>
	</head>
	
	<body style="background:white;">
	<div>
	<c:if test="${sessionScope.loginUser.memberType eq 3 }">
		<c:redirect url="adminMain.ad"></c:redirect>
	</c:if>
	<jsp:include page="common/mainMenubar.jsp"/>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	</div>
		<section id="main">
			<div class="inner">
				<section id="one" class="wrapper style1">
	
					<div class="image fit flush">
						<img src="${contextPath }/resources/images/notice.jpg" alt="" />
					</div>
					<header class="special">
						<h2>${board.bTitle }</h2>
					</header>
					<div class="content" style="text-align:center;">
						<p class="bContent">${board.bContent }</p>
					</div>
					<br><br><br>
				</section>
			</div>
		</section>




			<!-- Footer -->
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

		<!-- Scripts -->
			<script src="${contextPath }/resources/assets/js/jquery.min.js"></script>
			<script src="${contextPath }/resources/assets/js/jquery.poptrox.min.js"></script>
			<script src="${contextPath }/resources/assets/js/skel.min.js"></script>
			<script src="${contextPath }/resources/assets/js/util.js"></script>
			<script src="${contextPath }/resources/assets/js/main.js"></script>
			<script>
				$("#ill").click(function(){
					location.href='illustMain.ill';
				})
				$("#wt").click(function(){
					location.href='webtoonTop5.wt';
				})
				$("#wn").click(function(){
					location.href='webnovelMain.wn';
				})
			</script>
			<script>
				$('.noticeTable').on('click',function(){
					location.href='NoticeList.mg';
				});
				Date.prototype.format = function(f) {
				    if (!this.valueOf()) return " ";
				 
				    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
				    var d = this;
				     
				    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
				        switch ($1) {
				            case "yyyy": return d.getFullYear();
				            case "yy": return (d.getFullYear() % 1000).zf(2);
				            case "MM": return (d.getMonth() + 1).zf(2);
				            case "dd": return d.getDate().zf(2);
				            case "E": return weekName[d.getDay()];
				            case "HH": return d.getHours().zf(2);
				            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
				            case "mm": return d.getMinutes().zf(2);
				            case "ss": return d.getSeconds().zf(2);
				            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
				            default: return $1;
				        }
				    });
				};
				
				String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
				String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
				Number.prototype.zf = function(len){return this.toString().zf(len);};
				
			
	
			</script>

	</body>
</html>