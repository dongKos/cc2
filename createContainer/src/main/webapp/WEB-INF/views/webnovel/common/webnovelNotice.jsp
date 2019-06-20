<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<img src="${ contextPath }/resources/images/mybatis.png" alt="Los Angeles" style="width: 100%;">
				</div>
				<div class="item">
					<img src="${ contextPath }/resources/images/mybatis.png" alt="Chicago" style="width: 100%;">
				</div>
				<div class="item">
					<img src="${ contextPath }/resources/images/mybatis.png" alt="New york" style="width: 100%;">
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