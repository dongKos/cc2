<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
.col-sm-9 {
	
}

.container {
	display: block;
	position: relative;
	padding-left: 35px;
	margin-bottom: 12px;
	cursor: pointer;
	font-size: 22px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/* Hide the browser's default radio button */
.container input {
	position: absolute;
	opacity: 0;
	cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
	position: absolute;
	top: 0;
	left: 0;
	height: 25px;
	width: 25px;
	background-color: #eee;
	border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
	background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.container input:checked ~ .checkmark {
	background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
	content: "";
	position: absolute;
	display: none;
}

/* Show the indicator (dot/circle) when checked */
.container input:checked ~ .checkmark:after {
	display: block;
}

/* Style the indicator (dot/circle) */
.container .checkmark:after {
	top: 9px;
	left: 9px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}

#thumbnailArea {
	border: 0.5px solid grey;
	width: 50px;
	height: 50px;
}

.col-sm-9 {
	padding-top: 20px;
	padding-bottom: 30px;
	margin-bottom: 40px;
}

</style>
</head>
<body>
	<jsp:include page="../main/common/serviceNavbar.jsp" />
	<jsp:include page="common/webtoonMenubar.jsp" />
	<br>
	<br>
	<br>
	<div class="col-sm-2"></div>`
	<div class="col-sm-9">
	<!-- insertWebtoon.wt -->
		<form action="insertWebtoon.wt" method="post" enctype="multipart/form-data">
			<table class="insert">
				<tr>
					<td>
						<h4>
							작품 제목&nbsp;&nbsp;<input type="text"
								name="wTitle" style="width: 70%;">
						</h4><hr> <br>
						
					</td>
				</tr>

				<tr>
					<td>
						<h4>
							장르&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="checkbox-inline">
								<label><input type="checkbox" name="genre"
									value="GR_CTG1">현대</label>
							</div>
							<div class="checkbox-inline">
								<label><input type="checkbox" name="genre"
									value="GR_CTG2">개그</label>
							</div>
							<div class="checkbox-inline">
								<label><input type="checkbox" name="genre"
									value="GR_CTG3">판타지</label>
							</div>
							<div class="checkbox-inline">
								<label><input type="checkbox" name="genre"
									value="GR_CTG4">액션</label>
							</div>
							<div class="checkbox-inline">
								<label><input type="checkbox" name="genre"
									value="GR_CTG5">순정</label>
							</div>
							<div class="checkbox-inline">
								<label><input type="checkbox" name="genre"
									value="GR_CTG6">공포</label>
							</div>
							<div class="checkbox-inline">
								<label><input type="checkbox" name="genre"
									value="GR_CTG7">스포츠</label>
							</div>
						</h4> <br>
				<hr>
					</td>
				</tr>
				<tr>
					<td>
						<h4>
							줄거리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="wIntro"
							style="width: 70%; height:80%;"></textarea>
						</h4> <br>
						<hr>
					</td>
				</tr>
				<tr>
					<td>
						<h4>
							연재주기&nbsp;&nbsp;&nbsp;
							<div class="checkbox-inline">
								<label><input type="checkbox" name="wCycle" value="MON">월요일</label>
							</div>
							<div class="checkbox-inline">
								<label><input type="checkbox" name="wCycle" value="TUES">화요일</label>
							</div>
							<div class="checkbox-inline">
								<label><input type="checkbox" name="wCycle" value="WED">수요일</label>
							</div>
							
							<div class="checkbox-inline">
								<label><input type="checkbox" name="wCycle" value="THUR">목요일</label>
							</div>
						
							<div class="checkbox-inline">
								<label><input type="checkbox" name="wCycle" value="FRI">금요일</label>
							</div>
							<div class="checkbox-inline">
								<label><input type="checkbox" name="wCycle" value="SAT">토요일</label>
							</div>
							<div class="checkbox-inline">
								<label><input type="checkbox" name="wCycle" value="SUN">일요일</label>
							</div>
						</h4> <br><hr>
					</td>
				</tr>
				<tr>
					<td>
						<h4>썸네일 이미지</h4>
						<div class="thumbnailArea" style="border: 1px solid black; width: 100px; height: 100px;">
							<img id="thumbnail" style="width: 100%; height: 100%;">
						</div> <br><hr>
					</td>
					<td>
						<div id="fileArea">
							<input type="file" id="thumbInsert" name="photo"
								onchange="loadImg(this, 1)">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<h4>
							연령제한&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="checkbox-inline">
								<label><input type="checkbox" name="ageGrade" value="T">전연령</label>
							</div>
							<div class="checkbox-inline">
								<label><input type="checkbox" name="ageGrade" value="T">15세</label>
							</div>
							<div class="checkbox-inline">
								<label><input type="checkbox" name="ageGrade" value="AD">19세</label>
							</div>
						</h4><hr>
					</td>
				</tr>
			</table>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="reset" class="btn btn-primary btn-sm">취소하기</button>
			&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="submit"  class="btn btn-primary btn-sm">등록하기</button>
		</form>
	</div>
	<br>
	<br>
	<br>
	<br>
	<script>
		$(function() {
			$("#fileArea").hide();
			
			$("#thumbnail").click(function(){
				$("#thumbInsert").click();
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