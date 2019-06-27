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
	width:160px;
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
	font-weight:bold;
	font-size:17px;
}
.wnrIntro{
	padding:10px 30px 10px 30px;
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
	height:30px;
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
	width:300px;
	line-height:40px;
	background-color:lightgray;
	cursor:pointer;
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
								<c:if test="${ workStatus eq 'COMPLTE'}">
								<div class="introImg">
									<img src="${ contextPath }/resources/uploadFiles/webnovelMain/${ wn.changeName }">
								</div>
								</c:if>
								<c:if test="${ workStatus eq 'CLOSE'}">
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
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<p class="wnrIntro">${ wn.wIntro }</p>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<button class="wnrBtn" type="button" onclick="location.href='insertWnRoundForm.wn?wid=' + ${wn.wid}">신규 회차 등록</button>
								<button class="wnrBtn" type="button" onclick="location.href='selectWnUpdateOne.wn?wid=' + ${wn.wid}">작품 정보 수정</button>
								<button class="wnrBtn" type="button">휴재 신청</button>
							</td>
						</tr>
					</table>
				</div>
				<div class="wnrListArea">
				<c:forEach var="wnr" items="${ list }">
					<table class="wnrTable">
						<tr>
							<td rowspan="3" class="wnrImg">
								<div class="subImg">
								<c:if test="${ workStatus eq 'CLOSE'}">
									<div class="wnrStatus">완결</div>
									<img src="${ contextPath }/resources/uploadFiles/webnovelSub/${ wnr.changeName }">
								</c:if>
								<c:if test="${ workStatus eq 'COMPLTE'}">
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
								<button class="wnUpdateBtn">회차 정보 수정</button>
								<input type="hidden" value="${ wnr.rid }">
								<input type="hidden" value="${ wnr.fid }">
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
				<script>
					$(function(){
						$('.wnrListArea').find('td').children('button').click(function(){
							var rid = $(this).parents().children("input").eq(0).val();
							location.href = "selectWnrUpdateForm.wn?rid=" + rid;
						});
						$('.wnrListArea').find('td').children('p').click(function(){
							var rid = $(this).parents().parents().children().children("input").eq(0).val();
							
							location.href = "selectDetailedWebnovel.wn?rid=" + rid;
						});
					});
				</script>
				</div>
				
				
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
</body>
</html>