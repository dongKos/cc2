<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
.genreDiv{
	border:1px solid black;
	height:250px;
}
.genreDiv2{
	border:1px solid black;
	height:170px;
}



.item{
	height:350px;
}
.container{
	margin-top:30px;
}
.content{
	width:100%;
}




.wnCategory{
	width:100%;
}
.wnCategory tr{
	width:100%;
}
.lineUp{
	margin-top:50px;
	margin-bottom:10px;
	text-align:right;
}
.lineUp select{
	width:150px;
	height:30px;
}


</style>
</head>
<body>
	<!-- 서비스 상단 네비바 -->
	<jsp:include page="../../main/common/serviceNavbar.jsp"/>
	<!-- 웹소설 중단 네비바 -->
	<jsp:include page="../common/middleNavbar.jsp"/>
	<!-- 웹소설 장르 네비바 -->
	<jsp:include page="../common/genreNavbar.jsp"/>
	
	<div class="container">
		<!-- 공지 이미지 -->
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<jsp:include page="../common/webnovelNotice.jsp"/>
			</div>
			<div class="col-sm-1"></div>
		</div>
		
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div class="lineUp">
					<select>
						<option>최신순</option>
						<option>조회순</option>
						<option>별점순</option>
						<option>관심등록순</option>
					</select>
				</div>
				<table class="wnCategory">
					<tbody>
						<tr>
							<td><div class="genreDiv"></div></td>
							<td><div class="genreDiv"></div></td>
							<td><div class="genreDiv"></div></td>
						</tr>
						<tr style="height:30px;"><td></td></tr>
						<tr>
							<td><div class="genreDiv"></div></td>
							<td><div class="genreDiv"></div></td>
							<td><div class="genreDiv"></div></td>
						</tr>
						<tr style="height:30px;"><td></td></tr>
						<tr>
							<td><div class="genreDiv"></div></td>
							<td><div class="genreDiv"></div></td>
							<td><div class="genreDiv"></div></td>
						</tr>
						<tr style="height:30px;"><td></td></tr>
						<tr>
							<td><div class="genreDiv"></div></td>
							<td><div class="genreDiv"></div></td>
							<td><div class="genreDiv"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
</body>
</html>




















