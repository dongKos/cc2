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
	<jsp:include page="common/mypageNavbar.jsp"/>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="common/mypageSideNavbar.jsp"/>
			</div>
			<div class="col-md-10">
				<div class="point" style="border: 1px solid black;">
					<p>
						<span>포인트 : 5000원</span>
						<span>이용권 : 0개</span>
					</p>
				</div>
				<div class="area" style="height: 600px; border: 1px solid black;">
				
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="common/mypgFooter.jsp"/>
	
</body>
</html>