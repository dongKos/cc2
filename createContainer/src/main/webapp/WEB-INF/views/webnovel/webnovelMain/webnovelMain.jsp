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
<style>
.genreDiv{
	border:1px solid black;
	height:200px;
}
.genreDiv2{
	border:1px solid black;
	height:170px;
}
.item{
	height:350px;
}
.container{
	margin-top:30px;
}
.content{
	width:100%;
}

.genreNav{
	margin-top:0px;
	text-align: center;
	border-bottom:1px solid #E0E0E0;
	background-color:#F0F0F0;
}
.genreMenu{
	margin:0 auto;
}
.genreItem{
	height:30px;
	width:100px;
	font-weight:bold;
	font-size:13px;
	color:gray;
}
.genreItem:hover{
	cursor:pointer;
	color:#84CEFA;
}
</style>
<style>
.item{
	height:350px;
}
.container{
	margin-top:30px;
}
.content{
	width:100%;
}
.wnCategory{
	width:100%;
}
.wnCategory tr{
	width:100%;
}
.lineUp{
	margin-top:50px;
	margin-bottom:10px;
	text-align:right;
}
.lineUp select{
	width:150px;
	height:30px;
}
.wnImg{
	width:100%;
	height:100%;
}
.wnListArea{
	width:780px;
	padding:0px 0px 0px 0px;
}
.wnList{
	cursor:pointer;
	display:inline-block;
	padding:0px 0px 0px 0px;
	margin:5px 7px 5px 7px;
	width:180px;
	border:1px solid lightgray;
}
.wnImgBoxTd{
	padding:10px 10px 10px 10px; 
	width:180px;
	height:180px;
	border-bottom:1px solid lightgray;
}
.wnTitle{
	line-height:20px;
	padding-left:10px;
	font-size:13px;
	border-bottom:1px solid lightgray;
}
.wnNicknameTd{
	display: inline-block;
	width:90px;
	height:15px;
	padding-left:10px;
	font-size:12px;
	color:gray;
}
.wnrCountTd{
	display: inline-block;
	width:80px;
	height:15px;
	padding-left:10px;
	font-size:12px;
	color:gray;
	text-align:right;
}
.wnStarPoint{
	width:80px;
	display: inline-block;
	width:80px;
	height:15px;
	padding-left:10px;
	font-size:12px;
	color:red;
}
.wnInterest{
	display: inline-block;
	width:90px;
	height:15px;
	padding-left:10px;
	font-size:12px;
	color:gray;
	text-align:right;
}
.wnBestArea{
	border:1px solid lightgray;
}
.bestWn{
	margin:0 auto;
	cursor:pointer;
}
.bwnImg{
	height:100%;
	font-size:10px;
}
.bestImg{
	broder:1px solid lightgray;
	height:200px;
	padding:5px 5px 5px 5px;
	font-size:10px;
}
.bestTitle{
	width:150px;
	height:30px;
	font-size:12px;	
	padding-left:10px;
}
.bestGenre{
	font-size:9px;
	height:20px;
		padding-left:10px;
}
.bestSp{
	color:red;
	font-size:8px;
	padding-left:10px;
}
.bestMainTitle{
	display:inline-block;
	margin-bottom:0px;
	width:120px;
}
.bestRank{
	display:inline-block;
	margin-bottom:5px;
	margin-bottom:5px;
	width:120px;
	color:red;
}
.leftBtn{
	display:inline-block;
}
.rightBtn{
	display:inline-block;
}
.piBtn{
	width:25px;
	line-height:20px;
	border-radius:8px 8px 8px 8px;
	background-color:white;
	color:skyblue;
	border:1px solid skyblue;
	font-size:14px;
	font-weight:bold;
	cursor:pointer;
}
.bestPi{
	text-align:center;
}
.recommendGenreArea{
	padding:10px 10px 10px 10px;
	width:100%;
	background-color:#FAFAFA;
}
.recommendWn{
	border:1px solid lightgray;
	min-width:31%;
	display:inline-block;
	cursor:pointer;
	margin-left:5px;
	margin-right:5px;
}
.recommendImgBox{
	height:180px;
	broder:1px solid black;
	padding:5px 5px 5px 5px;
	font-size:10px;
}
.recommendImg{
	height:170px;
	font-size:10px;
    width: 114px;
}
.recommendTitle{
	line-height:20px;
	font-size:12px;
	font-weight:bold;	
	padding-left:5px;
}
.recommendNickname{
	line-height:20px;
	padding-left:5px;
	font-size:12px;	
}
.recommendGenre{
	font-size:9px;
	line-height:20px;
	padding-left:5px;
}
.recommendSp{
	color:red;
	font-size:12px;
	padding-left:5px;
	text-align:right;
}
.selectGenre{
	margin-left:20px;
	height:30px;
}
.challengeMenu{
	display:inline-block;
	margin-top:20px;
	margin-left:20px;
	font-size:16px;
	font-weight:bold;
}
.rPagingBtn{
	display:inline-block;
	float:right;
	margin-right:10px;
}
.piRbtn{
	display:inline-block;
	margin-top:20px;
	width:25px;
	line-height:20px;
	border-radius:8px 8px 8px 8px;
	background-color:white;
	color:skyblue;
	border:1px solid skyblue;
	font-size:14px;
	font-weight:bold;
	cursor:pointer;
}
.challengeMenuName{
	display:inline-block;
	margin-left:20px;
	font-size:16px;
	font-weight:bold;
	color:skyblue;
}

.newchallengeList{
	padding:0 autol
	widht:100%;
	background-color:#FAFAFA;
	
}
.nwnTable{
	border:1px solid lightgray;
	width:140px;
	display:inline-block;
	cursor:pointer;
    margin-left: 15px;
	margin-right:5px;
}
.newRecommendImgBox{
	padding:5px 5px 5px 5px;
	font-size:10px;
}
.newRecommendImg{
	height:180px;
	width:129px;
	font-size:10px;
}
.newRecommendTitle{
	height:20px;
	font-size:12px;
	font-weight:bold;	
	padding-left:5px;
}
.newNecommendNickname{
	height:20px;
	padding-left:5px;
	font-size:12px;	
}
.newRecommendGenre{
	font-size:9px;
	height:20px;
	padding-left:5px;
}
.newRecommendSp{
	color:red;
	font-size:12px;
	padding-left:5px;
	text-align:right;
}
.newstarAvg{
    display: inline-block;
    height: 23px;
    padding-right: 5px;
}
.rPagingBtn{
	display:inline-block;
	float:right;
	margin-right:10px;
}
.newPagingArea{
	display:inline-block;
}
</style>

</head>
<body>
	<!-- 서비스 상단 네비바 -->
	<jsp:include page="../../main/common/serviceNavbar.jsp"/>
	<!-- 웹소설 중단 네비바 -->
	<jsp:include page="../common/middleNavbar.jsp"/>
	<div class="container">
		<!-- 공지사항, 베스트 도전작품 -->
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-7">
				<jsp:include page="../common/webnovelNotice.jsp"/>
			</div>
			<div class="col-sm-3">
				<jsp:include page="../webnovelMain/webnovelTop5.jsp"/>
			</div>
			<div class="col-sm-1"></div>
		</div><br><br>
		
		<!-- 장르별 추천작 -->
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10 challengeList">
				<div class="wnListArea">
					<!-- <div class="lineUp">
						<select>
							<option>조회순</option>
							<option>최신순</option>
							<option>별점순</option>
							<option>관심등록순</option>
						</select>
					</div> -->
				</div>
				<div id="npagingArea" align="center">
					<ul class="pagination" id="nPaging">
					</ul>
				</div>
				<div class="recommendGenreArea"></div>
				<div id="rpagingArea"></div>
				
				
				
			</div>
			<div class="col-sm-1"></div>
		</div><br><br>
		
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10 ">
				<jsp:include page="../webnovelMain/newWebnovelList.jsp"/>
				<div class="col-sm-4">
					<%-- <p class="challengeMenu">광고광고</p>
					<br><br>
					<jsp:include page="../common/webnovelNotice.jsp"/> --%>
				</div>
			
			</div>
			<div class="col-sm-1"></div>
		</div>
		
		<jsp:include page="../webnovelMain/webnovelBestGenre.jsp"/>
		<hr>
	</div>
	<jsp:include page="../webnovelMain/webnovelBestGenre.jsp"/>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>