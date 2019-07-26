<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
	.mainLogo{
		height:50px;
	}
	.navbar-brand{
		padding-top:5px;
		height:60px !important;
	}
	.navbar{
		background:#2c3e50;
		height:60px !important;
	}
	.navbar-nav{
		margin-top:5px;
		font-size:15px;
		background:#2c3e50;
	}
	.navbar-header{
		background:#2c3e50;
	}
	.navbar-nav li>a{
		color:white !important;
	}
	.navbar-nav li>a:hover{
		color:gray !important;
		background: linear-gradient( to bottom, transparent, #84CEFA  );
		border-radius:5px;
	}
	.navbar-collapse {
	    background: #2c3e50;
	    padding-right:20px !important;
	}
	.navbar-toggle{
		margin-top:13px;
	}
	.navbar-default .navbar-toggle {
		background-color:#9ED7F8 !important;
	    border-color: white;
	}
	.navbar-toggle:hover {
    	background-color: #84CEFA  !important;
	}
	.icon-bar{
		background-color:gray !important;
	}
	
</style>
</head>
<body id="mainMenubar">
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="mainHome.me"> 
				<img class="mainLogo" src="${ contextPath }/resources/images/logo.png">
			</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-left">
            <li><a href="webtoonMain.wt">웹툰</a></li>
            <li><a href="webnovelMain.wn">웹소설</a></li>
            <li><a href="illustMain.ill">일러스트</a></li>
         </ul>
			<ul class="nav navbar-nav navbar-right">
				<!-- 로그인 비활성화 상태 -->
				<c:if test="${ empty sessionScope.loginUser }">
					<li><a href="${ contextPath }/loginForm.me">로그인</a></li>
					<li><a href="${ contextPath }/showStepForm.me">회원가입</a></li>
					<li><a href="#">ID/PWD 찾기</a></li>
				</c:if>
				<!-- 로그인 활성화 상태 -->
				<c:if test="${ !empty sessionScope.loginUser }">
					<li>
						<a href="${ contextPath }/mypgCreditCharge.mg">
							<img src="${ contextPath }/resources/images/icon/coin.png" width="20px;">
						</a>
					</li>
					<li>
						<a href="${ contextPath }/writerMain.mg">작가 페이지
						</a>
					</li>
					<li>
						<a href="${ contextPath }/mypgMain.mg">
							<c:out value="${ sessionScope.loginUser.userName }님 "/>
						</a>
					</li>
					<li><a href="${ contextPath }/logout.me">로그아웃</a></li>
				</c:if>
			</ul>
		</div>
	</nav>
	
	
	<script>
		$(document).ready(function() {
			$(".navbar a, footer a[href='#mainMenubar']").on('click',function(event) {
				if (this.hash !== "") {
					event.preventDefault();
					var hash = this.hash;
					$('html, body').animate({
						scrollTop : $(hash).offset().top
					}, 900, function() {
						window.location.hash = hash;
					});
				}
			});

			$(window).scroll(function() {
				$(".slideanim").each(function() {
					var pos = $(this).offset().top;

					var winTop = $(window).scrollTop();
					if (pos < winTop + 600) {
						$(this).addClass("slide");
					}
				});
			});
		})
	</script>
</body>
</html>