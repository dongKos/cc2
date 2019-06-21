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
  		location.href="illustRewardApply.ill";
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
			<h2>선택할 수 있는 후원 작품이 2개 있어요!</h2>
			<br><br>
			
		<div class="row">
			<div class="reward">
				<div align="right">
					원하는 만큼 후원하기 <button class="btn btn-primary" onclick="apply();">></button>
				</div>
				<hr>
				<div class="img-content">
					img
				</div>
				<hr>
				<h4>핸드폰 배경 화면 2증!</h4>
				<div class="textArea">
					이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며<br> 
					예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 위하여
				</div>
				
			</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>