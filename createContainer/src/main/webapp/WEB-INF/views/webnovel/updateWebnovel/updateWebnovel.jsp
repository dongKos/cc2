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
				<form action="updateNovel.wn" method="post" enctype="multipart/form-data">
					<div class="insertWnForm">
						<div class="title">
							<div class="webnovelTitle">작품 정보 수정</div>
						</div>
						<div class="content">
							<table class="insertWnTable">
								<tr>
									<td class="wnText">작품 제목</td>
									<td class="wnContent">
										<input type="hidden" name="gradeType"value="${wn.gradeType}">
										<input class="insertWnInput" type="text" name="wTitle" placeholder="제목을 입력해주세요." maxlength="40" value="${ wn.wTitle }" autofocus required>
									</td>
								</tr>
								<tr>
									<td class="wnText">장르</td>
									<td class="wnContent">
										<input id="genre" type="hidden" value="${ wn.genre }">
										<input id="GR_CTG3" type="radio" name="genre" value="GR_CTG3"><label for="GR_CTG3">판타지</label>
										<input id="GR_CTG8" type="radio" name="genre" value="GR_CTG8"><label for="GR_CTG8">무협</label>
										<input id="GR_CTG10" type="radio" name="genre" value="GR_CTG10"><label for="GR_CTG10">로맨스</label>
										<input id="GR_CTG1" type="radio" name="genre" value="GR_CTG1"><label for="GR_CTG1">현대</label>
										<input id="GR_CTG6" type="radio" name="genre" value="GR_CTG6"><label for="GR_CTG6">공포</label>
									</td>
								</tr>
								<tr>
									<td class="wnText">대표 썸네일</td>
									<td class="wnContent">
										<div class="imgBox">
											<img id="thumbnail" src="${ contextPath }/resources/uploadFiles/webnovelMain/${ wn.changeName }">
											<input type="hidden" name="changeName" value="${ wn.changeName }">
											
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="wnText">작품 소개</td>
								</tr>
								<tr>
									<td colspan="2" class="wnContent">
										<textarea class="introduction" name="wIntro">${ wn.wIntro }</textarea>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="wnText">연재 주기</td>
								</tr>
								<tr>
									<td colspan="2" class="wnContent">
										<textarea class="cycle" name="wCycle">${ wn.wCycle }</textarea>
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
											<button class="cancelWnBtn" type="button" onclick="location='insertWebnovel.wn'">수정취소</button>&nbsp;&nbsp;&nbsp;
											<button class="insertWnBtn" type="submit">수정하기</button>
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
		$(function(){
			if($('#genre').val() == 'GR_CTG3'){
				$('#GR_CTG3').prop('checked', true);
			}else if($('#genre').val() == 'GR_CTG8'){
				$('#GR_CTG8').prop('checked', true);
			}else if($('#genre').val() == 'GR_CTG10'){
				$('#GR_CTG10').prop('checked', true);
			}else if($('#genre').val() == 'GR_CTG1'){
				$('#GR_CTG1').prop('checked', true);
			}else if($('#genre').val() == 'GR_CTG6'){
				$('#GR_CTG6').prop('checked', true);
			}
		});
		
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
		
	/* 	$(function(){
        	$("input[name=genre]").each(function (){
        		var arr = ${ wn.genre };
        		//$("#genre").prop("checked", true);
        		console.log(arr);
        		for(var i = 0; i < arr.length; i++) {
        			if($(this).val() == arr[i]) {
        				$(this).attr("checked", true);
        			}
        		}
        	})
        	
        
        }); */
	</script>
</body>
</html>