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
  	function apply(){
  		var scode = "<c:out value='${srlist[0].scode }'/>"
  		location.href="illustRewardApply.ill?scode=" + scode;
  	}
  </script>
  <style>
  	.reward {
  		background: lightgray;
  		width: 100%;
  		padding: 30px;
  	}
  	
  	.img-content {
  		height: 500px;
  	}
  </style>
</head>
<body>
<jsp:include page="common/IllustTopNavbar.jsp"/>
	<div class="container">
			<br><br>
			<h2>선택할 수 있는 후원 작품이에요!</h2>
			<br><br>
			
		<div class="row">
			<c:forEach var="illSupportReward" items="${ srlist }">
				<div class="reward">
					<div align="right">
						원하는 만큼 후원하기 <button class="btn btn-primary" onclick="apply();">></button>
					</div>
					<hr>
					<div class="img-content">
						<img src="${contextPath }/resources/uploadFiles/support/${ illSupportReward.changeName }" style="width:100%; height:100%;">
					</div>
					<hr>
					<h4>${ srlist[0].stitle}</h4>
					<div class="textArea">
						${srlist[0].scontent}
						
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>