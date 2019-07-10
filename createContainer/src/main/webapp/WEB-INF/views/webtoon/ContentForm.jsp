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
.introImg{
    width: 34%;
    height: 125px;
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

.mainThumbnail{
	width:200%;
	margin-left:85%;
	margin-top:-13%;
	height: 100%;
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
.starPoitn{
	text-align: left;
}

.content{
	width:90%;
}
.optionBtn{
width: 530px;
}
.anthorWork{
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

</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<jsp:include page="../main/common/serviceNavbar.jsp" />
	<jsp:include page="common/webtoonMenubar.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10 wtList">
				<div class="wtMenu">
					<table class="wtWork">
						<tr>
							<td><a>요일별</a></td>
							<td><a>장르별</a></td>
							<td><a>완결</a></td>
						</tr>
					</table>
				</div>
			<div class="introArea">
					<table class="introTable">
						<tr>
							<td rowspan="3"width="210">
								<%-- <c:set var="workStatus" value="${ wt.workStatus }" />
								<c:if test="${ workStatus eq 'COMPLTE'}"> --%>
								<div class="introImg">
									<img class="mainThumbnail" src="${ contextPath }/resources/uploadFiles/webtoonMain/${ wt.changeName }">
								</div>
							
							</td>
							<td width="220" height="50%">
								<p class="wnrTitle">${ wt.wTitle }</p>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<p class="wtrIntro">${ wt.wIntro }</p>
							</td>
						</tr>
						<tr>
							<td class="attention" colspan="2">
							<div class="optionBtn">
								<button class="wnrBtn" type="button" onclick="location.href='attention.wt?wid=' + ${wt.wid}">관심웹툰</button>
								<button class="wnrBtn" type="button">첫화보기</button>
								<button class="anthorWork" type="button" onclick="location.href='anthorWork.wt?wid=' + ${wt.wid}">
								작가의 다른 작품 보기</button>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<hr>
				<div class="starPoitn">
					<h4>별점주는곳</h4>
				</div>
				<hr>
				<div class="contentArea">
					<img class="content" src="${ contextPath }/resources/uploadFiles/webtoonContent/${ wr.changeName }">
				</div>
				<hr>
				<br> <br>
			<br><br>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
	
	<script>
	
	
	</script>

</body>
</html>

































