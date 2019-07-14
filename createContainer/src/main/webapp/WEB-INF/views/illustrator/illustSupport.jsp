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
  		var userId = '${sdlist[0].userId}';
  		console.log(userId);
  		location.href="illustSupportReward.ill?userId=" + userId;
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
			<%-- <c:if test="${illSupportDetail.aCategory eq 'ma' && illSupportDetail.illType eq 'chall'}">
			<div class="main-img">
				<img src="${contextPath }/resources/uploadFiles/illustrator/illChallenge/${ illSupportDetail.changeName }" style="width:100%; height:100%">
			</div>
			</c:if> --%>
			<c:if test="${illSupportDetail.aCategory eq 'ma' && illSupportDetail.illType eq 'pri'}">
			<div class="main-img">
				<img src="${contextPath }/resources/uploadFiles/illustrator/illPortfolio/${ illSupportDetail.changeName }" style="width:100%; height:100%">
			</div>
			</c:if>
			</c:forEach>
		</div>
		<br>
		<div class="row">
		<c:forEach var="illSupportDetail" items="${ sdlist }">
		<c:if test="${illSupportDetail.aCategory eq 'prf'}">
			<div class="img" >
				<img src="${contextPath }/resources/uploadFiles/writerProfile/${ illSupportDetail.changeName }" style="width:200px; height:200px">
			</div>
		</c:if>
		</c:forEach>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="profile"><br>
				<h3 style="font-size:30px;">${sdlist[1].nickName}</h3>
				<p style="font-size:20px;">#${sdlist[1].illCategory}</p>
			</div><div hidden=true><input type="text" id="userIdspace"></div>
			<c:if test="${sessionScope.loginUser.userId ne  sdlist[0].userId}">
				<button class="btn btn-primary form-control" onclick="reward();" style="margin-top:3%; font-size:15px">후원하기</button>
			</c:if>
			<c:if test="${sessionScope.loginUser.userId eq  sdlist[0].userId}"> 	
				<button class="btn btn-primary form-control" onclick="reward();" style="margin-top:3%; font-size:15px" disabled>후원하기</button>
			</c:if>
		</div>
		<br>
		<div class="row">
			<h2>작가소개<br><br>
			${ sdlist[0].intro}</h2>
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