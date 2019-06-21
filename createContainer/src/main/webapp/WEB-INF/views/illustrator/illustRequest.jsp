<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의뢰 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/5.7.0/css/font-awesome.min.css">
  <style>
	.main-image {
		width: 100%;
		background: black;
		height: 500px;
	}
	
	.main-text {
		width: 100%;
		height: 500px;
	}
	
	.main-text textarea{
		width: 100%;
		height: 500px;
	}
  </style>
</head>
<body>
<jsp:include page="common/IllustTopNavbar.jsp"/>
	
	<div class="container">
	<br><br>
		<div class="row">
			<div class="col-lg-4 main-image">
				<img id="mainImage" alt="메인이미지">
			</div>
			<div class="col-lg-8 main-text">
				<textarea style="resize:none;" placeholder="자세히 입력하새주세요"></textarea>
			</div>
		</div>
		
		<br><br>
		<button class="btn btn-primary form-control">의뢰 신청하기</button>		
		
		<br><br>
		
		<hr>
		<h2 align="center">이용약관</h2>
		<br><br>
		
		<input type="checkbox" required><label>내용에 동의 합니다</label>
		
		<br><br>
		
		<textarea style="resize:none; width: 100%;" rows="10"></textarea>
		
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>