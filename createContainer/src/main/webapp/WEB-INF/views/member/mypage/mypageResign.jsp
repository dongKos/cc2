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
    <div class="col-sm-7">
      <div class="point">
					<ul class="nav nav-tabs">
    					<li class="active" style="width:100%;"><a href="#" style="font-weight:bold;">회원 탈퇴 안내</a></li>
    					
  					</ul>
  					<br>
  					<pre>케켘ㅋㅋ케케케ㅔ켘
케ㅔ네ㅏ에낭카넼아켕ㄴ
ㅋ에ㅏㅋ네아케나에</pre>
				<br>
  					<h4 align="center" style="color:red;">어쩔고저쩌고 탈퇴하면 저쩌고 합니다.</h4>
  					<div style="text-align:center;">
  					<input type="checkbox" checked><label>&nbsp; 모든 사항을 읽었으며 이에 동의합니다.</label>
		  					<br>
  					<button type="button" class="btn btn-info" >확인</button>
  					</div>
  					
				</div>
    </div>
    <div class="col-sm-2">
     <img src="${ contextPath }/resources/images/advertisement.png" width="100%">     
    </div>
  </div>
</div>
</body>
</html>