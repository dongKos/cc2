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
    <div class="col-sm-7">

      <div class="point">
					<ul class="nav nav-tabs">
    					<li style="width:50%;"><a href="writeWnoFree.mg">무료 웹소설 작품</a></li>
    					<li class="active" style="width:50%;"><a href="writeWnoPay.mg">유료 웹소설 작품</a></li>
    					
  					</ul>
  					<br>
  					<!-- 여기부터 -->
  					<div style="width:100%;">
  					
  					<table style="width:100%;">
  					
  					<tr style="border-top:1px solid #ececec;">
  					<td style="width:33%; padding-top:20px;"><img src="${ contextPath }/resources/images/mypage/denmathum.jpg" width="150px"/></td>
  					<td style="width:33%;">덴마</td>
  					<td style="width:33%;"><button type="button" class="btn btn-info" onclick="infoPassConfirm();">작품 정보 수정</button></td>
  					
  					</tr>
  					
  					
  					</table>
 					
  					</div>
  					<hr>
  					
  		
				</div>
				
				<div align="center">< - 페이징처리할꾸얌 - ></div>
  					<div align="center" style="margin-top:20px;">
  			<button type="button" class="btn btn-info" onclick="infoPassConfirm();">새 작품 등록</button>
  			</div>
  			
  			
  			
    </div>
    <div class="col-sm-2">
     <img src="${ contextPath }/resources/images/advertisement.png" width="100%">     
    </div>
  </div>
</div>
</body>
</html>