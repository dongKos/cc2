<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.genreNav{
	margin-top:0px;
	text-align: center;
	border-bottom:1px solid #E0E0E0;
	background-color:#F0F0F0;
}
.genreMenu{
	margin:0 auto;
}
.genreItem{
	height:30px;
	width:100px;
	font-weight:bold;
	font-size:13px;
	color:gray;
}
.genreItem:hover{
	cursor:pointer;
	color:#84CEFA;
}
</style>
</head>
<body>
	<div class="genreNav">
		<table class="genreMenu">
			<tr>
				<td class="genreItem" id="1" onClick="">추천</td>
				<td class="genreItem" id="2" onClick="genreMenu('GR_CTG3',1)">판타지</td>
				<td class="genreItem" id="3" onClick="genreMenu('GR_CTG8',1)">무협</td>
				<td class="genreItem" id="4" onClick="genreMenu('GR_CTG10',1)">로맨스</td>
				<td class="genreItem" id="5" onClick="genreMenu('GR_CTG1',1)">현대</td>
				<td class="genreItem" id="6" onClick="genreMenu('GR_CTG6',1)">공포</td>
				<td class="genreItem" id="7" onClick="genreMenu('CLOSE',1)">완결</td>
			</tr>
		</table>
	</div>
</body>
</html>