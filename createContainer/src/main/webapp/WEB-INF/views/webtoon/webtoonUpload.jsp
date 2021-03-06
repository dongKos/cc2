<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${ contextPath }/resources/css/webnovel/insertWebnovel.css">
<style>
.wtList {
	text-align: center;
}

.insertWtBtn {
	width: 250px;
	height: 40px;
	margin-top: 5px;
	background-color: white;
	color: skyblue;
	border: 1px solid #84CEFA;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
}

.insertWtBtn:hover {
	background-color: #84CEFA;
	color: white;
}

.wtMenu {
	width: 100%;
	border-bottom: 1px solid lightgray;
	margin-bottom: 30px;
}

.wtWork {
	margin-top: 50px;
	height: 40px;
}

.wtWork tr>td {
	width: 140px;
	color: gray;
	font-weight: bold;
}

.wtWork tr>td:hover {
	color: skyblue;
	cursor: pointer;
}

.wtListDiv {
	width: 100%;
	margin-bottom: 50px;
}

.titleImg {
	position: relative;
	padding: 0px 0px 0px 0px;
	cursor: pointer;
}

.titleImg img {
	width: 150px;
	height: 120px;
}

.contentTd {
	width: 50%;
}

.wtListTable {
	width: 100%;
	border: 1px solid lightgray;
}

.wtUpdateBtn {
	width: 130px;
	height: 30px;
	border-radius: 8px 8px 8px 8px;
	background-color: skyblue;
	color: white;
	border: 1px solid skyblue;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
}

.workImg {
	width: 10%;
	border-right: 1px solid lightgray;
}

.titleArea {
	width: 100%;
	cursor: pointer;
	margin-bottom: 0px;
}

.testImg {
	width: 100%;
	height: 100%;
}

.insertWtRound {
	width: 20%;
	height: 40px;
	margin-top: 5px;
	background-color: white;
	color: skyblue;
	border: 1px solid #84CEFA;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
}

.insertWtRound:hover {
	background-color: #84CEFA;
	color: white;
}

.roundList {
	width: 20%;
	height: 40px;
	margin-top: 5px;
	background-color: white;
	color: skyblue;
	border: 1px solid #84CEFA;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
}

.roundList:hover {
	background-color: #84CEFA;
	color: white;
}

.updateWork {
	width: 20%;
	height: 40px;
	margin-top: 5px;
	background-color: white;
	color: skyblue;
	border: 1px solid #84CEFA;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
}

.updateWork:hover {
	background-color: #84CEFA;
	color: white;
}
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<jsp:include page="../main/common/serviceNavbar.jsp" />
	<jsp:include page="common/webtoonMenubar.jsp" />
	<c:if test="${!empty sessionScope.loginUser }">
	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10 wtList">
				<div class="wtMenu">
					<table class="wtWork">
						<tr>
							<td>도전 작품</td>
							<td>프리미엄 작품</td>
						</tr>
					</table>
				</div>
				<div class="wtListDiv">
					<c:forEach var="wt" items="${list}">
						<table class="wtListTable">
							<tr>
								<td class="workImg">
									<div class="titleImg">
										<img class="testImg"
											src="${ contextPath }/resources/uploadFiles/webtoonMain/${ wt.changeName }" />
									</div>
								</td>
								<td class="contentTd">
									<div>
										<p class="titleArea">${ wt.wTitle }</p>
									</div>

									<div>
										<input type="hidden" class="wid" value="${ wt.wid }"> 
									</div>
									<div>
										<button class="updateWork">작품 수정</button>
										<button class="insertWtRound">회차등록</button>
										<button class="roundList">회차목록 보기</button>
									</div>
								</td>
							</tr>
						</table>
						<br>
					</c:forEach>
				</div>
				<br> <br>
				<button class="insertWtBtn" onclick="location='inserWorkForm.wt'">새
					작품 쓰기</button>
			<br><br>
			</div>
			<div class="col-sm-1"></div>
		</div>
		<div id="pagingArea" align="center">
			<c:if test="${ pi.currentPage <= 1}">
				[이전]&nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="wtlistBack" value="/insertWork.wt">
					<c:param name="currentPage" value="${ pi.currentPage - 1}" />
				</c:url>
				<a href="${ blistBack }">[이전]</a>&nbsp;
			</c:if>

			<c:forEach var="p" begin="${pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<font color="red" size="4"><b>[${ p }]</b></font>
				</c:if>
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="wtlistCheck" value="/insertWork.wt">
						<c:param name="currentPage" value="${ p }" />
					</c:url>
					<a href="${ blistCheck}">${ p }</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${ pi.currentPage >= pi.maxPage}">
				&nbsp; [다음]
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="wtlistEnd" value="/insertWork.wt">
					<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
				</c:url>
				<a href="${ blistEnd }">&nbsp;[다음]</a>
			</c:if>
		</div>
	</div>
	</c:if>
	<c:if test="${empty sessionScope.loginUser }">
		<h4 align="center">로그인이 필요한 서비스입니다</h4>
	</c:if>
	<script>
		$(function(){
			//회차등록
			$(".insertWtRound").click(function(){
				var wid = $(this).parents().children().children('.wid').val();
				console.log(wid);	
				location.href = "insertRoundFrom.wt?wid=" + wid;
			});
			
			//회차목록록보기
			$(".roundList").click(function(){
				var wid = $(this).parents().children().children('.wid').val();
				
				location.href = "roundList.wt?wid=" + wid;
				
				
			});
			
			$(".updateWork").click(function(){
				var wid = $(this).parents().children().children('.wid').val();
				location.href = "workUpdateForm.wt?wid=" + wid;
			});
			
			
		});
	
	</script>

</body>
</html>

































