<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.middleNav{
	margin-top:60px;
	text-align: center;
	border-top:1px solid #E0E0E0;
	border-bottom:1px solid #E0E0E0;
	background: #2c3e50;
}
.middleMenu{
	margin:0 auto;
}
.middleItem{
	height:50px;
	width:130px;
	font-weight:bold;
	font-size:15px;
	color:white;
}
.middleItem:hover{
	cursor:pointer;
	color:#84CEFA;
}
.line{
	font-size:25px;
	color:#D5D5D5;
	margin-top:10px;
}
</style>
</head>
<body>
	<div class="middleNav">
		<table class="middleMenu">
			<tr>
				<td class="middleItem" onClick="location.href='webnovelMain.wn'">홈</td>
				<td class="middleItem" onClick="location.href='webnovelCategory.wn'">웹소설</td>
				<td class="middleItem" onClick="location.href='webnovelChallenge.wn?gradeType=1'">도전!!</td>
				<td class="middleItem" onClick="location.href='Faq.mg'">고객센터</td>
				<td class="middleItem" onClick="location.href='mypgMain.mg'">마이페이지</td>
				<td class="line">&#x2758;</td>
				<c:if test="${ !empty sessionScope.loginUser }">
					<td class="middleItem" onClick="location.href='selectWnList.wn?gradeType=1'">작품 올리기</td>
				</c:if>
				<c:if test="${ empty sessionScope.loginUser }">
					<td class="middleItem" onClick="location.href='loginForm.me'">작품 올리기</td>
				</c:if>
			</tr>
		</table>
	</div>
</body>
</html>







