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
	background-color:#FAFAFA;
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
	margin-top:10%;
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

.replyArea{
	margin:0 auto;
	width:80%;
}
.replyInsertArea{
	background-color:white;
	padding:10px 10px 10px 10px;
	width:100%;
    height:140px;
    border:1px solid skyblue;
    border-radius: 10px;
}
.replyBtnArea{
	width:100%;
}
.replyText{
	width:100%;
	height:100px;
	border:none;
	resize:none;
}
.cntArea{
	float:right;
}
.replyBtn{
	float:right;
	width:100px;
	line-height:30px;
	border-radius:8px 8px 8px 8px;
	background-color:skyblue;
	color:white;
	border:1px solid skyblue;
	font-size:14px;
	font-weight:bold;
	cursor:pointer;
	margin-left:10px;
}
.replyListArea{
	background-color:white;
	padding:20px 20px 20px 20px;
	width:100%;
	border:1px solid skyblue;
	border-radius:10px;
}
.cntArea{
	font-size:15px;
}
.replyList{
	background-color:white;
	width:100%;
	margin-bottom:20px;
	padding-left:10px;
}
.replycontents{
	width:80%;
	padding-left:10px;
	padding-top:20px;
	padding-bottom:20px;
	border-bottom:1px solid gray;
	color:gray;
}
.replyListTr{
	
}
.replyNickname{
	font-size:14px;
	height:30px;
	padding-left:10px;
	font-weight:bold;
}
.replyReportBtn{
	float:right;
	width:120px;
	line-height:25px;
	border-radius:8px 8px 8px 8px;
	background-color:white;
	color:skyblue;
	border:1px solid skyblue;
	font-size:13px;
	font-weight:bold;
	cursor:pointer;
	margin-left:10px;
}
.reportTable{
	margin:0 auto;
	width:90%;
}
.reportRe{
	width:150px;
	
}
.reportContents{
	padding-top:20px;
}
.reportCa{
	text-align:right;
	height:50px;
	border-bottom:1px solid lightgray;
}
.reportSelect{
	width:120px;
}
.reportTextArea{
	background-color:white;
	padding:10px 10px 10px 10px;
	width:100%;
    height:140px;
    border:1px solid skyblue;
    border-radius: 10px;
}
.reportText{
	width:100%;
	height:100px;
	border:none;
	resize:none;
}
.cntrArea{
	float:right;
}
.wnListGo{
	position: fixed;
    top: 19%;
    left: 91.5%;
    width: 60px;
    line-height: 30px;
    border-radius: 8px 8px 8px 8px;
    background-color: white;
    color: skyblue;
    border: 1px solid skyblue;
    font-size: 13px;
    font-weight: bold;
    cursor: pointer;
}
</style>
</head>
<body oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
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
								
								<c:if test="${ pi.currentPage >= 1 }">
								<c:url var="wnrmaxPage" value="/selectDetailedWebnovel.wn">
									<c:param name="wid" value="${ wn.wid }"/>
									<c:param name="gradeType" value="${wn.gradeType}"/>
									<c:param name="rid" value="${ list[0].rid }"/>
									<c:param name="currentPage" value="${ pi.maxPage }"/>
								</c:url>
								<button class="firstBtn" type="button" onclick="location.href='${ wnrmaxPage }'">첫화보기</button>
								</c:if>
								<c:set var="str2" value="${list[status.index+1]}"/>
								<c:if test="${ pi.currentPage == pi.maxPage }">
									<button class="pageBtn" type="button" ><</button>
								</c:if>
								<c:if test="${ pi.currentPage < pi.maxPage }">
									
									<c:url var="wnrListEnd" value="/selectDetailedWebnovel.wn">
										<c:param name="wid" value="${ wn.wid }"/>
										<c:param name="gradeType" value="${wn.gradeType}"/>
										<c:param name="rid" value="${ list[0].rid }"/>
										<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
									</c:url>
									<button class="pageBtn" type="button" onclick="location.href='${ wnrListEnd }'"><</button>
								</c:if>
								&nbsp;&nbsp;${ wnr.rTitle }
								<c:if test="${ pi.currentPage == pi.startPage }">
									<button class="pageBtn"type="button">></button>
								</c:if>
								<c:if test="${ pi.currentPage > pi.startPage}">
									<c:url var="wnrListBack" value="/selectDetailedWebnovel.wn">
										<c:param name="wid" value="${ wn.wid }"/>${wn.gradeType}
										<c:param name="gradeType" value="${wn.gradeType}"/>
										<c:param name="rid" value="${ list[0].rid }"/>
										<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
									</c:url>
									<c:if test="${pi.maxPage - 9 == pi.currentPage}">
										<button class="pageBtn" type="button" onclick="noMoney()">></button>
									</c:if>
									<c:if test="${pi.maxPage - 9 < pi.currentPage}">
										<button class="pageBtn" type="button" onclick="location.href='${ wnrListBack }'">></button>
									</c:if>
									<c:if test="${pi.maxPage - 9 > pi.currentPage}">
										<button class="pageBtn" type="button" onclick="location.href='${ wnrListBack }'">></button>
									</c:if>
								</c:if>
								<script>
									function noMoney(){
										alert("코인이 없습니다 결제페이지로 이동합니다.");
										location.href="mypgCreditCharge.mg";
									}
								</script>
								<c:if test="${ pi.currentPage >= 0  }">
								<c:url var="wnrstartPage" value="/selectDetailedWebnovel.wn">
									<c:param name="wid" value="${ wn.wid }"/>
									<c:param name="gradeType" value="${wn.gradeType}"/>
									<c:param name="rid" value="${ list[0].rid }"/>
									<c:param name="currentPage" value="${ pi.startPage }"/>
								</c:url>
								<button class="lastBtn" type="button" onclick="location.href='${ wnrstartPage }'">최신화보기</button>
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
						<c:if test="${sessionScope.loginUser.userId == wn.userId}">
						</c:if>
						<c:if test="${sessionScope.loginUser.userId != wn.userId}">
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
									<input type="hidden" name="gradeType" value="${wn.gradeType }">
									<input type="hidden" name="currentPage" value="${ pi.currentPage }">
										<c:if test="${ empty sessionScope.loginUser }">
											<button class="insertStarP"  type="button" onclick="login()">별점주기</button>
										</c:if>
										
										<c:if test="${ !empty sessionScope.loginUser }">
											<div class="insertStarBtn">
											</div>
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
								<c:if test="${sessionScope.loginUser.userId == wn.userId}">
								</c:if>
								<c:if test="${sessionScope.loginUser.userId != wn.userId}">
									<c:if test="${ empty sessionScope.loginUser }">
										<button type="button" class="replyReportBtn" onclick="login()">신고하기</button>
									</c:if>
									<c:if test="${ !empty sessionScope.loginUser }">
										<div class="replyReportBtnArea">
										</div>
									</c:if>
								</c:if>
								<div class="modal fade" id="myModal1" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title">신고하기</h4>
												</div>
												<div class="modal-body">
													<table class="reportTable">
														<tr>
															<td class="reportCa" colspan="2">
																신고유형 &nbsp;
																<select class="reportSelect" name="reportCategory">
																	<option value="RE_CTG1">욕설</option>
																	<option value="RE_CTG2">비방</option>
																	<option value="RE_CTG3">인격모독</option>
																	<option value="RE_CTG4">저작권침해</option>
																	<option value="RE_CTG5">명예회손</option>
																	<option value="RE_CTG6">청소년유해</option>
																	<option value="RE_CTG7">불법음란</option>
																	<option value="RE_CTG8">기타</option>
																</select>
															</td>
														</tr>
														<tr>
															<td class="reportRe">
																신고사유
															</td>
															<td class="reportContents">
																<div class="reportTextArea">
																	<textarea class="reportText" name="reportText" cols="25" rows="20" placeholder="내용을 입력하세요."></textarea>
																	<p class="cntrArea"><span class="cntrText">0 </span>/ 500</p>
																</div>
															</td>
														</tr>
													</table>
												</div>
												<div class="modal-footer">
													<button type="button" class="cancleBtn" data-dismiss="modal">취소하기</button>
													<button type="button" class="insertStarP" onclick="insertReport()">신고하기</button>
												</div>
											</div>
										</div>
									</div>
								<script>
								$(document).ready(function(){
									var sessionUserId = "${sessionScope.loginUser.userId}";
									var userId = "${wn.userId}";
									var rid = ${wnr.rid};
									$.ajax({
										url:"selectwReportOne.wn",
										type:"get",
										data:{rid:rid},
										success:function(data){
											console.log(data);
											if(data.wReport == null){
												$(".replyReportBtnArea").empty();
												$(".replyReportBtnArea").append(
													'<button class="replyReportBtn" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal1" >신고하기</button>'	
												);
											}else if(data.wReport != null){
												$(".replyReportBtnArea").empty();
												$(".replyReportBtnArea").append(
													'<button class="replyReportBtn"  type="button" onclick="reportidId()">신고신청완료</button>'	
												);
											}
										},
										error:function(status){
											alert(status);
										}
									});
								});
								function reportidId(){
									alert("이미 신고 하셨습니다.");
								}
								</script>
							</td>
						</tr>
						</c:if>
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
			
			<div class="col-sm-1"><button class="wnListGo" onclick="location.href='selectWnRoundList.wn?wid=${ wn.wid }&gradeType=${ wn.gradeType}&authorId=${ wn.userId }'">목록</button></div>
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
			<div class="col-sm-10" >
				<div class="replyArea">
					<br>
					<p>댓글</p>
					<div class="replyInsertArea">
						<textarea class="replyText" name="replyText" cols="25" rows="20" placeholder="댓글을 입력하세요." ></textarea>
						<p class="cntArea"><span class="cntText">0 </span>/ 500</p>
					</div>
					<div class="replyBtnArea">
						<br>
						<c:if test="${ empty sessionScope.loginUser }">
							<button type="button" class="replyBtn" onclick="login()">등록</button>
						</c:if>
						<c:if test="${ !empty sessionScope.loginUser }">
							<button type="button" class="replyBtn" onclick="insertReply()">등록</button>
						</c:if>
					</div>
					<br><br><br><br>
					<div class="replyListArea">
					
					</div>
					<div id="npagingArea" align="center">
						<ul class="pagination" id="nPaging">
						
						</ul>
					</div>
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
	
	<script>
		var rid = 4011;
		console.log(4011);
		
		
		$(document).ready(function(){
			console.log(rid);
			var currentPage = 1;
			$.ajax({
				url:"selectWebnovelReply.wn",
				type:"get",
				data:{rid:rid, currentPage:currentPage},
				success:function(data){
					
					for(var i = 0; i < data.list.length; i++){
						var replyListArea = $(".replyListArea");
						var replyList =$('<table class="replyList">');
						var replyNickname = $('<td class="replyNickname">' + data.list[i].nickname +'<button class="replyReportBtn" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal0'+i+'" name="replyReportBtn">신고하기</button>');
						var replyNicknameOk = $('<td class="replyNickname">' + data.list[i].nickname +'<button class="replyReportBtn" type="button" name="replyReportBtn">신고완료</button>');
						var replyNicknameNo = $('<td class="replyNickname">' + data.list[i].nickname + '<button class="replyReportBtn" type="button" onclick="deleteReply('+data.list[i].replyId+')">삭제하기</button>');
						var replycontents = $('<td class="replycontents">').text(data.list[i].replyContent);
						var hiddenReplayId = $('<input type="hidden" id="replyId" value="'+data.list[i].replyId+'">')
						var userIdCk = data.list[0].userId;
						var replyId = data.list[i].replyId;
						var commentId = data.list[i].commentId;
						var loginId = '${sessionScope.loginUser.userId}';
						var userId = '${wn.userId}';
						var list = new Array();
						
						console.log(loginId);
						console.log(userIdCk);
						if(userId == userIdCk){
							list[0] = replyNicknameNo;
						}else if(loginId == commentId){
							list[0] = replyNicknameNo;
						}else if(replyId == userIdCk){
							list[0] = replyNicknameOk;
						}else if(commentId == 0){
							list[0] = replyNickname;
						}
						list[1] = replycontents;
						list[2] = hiddenReplayId;
						
						for(var j = 0; j < list.length; j++) {
							
							var tr = $('<tr>');
							tr.append(list[j]);
							replyList.append(tr);
						}
						replyListArea.append(replyList);
						replyList.append(tr);
					
						$(this)
					
						$paging = $("#nPaging");
						$paging.html('');
						
						replyListArea.append(
							'<div class="modal fade" id="myModal0'+i+'" role="dialog">' +
							'<div class="modal-dialog"><div class="modal-content"><div class="modal-header">' +
							'<button type="button" class="close" data-dismiss="modal">&times;</button><h4 class="modal-title">신고하기</h4>' +
							'</div><div class="modal-body"><table class="reportTable"><tr><td class="reportCa" colspan="2">신고유형 &nbsp;' +
							'<select class="reportSelect" name="reportCategory"><option value="RE_CTG1">욕설</option><option value="RE_CTG2">비방</option>' +
							'<option value="RE_CTG3">인격모독</option><option value="RE_CTG4">저작권침해</option><option value="RE_CTG5">명예회손</option>' +
							'<option value="RE_CTG6">청소년유해</option><option value="RE_CTG7">불법음란</option><option value="RE_CTG8">기타</option>' +
							'</select></td></tr><tr><td class="reportRe">신고사유</td><td class="reportContents"><div class="reportTextArea">' +
							'<textarea class="reportText" name="reportText" cols="25" rows="20" placeholder="내용을 입력하세요."></textarea>' +
							'<p class="cntrArea"><span class="cntrText">0 </span>/ 500</p></div></td></tr></table></div>' +
							'<div class="modal-footer"><button type="button" class="cancleBtn" data-dismiss="modal">취소하기</button>' +
							'<button type="button" class="insertStarP insertReplyReport'+i+'">신고하기</button><input type="hidden" class="replyId" value="'+data.list[i].replyId+'"></div></div></div></div>'					
						);
					
						$('.replyListArea').find($(".insertReplyReport"+i+"")).on('click',function(){
							var reportType = 'REPLY';
							var reportCategory = $(this).parent().parent().find($('.reportSelect option:selected')).val();
							var status = 'WAIT';
							var reportReason = $(this).parent().parent().find($(".reportText")).val();
							var replyId = $(this).parent().find($(".replyId")).val();
							
							$.ajax({
								url:"insertReplyReport.wn",
								type:"post",
								data:{reportType:reportType, reportCategory:reportCategory,
									  status:status, reportReason:reportReason, replyId:replyId},
								success:function(data){
									location.reload();
								},
								error:function(status){
									alert(status);
								}
							});
						});
					}
					
					
					var currentPage = data.pi.currentPage;
					var startPage = data.pi.startPage;
					var endPage = data.pi.endPage;
					var maxPage = data.pi.maxPage;
				         
					//이전
					if(currentPage <= 1){
						$paging.append("<li class='page-item'><a class='page-link'>이전</a></li>");
					}else{
						$paging.append("<li class='page-item'><a class='page-link' onclick='rPaging("+ (currentPage -1) + ")'>이전</a></li>");
					}
					
					//숫자
					for(var i = startPage; i <= endPage; i++){
						if(i == currentPage){
							$paging.append("<li class='page-item'><a class='page-link'>" + i + "</a></li>");
						}else{
							$paging.append("<li class='page-item'><a class='page-link' onclick='rPaging("+ i + ")'>" + i + "</a></li>");
						}
					}
					
					//다음
					if(currentPage >= maxPage){
						$paging.append("<li class='page-item'><a class='page-link'>다음</a></li>");
					}else{
						$paging.append("<li class='page-item'><a class='page-link' onclick='rPaging("+ (currentPage + 1) + ")'>다음</a></li>");
					}
				},
				error:function(status){
					alert(status);
				}
			});
			$('.replyText').keyup(function(){
				var inputLength=$(this).val().length;
				var remain=0+inputLength;
				
				$('.cntText').html(remain);
				if(remain > 500){
					console.log("500자 이상!");
				 $('.cntText').css('color','red');
				}
			});
			$('.reportText').keyup(function(){
				var inputLength=$(this).val().length;
				var remain=0+inputLength;
				
				$('.cntrText').html(remain);
				if(remain > 500){
					console.log("500자 이상!");
				 $('.cntrText').css('color','red');
				}
			});
			
			
			
			
			
			
			
		});
		
		
		function rPaging(currentPage){
			$.ajax({
				url:"selectWebnovelReply.wn",
				type:"post",
				data:{rid:rid, currentPage:currentPage},
				success:function(data){
					console.log(data.pi);
					$(".replyListArea").children().remove();
					for(var i = 0; i < data.list.length; i++){
						var replyListArea = $(".replyListArea");
						var replyList =$('<table class="replyList">');
						var replyNickname = $('<td class="replyNickname">닉네임 - ' + data.list[i].nickname +'<button class="replyReportBtn">신고하기</button>');
						var replycontents = $('<td class="replycontents">').text(data.list[i].replyContent);
						var replyReport = $('<td class="replyReport"><button class="replyReportBtn">신고하기</button>');
						var hiddenReplayId = $('<input type="hidden" id="wnWid" value="'+data.list[i].replayId+'">')
						
						var list = new Array();
						
						list[0] = replyNickname;
						list[1] = replycontents;
						list[2] = hiddenRePlayId;
						
						for(var j = 0; j < list.length; j++) {
							
							var tr = $('<tr>');
							tr.append(list[j]);
							replyList.append(tr);
						}
						replyListArea.append(replyList);
						replyList.append(tr);
					}
					
					
					$paging = $("#nPaging");
					$paging.html('');
					var currentPage = data.pi.currentPage;
					var startPage = data.pi.startPage;
					var endPage = data.pi.endPage;
					var maxPage = data.pi.maxPage;
				         
					//이전
					if(currentPage <= 1){
						$paging.append("<li class='page-item'><a class='page-link'>이전</a></li>");
					}else{
						$paging.append("<li class='page-item'><a class='page-link' onclick='rPaging("+ (currentPage -1) + ")'>이전</a></li>");
					}
					
					//숫자
					for(var i = startPage; i <= endPage; i++){
						if(i == currentPage){
							$paging.append("<li class='page-item'><a class='page-link'>" + i + "</a></li>");
						}else{
							$paging.append("<li class='page-item'><a class='page-link' onclick='rPaging("+ i + ")'>" + i + "</a></li>");
						}
					}
					
					//다음
					if(currentPage >= maxPage){
						$paging.append("<li class='page-item'><a class='page-link'>다음</a></li>");
					}else{
						$paging.append("<li class='page-item'><a class='page-link' onclick='rPaging("+ (currentPage + 1) + ")'>다음</a></li>");
					}
					
					
					
					
					
					
				},
				error:function(status){
					alert(status);
				}
			});
		}
		
		function insertReply(){
			var replyContent = $(".replyText").val();
			$.ajax({
				url:"insertWebnovelReply.wn",
				type:"post",
				data:{rid:rid, replyContent:replyContent},
				success:function(data){
					location.reload();
				},
				error:function(status){
					alert(status);
				}
			});
		}
		function insertReport(){
			var reportType = 'ROUND';
			var reportCategory = $(".reportSelect option:selected").val()
			var status = 'wait';
			var reportReason = $(".reportText").val();
			var rid = ${ list[0].rid };
			//console.log(reportType);
			//console.log(reportCategory);
			//console.log(status);
			//console.log(reportReason);
			//console.log(rid);
			$.ajax({
				url:"insertReport.wn",
				type:"post",
				data:{reportType:reportType, reportCategory:reportCategory,
					  status:status, reportReason:reportReason, rid:rid},
				success:function(data){
					location.reload();
				},
				error:function(status){
					alert(status);
				}
			});
		}
		function login(){
			var result = window.confirm("로그인 후 등록하세요");
			if(result){
				location.href='loginForm.me';
			}
		}
		function deleteReply(replyId){
			$.ajax({
				url:"deleteReply.wn",
				type:"post",
				data:{replyId:replyId},
				success:function(data){
					var result = window.confirm("댓글을 삭제하시겠습니까?");
					if(result){
						location.reload();
					}
					
				},
				error:function(status){
					alert(status);
				}
			});
		}
	</script>
	
	<jsp:include page="../common/webnovelFooter.jsp"/>
</body>
</html>