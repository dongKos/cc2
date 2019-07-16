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
    					<li class="active" style="width:100%; text-align:center;"><a href="#" style="font-weight:bold;">내 휴재 내역</a></li>
    					
  					</ul>
  					<br>
  					<div id="charge">
  					<br>
  					<table width="100%;" style="text-align:center;" class="table table-hover">
  					<tr>
  						<th style="text-align:center;">날짜</th><th style="text-align:center;">제목</th><th style="text-align:center;">휴재 기간</th><th style="text-align:center;">승인 여부</th>
  					</tr>
  					<c:forEach var="ch" items="${ list }">
  					<tr>
  						<td>${ ch.uploadDate }</td><td>${ ch.wTitle }</td><td>${ ch.startDate }~${ ch.closedDate }</td><td>${ ch.closedReason }</td>
  					</tr>
  					</c:forEach>
  					<c:if test="${ list == null }">
  					<tr>
  						<td colspan=4 style="height:100px;">신청한 내역이 없습니다.</td>
  					</tr>
  					</c:if>
  					</table>
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