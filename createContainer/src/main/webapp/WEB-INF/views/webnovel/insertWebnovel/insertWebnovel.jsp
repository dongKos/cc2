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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel = "stylesheet" type = "text/css" href = "${ contextPath }/resources/css/webnovel/insertWebnovel.css">
</head>
<body>
	<!-- 서비스 상단 네비바 -->
	<jsp:include page="../../main/common/serviceNavbar.jsp"/>
	<!-- 웹소설 중단 네비바 -->
	<jsp:include page="../common/middleNavbar.jsp"/>
	<!-- 웹소설 목록 -->
	<div class="container">
		<div class="row">
			<div class="col-sm-1 col-md-1 col-xs-1"></div>
			<div class="col-sm-10 col-md-10 col-xs-10">
				<form action="insertNovel.wn" method="post" enctype="multipart/form-data">
					<div class="insertWnForm">
						<div class="title">
							<div class="webnovelTitle">새 작품 등록</div>
						</div>
						<div class="content">
							<table class="insertWnTable">
								<tr>
									<td class="wnText">작품 제목</td>
									<td class="wnContent">
										<input class="insertWnInput" type="text" name="wTitle" placeholder="제목을 입력해주세요." maxlength="40" autofocus required>
									</td>
								</tr>
								<tr>
									<td class="wnText">장르</td>
									<td class="wnContent">
										<input id="cb1" type="radio" name="genre" value="GR_CTG1"><label for="cb1">판타지</label>
										<input id="cb2" type="radio" name="genre" value="GR_CTG8"><label for="cb2">무협</label>
										<input id="cb3" type="radio" name="genre" value="GR_CTG10"><label for="cb3">로맨스</label>
										<input id="cb4" type="radio" name="genre" value="GR_CTG1"><label for="cb4">현대</label>
										<input id="cb5" type="radio" name="genre" value="GR_CTG6"><label for="cb5">공포</label>
									</td>
								</tr>
								<tr>
									<td class="wnText">대표 썸네일</td>
									<td class="wnContent">
										<div class="imgBox">
											<img id="thumbnail">
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="wnText">작품 소개</td>
								</tr>
								<tr>
									<td colspan="2" class="wnContent">
										<textarea class="introduction" name="wIntro"></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="wnText">연재 주기</td>
								</tr>
								<tr>
									<td colspan="2" class="wnContent">
										<textarea class="cycle" name="wCycle"></textarea>
									</td>
								</tr>
								<tr>
									<td class="wnText">연령대</td>
									<td class="wnInput wnContent">
										<select class="ageSelect" name="ageGrade">
											<option value="T">12세 이상 관람 가능</option>
											<option value="T">15세 이상 관람 가능</option>
											<option value="AD">청소년 이상 관람 가능</option>
											<option value="T">전체 관람 가능</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="lastTd"colspan="2">
										<div id="fileArea">
											<input type="file" id="wnMainThumbnail" name="photo" onchange="loadImg(this,1)">
										</div>
										<div class="wnBtn">
											<button class="cancelWnBtn" type="button" onclick="location='cancelWebnovel.wn'">등록 취소</button>&nbsp;&nbsp;&nbsp;
											<button class="insertWnBtn" type="submit">작품 등록</button>
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
	<br><br><br><br><br>
	<br><br><br><br><br>
	<script>
		$(function(){
			$("#fileArea").hide();
			
			$("#thumbnail").click(function(){
				$("#wnMainThumbnail").click();
			});
		});
		
		function loadImg(value, num){
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function(e){
					switch(num){
					case 1 :
						$("#thumbnail").attr("src", e.target.result); break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
	</script>
</body>
</html>