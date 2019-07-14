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
	
<footer class="footer text-center">
		<div class="container">
			<div class="row">

				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">ADDRESS</h4>
					<p class="lead mb-0" style="font-size:18px; font-family: 'Do Hyeon', sans-serif;">
						서울특별시 강남구 테헤란로14길 6 <br>남도빌딩 2층, 3층, 4층
					</p>
				</div>

				<!-- Footer Social Icons -->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">COMPANY</h4>
					<p class="lead mb-0" style="font-size:18px; font-family: 'Do Hyeon', sans-serif;">
						회사명 : CreateContainer<br>
						대표이사 : 김동환 <br>
					</p>
				</div>

				<!-- Footer About Text -->
				<div class="col-lg-4">
					<h4 class="text-uppercase mb-4">INFORMATION</h4>
					<p class="lead mb-0" style="font-size:18px; font-family: 'Do Hyeon', sans-serif;">
						카카오톡 : 김동환<br>
						이메일 : CreateContainer@cc.kr <br>
						대표번호 : 010 - 0123 - 4567<br>
						고객센터 : AM 10:00 ~ PM 10:00
					</p>
				</div>

			</div>
		</div>
	</footer>
	

	<!-- Copyright Section -->
	<section class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; CreateContainer 2019</small>
		</div>
	</section>
</body>
</html>