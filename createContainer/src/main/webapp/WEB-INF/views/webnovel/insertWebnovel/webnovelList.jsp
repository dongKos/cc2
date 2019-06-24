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
.wnList{
	text-align:center;
}
.insertWnBtn{
	width:250px;
	height:40px;
	margin-top:5px;
	background-color:white;
	color:skyblue;
	border:1px solid #84CEFA;
	font-size:15px;
	font-weight:bold;
	cursor:pointer;
}
.insertWnBtn:hover{
	background-color:#84CEFA;
	color:white;
}
.wnMenu{
	width:100%;
	border-bottom:1px solid lightgray;
	margin-bottom:30px;
}
.wnWork{
	margin-top:50px;
	
	height:40px;
}
.wnWork tr>td{
	width:140px;
	color:gray;
	font-weight:bold;
}
.wnWork tr>td:hover{
	color:skyblue;
	cursor:pointer;
}
.wnListDiv{
	width:100%;
	margin-bottom:50px;
}
.titleImg{
	padding:5px 5px 5px 5px;
}
.titleImg img{
	width:150px;
	height:120px;
}
.contentTd{
	width:50%;
}
.wnListTable{
	width:100%;
	border:1px solid lightgray;
}
.wnUpdateBtn{
	width:130px;
	height:30px;
	border-radius:8px 8px 8px 8px;
	background-color:skyblue;
	color:white;
	border:1px solid skyblue;
	font-size:14px;
	font-weight:bold;
	cursor:pointer;
}
.workImg{
	width:10%;
	border-right:1px solid lightgray;
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
			<div class="col-sm-10 wnList">
				<div class="wnMenu">
					<table class="wnWork">
						<tr><td>도전 작품</td><td>프리미엄 작품</td></tr>
					</table>
				</div>
				<div class="wnListDiv">
				
				<c:forEach var="wn" items="${ list }">
					<table class="wnListTable">
						<tr>
							<td class="workImg">
								<div class="titleImg">
									<img src="${ contextPath }/resources/uploadFiles/webnovelMain/${ wn.changeName }">
								</div>
							</td>
							<td class="contentTd">
								${ wn.wTitle }
								<input type="hidden" value="${ wn.wid }">
							</td>
							<td>
								<button class="wnUpdateBtn">작품 정보 수정</button>
							</td>
						</tr>
					</table>
					<br>
				</c:forEach>
				
				
				<script>
					$(function(){
						$('.wnListDiv').find('td').children('button').click(function(){
							var wid = $(this).parents().parents().children("td").eq(1).children("input").val();
							
							location.href = "selectWnUpdateOne.wn?wid=" + wid;
						});
						$('.wnListDiv').find('td').children('div').children('img').click(function(){
							var wid = $(this).parents().parents().parents().children("td").eq(1).children("input").val();
							
							console.log(wid);
							
							location.href = "selectWnRoundList.wn?wid=" + wid;
						});
					});
			
				</script>
				</div>
				
				<div id="pagingArea" align="center">
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="wnListBack" value="/selectWnList.wn">
							<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ wnListBack }">[이전]</a> &nbsp;
					</c:if>
					
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="4"><b>[${ p }]</b></font>
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="wnListCheck" value="/selectWnList.wn">
								<c:param name="currentPage" value="${ p }"/>
							</c:url>
							<a href="${ wnListCheck }">${ p }</a>
						</c:if>
					</c:forEach>
					
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						&nbsp; [다음]
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="wnListEnd" value="/selectWnList.wn">
							<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
						</c:url>
						<a href="${ wnListEnd }">&nbsp;[다음]</a>
					</c:if>
					
				</div>
				<br>
				<br>
				
				
				<button class="insertWnBtn" onclick="location='insertWebnovel.wn'">새 작품 쓰기</button>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
	
	
</body>
</html>











