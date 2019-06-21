<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel = "stylesheet" type = "text/css" href = "${ contextPath }/resources/css/webnovel/insertWebnovel.css">
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
	border-right:1px solid lightgray;
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
</style>
</head>
<body>
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
					<table class="wnListTable">
						<tbody>
							<tr>
								<td>
									<div class="titleImg">
										<img src="${ contextPath }/resources/uploadFiles/webnovelMain/e569e31dc2ba4ae89a0c9d731189fbc8.PNG">
									</div>
								</td>
								<td class="contentTd">
									작품 제목
								</td>
								<td>
									<button>작품 정보 수정</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<button class="insertWnBtn" onclick="location='insertWebnovel.wn'">새 작품 쓰기</button>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
</body>
</html>











