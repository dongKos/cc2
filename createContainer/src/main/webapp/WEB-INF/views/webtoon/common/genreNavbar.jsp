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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<div class="genreNav">
		<table class="genreMenu">
			<tr>
				<td class="genreItem"><input type="hidden" name="genre" value="GR_CTG1">일상</td>
				<td class="genreItem"><input type="hidden" name="genre" value="GR_CTG2">개그</td>
				<td class="genreItem"><input type="hidden" name="genre" value="GR_CTG3">판타지</td>
				<td class="genreItem"><input type="hidden" name="genre" value="GR_CTG4">액션</td>
				<td class="genreItem"><input type="hidden" name="genre" value="GR_CTG5">로멘스</td>
				<td class="genreItem"><input type="hidden" name="genre" value="GR_CTG6">스릴러</td>
				<td class="genreItem" ><input type="hidden" name="genre" value="GR_CTG7">스포츠</td>
			</tr>
		</table>
	</div>
	
	<script>
		$(function(){
			$(".genreItem").click(function(){
			    var gen = $(this).children('input').val();
				console.log(gen);
				location.href="genrecategory.wt?genre=" + gen;
			});
		});
	
	</script>
	
</body>
</html>






















