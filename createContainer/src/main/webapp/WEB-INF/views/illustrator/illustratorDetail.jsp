<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Freelancer - Start Bootstrap Theme</title>

  <!-- Custom fonts for this theme -->
  <link href="${contextPath }/resources/vendor/illust/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Theme CSS -->
  <link href="${contextPath }/resources/css/illust/freelancer.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
  	.list .list-div{
  		display: inline-block;
  		width: 32%;
  		height: 200px;
  		margin-bottom: 50px;
  		padding: 15px;
  	}
  	.list .list-div img {
  		width: 100%;
  		height: 100%;
  	}
  </style>
</head>
<body id="page-top">
<jsp:include page="common/IllustTopNavbar.jsp"/>
<br><br><br>
<div class="container-fluid" style="margin-top:-5%;">
	<br>
	<!-- 작가 프로필  -->
	<div class="row">
		<div class="col-lg-3" align="center">
			<c:forEach var="ill" items="${ilist }">
				<c:if test="${ill.aCategory eq 'prf'}">
					<img src="${contextPath }/resources/uploadFiles/writerProfile/${ill.changeName}" style="width:70%">
				</c:if>
			</c:forEach>
			<br><br>
			
			<h2>${ilist[0].nickName}</h2><br>
			<i class="fab fa-instagram" style="font-size:40px;"><br><p style="font-size:12px">Instargram</p></i>
			<i class="fab fa-facebook-square" style="font-size:40px; margin-left:5%;"><br><p style="font-size:12px">Facebook</p></i>
			<i class="fab fa-twitter-square" style="font-size:40px; margin-left:10%;"><br><p style="font-size:12px">Twitter</p></i><br><br>
			<button type="button" class="btn btn-info" style="width:70%; font-size:13px;">Follow</button><br><br>
			<hr style="border:2px solid darkgray; width:100%"><br><br>
			<h3 style="text-align:justify">${ilist[0].intro}</h3>
		</div>
		<!-- 작가 작품 목록 -->
		<div class="col-lg-9 list">
		<h2>도전 </h2>
			<c:forEach var="ill" items="${ilist }">
				<c:if test="${ill.aCategory eq 'ma' && ill.illType eq 'chall'}">
					<div class="list-div">
						<img src="${contextPath }/resources/uploadFiles/illustrator/illChallenge/${ill.changeName}">
					</div>
				</c:if>
			</c:forEach>
			
			<br>
		<h2>포트폴리오 </h2>
			<c:forEach var="ill" items="${ilist }">
				<c:if test="${ill.aCategory eq 'ma' && ill.illType eq 'pri'}">
					<div class="list-div">
						<img src="${contextPath }/resources/uploadFiles/illustrator/illPortfolio/${ill.changeName}">
					</div>
				</c:if>
			</c:forEach>
			
		</div>
	</div>
	
	
	<table class="col-lg-12" style="border-color:2px solid black">
		<tr style="float:left; width:25%; height:auto">
			<%-- <td align="center">
			<c:forEach var="ill" items="${ilist }">
			<c:if test="${ill.aCategory eq 'prf'}">
			<img src="${contextPath }/resources/uploadFiles/writerProfile/${ill.changeName}" style="width:70%">
			</c:if>
			</c:forEach>
			<br><br>
			<h2>${ilist[0].nickName}</h2><br>
			<i class="fab fa-instagram" style="font-size:40px;"><br><p style="font-size:12px">Instargram</p></i>
			<i class="fab fa-facebook-square" style="font-size:40px; margin-left:5%;"><br><p style="font-size:12px">Facebook</p></i>
			<i class="fab fa-twitter-square" style="font-size:40px; margin-left:10%;"><br><p style="font-size:12px">Twitter</p></i><br><br>
			<button type="button" class="btn btn-info" style="width:70%; font-size:13px;">Follow</button><br><br>
			<hr style="border:2px solid darkgray; width:100%"><br><br>
			<h3 style="text-align:justify">${ilist[0].intro}</h3>
			</td> --%>
			</tr>
			<%-- <c:forEach var="ill" items="${ilist }">
			<c:if test="${ill.aCategory eq 'ma' }">
			<img src="${contextPath }/resources/uploadFiles/illustrator/illChallenge/${ill.changeName}" style="width:70%; height:20%">
			</c:if>
			</c:forEach> --%>
			<tr>
				<td>
					<ul class="pagination" style="margin-left:54%; margin-top:4%; font-size:15px">
  						<li><a href="#">1</a></li>
  						<li><a href="#">2</a></li>
  						<li><a href="#">3</a></li>
  						<li><a href="#">4</a></li>
  						<li><a href="#">5</a></li>
					</ul>
				</td>
			</tr>
	</table>
</div>
</body>
</html>