<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
    <div class="container">
      <!-- <a class="navbar-brand js-scroll-trigger" href="#page-top">Start Bootstrap</a> -->
      <img src="${contextPath }/resources/images/logo.png" onclick="location='mainHome.me'" style="cursor:pointer; width:15%; height:15%;">
      <h2 style="color:white">CreateContainer</h2>
      <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#portfolio">로그인</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#about">회원가입</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#contact">메인페이지</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
  <nav style="height:100%; height:60px; margin-top:16%; background-color:gray;">
  	<div style="float:left; margin-left:23%; margin-top:1%;">
  		<h2><a href="#" style="color:white">포트폴리오</a></h2>
  	</div>
  	<div style="float:left; margin-left:10%; margin-top:1%;">
  		<h2><a href="#" style="color:white">도전</a></h2>
  	</div>
  	<div style="float:left; margin-left:10%; margin-top:1%;">
  		<h2><a href="#" style="color:white">후원하기</a></h2>
  	</div>
  </nav>
</body>
</html>