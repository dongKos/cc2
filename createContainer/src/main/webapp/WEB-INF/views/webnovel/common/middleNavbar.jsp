<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.middleNav{
	margin-top:60px;
	text-align: center;
	border-bottom:1px solid #E0E0E0;
}
.middleMenu{
	margin:0 auto;
}
.middleItem{
	height:50px;
	width:130px;
	font-weight:bold;
	font-size:15px;
	color:gray;
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
				<td class="middleItem" onClick="location.href='webnovelTop5.wn'">TOP5</td>
				<td class="middleItem" onClick="location.href='webnovelChallenge.wn'">도전!!</td>
				<td class="middleItem" onClick="location.href='mypgMain.mg'">마이페이지</td>
				<td class="line">&#x2758;</td>
				<td class="middleItem" onClick="location.href='selectWnList.wn'">작품 올리기</td>
			</tr>
		</table>
	</div>
</body>
</html>