<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
input[type=checkbox]{
	display:none;
}
input[type=checkbox] + label{
	display:inline-block;
	cursor:poonter;
	position:relative;
	padding-left:25px;
	margin-right:18px;
	font-size:13px;
}
input[type=checkbox]+label:before{
	content:"";
	display:inline-block;
	
	border:1px solid lightgray;
	
	width:16px;
	height:16px;
	
	margin-right:10px;
	position:absolute;
	left:0;
	bottom:1px;
	background-color:white;
	border-radius:2px;
}
input[type=checkbox]:checked + label:before{
	content: "\2713";
	text-shadow:1px 1px 1px rgba(0,0,0,.2);
	font-size:14px;
	font-weight:800;
	color:white;
	background:skyblue;
	text-align:center;
	line-height:18px;
}
.insertWnrFrom{
	background-color:#FBFBFB;
	margin-top:30px;
	min-width:670px;
	width:100%;
	border:2px solid #E0E0E0;
}
.wnrBtn{
	text-align:center;
	width:100%;
}
.insertwnrBtn{
	width:150px;
	height:40px;
	margin-top:30px;
	margin-bottom:30px;
	background-color:#ABE5FB;
	color:white;
	border:1px solid #ABE5FB;
	font-size:15px;
	font-weight:bold;
	cursor:pointer;
}
.insertwnrBtn:hover{
	background-color:#84CEFA;
	color:white;
}
.cancelwnrBtn{
	width:150px;
	height:40px;
	margin-top:30px;
	margin-bottom:30px;
	background-color:white;
	color:skyblue;
	border:1px solid #84CEFA;
	font-size:15px;
	font-weight:bold;
	cursor:pointer;
}
.cancelwnrBtn:hover{
	background-color:#CFEEF9;
	color:skyblue;
}
.wnrText{
	min-width:120px;
	font-weight:bold;
}
.wnrTitle{
	width:100%;
	line-height:60px;
	vertical-align:middle;
	border-bottom:2px solid #E0E0E0;
	padding-left:10%;
	font-size:18px;
	font-weight:bold;
}
.insertWnrTable{
	min-width:100%;
}
.insertWnrTable tr>td{
	border-bottom:1px solid #E0E0E0;
	height:40px;
	padding-left:20px;
	padding-right:20px;
}
.wnrContent{
	padding-top:10px;
	padding-bottom:10px;
}
.insertWnrInput{
	border:none;
	width:300px;
	height:30px;
}
.imgBox{
	width:170px;
	height:170px;
	margin-top:10px;
	margin-bottom:10px;
	padding:5px 5px 5px 5px;
	cursor:pointer;
	border:1px dashed #E0E0E0;
}
#roundThumbnail{
	width:100%;
	height:100%;
}
.introduction{
	width:100%;
	margin-top:10px;
	margin-bottom:10px;
	height:300px;
	resize: none;
}
.wnrContent{
	padding-top:10px;
	padding-bottom:10px;
}
.wrComment{
	width:100%;
	margin-top:10px;
	margin-bottom:10px;
	height:150px;
	resize: none;
}
.lastTd{
	border-bottom:none !important;
}
.content{
	padding:0px 50px 0px 50px;
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
			<div class="col-sm-1 col-md-1 col-xs-1"></div>
			<div class="col-sm-10 col-md-10 col-xs-10">
				<form action="insertWnRound.wn" method="post" enctype="multipart/form-data">
					<div class="insertWnrFrom">
						<div class="title">
							<div class="wnrTitle">신규 회차 등록</div>
						</div>
						<div class="content">
							<table class="insertWnrTable">
								<tr>
									<td class="wnrText">회차 제목</td>
									<td class="wnrContent">
										<input type="hidden" value="${ wn.wid }">
										<input class="insertWnrInput" type="text" name="rTitle" placeholder="제목을 입력해주세요." maxlength="40" autofocus required>
									</td>
								</tr>
								<tr>
									<td class="wnrText">회차 썸네일</td>
									<td class="wnContent">
										<input type="hidden" name="gradeType" value="${wn.gradeType}">
										<div class="imgBox">
											<img id="roundThumbnail">
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="wnrText">회차 내용</td>
								</tr>
								<tr>
									<td colspan="2" class="wnrContent">
										<textarea class="introduction" name="rContent"></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="wnrText">작가의 말</td>
								</tr>
								<tr>
									<td colspan="2" class="wnContent">
										<textarea class="wrComment" name="wrComment"></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="">
										<input id="workStatus" type="checkbox" name="workStatus" value="COMP"><label for="workStatus">이 회차가 완결입니다.</label>
									</td>
								</tr>
								<tr>
									<td class="lastTd"colspan="2">
										<div id="fileArea">
											<input type="file" id="wnroundThumbnail" name="photo" onchange="loadImg(this,1)">
										</div>
										<div class="wnrBtn">
											<button class="cancelwnrBtn" type="button" onclick="location='cancelWebnovel.wn'">등록 취소</button>&nbsp;&nbsp;&nbsp;
											<button class="insertwnrBtn" type="submit">작품 등록</button>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</form>
				
				
			</div>
			<div class="col-sm-1 col-md-1 col-xs-1"></div>
		</div>
	</div>
	<jsp:include page="../common/webnovelFooter.jsp"/>
	<script>
		$(".insertwnrBtn").on("click", function(){
			var rTitle = $("input[name=rTitle]").val();
			var photo = $("input[name=photo]").val();
			var rContent = $("textArea[name=rContent]").val();
			var wrComment = $("textArea[name=wrComment]").val();
			if(rTitle==""){
				alert("회차 제목을 입력하세요.");
				return false;
			}else if(!photo){
				alert("사진을 등록해주세요.");
				return false;
			}else if(rContent==""){
				alert("회차 내용을 입력하세요.");
				return false;
			}else if(wrComment==""){
				alert("작가의 말 입력하세요.");
				return false;
			}else{
				return true;
			}
		});
	
		$(function(){
			$("#fileArea").hide();
			
			$("#roundThumbnail").click(function(){
				$("#wnroundThumbnail").click();
			});
		});
		
		$(function(){
			$("#workStatus").click(function(){
				var chk = $(this).is(":checked");
				if(chk) $("#workStatus").val('COMP');
				else $("#workStatus").val('RUN');
			});
		});
		
		function loadImg(value, num){
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function(e){
					switch(num){
					case 1 :
						$("#roundThumbnail").attr("src", e.target.result); break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
	</script>
</body>
</html>