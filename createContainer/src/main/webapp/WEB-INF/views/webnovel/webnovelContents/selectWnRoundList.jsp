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
.introArea{
	margin-top:30px;
	border:1px solid lightgray;
	padding: 15px 15px 15px 15px;
}
.introTable{
	width:100%;
	text-align:center;
}
.introImg{
	padding:5px 5px 5px 5px;
}
.introImg img{
	width:200px;
	height:160px;
}
.wnrBtn{
	width:130px;
	height:30px;
	border-radius:8px 8px 8px 8px;
	background-color:skyblue;
	color:white;
	border:1px solid skyblue;
	font-size:14px;
	font-weight:bold;
	cursor:pointer;
	margin-left:10px;
}
.wnrBtn:hover{
	background-color:#84CEFA;
	color:white;
}
.wnrTitle{
	float:left;
	font-weight:bold;
	font-size:17px;
}
.wnrIntro{
	float:left;
	text-align:left;
}
.wnrListArea{
	margin-top:30px;
	width:100%;
	padding:0px 30px 0px 30px;
}
.wnrImg{
	width:170px;
}
.subImg{
	padding: 10px 10px 10px 10px;
}
.subImg img{
	width:140px;
	height:110px;
}
.wnrTable{
	border-top:1px solid lightgray;
	width:100%;
}
.wnrTable tr>td{
	height:47px;
}
.wnrContent{
	padding-left:30px;
}
.wnUpdateBtn{
	width:130px;
	height:25px;
	border-radius:8px 8px 8px 8px;
	background-color:skyblue;
	color:white;
	border:1px solid skyblue;
	font-size:14px;
	font-weight:bold;
	cursor:pointer;
}
.wnDeleteBtn{
	width:130px;
	height:25px;
	border-radius:8px 8px 8px 8px;
	background-color:white;
	color:skyblue;
	border:1px solid skyblue;
	font-size:14px;
	font-weight:bold;
	cursor:pointer;
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
.deleteBtn{
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
.wnrBtnArea{
	text-align:right;
	padding-right:30px;
}
.btnArea{
	padding-top:20px;
}
.wnrArea{
	background-color:#FBFBFB;
	padding:0px 20px 50px 20px;
}
.introImg{
	position:relative;
}
.wnStatus{ 
	position:absolute;
    top: 51px;
    left: 41px;
	width:60px;
	line-height:40px;
	z-index:100;
	font-size:18px;
	font-weight:bold;
	background-color: #ffffff;
	opacity: 0.5;
	color:red;
}
.subImg{
	position:relative;
}
.wnrStatus{
	text-align:center;
	position:absolute;
    top: 10px;
    left: 10px;
	width:40px;
	line-height:30px;
	z-index:100;
	font-size:16px;
	font-weight:bold;
	background-color: #ffffff;
	opacity: 0.5;
	color:red;
}
.wnrTitleArea{
	width:200px;
	line-height:40px;
	cursor:pointer;
}
.titleArea{
	width:100%;
	line-height:130px;
	cursor:pointer;
	margin-bottom:0px;
}
.modal{
	margin-top:30%;
}
.modal-title{
	font-weight:bold;
}
.modal-footer{
	text-align:center;
}
.glyphicon-star-empty{

}
.attentionBtn{
	width:100px;
	height:30px;
	background-color:white;
	color:skyblue;
	border:1px solid skyblue;
	font-size:14px;
	font-weight:bold;
	cursor:pointer;
	border-radius: 5px;
}
.starP{
	padding-left:10px;
	width:150px;
	line-height:30px;
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
.wnBestArea{
	border-left:1px solid lightgray;
	padding-left:20px;
}
.bestWn{
	margin-bottom:10px;
	border-bottom:1px solid lightgray;
	cursor:pointer;
}
.bwnImg{
	width:100%;
	font-size:10px;
	padding-bottom:5px;
}
.bestImg{
	width:80px;
	padding:5px 5px 5px 5px;
	font-size:10px;
}
.bestTitle{
	width:150px;
	height:30px;
	font-size:12px;
}
.bestGenre{
	font-size:9px;
	height:20px;
}
.bestSp{
	font-size:8px;
}

</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<!-- 서비스 상단 네비바 -->
	<jsp:include page="../../main/common/serviceNavbar.jsp"/>
	<!-- 웹소설 중단 네비바 -->
	<jsp:include page="../common/middleNavbar.jsp"/>
	<!-- 웹소설 회차 목록 -->
	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10 wnrArea">
				<div class="introArea">
					<table class="introTable">
						<tr>
							<td rowspan="3"width="210">
								<c:set var="workStatus" value="${ wn.workStatus }" />
								<c:if test="${ workStatus eq 'RUN'}">
								<div class="introImg">
									<img src="${ contextPath }/resources/uploadFiles/webnovelMain/${ wn.changeName }">
								</div>
								</c:if>
								<c:if test="${ workStatus eq 'COMP'}">
								<div class="wnStatus">완결</div>
								<div class="introImg">
									<img src="${ contextPath }/resources/uploadFiles/webnovelMain/${ wn.changeName }">
								</div>
								</c:if>
							</td>
							<td width="220" height="50%">
								<p class="wnrTitle">${ wn.wTitle }</p>
							</td>
							<td>
								<c:if test="${sessionScope.loginUser.userId == wn.userId}">
								</c:if>
								<c:if test="${sessionScope.loginUser.userId != wn.userId}">
									<c:if test="${ empty sessionScope.loginUser }">
										<button class="attentionBtn" type="button" onclick="location.href='loginForm.me'">
										<span class="glyphicon glyphicon-star-empty" ></span> 관심등록
									</button>
									</c:if>
									<c:if test="${ !empty sessionScope.loginUser }">
										<c:if test="${wa.attentionId != null}">
											<button class="attentionBtn" type="button" onclick="attentionId()">
												<span class="glyphicon glyphicon-star"></span> 관심등록
											</button>
										</c:if>
										<c:if test="${wa.attentionId == null}">
											<button class="attentionBtn" type="button" onclick="location.href='insertAttention.wn?wid=' + ${wn.wid}">
												<span class="glyphicon glyphicon-star-empty"></span> 관심등록
											</button>
										</c:if>
									</c:if>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="1">
								<p class="wnrIntro">${ wn.wIntro }</p>
							</td>
							<td class="starP" colspan="1">
								
							</td>
						</tr>
						<tr>
							<td class="btnArea"colspan="2">
								<c:if test="${sessionScope.loginUser.userId == wn.userId}">
									<button class="wnrBtn" type="button" onclick="location.href='insertWnRoundForm.wn?wid=' + ${wn.wid}">신규 회차 등록</button>
									<button class="wnrBtn" type="button" onclick="location.href='selectWnUpdateOne.wn?wid=' + ${wn.wid}">작품 정보 수정</button>
									<button class="wnrBtn" type="button">휴재 신청</button>
								</c:if>
								<c:if test="${sessionScope.loginUser.userId != wn.userId}">
									<button class="wnrBtn" type="button" onclick="location.href='selectDetailedWebnovel.wn?wid=' + ${wn.wid}  +'&currentPage='+${pi.listCount}">첫회보기</button>
									<button class="wnrBtn" type="button" onclick="location.href='selectDetailedWebnovel.wn?wid=' + ${wn.wid}  +'&currentPage='+${pi.currentPage}">최신화보기</button>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
				
			</div>
			<div class="col-sm-1"></div>
		</div>
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10 wnrArea">
				<!-- 자신이 올린 작품일 경우 -->
				<c:if test="${sessionScope.loginUser.userId == wn.userId}">
				<div class="wnrListArea">
					<c:forEach var="wnr" items="${ list }" varStatus="status">
						<table class="wnrTable">
							<tr>
								<td rowspan="3" class="wnrImg">
									<div class="subImg">
									<c:if test="${ workStatus eq 'COMP'}">
										<div class="wnrStatus">완결</div>
										<img src="${ contextPath }/resources/uploadFiles/webnovelSub/${ wnr.changeName }">
									</c:if>
									<c:if test="${ workStatus eq 'RUN'}">
										<img src="${ contextPath }/resources/uploadFiles/webnovelSub/${ wnr.changeName }">
									</c:if>
									</div>
								</td>
								<td colspan="2" class="wnrContent"></td>
							</tr>
							<tr>
								<td class="wnrContent">
									<h1>${status.end}</h1>
									<p class="wnrTitleArea">${ wnr.rTitle }</p>
								</td>
								<td class="wnrBtnArea">
									<input type="hidden" value="${ wnr.rid }">
									<input type="hidden" value="${ wnr.wid }">
									<input type="hidden" value="${status.index + 1}">
									<button class="wnUpdateBtn" name="wnUpdateBtn">회차 정보 수정</button><br><br>
									<button class="wnDeleteBtn" name="wnDeleteBtn" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal<c:out value="${status.index}" />">작품 삭제</button>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="wnrContent">
									조회&nbsp; ${ wnr.vCount } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
									${ wnr.ruploadDate }
								</td>
							</tr>
						</table>
						<div class="modal fade" id="myModal<c:out value="${status.index}" />" role="dialog">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">작품 삭제</h4>
									</div>
									<div class="modal-body">
										<p>정말로 삭제 하시겠습니까?<br><br>삭제하시면 복구가 불가능합니다.</p>
									</div>
									<div class="modal-footer">
										<input type="hidden" class="wid" value="${ wnr.rid }">
										<button type="button" class="cancleBtn" data-dismiss="modal">취소하기</button>
										<button type="button" class="deleteBtn" name="deleteBtn">삭제하기</button>
									</div>
								</div>
							</div>
						</div>
						
					</c:forEach>
				</div>
				</c:if>
				
				
				
			
			
			
				<!-- 자신의 작품이 아닌경우 -->
				<c:if test="${sessionScope.loginUser.userId != wn.userId}">
				<div class="col-sm-8">
					<div class="wnrListArea">
						<c:forEach var="wnr" items="${ list }" varStatus="status">
						<table class="wnrTable">
							<tr>
								<td rowspan="3" class="wnrImg">
									<div class="subImg">
									<c:if test="${ workStatus eq 'COMP'}">
										<div class="wnrStatus">완결</div>
										<img src="${ contextPath }/resources/uploadFiles/webnovelSub/${ wnr.changeName }">
									</c:if>
									<c:if test="${ workStatus eq 'RUN'}">
										<img src="${ contextPath }/resources/uploadFiles/webnovelSub/${ wnr.changeName }">
									</c:if>
									</div>
								</td>
								<td colspan="2" class="wnrContent"></td>
							</tr>
							<tr>
								<td class="wnrContent">
									<p class="wnrTitleArea">${ wnr.rTitle }</p>
								</td>
								<td class="wnrBtnArea">
									<input type="hidden" value="${ wnr.rid }">
									<input type="hidden" value="${ wnr.wid }">
									<input type="hidden" value="${status.index + 1}">
								</td>
							</tr>
							<tr>
								<td colspan="2" class="wnrContent">
									조회&nbsp; ${ wnr.vCount } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
									${ wnr.ruploadDate }
								</td>
							</tr>
						</table>
						
					</c:forEach>
							
					</div>
				</div>
				<div class="col-sm-4">
					<!-- 베스트 도전 작품 -->
					<h4 align="center">베스트 도전 작품</h4>
					<div class="wnBestArea">
									
					</div>
				</div>
				<script>
					$(document).ready(function(){
						
						var gradeType = 1;
						$.ajax({
							url:"selectBestWnList.wn",
							type:"get",
							data:{gradeType:gradeType},
							success:function(data){
								$(".bestWn").remove();
								
								for(var i = 0; i < data.list.length; i++){
									var wnBestArea = $(".wnBestArea");
									var bestWn = $('<table class="bestWn" name="bestWn">');
									var bwnImg = $('<td class="bestImg" rowspan="4"><img class="bwnImg" src="${ contextPath }/resources/uploadFiles/webnovelMain/'+ data.list[i].changeName+'">');
									var bestTitle = $('<td  class="bestTitle">').text(data.list[i].wTitle);
									var bestGenre = $('<td class="bestGenre">').text('장르 - ' + data.list[i].genreExplain);
									var stpAvg = data.list[i].spAvg;
									var hiddenWid = $('<input type="hidden" id="wnWid" value="'+data.list[i].wid+'">')
									var bestSpTd = $('<td class="bestSp">');
									
									var bestSp0 = $('<p class="starAvg">').append('<br>'+ data.list[i].spAvg + ' 점');
									var bestSp1 = $('<p class="starAvg">').append('&#11088; <br>'+ data.list[i].spAvg + ' 점');
									var bestSp2 = $('<p class="starAvg">').append('&#11088; &#11088; <br>'+ data.list[i].spAvg + ' 점');
									var bestSp3 = $('<p class="starAvg">').append('&#11088; &#11088; &#11088; <br>'+ data.list[i].spAvg + ' 점');
									var bestSp4 = $('<p class="starAvg">').append('&#11088; &#11088; &#11088; &#11088; <br>'+ data.list[i].spAvg + ' 점');
									var bestSp5 = $('<p class="starAvg">').append('&#11088; &#11088; &#11088; &#11088; &#11088; <br>'+ data.list[i].spAvg + ' 점');
									var list = new Array();
									list[0] = bwnImg;
									list[1] = bestTitle;
									list[2] = bestGenre;
									if(stpAvg >= 4.5){
										list[3] = bestSpTd.append(bestSp5,hiddenWid);
									}else if(stpAvg >= 3.5){
										list[3] =  bestSpTd.append(bestSp4,hiddenWid);
									}else if(stpAvg >= 2.5){
										list[3] =  bestSpTd.append(bestSp3,hiddenWid);
									}else if(stpAvg >= 1.5){
										list[3] =  bestSpTd.append(bestSp2,hiddenWid);
									}else if(stpAvg >= 1){
										list[3] =  bestSpTd.append(bestSp1,hiddenWid);
									}else{
										list[3] = bestSpTd.append(bestSp0,hiddenWid);
									}
									
									
									for(var j = 0; j < list.length; j++) {
										var tr = $('<tr>');
										tr.append(list[j]);
										bestWn.append(tr);
									}
									wnBestArea.append(bestWn);
									bestWn.append(tr);
								}
								
								$('.wnBestArea').find($(".bestWn")).on('click',function(){
									var wid = $(this).children().last().children().children('input').val();
									location.href = "selectWnRoundList.wn?wid=" + wid;
								});
								
							},
							error:function(status){
								alert(status);
							}
						});	
						
					});
				
				</script>
				</c:if>
			</div>
			<div class="col-sm-1"></div>
		</div>
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10 wnrArea">
			<div id="pagingArea" align="center">
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="wnrListBack" value="/selectWnRoundList.wn?">
						<c:param name="wid" value="${ wn.wid }"/>
						<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ wnrListBack }">[이전]</a> &nbsp;
				</c:if>
				
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="wnrListCheck" value="/selectWnRoundList.wn">
							<c:param name="wid" value="${ wn.wid }"/>
							<c:param name="currentPage" value="${ p }"/>
						</c:url>
						<a href="${ wnrListCheck }">${ p }</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					&nbsp; [다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="wnrListEnd" value="/selectWnRoundList.wn">
						<c:param name="wid" value="${ wn.wid }"/>
						<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<a href="${ wnrListEnd }">&nbsp;[다음]</a>
				</c:if>
				
			</div>
			
			</div>
			<div class="col-sm-1"></div>
		</div>
		
		
		
	</div>
	
	
	
	
	<script>
		function attentionId(){
			alert("이미 관심등록을 하셨습니다.");
		}
		function fisrtWnr(){
			$('.wnrListArea').find('td').children('p').click(function(){
				var wid = $(this).parents().parents().children().children("input").eq(1).val();
				location.href = "selectDetailedWebnovel.wn?wid=" + wid +"&currentPage=" + ${pi.listCount };
			});
		}
		$(function(){
			$('.wnrListArea').find($("button[name=deleteBtn]")).click(function(){
				var rid = $(this).parents().children("input").eq(0).val();
				location.href = "deleteWnRound.wn?rid=" + rid;
			});	
			
			$('.wnrListArea').find($("button[name=wnUpdateBtn]")).click(function(){
				var rid = $(this).parents().children("input").eq(0).val();
				location.href = "selectWnrUpdateForm.wn?rid=" + rid;
			});
			
			$('.wnrListArea').find('td').children('p').click(function(){
				var rid = $(this).parents().parents().children().children("input").eq(0).val();
				var wid = $(this).parents().parents().children().children("input").eq(1).val();
				var currentPage = $(this).parents().parents().children().children("input").eq(2).val();
				location.href = "selectDetailedWebnovel.wn?wid=" + wid + "&rid="+ rid +"&currentPage=" + currentPage;
			});
		});
		$(document).ready(function(){
			var wid = ${ wn.wid};
			$.ajax({
				url:"selectAllStarAvgCnt.wn",
				type:"get",
				data:{wid:wid},
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
			
		});


	</script>
	
	
</body>
</html>