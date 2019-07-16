<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table tr th {
		text-align:center;
		border-top:1px solid #ececec;
		border-bottom:1px solid #ececec;
		padding:10px 0px;
	}
	table tr td{
		padding:5px 0;
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
    					<li class="active" style="width:50%; text-align:center;"><a href="mypgCredit.mg" style="font-weight:bold;">CC 충전/사용 내역</a></li>
    					<li style="width:50%; text-align:center;"><a href="mypgCreditCharge.mg">CC 충전</a></li>
    					
  					</ul>
  					<br>
  					<div style="text-align:right;">
  						<select id="ctg" style="border:none; width:80px; height:30px; align:center; font-size:15px;" >
  							<option value="charge">충전</option>
  							<option value="user">사용</option>
  						</select>
  						<br>
  					</div>
  					<div id="charge">
  					<br>
  					<table width="100%;" style="text-align:center;" class="table table-hover">
  					<tr>
  						<th style="text-align:center;" width="20%;">날짜</th><th width="60%;">내용</th><th width="10%;">개수</th><th>상태</th>
  					</tr>
  					<c:forEach var="ch" items="${ chargeList }">
  					<tr>
  						<td width="20%;">${ ch.cDate }</td><td width="60%;">사용자 충전</td><td width="10%;">${ ch.cCount }</td><td>정상</td>
  					</tr>
  					</c:forEach>
  					<c:if test="${ chargeList == null }">
  					<tr>
  						<td colspan=4 style="height:100px;">충전 내역이 없습니다.</td>
  					</tr>
  					</c:if>
  					</table>
  					</div>
  					<div id="use" hidden>
  					
  					<br>
  					<table width="100%;" style="text-align:center;" class="table table-hover">
  					<tr>
  						<th style="text-align:center;" width="20%;">날짜</th><th width="60%;">내용</th><th width="10%;">개수</th><th>상태</th>
  					</tr>
  					<c:forEach var="us" items="${ useList }">
  					<tr>
  						<td width="20%;">${ us.cDate }</td><td width="60%;">${ us.rid }</td><td width="10%;">${ us.cCount }</td><td>사용</td>
  					</tr>
  					</c:forEach>
  					<c:if test="${ useList == null }">
  					<tr>
  						<td colspan=4 style="height:100px;">사용한 내역이 없습니다.</td>
  					</tr>
  					</c:if>
  					</table>
  					</div>
  					<div id="refund" hidden>
  					<br>
  					<table width="100%;" style="text-align:center;">
  					<tr>
  						<th style="text-align:center;">날짜</th><th>내용</th><th>개수</th><th>상태</th>
  					</tr>
  					<tr>
  						<td>날짜</td><td>환불 요청</td><td>10개</td><td>대기</td>
  					</tr>
  					<tr>
  						<td>날짜</td><td>환불 요청</td><td>10개</td><td>완료</td>
  					</tr>
  					<tr>
  						<td>날짜</td><td>환불 요청</td><td>10개</td><td>완료</td>
  					</tr>
  					</table>
  					</div>
				</div>
    </div>
    <div class="col-sm-2">
     <img src="${ contextPath }/resources/images/advertisement.png" width="100%">     
    </div>
  </div>
</div>
<script>
	$("#ctg").change(function(){
		var cate = $(this).children("option:selected").val();
		if(cate == "charge"){
			$("#charge").attr("hidden", false);
			$("#use").attr("hidden", true);
		}else if(cate == "user"){
			$("#charge").attr("hidden", true);
			$("#use").attr("hidden", false);
		}
	})
</script>
<jsp:include page="common/mypgFooter.jsp"/>

</body>
</html>