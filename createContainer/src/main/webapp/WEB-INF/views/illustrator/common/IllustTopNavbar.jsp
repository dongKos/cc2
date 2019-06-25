<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>CC 일러스트</title>

  <!-- Custom fonts for this theme -->
  <link href="${contextPath }/resources/vendor/illust/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">

  <!-- Theme CSS -->
  <link href="${contextPath }/resources/css/illust/freelancer.min.css" rel="stylesheet">
<style>
	.secondNav {
		text-align: center;
	}
	
	.secondNav ul {
		width: 70%;
		text-align: center;
		margin: 0 auto;
	}
	.secondNav li {
		width: 33%;
	}
</style>
</head>

<body>
<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
    <div class="container">
      <!-- <a class="navbar-brand js-scroll-trigger" href="#page-top">Start Bootstrap</a> -->
      <img src="${contextPath }/resources/images/logoEdit.png" onclick="location='mainHome.me'" style="cursor:pointer; width:15.4%; height:15.4%;">
      <a href="illustratorDetail.ill"><h2 style="color:white">Create Container</h2></a>
      <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <c:if test="${ empty sessionScope.loginUser }">
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link" href="${ contextPath }/loginForm.me" style="font-size:20px;">로그인</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link" href="${ contextPath }/showStepForm.me" style="font-size:20px;">회원가입</a>
          </li>
          </c:if>
          
          <c:if test="${ !empty sessionScope.loginUser }">
          <li class="nav-item mx-0 mx-lg-1">
			<a class="nav-link" href="mypgMain.mg" style="font-size:20px;">
				<c:out value="${ sessionScope.loginUser.userName }님"/>
			</a>
		  </li>
		  <li class="nav-item mx-0 mx-lg-1"><a class="nav-link" href="${ contextPath }/logout.me" style="font-size:20px;">로그아웃</a></li>
          </c:if>
          
          <div class="dropdown" style="margin-top:4%;">
		  	<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" style="font-size:13px;">
		    다른페이지로 이동
		  </button>
		  <div class="dropdown-menu">
		    <a class="dropdown-item" href="webtoonMain.wt" style="font-size:13px;">웹툰</a>
		    <a class="dropdown-item" href="webnovelMain.wn" style="font-size:13px;">웹소설</a>
		  </div>
		</div>
        </ul>
      </div>
    </div>
  </nav>
  
  <nav style="margin-top:14.4%; margin-bottom:0;background-color:gray;" class="navbar navbar-expand-lg">
 <!--  	<div style="float:left; margin-left:23%; margin-top:-1%;">
  		<h2><a href="illustPortpolio.ill" style="color:white">포트폴리오</a></h2>
  	</div>
  	<div style="float:left; margin-left:10%; margin-top:-1%;">
  		<h2><a href="illustChallenge.ill" style="color:white">도전</a></h2>
  	</div>
  	<div style="float:left; margin-left:10%; margin-top:-1%;">
  		<h2><a href="illustSupport.ill" style="color:white">후원하기</a></h2>
  	</div> -->
  	<div class="collapse navbar-collapse secondNav" id="navbarResponsive">
        <ul class="navbar-nav">
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link" href="illustChallenge.ill" style="color:white; font-size:40px; font-family: 'Do Hyeon', sans-serif;">도전하기</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link" href="illustPortpolio.ill" style="color:white; font-size:40px; font-family: 'Do Hyeon', sans-serif;">포트폴리오</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link" href="illustSupport.ill" style="color:white; font-size:40px; font-family: 'Do Hyeon', sans-serif;">후원하기</a>
          </li>
        </ul>
      </div>
    </div>
  	
  	
  </nav>
</body>
</html>