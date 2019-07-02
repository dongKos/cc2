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
</head>
<body id="page-top">
<jsp:include page="common/IllustTopNavbar.jsp"/>
<br><br><br>
<div class="col-lg-12">
	<br>
	<table class="col-lg-12" style="border-color:2px solid black">
		<tr style="float:left; width:25%;">
			<td align="center"><img src="${contextPath }/resources/images/logoEdit.png" style="width:70%"><br><br>
			<h2>작가닉네임</h2><br>
			<i class="fab fa-instagram" style="font-size:40px;"><br><p style="font-size:12px">Instargram</p></i>
			<i class="fab fa-facebook-square" style="font-size:40px; margin-left:5%;"><br><p style="font-size:12px">Facebook</p></i>
			<i class="fab fa-twitter-square" style="font-size:40px; margin-left:10%;"><br><p style="font-size:12px">Twitter</p></i><br><br>
			<button type="button" class="btn btn-info" style="width:70%; font-size:13px;">Follow</button><br><br>
			<hr style="border:2px solid darkgray; width:100%"><br><br>
			<h3 style="text-align:justify">작가소개씨부렁씨부렁씨부렁씨부렁씨부렁씨부렁씨부렁씨부렁</h3>
			</td>
			<tr style="align:center; float:left; width:25%; margin-top:5%"><td align="center"><img src="${contextPath }/resources/images/logoEdit.png" style="width:70%"></td></tr>
			<tr style="align:center; float:left; width:25%; margin-top:5%"><td align="center"><img src="${contextPath }/resources/images/logoEdit.png" style="width:70%"></td></tr>
			<tr style="align:center; float:left; width:25%; margin-top:5%"><td align="center"><img src="${contextPath }/resources/images/logoEdit.png" style="width:70%"></td></tr>
			<tr style="align:center; float:left; width:25%; margin-top:5%"><td align="center"><img src="${contextPath }/resources/images/logoEdit.png" style="width:70%"></td></tr>
			<tr style="align:center; float:left; width:25%; margin-top:5%"><td align="center"><img src="${contextPath }/resources/images/logoEdit.png" style="width:70%"></td></tr>
			<tr style="align:center; float:left; width:25%; margin-top:5%"><td align="center"><img src="${contextPath }/resources/images/logoEdit.png" style="width:70%"></td></tr>
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
		</tr>
	</table>
</div>
</body>
</html>