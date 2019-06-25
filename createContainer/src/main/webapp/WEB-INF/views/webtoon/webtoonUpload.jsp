<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
.col-sm-9 {
	
}

.container {
	display: block;
	position: relative;
	padding-left: 35px;
	margin-bottom: 12px;
	cursor: pointer;
	font-size: 22px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/* Hide the browser's default radio button */
.container input {
	position: absolute;
	opacity: 0;
	cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
	position: absolute;
	top: 0;
	left: 0;
	height: 25px;
	width: 25px;
	background-color: #eee;
	border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
	background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.container input:checked ~ .checkmark {
	background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
	content: "";
	position: absolute;
	display: none;
}

/* Show the indicator (dot/circle) when checked */
.container input:checked ~ .checkmark:after {
	display: block;
}

/* Style the indicator (dot/circle) */
.container .checkmark:after {
	top: 9px;
	left: 9px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}

#thumbnailArea {
	border: 0.5px solid grey;
	width: 50px;
	height: 50px;
}

.col-sm-8 {
	border: 0.5px solid grey;
	padding-top: 20px;
	padding-bottom: 30px;
	margin-bottom: 40px;
}
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath}" scope="application"/>
	<jsp:include page="../main/common/serviceNavbar.jsp" />
	<jsp:include page="common/webtoonMenubar.jsp" />
	<br>
	<br>
	<br>
	<div class="container">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<c:forEach var="wt" items="${list }">
			<table class="wtList">
				<tr>
					<td class="workThumbnail">
						<div class="thumbnail">
							<img src="${contextPath}/resources/uploadFiles/webtoonMain/${wt.changName}"/>
						</div>
					</td>
					<td class="subContent">
						${wt.wTitle }
						
					</td>
					<td>
						<button class="btn btn-primary btn-sm">작품정보수정</button>
					</td>
				</tr>
				
			</table>
						
			</c:forEach>
			
			<h3>ㄹ인머림나ㅓ</h3>			
			<button onclick="location.href='inserWorkForm.wt'"
					class="btn btn-primary btn-sm">웹툰등록</button>
		</div>
	</div>
</body>
</html>

































