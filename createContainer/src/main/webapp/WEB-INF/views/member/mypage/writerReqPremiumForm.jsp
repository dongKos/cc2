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
    					<li class="active"><a href="#">유료 작품 등록하기</a></li>
    					
  					</ul>
  					<br>
  					<table width="100%;">
  						<tr>
  							<td width="100px;"><label>작품 제목 : </label></td>
  							<td><label>${ work.wTitle }</label>
  						</tr>
  						<tr>
  							<td width="100px;"><label>연재 주기 : </label></td>
  							<td><label>${ work.wCycle }</label>
  						</tr>
  						<tr>
  							<td width="100px;"><label>연재 회차 : </label></td>
  							<td><label>${ work.wCycle }</label>
  						</tr>
  					</table>
				</div>
    </div>
    <div class="col-sm-2">
     <img src="${ contextPath }/resources/images/advertisement.png" width="100%">     
    </div>
  </div>
</div>
</body>
</html>