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
	background-color:#F4F4F4;
	height:100%;
}
.wnDetailedArea{
	margin-top:50px;
}
.wnDetailedTable{
	width:100%;
	border:1px solid lightgray;
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
	font-size:20px;
	font-weight:bold;
	text-align:center;
}
.wnrDate{
	text-align:right;
	width:300px;
}
.titleArea{
	width:27%;
}
.tdRight{
	text-align:right;
}
.wTitle{
	text-align:center;
	width:200px;
	border:1px solid lightgray;
}
.piArea{
	text-align:center;
	height:60px;
	border:1px solid lightgray;
}
.pageBtn{
	width:25px;
	line-height:20px;
	border-radius:8px 8px 8px 8px;
	background-color:white;
	color:skyblue;
	border:1px solid skyblue;
	font-size:14px;
	font-weight:bold;
	cursor:pointer;
	margin-left:10px;
}
.firstBtn{
	float: left;
	width:87px;
	line-height:25px;
	border-radius:8px 8px 8px 8px;
	background-color:skyblue;
	color:white;
	border:1px solid skyblue;
	font-size:14px;
	font-weight:bold;
	cursor:pointer;
	margin-left:10px;
}
.lastBtn{
	float: right;
	width:87px;
	line-height:25px;
	border-radius:8px 8px 8px 8px;
	background-color:skyblue;
	color:white;
	border:1px solid skyblue;
	font-size:14px;
	font-weight:bold;
	cursor:pointer;
	margin-right:10px;
}
.newBtn{
	width:80px;
	line-height:25px;
	border-radius:8px 8px 8px 8px;
	background-color:white;
	color:skyblue;
	border:1px solid skyblue;
	font-size:14px;
	font-weight:bold;
	cursor:pointer;
	margin-left:10px;
}
.contentImg{
	text-align:center;
}
.contentImg img{
	margin-top:30px;
	margin-bottom:30px;
	width: 300px;
	height: 400px;
}
.row{
	margin-bottom:30px;
}
.testImg{
	height:120px;
}
.bottomBorder{
	border-bottom:1px solid lightgray;
}
.wrComment{
	height:200px;
}
.wnrTd{
	height:40px;
}
.starPoint{
	text-align:center;
	width:200px;
	height:30px;
}
.starP{
	padding-left:10px;
	width:150px;
	line-height:30px;
}
.cancleBtn{
	width:100px;
	height:25px;
	border-radius:8px 8px 8px 8px;
	background-color:skyblue;
	color:white;
	border:1px solid skyblue;
	font-size:14px;
	font-weight:bold;
	cursor:pointer;
}
.insertStarP{
	width:100px;
	height:25px;
	border-radius:8px 8px 8px 8px;
	background-color:white;
	color:skyblue;
	border:1px solid skyblue;
	font-size:14px;
	font-weight:bold;
	cursor:pointer;
}
.modal{
	margin-top:40%;
	text-align:center;
}
.modal-footer{
	text-align:center;
}
.starArea{
	font-size:20px;
}
.starAvg{
	display:inline;
	color:red;
	font-size:15px;
	font-weight:bold;
}
.starAll{
	display:inline;
	margin-left:10px;
	color:gray;
	font-size:15px;
}
.insertStarBtn{
	display:inline-block;
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
					<c:forEach var="wnr" items="${ list }" varStatus="status">
					<table class="wnDetailedTable">
						<tr class="bottomBorder">
							<td class="wTitle">
								${ wn.wTitle }
							</td>
							<td class="piArea">
								
								<c:if test="${ pi.currentPage >= 0 }">
								<c:url var="wnrMaxPage" value="/selectDetailedWebnovel.wn">
									<c:param name="wid" value="${ wn.wid }"/>
									<c:param name="currentPage" value="${ pi.maxPage }"/>
								</c:url>
								<button class="firstBtn" type="button" onclick="location.href='${ wnrMaxPage }'">첫화보기</button>
								</c:if>
								
								<c:set var="str2" value="${list[status.index+1]}"/>
								<c:if test="${ pi.currentPage >= pi.maxPage }">
									<button class="pageBtn" type="button" ><</button>
								</c:if>
								<c:if test="${ pi.currentPage < pi.maxPage }">
									<c:url var="wnrListEnd" value="/selectDetailedWebnovel.wn">
										<c:param name="wid" value="${ wn.wid }"/>
										<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
									</c:url>
									<button class="pageBtn" type="button" onclick="location.href='${ wnrListEnd }'"><</button>
								</c:if>
								&nbsp;&nbsp;${ wnr.rTitle }
								<c:if test="${ pi.currentPage <= 1 }">
									<button class="pageBtn"type="button">></button>
								</c:if>
								<c:if test="${ pi.currentPage > 1 }">
									<c:url var="wnrListBack" value="/selectDetailedWebnovel.wn">
										<c:param name="wid" value="${ wn.wid }"/>
										<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
									</c:url>
									<button class="pageBtn" type="button" onclick="location.href='${ wnrListBack }'">></button>
								</c:if>
								
								
								<c:if test="${ pi.currentPage >= 0 }">
								<c:url var="wnrStartPage" value="/selectDetailedWebnovel.wn">
									<c:param name="wid" value="${ wn.wid }"/>
									<c:param name="currentPage" value="${ pi.startPage }"/>
								</c:url>
								<button class="lastBtn" type="button" onclick="location.href='${ wnrStartPage }'">최신화보기</button>
								</c:if>
								
							</td>
							<td class="starP">
								
								<script>
									$(document).ready(function(){
										var rid = ${wnr.rid};
										$.ajax({
											url:"selectStarAvgCnt.wn",
											type:"get",
											data:{rid:rid},
											success:function(data){
												var stpAvg = data.wnrStarPointAvg;
												var stpCnt = data.starPointCount;
												$(".starP").empty();
												
												if(stpAvg >= 4.5){
													$(".starP").append(
													'<p class="starAvg">&#11088; &#11088; &#11088; &#11088; &#11088; <br>' + stpAvg + '</p>' + 
													'<p class="starAll">'+ stpCnt + '명 참여 </p>'
													);
												}else if(stpAvg >= 3.5){
													$(".starP").append(
														'<p class="starAvg">&#11088; &#11088; &#11088; &#11088; <br>' + stpAvg + '</p>' + 
														'<p class="starAll">'+ stpCnt + '명 참여 </p>'
													);
												}else if(stpAvg >= 2.5){
													$(".starP").append(
														'<p class="starAvg">&#11088; &#11088; &#11088; <br>' + stpAvg + '</p>' + 
														'<p class="starAll">'+ stpCnt + '명 참여 </p>'
													);
												}else if(stpAvg >= 1.5){
													$(".starP").append(
														'<p class="starAvg">&#11088; &#11088; <br>' + stpAvg + '</p>' + 
														'<p class="starAll">'+ stpCnt + '명 참여 </p>'
													);
												}else if(stpAvg >= 1){
													$(".starP").append(
														'<p class="starAvg">&#11088; <br>' + stpAvg + '</p>' + 
														'<p class="starAll">'+ stpCnt + '명 참여 </p>'
													);
												}else{
													$(".starP").append(
														"<p>아직 별점이 없습니다.</p>"
													);
												}
												
											},
											error:function(status){
												alert(status);
											}
										});
										
										
										$.ajax({
											url:"selectWnspOne.wn",
											type:"get",
											data:{rid:rid},
											success:function(data){
												if(data.wnsp == null){
													$(".insertStarBtn").empty();
													$(".insertStarBtn").append(
														'<button class="insertStarP"  type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" >별점주기</button>'	
													);
												}else if(data.wnsp != null){
													$(".insertStarBtn").empty();
													$(".insertStarBtn").append(
														'<button class="insertStarP"  type="button" onclick="starpId()">참여완료</button>'	
													);
												}
												
											},
											error:function(status){
												alert(status);
											}
										});
									});


								</script>
								
							</td>
						</tr>
						<tr class="bottomBorder">
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
											<td class="bottomBorder"><p class="wnrDate">${ wnr.ruploadDate }</p></td>
											<td class="titleArea"></td>
										</tr>
									</table>
									${ wnr.rContent }
									<div class="contentImg">
										<img src="${ contextPath }/resources/uploadFiles/webnovelSub/${ wnr.changeName }">
									</div>
								</div>
								<div class="col-sm-2"></div>
							</td>
						</tr>
						<tr class="bottomBorder">
							<td></td>
							<td class="tdRight wnrTd">
								<form action="insertStarPoint.wn" method="post">
									<select class="starPoint" name="starPoint">
										<option value="5">
											5점 : &#11088; &#11088; &#11088; &#11088; &#11088;
										</option>
										<option value="4">
											4점 : &#11088; &#11088; &#11088; &#11088;
										</option>
										<option value="3">
											3점 : &#11088; &#11088; &#11088;
										</option>
										<option value="2">
											2점 : &#11088; &#11088;
										</option>
										<option value="1">
											1점 : &#11088;
										</option>
									</select>
									<input type="hidden" name="rid" value="${ wnr.rid }">
									
									<c:if test="${sessionScope.loginUser.userId == wn.userId}">
									</c:if>
									<c:if test="${sessionScope.loginUser.userId != wn.userId}">
										<c:if test="${ empty sessionScope.loginUser }">
											<button class="insertStarP"  type="button" onclick="location.href='loginForm.me'">별점주기</button>
										</c:if>
										
										<c:if test="${ !empty sessionScope.loginUser }">
											<div class="insertStarBtn">
											</div>
										</c:if>
									</c:if>
									
									
									
									
									
									
									
									<div class="modal fade" id="myModal" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title">별점주기</h4>
												</div>
												<div class="modal-body">
													<p class="starArea">
														5점 : &#11088; &#11088; &#11088; &#11088; &#11088;
													</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="cancleBtn" data-dismiss="modal">취소하기</button>
													<button type="submit" class="insertStarP" >별점주기</button>
												</div>
											</div>
										</div>
									</div>
								</form>
								<script>
									function starpId(){
										alert("이미 별점주기를 하셨습니다.");
									}
									$(function(){
										$(".starPoint").change(function(){
											var starP = $(".starPoint option:selected").val();
											if(starP == 5){
												$(".starArea").empty();
												$(".starArea").append("<p>"+starP + "점 : &#11088; &#11088; &#11088; &#11088; &#11088; </p>");
											}else if(starP == 4){
												$(".starArea").empty();
												$(".starArea").append("<p>"+starP + "점 : &#11088; &#11088; &#11088; &#11088;</p>");
											}else if(starP == 3){
												$(".starArea").empty();
												$(".starArea").append("<p>"+starP + "점 : &#11088; &#11088; &#11088;</p>");
											}else if(starP == 2){
												$(".starArea").empty();
												$(".starArea").append("<p>"+starP + "점 : &#11088; &#11088;</p>");
											}else if(starP == 1){
												$(".starArea").empty();
												$(".starArea").append("<p>"+starP + "점 : &#11088;</p>");
											}
										});
									});
								</script>
							</td>
							<td class="tdRight">
								<button type="button">신고하기</button>
							</td>
						</tr>
						<tr>
							<td></td>
							<td class="wnrTd">
								작가의 말
							</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td class="wrComment">
								${ wnr.wrComment }
							</td>
							<td></td>
						</tr>
					</table>
					
					</c:forEach>
					
				</div>
			</div>
			
			
			<div class="col-sm-1"></div>
		</div>
			
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<img class="testImg" src="${ contextPath }/resources/images/logo.png"> 공지사항 이미지
			</div>
			<div class="col-sm-1"></div>
		</div>
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10"></div>
			<div class="col-sm-1"></div>
		</div>
	</div>
	
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>