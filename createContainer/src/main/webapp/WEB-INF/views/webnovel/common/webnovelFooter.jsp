<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#flogo{
		margin:0px 0px 0px 0px;
		width:150px;
	}
	footer{
		height:200px;
		background-color:white;
		margin-top:100px;
		border:1px solid gray;
		min-width:1000px;
	}
	.footer{
		height:100%;
		width:100%;
		color:gray;
		font-size:12px;
		font-weight:bold;
	}
	.footer tr>td{
		padding:0px 0px 0px 0px;
		text-align:left;
		height:20px;
	}
	
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<footer class="container-fluid text-center">
		<table class="footer">
			<tr>
				<td colspan="4"></td>
			</tr>
			<tr>
				<td rowspan="4" style="width:200px;text-align:center;">
					<img id="flogo"src="${ contextPath }/resources/images/logo.png">
				</td>
				<td style="width:300px;">(주)CreateContainer</td>
				<td style="width:50px;">고객센터</td><td>(주 6일,오전 10시 ~ 저녁 10시 까지)</td>
			</tr>
			<tr>
				<td>대표이사 : 김동환</td>
				<td>카카오톡</td><td style="font-size:8px;">김동환</td>
			</tr>
			<tr>
				<td>서울 특별시 갱남 KH정보교육원</td>
				<td>대표번호</td><td style="font-size:8px;">010-0123-4567</td>
			</tr>
			<tr>
				<td></td>
				<td>이메일</td><td style="font-size:8px;">CreateContainer@cc.kr</td>
			</tr>
			<tr>
				<td>
				<td colspan="3" style="font-size:10px;">CreateContainer 이용 중 궁금하신 점이 있으신가요? 
								메일 또는 플러스친구 `CreateContainer`로 연락해주세요.<br>
								최선을 다해 도와드리겠습니다.
				</td>
			</tr>
			<tr>
				<td colspan="4"></td>
			</tr>
		</table>
	</footer>
</body>
</html>