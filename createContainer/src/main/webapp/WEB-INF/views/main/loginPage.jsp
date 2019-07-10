<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreateContainer-로그인</title>
<link rel = "stylesheet" type = "text/css" href = "${ contextPath }/resources/css/main.css">
</head>
<body>
	<div class="loginForm">
		<div class="logo">
			<a href="${ contextPath }/mainHome.me">
				<img class="logoImg" src="${ contextPath }/resources/images/logo.png">
			</a>
		</div>
		
		<form action="login.me" method="post">
			<table class="lineTable">
				<tr>
					<td class="hr"><hr></td>
					<td class="line"><h4>아이디 로그인</h4></td>
					<td class="hr"><hr></td>
				</tr>
			</table>
			<div class="divBox">
				<input class="mainInput" type="text" name="userId" placeholder="아이디" maxlength="20" autofocus required>
				<input class="mainInput" type="password" name="userPwd" placeholder="비밀번호" maxlength="20"  required>
			</div>
			<div class="loginDiv">	
				<a class="findUser" href="${ contextPath }/findUser.me">아이디 / 비밀번호를 잊어버리셨나요?</a>
			</div>
			<div class="divBox">
				<button class="loginBtn"  onclick="console.log('버튼 클릭')" type="submit">로그인</button>
				<button class="signUpBtn" type="button" onclick="location.href='showStepForm.me'">회원가입</button>
			</div>
			<table class="lineTable">
				<tr>
					<td class="hr"><br><vr><hr></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>