<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.djcNav{
	margin-top:0px;
	text-align: center;
	border-bottom:1px solid #E0E0E0;
	padding-left: 20%;
	background-color: #2c3e50;
	
}
.djcMenu{
	margin:left;
}
.djcItem{
	height:30px;
	width:100px;
	font-weight:bold;
	font-size:13px;
	color:white;
}
.djcItem:hover{
	cursor:pointer;
	color:#84CEFA;
}
</style>
</head>
<body>

	<div class="djcNav">
		<table class="djcMenu">
			<tr>	
				<td class="middleItem" onClick="location.href='webtoonMain.wt'">추천</td>
				<td class="djcItem" onClick="location.href='webtoonDaily.wt'">요일별</td>
				<td class="djcItem" onClick="location.href='webtoonComplete.wt'">완결</td>
				
			</tr>
		</table>
	</div>
</body>
</html>