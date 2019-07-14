<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreateContainer</title>
<style>
.container{
	margin-top:80px;
}
.noticeImg{
	height:400px !important;
	cursor:pointer;
}
.col-sm-10{
	text-align:center;
}
.logoTitleImg{
	height:50px;
	margin-bottom: 30px;
    margin-top: 10px;
}
</style>
</head>
<body>

<c:if test="${sessionScope.loginUser.memberType eq 3 }">
	<c:redirect url="adminMain.ad"/>
</c:if>
	<jsp:include page="common/mainMenubar.jsp"/>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<div class="container">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<img class="logoTitleImg" src="${ contextPath }/resources/images/logoTitle.png" alt="1">
			<div class="row">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
		
					<div class="carousel-inner">
						<div class="item active">
							<img class="noticeImg" src="${ contextPath }/resources/images/" onclick="location.href='webtoonMain.wt'" alt="웹툰 메인">
						</div>
						<div class="item">
							<img class="noticeImg" src="${ contextPath }/resources/images/" onclick="location.href='webnovelMain.wn'" alt="웹소설 메인">
						</div>
						<div class="item">
							<img class="noticeImg" src="${ contextPath }/resources/images/" onclick="location.href='illustMain.ill'"  alt="일러스트 메인">
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
		</div>
		<div class="col-sm-1"></div>
	</div>
	
	<div align="center">
	<button onclick="location.href='NoticeList.mg'">공지사항</button>
	
	</div>
	<jsp:include page="common/footer.jsp"/>
</body>
</html>