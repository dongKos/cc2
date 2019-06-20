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
</head>
<style>
.genreDiv{
	border:1px solid black;
	height:250px;
}
.item{
	height:350px;
}
.container{
	margin-top:30px;
}
.wbTop5{
	width:100%;
}
.wbTop5 tr{
	width:100%;
}
</style>
<body>
	<!-- 서비스 상단 네비바 -->
	<jsp:include page="../../main/common/serviceNavbar.jsp"/>
	<!-- 웹소설 중단 네비바 -->
	<jsp:include page="../common/middleNavbar.jsp"/>
	<!-- 웹소설 장르 네비바 -->
	<jsp:include page="../common/genreNavbar.jsp"/>
	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-7">
				
				<jsp:include page="../common/webnovelNotice.jsp"/>
				
			</div>
			<div class="col-sm-3">
				<p>베스트 도전작품</p><br>
				<img style="width:100%; hegiht:300px !important;"src="${ contextPath }/resources/images/logo.png"/>
			</div>
			<div class="col-sm-1"></div>
		</div><br><br>
		
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<table class="wbTop5">
					<tbody>
						<tr>
							<td><div class="genreDiv"></div></td>
						</tr>
						<tr style="height:30px;"><td></td></tr>
						<tr>
							<td><div class="genreDiv"></div></td>
						</tr>
						<tr style="height:30px;"><td></td></tr>
						<tr>
							<td><div class="genreDiv"></div></td>
						</tr>
						<tr style="height:30px;"><td></td></tr>
						<tr>
							<td><div class="genreDiv"></div></td>
						</tr>
						<tr style="height:30px;"><td></td></tr>
						<tr>
							<td><div class="genreDiv"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
</body>
</html>