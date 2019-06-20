<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#loginBtn {
		height: 50px;
	}
	.nav {
		width: 700px;
		margin: 0 auto;
	}
	.menu {
		display: inline-block;
		background: yellowgreen;
		text-align: center;
		line-height: 50px;
		width: 24%;
		height: 50px;
		border-radius: 20px;
	}
	.menu:hover {
		background: orangered;
		color: white;
		cursor: pointer;
	}
</style>

</head>
<body>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
	<h1 align="center">마지막 수업</h1>
	<div class="loginArea" align="right">
		<c:if test="${empty loginUser }">
			<form action="login.me" method="post">
				<table id="loginTable" style="text-align:center;">
					<tr>
						<td>아이디</td>
						<td><input type="text" name="userId"></td>
						<td rowspan="2">
							<button id="loginBtn">로그인</button>
						</td>
					</tr>
					
					<tr>
						<td>패스워드</td>
						<td><input type="password" name="userPwd"></td>
					</tr>
					<tr>
						<td colspan="2">
							<a href="memberJoinView.me">회원가입</a>
							<a href="#">아이디 비밀번호 찾기</a>
						</td>
					</tr>
				</table>
			</form>
		</c:if>
		<c:if test="${!empty loginUser }">
			<h3 align="right"><c:out value="${loginUser.userName }님 환영합니다!"></c:out></h3>
			<button>정보수정</button>
			<button onclick="location.href='logout.me'">로그아웃</button>
		</c:if>
	</div>
	<div class="menubar">
		<div class="nav">
			<div class="menu">HOME</div>
			<div class="menu">공지사항</div>
			<div class="menu">게시판</div>
			<div class="menu">사진게시판</div>
		</div>
	</div>
</body>
</html>































