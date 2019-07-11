<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원 신청 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/5.7.0/css/font-awesome.min.css">
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
  <script>
  	function support(){
  		var wallet = Number("<c:out value='${sessionScope.loginUser.wallet}'/>");
  		var sPrice = Number($("#price").val());
  		var sCode = "<c:out value='${scode}'/>";
  		var mno = "<c:out value='${sessionScope.loginUser.mno}'/>";
  		console.log(wallet);
  		if(wallet < sPrice){
  			alert("보유 코인 부족!");
  		}else{
	  		location.href="insertSponsor.ill?sPrice=" + sPrice + "&mno=" + mno + "&sCode=" + sCode;
  		}
  		
  	}
  </script>
</head>
<body>
<jsp:include page="common/IllustTopNavbar.jsp"/>
	
	<div class="container">
		<br><br>
		<div class="row">
			<input type="number" class="form-control" placeholder="후원할 금액을 입력해주세요!" id="price">
		</div>
		
		<hr>
		
		<h2 align="center">이용약관</h2>
		<br><br>
		
		<input type="checkbox" required><label>내용에 동의 합니다</label>
		
		<br><br>
		
		<textarea style="resize:none; width: 100%;" rows="10"></textarea>
	</div>
	<br><br>
	<div align="center">
		<button class="btn btn-primary" onclick="support();">후원하기</button>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>