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
		<div class="row">
			<div class="main-img">
			<c:forEach var="illSupportDetail" items="${ sdlist }">
			<c:if test="${sdlist[0].aCategory eq 'ma' }">
				<img src="${contextPath }/resources/uploadFiles/illustrator/illChallenge/${ illSupportDetail.changeName }" >
			</c:if>
			</c:forEach>
			</div>
		</div>
		
		<div class="row">
		<c:forEach var="illSupportDetail" items="${ sdlist }">
		<c:if test="${illSupportDetail.aCategory eq 'prf' }">
			<div class="img" >
				<img src="${contextPath }/resources/uploadFiles/writerProfile/${ illSupportDetail.changeName }" style="width:200px; height:200px">
			</div>
		</c:if>
		</c:forEach>
			<div class="profile">
				<h3>${sdlist[1].nickName}</h3>
				<p>#${sdlist[1].illCategory}</p>	
			</div>
			<br>
			<button class="btn btn-primary form-control" onclick="reward();">후원하기</button>
		</div>
		<div class="row">
			<h2>작가소개</h2>
			<div class="text">
				${ sdlist[0].intro}
			</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>