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
	height:200px;
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
	<!-- 서비스 상단 네비바 -->
	<jsp:include page="../../main/common/serviceNavbar.jsp"/>
	<!-- 웹소설 중단 네비바 -->
	<jsp:include page="../common/middleNavbar.jsp"/>
	<div class="container">
		<!-- 공지사항, 베스트 도전작품 -->
		
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
		<!-- 장르별 추천작 -->
		<jsp:include page="mainGenre.jsp"/>
		<hr>
		<!-- 이달의 Best -->
		<jsp:include page="bestMonthWebnovel.jsp"/>
		<hr>
		<!-- 최신 등록작품,공지사항,광고-->
		<jsp:include page="newWebnovel.jsp"/>
		
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>