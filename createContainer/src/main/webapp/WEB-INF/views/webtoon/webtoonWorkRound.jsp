<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
.row.content {
	height: 1500px
}
  
/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

table td {
	padding-left: 6px;
}

#sideCategory {
	list-style: none;
	display: inline;
}

#sideCategory li {
	display: inline-block;
	padding-left: 90px;
}

#new div {
	border: 0.5px solid black;
	width: 20%;
	height: 30%
}

#whole td {
	padding-bottom: 30px;
	padding-right: 5px;
}

#challengeArea {
	background-color: red;
	width: 80%;
	height: 170px;
	margin: 0 auto;
}

#event {
	background-color: red;
	width: 80%;
	height: 200px;
	margin: 0 auto;
}

#notice {
	background-color: red;
	width: 80%;
	height: 150px;
	margin: 0 auto;
}

#middleTopCategory div {
	display: inline;
}

#todayWebtoon {
	background-color: red;
	width: 80%;
	height: 150px;
	margin: 0 auto;
}

#workMainImg {
	background-color: red;
	width: 35%;
	margin-left: 70px;
	height: 120px;
	margin-top: 10px;
}

#workRoundImg {
	background-color: red;
	width: 110px;
	height: 80px;
	padding-left: 10px;
}

#new {
	padding-left: 10px;
}

.new-content {
	display: table-cell;
	padding-top: 10px;
}

#workSubMenu {
	padding-left: 10px;
}
</style>
</head>
<body style="margin-top: 3.5%;">

	<!-- 서비스 상단 네비바 -->
	<jsp:include page="../main/common/serviceNavbar.jsp" />
	<jsp:include page="common/webtoonMenubar.jsp" />
	<jsp:include page="common/djcNavbar.jsp" />
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8 content">
				<div class="new">
					<div id="workMainImg" class="new-content">
						<h4 align="center">test</h4>
					</div>
					<div id="workSubMenu" class="new-content">
						<h3 style="display: inline-block;">작품명</h3>
						<h4 style="display: inline-block;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;작가명</h4>
						<p>
							솔직 담백 최강의 개그 만화 <br>인트로인트로인트로인트로
						</p>
						<button type="button" class="btn btn-primary btn-sm">관심웹툰</button>
						<button type="button" class="btn btn-primary btn-sm">첫화보기</button>
						<button type="button" class="btn btn-primary btn-sm">다른작품보기</button>
					</div>
				</div>
				<hr>
				<h3>회차제목</h3>
				<hr>
				<h4>별점주는곳</h4>
				<hr/>
				<br><br><br><br>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>