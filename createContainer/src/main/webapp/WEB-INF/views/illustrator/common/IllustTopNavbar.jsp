<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Freelancer - Start Bootstrap Theme</title>

  <!-- Custom fonts for this theme -->
  <link href="${contextPath }/resources/vendor/illust/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Theme CSS -->
  <link href="${contextPath }/resources/css/illust/freelancer.min.css" rel="stylesheet">

</head>
<body>
<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
    <div class="container">
      <!-- <a class="navbar-brand js-scroll-trigger" href="#page-top">Start Bootstrap</a> -->
      <img src="${contextPath }/resources/images/logo.png" onclick="location='mainHome.me'" style="cursor:pointer; width:15%; height:15%;">
      <a href="illustratorDetail.ill"><h2 style="color:white">CreateContainer</h2></a>
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
  
  <nav style="height:100%; height:60px; margin-top:-2%; background-color:gray;">
  	<div style="float:left; margin-left:23%; margin-top:-1%;">
  		<h2><a href="illustPortpolio.ill" style="color:white">포트폴리오</a></h2>
  	</div>
  	<div style="float:left; margin-left:10%; margin-top:-1%;">
  		<h2><a href="illustChallenge.ill" style="color:white">도전</a></h2>
  	</div>
  	<div style="float:left; margin-left:10%; margin-top:-1%;">
  		<h2><a href="illustSupport.ill" style="color:white">후원하기</a></h2>
  	</div>
  </nav>
</body>
</html>