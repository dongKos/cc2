<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
.thumbnail{
     width: 140px;
     height: 135px;
 }
 .subInfo{
 
 }
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<!-- 서비스 상단 네비바 -->
	<jsp:include page="../main/common/serviceNavbar.jsp"/>
	<!-- 웹소설 중단 네비바 -->
	<jsp:include page="common/webtoonMenubar.jsp"/>
	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
			<h3>${ list1.userName}&nbsp;&nbsp;&nbsp;&nbsp;님의 작품</h3>
			<hr>
			<c:forEach var="wtr" items="${list}">
			<table>
				<tr>
					<td>
					<img class="thumbnail" src="${contextPath}/resources/uploadFiles/webtoonMain/${wtr.changeName }"/>
					<div class="subInfo">
					<h4>${ wtr.genreExplain }</h4>
					<h4>${ wtr.wTitle }</h4>
					</div>
					</td>
				</tr>
			</table>
			</c:forEach>
			</div>
		</div>
	</div>











</body>
</html>