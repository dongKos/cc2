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
	/* background-color:#F0F0F0; */
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
				<td class="genreItem" onClick="location.href=''">일상</td>
				<td class="genreItem" onClick="location.href=''">개그</td>
				<td class="genreItem" onClick="location.href=''">판타지</td>
				<td class="genreItem" onClick="location.href=''">액션</td>
				<td class="genreItem" onClick="location.href=''">로멘스</td>
				<td class="genreItem" onClick="location.href=''">스릴러</td>
				<td class="genreItem" onClick="location.href=''">스포츠</td>
			</tr>
		</table>
	</div>
</body>
</html>