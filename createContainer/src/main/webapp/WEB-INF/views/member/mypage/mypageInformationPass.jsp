<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.form-control {
    display: block;
    width: 50%;
    }
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="margin-top: 3.5%;">

	
	<jsp:include page="common/mypagebanner.jsp"/>
  
<div class="container">
  <div class="row">
  <jsp:include page="common/mypageNavbar.jsp"/>
    <div class="col-sm-3">
  	 	<jsp:include page="common/mypageSideNavbar.jsp"/>
    </div>
    <div class="col-sm-7">
      <div class="point" style="text-align:center;">
					<h4 align="center" style="margin-top:150px;">현재 계정의 비밀번호를 입력하세요.</h4>
					
  					<br>
  					<div style="width:50%; margin:0 auto; text-align:center;">
  					<form action="mypgInfo.mg" method="post">
  					<input type="text" id="userId" name="userId" style="display:none;" value="${ sessionScope.loginUser.userId }">
  					<input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="비밀번호 입력">
  					<br>
  					<button type="submit" class="btn btn-info">확인</button>
  					</form>
  					</div>
				</div>
    </div>
    <div class="col-sm-2">
     <img src="${ contextPath }/resources/images/advertisement.png" width="100%">     
    </div>
  </div>
</div>
<script>
	function infoPassConfirm() {
		location.href="mypgInfo.mg";
	}
</script>
<jsp:include page="common/mypgFooter.jsp"/>

</body>
</html>