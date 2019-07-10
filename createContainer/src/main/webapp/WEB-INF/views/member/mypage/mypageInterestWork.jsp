<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="margin-top: 3.5%;">

	
	<div class="jumbotron text-center" style="
    padding-bottom: 0px;
    padding-top: 0px;
    background:white;
	">
  <img src="${ contextPath }/resources/images/mypagebanner.png">
</div>
  
<div class="container">
  <div class="row">
  <jsp:include page="../../main/common/mainMenubar.jsp"/>
    <div class="col-sm-3">
  	 	<jsp:include page="common/mypageSideNavbar.jsp"/>
    </div>
    <div class="col-sm-7">
      <div class="point" style="border: 1px solid lightgray;">
					<p>
						<span>포인트 : 5000원</span>
						<span>이용권 : 0개</span>
					</p>
				</div>
    </div>
    <div class="col-sm-2">
     <img src="${ contextPath }/resources/images/advertisement.png" width="100%">     
    </div>
  </div>
</div>
<jsp:include page="common/mypgFooter.jsp"/>

</body>
</html>