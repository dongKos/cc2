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

#area {
	background-color: red;
	width: 60px;
	height: 80px;
	margin-right: 10px;
	margin-top: 10px;
	margin-bottom: 30px;
}

#todayWebtoon {
	background-color: red;
	width: 80%;
	height: 150px;
	margin: 0 auto;
}

#day {
	display: inline-block;
	margin-right: 20px;
}
</style>
</head>
<body style="margin-top: 3.5%;">

	<!-- 서비스 상단 네비바 -->
	<jsp:include page="../main/common/serviceNavbar.jsp" />
	<jsp:include page="common/webtoonMenubar.jsp" />
	<jsp:include page="common/djcNavbar.jsp" />
	<jsp:include page="common/genreNavbar.jsp" />
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-6 content">
				<div class="new">
					<table id="new">
						<h3>신규웹툰</h3>
						<tbody>
							<tr>
								<td><img src="${contextPath}/resources/images/noimg.png"
									style="width: 100%;"></td>
								<td><img src="${contextPath}/resources/images/noimg.png"
									style="width: 100%;"></td>
								<td><img src="${contextPath}/resources/images/noimg.png"
									style="width: 100%;"></td>
								<td><img src="${contextPath}/resources/images/noimg.png"
									style="width: 100%;"></td>
								<td><img src="${contextPath}/resources/images/noimg.png"
									style="width: 100%;"></td>
							</tr>
						</tbody>
					</table>
				</div>

				<hr>
				<div id="middleTopCategory">
					<div style="display: inline; margin-top: 0px;">
						<h4>요일별 전체 웹툰</h4>
					</div>
					<div style="display: inline;">
						<ul id="sideCategory" style="padding-left: 120px;">
							<li><a href="#">조회수</a></li>
							<li><a href="#">인기순</a></li>
							<li><a href="#">별점순</a></li>
						</ul>
					</div>
				</div>
				<hr>

				<div id="dayText" style="display: inline;">
					<h3>월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						화&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						토&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</h3>
				</div>
				<hr>

				<div id="mondayArea" style="display: inline-block;">
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
				</div>

				<div id="tuesdayArea" style="display: inline-block;">
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
				</div>

				<div id="wednesdayArea" style="display: inline-block;">
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
				</div>

				<div id="thursdayArea" style="display: inline-block;">
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
				</div>

				<div id="fridayArea" style="display: inline-block;">
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
				</div>

				<div id="saturdayArea" style="display: inline-block;">
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
				</div>

				<div id="sundayArea" style="display: inline-block;">
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
					<div id="area">test</div>
				</div>

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
				<div id="todayWebtoon">
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