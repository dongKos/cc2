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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
input[type=checkbox] {
	display: none;
} 

input[type=checkbox]+label {
	display: inline-block;
	cursor: poonter;
	position: relative;
	padding-left: 25px;
	margin-right: 18px;
	font-size: 13px;
}

input[type=checkbox]+label:before {
	content: "";
	display: inline-block;
	border: 1px solid lightgray;
	width: 16px;
	height: 16px;
	margin-right: 10px;
	position: absolute;
	left: 0;
	bottom: 1px;
	background-color: white;
	border-radius: 2px;
}

input[type=checkbox]:checked+label:before {
	content: "\2713";
	text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);
	font-size: 14px;
	font-weight: 800;
	color: white;
	background: skyblue;
	text-align: center;
	line-height: 18px;
}

.insertWtrFrom {
	background-color: #FBFBFB;
	margin-top: 30px;
	min-width: 670px;
	width: 100%;
	border: 2px solid #E0E0E0;
}

.wtrBtn {
	text-align: center;
	width: 100%;
}

.insertwtrBtn {
	width: 150px;
	height: 40px;
	margin-top: 30px;
	margin-bottom: 30px;
	background-color: #ABE5FB;
	color: white;
	border: 1px solid #ABE5FB;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
}

.insertwtrBtn:hover {
	background-color: #84CEFA;
	color: white;
}

.cancelwtrBtn {
	width: 150px;
	height: 40px;
	margin-top: 30px;
	margin-bottom: 30px;
	background-color: white;
	color: skyblue;
	border: 1px solid #84CEFA;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
}

.cancelwtrBtn:hover {
	background-color: #CFEEF9;
	color: skyblue;
}

.wtrText {
	min-width: 120px;
	font-weight: bold;
}

.wtrTitle {
	width: 100%;
	line-height: 60px;
	vertical-align: middle;
	border-bottom: 2px solid #E0E0E0;
	padding-left: 10%;
	font-size: 18px;
	font-weight: bold;
}

.insertWtrTable {
	min-width: 100%;
}

.insertWtrTable tr>td {
	border-bottom: 1px solid #E0E0E0;
	height: 40px;
	padding-left: 20px;
	padding-right: 20px;
}

.wtrContent {
	padding-top: 10px;
	padding-bottom: 10px;
}

.insertWtrInput {
	border: none;
	width: 300px;
	height: 30px;
}

.imgBox {
	width: 170px;
	height: 170px;
	margin-top: 10px;
	margin-bottom: 10px;
	padding: 5px 5px 5px 5px;
	cursor: pointer;
	border: 1px dashed #E0E0E0;
}

#roundThumbnail {
	width: 100%;
	height: 100%;
}

#roundContent{
	width: 100%;
	height: 100%;
}

.introduction {
	width: 100%;
	margin-top: 10px
	margin-bottom: 10px;
	height: 300px;
	resize: none;
}

.wtrContent {
	padding-top: 10px;
	padding-bottom: 10px;
}

.wrComment {
	width: 100%;
	margin-top: 10px;
	margin-bottom: 10px;
	height: 150px;
	resize: none;
}

.lastTd {
	border-bottom: none !important;
}

.content {
	padding: 0px 50px 0px 50px;
}
</style>
</head>
<body>
	<c:set var="contextPath"
			value="${ pageContext.servletContext.contextPath }"
				scope="application" />
	<!-- 서비스 상단 네비바 -->
	<jsp:include page="../main/common/serviceNavbar.jsp" />
	<jsp:include page="common/webtoonMenubar.jsp" />
	<!-- 웹소설 중단 네비바 -->
	<!-- 웹소설 목록 -->
	<div class="container">
		<div class="row">
			<div class="col-sm-1 col-md-1 col-xs-1"></div>
			<div class="col-sm-10 col-md-10 col-xs-10">
				<form action="insertWtRound.wt" method="post"
					enctype="multipart/form-data">
					<div class="insertWnrFrom">
						<div class="title">
							<div class="wtrTitle">신규 회차 등록</div>
						</div>
						<div class="content">
							<table class="insertWtrTable">
								<tr>
									<td class="wtrText">회차 제목</td>
									<td class="wtrContent"> <input class="insertWtrInput"
										type="text" name="rTitle" placeholder="제목을 입력해주세요."
										maxlength="40" autofocus required>
									</td>
									<td>
										<input type="hidden" name="wid" value="${ wid }">
									</td>
								</tr>
								<tr>
									<td class="wtrText">회차 썸네일</td>
									<td class="wtContent">
										<div class="imgBox">
											<img id="roundThumbnail">
										</div>
								</tr>
								<tr>
									</td>
									<td class="wtrText">회차내용</td>
									<td class="wtContent">
										<div class="imgBox">
											<img id="roundContent">
										</div>
									</td>
								</tr>

								<tr>
									<td colspan="2" class="wtrText" name="wtrText">작가의 말</td>
								</tr>
								<tr>
									<td colspan="2" class="wtContent"><textarea
											class="wrComment" name="wrComment"></textarea></td>
								</tr>
								<tr>
									<td colspan="2" class=""><input id="workStatus"
										type="checkbox" name="workStatus" value="COMP"><label
										for="workStatus">이 회차가 완결입니다.</label></td>
								</tr>
								<tr>
									<td class="lastTd" colspan="2">
										<div id="fileArea">
											<input type="file" id="wtroundThumbnail1" name="photo"
												onchange="loadImg(this,1)">
											<input type="file" id="wtroundThumbnail2" name="photo1"
												onchange="loadImg(this,2)">
										</div>
										<div class="wtrBtn">
											<button class="cancelwtrBtn" type="button"
												onclick="location='cancelWebtoon.wt'">등록 취소</button>
											&nbsp;&nbsp;&nbsp;
											<button class="insertwtrBtn" type="submit">회차 등록</button>
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
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<script>
		$(function() {
			$("#fileArea").hide();

			$("#roundThumbnail").click(function() {
				$("#wtroundThumbnail1").click();
			});
			
			$("#roundContent").click(function() {
				$("#wtroundThumbnail2").click();
			});
			
		});

		$(function() {
			$("#workStatus").click(function() {
				var chk = $(this).is(":checked");
				if (chk)
					$("#workStatus").val('COMP');
				else
					$("#workStatus").val('RUN');
				console.log(chk);
			});
		});

		function loadImg(value, num) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					switch (num) {
					case 1:
						$("#roundThumbnail").attr("src", e.target.result);
						console.log("제1구역");
						break;
						
					case 2:
						$("#roundContent").attr("src", e.target.result);
						console.log("제2구역");
						break;
					}
				}
				reader.readAsDataURL(value.files[0]);
				console.log("reader구문");
			}
		}
	</script>
</body>
</html>