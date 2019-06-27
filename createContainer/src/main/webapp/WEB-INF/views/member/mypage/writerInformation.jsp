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

	
	<jsp:include page="common/writerbanner.jsp"/>
  
<div class="container">
  <div class="row">
  <jsp:include page="common/mypageNavbar.jsp"/>
    <div class="col-sm-3">
  	 	<jsp:include page="common/WriterpageSideNavbar.jsp"/>
    </div>
    <div class="col-sm-7" style="text-align:center;">
					<ul class="nav nav-tabs">
    					<li class="active" style="width:100%;"><a href="#" style="font-weight:bold;">회원 정보 수정</a></li>
    					
  					</ul>
      <div class="point" style="width:80%; margin:0 auto;">
  					<br>
  					
  					
  					
  					<form action="memberUpdate.mg" class="form-horizontal" method="post" style="margin-top:50px;" enctype="multipart/form-data">
  					
  					
  					
  					<!-- input name, vo name이랑 맞추기 -->
  					<div class="form-group">
    					<img src="${contextPath}/resources/images/icon/avatar-06.jpg">
    					<div class="col-sm-12" style="text-align:center;">
    						<input type="file" name="photo" id="profilePhoto">
    						<br>
    						<img src="${ contextPath }/resources/images/mypage/upload.png" id="img1Area" width="30px" style="margin:0 auto;">
    					</div>
  					</div> 
  					<div class="form-group">
    					<div class="col-sm-12">
      						<textarea id="introduce" style="resize:none; margin-top:50px;" cols="60" rows="6" name="intro">작가 소개글을 적어주세요.</textarea>
    					</div>
  					</div> 
  					
  					
  					<button class="btn btn-info" type="submit">수정</button>
  					</form>
				</div>
    </div>
    <div class="col-sm-2">
     <img src="${ contextPath }/resources/images/advertisement.png" width="100%">     
    </div>
  </div>
</div>
<script>
		$(function(){
			
			$("#profilePhoto").hide();
			 $("#img1Area").click(function(){
				 $("#profilePhoto").click();
			 })
			
		})
</script>
</body>
</html>