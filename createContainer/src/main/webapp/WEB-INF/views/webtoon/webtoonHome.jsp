<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#todayWebtoon {
	width: 30%;
	height: 170px;
	background-color: red;
	margin: auto;
}

#sideCategory {
	list-style: none;
	display: inline;
}

#sideCategory li {
	padding-left:20%;
}
</style>
</head>
<body>
	<jsp:include page="common/webtoonMenubar.jsp" />

	<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;오늘의 웹툰</h2>
	<br>
	<br>
	<br>
	<br>
	<ul id="sideCategory">
		<li><a href="#" />조회수</li>
		<br>
		<li><a href="#" />인기순</li>
		<br>
		<li><a href="#" />별점순</li>
		<br>
	</ul>
	<div id="todayWebtoon">
		<h1 align="center">test</h1>
	</div>
</body>
</html>