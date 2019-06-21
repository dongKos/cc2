<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

#todayWebtoon {
	width: 60%;
	height: 150px;
	background-color: red;
	margin: 0 auto;
	float: right;
	display: inline-block;
	margin-top: 5%;
	margin-right: 5%;
}

#sideCategory {
	list-style: none;
	display: inline;
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

#area {
	background-color: red;
	width: 160px;
	height: 150px;
	margin-right: 10px;
	margin-top: 10px;
	margin-bottom: 10px;
	display: inline-block;
}

#todayWebtoon1 {
	background-color: red;
	width: 80%;
	height: 150px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<jsp:include page="../main/common/serviceNavbar.jsp" />
	<jsp:include page="common/webtoonMenubar.jsp" />

	<div class="container-fluid">
		<div class="col-sm-2"></div>
		<div class="col-sm-6 topContent" style="display: inline-block;">
			<div style="display: inline-block;">
				<h2>오늘의 웹툰</h2>
				<br>
				<ul id="sideCategory" style="display: inline-block;">
					<li><a href="#"></a>조회수</li>
					<br>
					<li><a href="#"></a>인기순</li>
					<br>
					<li><a href="#"></a>별점순</li>
					<br>
				</ul>
			</div>
			<div id="todayWebtoon" style="display: inline-block;">
				<h1 align="center">test</h1>
			</div>
			<hr>
			<h4>장르별 추천</h4>
			<hr>
			<jsp:include page="common/genreNavbar.jsp" />
			<table id="genreRecommed">
				<tr>
					<td><div id="area">
							<h4 align="center">test</h4>
						</div></td>
					<td><div id="area">
							<h4 align="center">test</h4>
						</div></td>
					<td><div id="area">
							<h4 align="center">test</h4>
						</div></td>
				</tr>
				<tr>
					<td><div id="area">
							<h4 align="center">test</h4>
						</div></td>
					<td><div id="area">
							<h4 align="center">test</h4>
						</div></td>
					<td><div id="area">
							<h4 align="center">test</h4>
						</div></td>
				</tr>
			</table>
			<hr>
			<h4>도전 추천웹툰</h4>
			<jsp:include page="common/genreNavbar.jsp" />
			<table id="genreRecommed">
				<tr>
					<td><div id="area">
							<h4 align="center">test</h4>
						</div></td>
					<td><div id="area">
							<h4 align="center">test</h4>
						</div></td>
					<td><div id="area">
							<h4 align="center">test</h4>
						</div></td>
				</tr>
				<tr>
					<td><div id="area">
							<h4 align="center">test</h4>
						</div></td>
					<td><div id="area">
							<h4 align="center">test</h4>
						</div></td>
					<td><div id="area">
							<h4 align="center">test</h4>
						</div></td>
				</tr>
			</table>
		</div>
		<div class="col-sm-2 sidenav">

			<h2>베스트도전만화</h2>
			<div id="challengeArea">
				<h3>도전만화 이미지</h3>
			</div>
			<br> <br> <br> <br>
			<div id="event">
				<br>
				<h4 align="center">이벤트</h4>
			</div>
			<br> <br> <br> <br>
			<div id="todayWebtoon1">
				<br>
				<h4 align="center">오늘 업데이트 된 웹툰</h4>
			</div>
			<br> <br> <br> <br>
			<div id="notice">
				<br>
				<h4 align="center">공지사항</h4>
				<ul>
					<li><a herf="#">공지사항1</a></li>
					<li><a herf="#">공지사항1</a></li>
					<li><a herf="#">공지사항1</a></li>
					<li><a herf="#">공지사항1</a></li>
				</ul>
			</div>
			<br> <br>
			<h4>
				<a href="#">만화FAQ</a>
			</h4>
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











