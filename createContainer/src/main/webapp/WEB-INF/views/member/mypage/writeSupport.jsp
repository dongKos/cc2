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
					<a href="Support.mg"></a>
  				<table style="width:100%; text-align:center" border="1">
  				<tr style="height:50px;">
  				
  				<td colspan="2"><label>후원 신청</label></td>
  				
  				</tr>
  				<tr style="height:50px;">
  				<td><label>후원 제목</label></td>
  				<td>이것은 후원제목이다</td>
  				
  				</tr>
  				<tr style="height:50px;">
  				<td><label>후원 최소금액</label></td>
  				<td>이것은 돈이다</td>
  				
  				</tr>
  				<tr style="height:50px;">
  				<td><label>후원보상</label></td>
  				<td><input type="file" style="margin:0 auto;"></td>
  				
  				</tr>
  				<tr style="height:50px;">
  				<td><label>후원 내용</label></td>
  				<td style="margin:0 auto;">이것은 내용이다<br>이것은 내용이다<br>이것은 내용이다<br>이것은 내용이다<br>이것은 내용이다<br>
  				이것은 내용이다<br>이것은 내용이다<br>이것은 내용이다<br>이것은 내용이다<br>이것은 내용이다<br>
  				이것은 내용이다<br>이것은 내용이다<br>이것은 내용이다<br>이것은 내용이다<br>이것은 내용이다<br>
  				
  				
  				</td>
  				
  				</tr>
  				
  				</table>	
  					
  					
  					
  					
  					
  					
  					
  					
				</div>
				<hr>
  					<div align="center" style="margin-top:30px;">
  			<button type="button" class="btn btn-info" onclick="infoPassConfirm();">신청하기</button>
  			</div>
  			
  			
  			
    </div>
    <div class="col-sm-2">
     <img src="${ contextPath }/resources/images/advertisement.png" width="100%">     
    </div>
  </div>
</div>
</body>
</html>