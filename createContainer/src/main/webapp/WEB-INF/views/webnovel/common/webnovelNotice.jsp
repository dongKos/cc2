<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.noticeImg{
		height:100% !important;
	    margin: auto;
	}
.carousel-control.left {
	background-image: linear-gradient(to right,rgb(202, 205, 208) 0,rgba(0,0,0,.0001) 100%);
}
.carousel-control.right {
    background-image: linear-gradient(to right,rgba(0,0,0,.0001) 0,rgba(202, 205, 208) 100%);
}
#myCarousel{
	width:565px;
	margin:auto;
}

</style>
</head>
<body>
	<!-- 공지 이미지 -->
	<div class="row">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<div class="carousel-inner">
				<div class="item active">
					<img class="noticeImg" src="${ contextPath }/resources/images/novelcarucel01.jpg" alt="1">
				</div>
				<div class="item">
					<img class="noticeImg" src="${ contextPath }/resources/images/novelcarucel02.jpg" alt="2">
				</div>
				<div class="item">
					<img class="noticeImg" src="${ contextPath }/resources/images/novelcarucel03.jpg" alt="3">
				</div>
			</div>

			<a class="left carousel-control" href="#myCarousel" data-slide="prev"> 
				<span class="glyphicon glyphicon-chevron-left"></span> 
				<span class="sr-only">Previous</span>
			</a> 
			<a class="right carousel-control" href="#myCarousel" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
</body>
</html>