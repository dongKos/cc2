<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
.wnList{
	text-align:center;
}
.insertWnBtn{
	width:250px;
	height:40px;
	margin-top:5px;
	background-color:white;
	color:skyblue;
	border:1px solid #84CEFA;
	font-size:15px;
	font-weight:bold;
	cursor:pointer;
}
.insertWnBtn:hover{
	background-color:#84CEFA;
	color:white;
}
</style>
</head>
<body>
	<!-- 서비스 상단 네비바 -->
	<jsp:include page="../../main/common/serviceNavbar.jsp"/>
	<!-- 웹소설 중단 네비바 -->
	<jsp:include page="../common/middleNavbar.jsp"/>
	<!-- 웹소설 목록 -->
	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10 wnList">
				<button class="insertWnBtn" onclick="location='insertWebnovel.wn'">새 작품 쓰기</button>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
</body>
</html>











