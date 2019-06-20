<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreateContainer-가입 방법</title>
<link rel = "stylesheet" type = "text/css" href = "${ contextPath }/resources/css/main.css">
</head>
<body>
	<div class="insertForm">
		<div class="logo">
			<a href="${ contextPath }/mainHome.me">
				<img class="logoImg" src="${ contextPath }/resources/images/logo.png">
			</a>
		</div>
			
		<table class="lineTable">
			<tr>
				<td class="hr"><hr></td>
				<td class="hr"><h4>가입 방법</h4></td>
				<td class="hr"><hr></td>
			</tr>
		</table>
		<table class="step">
			<tr>
				<td><span class="first">1</span></td>
				<td class="hr"><hr></td>
				<td><span class="second">2</span></td>
			</tr>
		</table>
		
			
			
		<div class="imgBox">
			<img class="loginImg" src="${ contextPath }/resources/images/naverJoin.png">
			<img class="loginImg" src="${ contextPath }/resources/images/kakaoJoin.png">
			<img class="loginImg" src="${ contextPath }/resources/images/gogleJoin.png">
			<button class="signUpBtn" type="button" onclick="location.href='showInsetForm.me'">간단 가입</button>
		</div>
	</div>
</body>
</html>