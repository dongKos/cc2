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
.workImg{
	width:10%;
	border-right:1px solid lightgray;
}
.titleImg{
	position:relative;
	padding:5px 5px 5px 5px;
	cursor:pointer;
}
.wnStatus{ 
	position:absolute;
    top: 5px;
    left: 5px;
	width:60px;
	line-height:40px;
	z-index:100;
	font-size:18px;
	font-weight:bold;
	background-color:#ffffff;
	opacity: 0.6;
	color:red;
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
						<tr>
							<td onClick="location.href='selectWnList.wn?gradeType=1'">도전 작품</td>
							<td onClick="location.href='selectWnList.wn?gradeType=2'">프리미엄 작품</td>
						</tr>
					</table>
				</div>
				<div class="wnListDiv">
				<c:if test="${list[0].wid == null}">
					<table class="wnListTable">
						<tr>
							<td class="workImg">
								<div class="titleImg">
									<img src="${ contextPath }/resources/images/icon/noImg.png">
								</div>
							</td>
							<td class="contentTd">
								<p class="titleArea">작품을 등록하세요</p>
								<input type="hidden" class="wid" value="">
							</td>
							<td>
							</td>
						</tr>
					</table>
				</c:if>
				<c:forEach var="wn" items="${ list }" varStatus="status" begin="0" end="4">
					<table class="wnListTable">
						<tr>
							<td class="workImg">
								<c:set var="workStatus" value="${ wn.workStatus }" />
								<div class="titleImg">
								<c:if test="${ workStatus eq 'RUN'}">
									<img src="${ contextPath }/resources/uploadFiles/webnovelMain/${ wn.changeName }">
								</c:if>
								<c:if test="${ workStatus eq 'COMP'}">
								<div class="wnStatus">완결</div>
									<img src="${ contextPath }/resources/uploadFiles/webnovelMain/${ wn.changeName }">
								</c:if>
								</div>
							</td>
							<td class="contentTd">
								<p class="titleArea">${ wn.wTitle }</p>
								<input type="hidden" class="wid" value="${ wn.wid }">
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
												<input type="hidden" class="wid" value="${ wn.wid }">
												<button type="button" class="cancleBtn" data-dismiss="modal">취소하기</button>
												<button type="button" class="deleteBtn" name="deleteBtn">삭제하기</button>
											</div>
										</div>
									</div>
								</div>
								
							</td>
							<td>
								<button class="wnUpdateBtn" name="wnUpdateBtn">작품 정보 수정</button><br><br>
								
								<button class="wnDeleteBtn" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal<c:out value="${status.index}" />">작품 삭제</button>
								
							</td>
						</tr>
					</table>
					<br>
				</c:forEach>
					
				
				<script>
					$(function(){
						var gradeType = ${list[0].gradeType};
						console.log(gradeType);
						$('.wnListDiv').find($("button[name=deleteBtn]")).click(function(){
							var wid = $(this).parents().children("input").val();
							console.log(wid);
							
							location.href = "deleteWebnovel.wn?wid="+wid+"&gradeType=" + gradeType;
						});
						
						$('.wnListDiv').find($("button[name=wnUpdateBtn]")).click(function(){
							var wid = $(this).parents().parents().children("td").eq(1).children("input").val();
							
							location.href = "selectWnUpdateOne.wn?wid=" + wid +"&gradeType=" + gradeType;
						});
						
						$('.wnListDiv').find('td').children('div').children('img').click(function(){
							var wid = $(this).parents().parents().parents().children("td").eq(1).children("input").val();
							
							location.href = "selectWnRoundList.wn?wid=" + wid + "&gradeType=" + gradeType;
						});
						$('.wnListDiv').find('tr').children().children('p').click(function(){
							var wid = $(this).parents().children("input").val();
							location.href = "selectWnRoundList.wn?wid=" + wid + "&gradeType=" + gradeType;
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
				<c:if test="${gradeType == 1}">
					<button class="insertWnBtn" onclick="location='insertWebnovel.wn'">새 작품 쓰기</button>
				</c:if>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
	
	
</body>
</html>











