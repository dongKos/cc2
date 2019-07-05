<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	li {
		list-style:none;
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
      <div class="point">
					<ul class="nav nav-tabs">
    					<li style="width:50%; text-align:center;"><a href="mypgCredit.mg">CC 사용 내역</a></li>
    					<li class="active" style="width:50%; text-align:center;"><a href="mypgCreditCharge.mg" style="font-weight:bold;">CC 충전</a></li>
    					
  					</ul>
  					<br>
  					<table width="100%;">
  						<tr>
  							<td colspan=3 align="center" style="text-align:center;"><h4>보유중인 CC : ${sessionScope.loginUser.wallet }개</h4> </td>
  						</tr>
  						<tr>
  						<td colspan=3>
  						<hr>
  						</td>
  						</tr>
  						<tr>
  							<td style="padding-left:10px; width:20%;"><h4>CC란?</h4> </td>
  							<td>만화,장르소설 작품 감상을 위해 필요한 전용 결제수단이며,<br> 일러스트 구매, 후원 등 CreateContainer 에서 사용 가능한 화폐입니다.</td>
  						</tr>
  						<tr>
  						<td colspan=3>
  						<hr>
  						</td>
  						</tr>
  						<tr>
  							<td style="padding-left:10px; width:20%;"><h4>CC결제</h4> </td>
  							<td>
  							<span>
  												<img src="${ contextPath }/resources/images/icon/coin.png" width="20px;">
  												<span>CC 1개</span>
  											</span>
  							</td>
  							<td style="padding-right:10px;">
  								<input type="button" value="100원">
  							</td>
  							<%-- <td><ul>
  								<li>
  									<dl>
  										<dt>
  											<span>
  												<img src="${ contextPath }/resources/images/icon/coin.png" width="20px;">
  												<span>CC 1개</span>
  											</span>
  										</dt>
  										
  									</dl>
  								</li>
  								<li>
  									<dl>
  										<dt>
  											<span>
  												<img src="${ contextPath }/resources/images/icon/coin.png" width="20px;">
  												<span>CC 10개</span>
  											</span>
  										</dt>
  									</dl>
  								</li>
  								<li>
  									<dl>
  										<dt>
  											<span>
  												<img src="${ contextPath }/resources/images/icon/coin.png" width="20px;">
  												<span>CC 30개</span>
  											</span>
  										</dt>
  									</dl>
  								</li>
  								<li>
  									<dl>
  										<dt>
  											<span>
  												<img src="${ contextPath }/resources/images/icon/coin.png" width="20px;">
  												<span>CC 50개</span>
  											</span>
  										</dt>
  									</dl>
  								</li>
  								<li>
  									<dl>
  										<dt>
  											<span>
  												<img src="${ contextPath }/resources/images/icon/coin.png" width="20px;">
  												<span>CC 100개</span>
  											</span>
  										</dt>
  									</dl>
  								</li>
  							</ul></td> --%>
  						</tr>
  					<tr>
  						<td colspan=3>
  						<hr>
  						</td>
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