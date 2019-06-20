<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreateContainer</title>
<style>
	.testImg{
		margin-top:50px;
	}
</style>
</head>
<body>
	<jsp:include page="common/mainMenubar.jsp"/>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<div align="center">
	
	<!-- 로그아웃 상태 -->
	<c:if test="${ empty sessionScope.loginUser }">
		<img class="testImg" src="${ contextPath }/resources/images/spring.png" width="50%">	
		<h1>로그인 고고</h1>
	</c:if>
	<!-- 로그인 상태 -->
	<c:if test="${ !empty sessionScope.loginUser }">
		<img class="testImg" src="${ contextPath }/resources/images/logo.png" width="50%">	
		<h1>로그인 성고옹</h1>
	</c:if>
	   
	</div>
	
	<div align="center">
	<button onclick="location.href='adminMain.ad'">관리자 페이지로 이동</button><br>
	<button onclick="location.href='illustMain.ill'">일러스트 메인</button>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>