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
			.noticeTable:hover{
				cursor:pointer;
				transform:scale(1.01);
				transition-duration: 1s;
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
		</style>
	</head>
	
	<body style="background:white;">
	<div>
	<c:if test="${sessionScope.loginUser.memberType eq 3 }">
	<jsp:forward page="../admin/adminMain.jsp"/>
</c:if>
	<jsp:include page="common/mainMenubar.jsp"/>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	</div>

		<!-- Header -->
			<header id="header">
				<div class="logo" style="padding-top:50px;"><a href="#"> <span>For Author, For Reader</span></a></div>
			</header>

		<!-- Main -->
			<section id="main">
				<div class="inner">

				<!-- One -->
					<section id="one" class="wrapper style1">

						<div class="image fit flush">
							<img src="${contextPath }/resources/images/pic022.jpg" alt="" />
						</div>
						<header class="special">
							<h2>당신의 꿈에 날개를 달아주는 공간</h2>
							<p>For Author, For Reader</p>
						</header>
						<div class="content" style="text-align:center;">
							<p>웹툰, 소설, 일러스트 이 세상에 없던 종합 플랫폼 크리에이트 컨테이너</p>
							<p>작가가 되고 싶은데, 마땅한 공간이 없으시다구요? Create Container에서 꿈을 키워보세요!<br> 프로 작가의 장벽이 높아 고민이시라면 부담없이 작품을 올리고 공유하고 감상 해 보세요. <br>자유로운 연재로 다양한 작품들을 감상 하실 수 있습니다.</p>
						</div>
					</section>

				<!-- Two -->
					<section id="two" class="wrapper style2">
						<header>
							<h2>웹툰, 웹 소설, 일러스트</h2>
							<p>세 가지 활동을 하나로 모았습니다.</p>
						</header>
						<div class="content">
							<div class="gallery">
								<div>
									<div class="image fit flush">
										<a href="${contextPath }/resources/images/pic03.jpg"><img src="${contextPath }/resources/images/pic03.jpg" alt="" /></a>
									</div>
								</div>
								<div>
									<div class="image fit flush">
										<a href="${contextPath }/resources/images/pic01.jpg"><img src="${contextPath }/resources/images/pic01.jpg" alt="" /></a>
									</div>
								</div>
								<div>
									<div class="image fit flush">
										<a href="${contextPath }/resources/images/pic04.jpg"><img src="${contextPath }/resources/images/pic04.jpg" alt="" /></a>
									</div>
								</div>
								<div>
									<div class="image fit flush">
										<a href="${contextPath }/resources/images/pic05.jpg"><img src="${contextPath }/resources/images/pic05.jpg" alt="" /></a>
									</div>
								</div>
							</div>
						</div>
					</section>

				<!-- Three -->
					<section id="three" class="wrapper">
						<div class="spotlight" id="wt">
							<div class="image flush"><img src="${contextPath }/resources/images/72.JPG" alt=""/></div>
							<div class="inner">
								<h3>WEBTOON</h3>
								<p> &nbsp;자유롭게 연재하고 독자와 소통하세요.<br>웹툰을 연재에는 아무런 조건이 없습니다!<br>재미있는 아이디어와 뛰어난 상상력이 있다면 누구든지 웹툰 작가가 될 수 있습니다.</p>
							</div>
						</div>
						<div class="spotlight alt" id="wn">
							<div class="image flush"><img src="${contextPath }/resources/images/71.png" alt="" /></div>
							<div  class="inner">
								<h3>WEBNOVEL</h3>
								<p>지금껏 숨겨왔던 글솜씨를 뽐내보세요!<br>독자들을 사로잡아 자신만의 소설을 연재하다 보면,<br>세상은 진흙속의 진주를 발견하게 될 거니까요.</p>
							</div>
						</div>
						
						<div class="spotlight" id="ill">
							<div class="image flush"><img src="${contextPath }/resources/images/pic08.jpg" alt="" /></div>
							<div class="inner">
								<h3>ILLUSTRATION</h3>
								<p>당신만의 독특한 그림체가 필요합니다.<br>뛰어난 그림 솜씨를 알리고 싶으신가요?<br>일러스트 포트폴리오에 프로필을 올려 의뢰를 받고 독자에게 전달 해 주세요. 정말 멋진 일이에요.</p>
							</div>
						</div>					
						
						<div class="noticeArea">
							<h3 class="noticeTitle">NOTICE</h3>
							<table class="noticeTable">
								<tr>
									<td class="titleTd" width="80">No.</td>
									<td class="titleTd">제목</td>
									<td class="titleTd" width="120">구분</td>
									<td class="titleTd" width="120">등록일</td>
								</tr>
								<tbody class="bTbody"></tbody>
							</table>	
						</div>
					</section>

				</div>
			</section>

		<!-- Footer -->
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
					location.href='webtoonMain.wt';
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
				
				$(document).ready(function(){
					$.ajax({
						url:"selectmainNotice.wn",
						type:"get",
						data:{},
						success:function(data){
							for(var i = 0; i < data.list.length; i++){
								var updateDate = new Date(data.list[i].updateDate).format("yyyy-MM-dd");
								var category = '';
								if(data.list[i].subCategory == 'WN'){
									category = '소설';
								}else if(data.list[i].subCategory == 'WT'){
									category = '웹툰';
								}else if(data.list[i].subCategory == 'ILL'){
									category = '일러스트';
								}else if(data.list[i].subCategory == 'ETC'){
									category = '기타';
								}
								
								$(".bTbody").append(
									'<tr>' + 
										'<td>' + (i+1) + '</td>' +
										'<td>' + data.list[i].bTitle + '</td>' +
										'<td>' + category + '</td>' +
										'<td>' + updateDate + '</td>' +
									'</tr>'
								);
								
							}
							console.log(updateDate);
							console.log(data);
						},
						error:function(status){
							alert(status);
						}
					});	
				});
	
			</script>

	</body>
</html>