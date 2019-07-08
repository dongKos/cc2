<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/5.7.0/css/font-awesome.min.css">
  <script>
  	function reward(){
  		location.href="illustSupportReward.ill";
  	}
  </script>
  <style>
  	.main-img {
  		width: 100%;
  		background: pink;
  		height: 500px;
  	}
  </style>
</head>
<body>
<jsp:include page="common/IllustTopNavbar.jsp"/>
	<div class="container">
	<br>
		<div class="row">
			<c:forEach var="illSupportDetail" items="${ sdlist }">
			<c:if test="${illSupportDetail.aCategory eq 'ma' }">
			<div class="main-img">
				<img src="${contextPath }/resources/uploadFiles/illustrator/illChallenge/${ illSupportDetail.changeName }" style="width:100%; height:100%">
			</div>
			</c:if>
			</c:forEach>
		</div>
		<br>
		<div class="row">
		<c:forEach var="illSupportDetail" items="${ sdlist }">
		<c:if test="${illSupportDetail.aCategory eq 'prf' }">
			<div class="img" >
				<img src="${contextPath }/resources/uploadFiles/writerProfile/${ illSupportDetail.changeName }" style="width:200px; height:200px">
			</div>
		</c:if>
		</c:forEach>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="profile"><br>
				<h3 style="font-size:30px;">${sdlist[1].nickName}</h3>
				<p style="font-size:20px;">#${sdlist[1].illCategory}</p>
			</div>
				<button class="btn btn-primary form-control" onclick="reward();" style="margin-top:3%; font-size:15px">후원하기</button>
		</div>
		<br>
		<div class="row">
			<h2>작가소개<br><br>
			${ sdlist[0].intro}</h2>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>