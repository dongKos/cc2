<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/webnovel/insertWebnovel.css">
<style>
.col-sm-10{
	background-color:lightgray;
	height:100%;
}
.wnDetailedArea{}
.wnDetailedTable{
	width:100%;
}
.wnDetailedTable tr>td{
	border:1px solid black;
}
.detailContent{
	margin:0 auto;
	width:550px;
	height:700px;
}
.detailTitle{
	margin:0 auto;
	width:70%;
	margin-top:30px;
	margin-bottom:30px;
}
.wnrRTitle{
	font-size:18px;
	font-weight:bold;
	text-align:center;
}
.wnrDate{
	text-align:right;
}
.titleArea{
	width:27%;
}
.starstar{
	text-align:right;
}
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<!-- 서비스 상단 네비바 -->
	<jsp:include page="../../main/common/serviceNavbar.jsp"/>
	<!-- 웹소설 중단 네비바 -->
	<jsp:include page="../common/middleNavbar.jsp"/>
	<!-- 웹소설 목록 -->
	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div class=wnDetailedArea>
					<table class="wnDetailedTable">
						<tr>
							<td>
								${ wn.wTitle }
							</td>
							<td>
								<button><</button> 1화 <button>></button>
							</td>
							<td>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<div class="col-sm-2"></div>
								<div class="col-sm-8">
									<table class="detailTitle">
										<tr>
											<td class="titleArea"></td>
											<td><p class="wnrRTitle">${ wnr.rTitle }</p></td>
											<td class="titleArea"></td>
										</tr>
										<tr>
											<td class="titleArea"></td>
											<td><p class="wnrDate">${ wnr.ruploadDate }</p></td>
											<td class="titleArea"></td>
										</tr>
									</table>
									
									
									${ wnr.rContent }
								</div>
								<div class="col-sm-2"></div>
							</td>
						</tr>
						<tr>
							<td colspan="3" class="starstar">
								<select>
									<option>
										별 별 별 별 별
									</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<div class="col-sm-2"></div>
								<div class="col-sm-8">
									${ wnr.wrComment }
								</div>
								<div class="col-sm-2"></div>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10"></div>
			<div class="col-sm-1"></div>
		</div>
	</div>

</body>
</html>