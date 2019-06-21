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
	
}
.djcMenu{
	margin:left;
}
.djcItem{
	height:30px;
	width:100px;
	font-weight:bold;
	font-size:13px;
	color:gray;
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
				<td class="djcItem" onClick="location.href='webtoonDaily.wt'">요일별</td>
				<td class="djcItem" onClick="location.href='webtoonGenre.wt'">장르별</td>
				<td class="djcItem" onClick="location.href='webtoonComplete.wt'">완결</td>
				
			</tr>
		</table>
	</div>
</body>
</html>