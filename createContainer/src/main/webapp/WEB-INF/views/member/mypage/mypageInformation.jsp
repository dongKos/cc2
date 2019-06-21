<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
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
    <div class="col-sm-7" style="text-align:center;">
					<ul class="nav nav-tabs">
    					<li class="active" style="width:100%;"><a href="#" style="font-weight:bold;">회원 정보 수정</a></li>
    					
  					</ul>
      <div class="point" style="width:80%; margin:0 auto;">
  					<br>
  					<form class="form-horizontal" action="/action_page.php">
  					<div class="form-group">
    					<label class="control-label col-sm-2" for="userId">아이디:</label>
    					<div class="col-sm-10">
      						<input type="text" class="form-control" id="userId" placeholder="dd">
    					</div>
  					</div> 
  					<div class="form-group">
    					<label class="control-label col-sm-2" for="userId">닉네임:</label>
    					<div class="col-sm-10">
      						<input type="text" class="form-control" id="userId" placeholder="dd">
    					</div>
  					</div> 
  					<div class="form-group">
    					<label class="control-label col-sm-2" for="userId">이름:</label>
    					<div class="col-sm-10">
      						<input type="text" class="form-control" id="userId" placeholder="dd">
    					</div>
  					</div> 
  					<div class="form-group">
    					<label class="control-label col-sm-2" for="userId">전화번호:</label>
    					<div class="col-sm-10">
      						<input type="text" class="form-control" id="userId" placeholder="dd">
    					</div>
  					</div> 
  					<div class="form-group">
    					<label class="control-label col-sm-2" for="userId">이메일:</label>
    					<div class="col-sm-10">
      						<input type="text" class="form-control" id="userId" placeholder="dd">
    					</div>
  					</div> 
  					<div class="form-group">
    					<label class="control-label col-sm-2" for="userId">생년월일:</label>
    					<div class="col-sm-10">
      						<input type="text" class="form-control" id="userId" placeholder="dd">
    					</div>
  					</div> 
  					<button type="button" class="btn btn-info" onclick="infoPassConfirm();">수정</button>
  					</form>
				</div>
    </div>
    <div class="col-sm-2">
     <img src="${ contextPath }/resources/images/advertisement.png" width="100%">     
    </div>
  </div>
</div>
</body>
</html>