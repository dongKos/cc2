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
<style>
.genreDiv{
	border:1px solid black;
	height:250px;
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
	border:1px solid lightgray;
	padding:0px 0px 0px 0px;
}
.wnList{
	display:inline-block;
	padding:0px 0px 0px 0px;
	margin:5px 5px 5px 5px;
	width:180px;
	border:1px solid black;
}
.wnImgBoxTd{
	padding:10px 10px 10px 10px; 
	width:180px;
	height:180px;
	border-bottom:1px solid black;
}
.wnTitle{
	line-height:20px;
	padding-left:10px;
	font-size:13px;
	border-bottom:1px solid black;
}
.wnNicknameTd{
	height:15px;
	padding-left:10px;
	font-size:12px;
	color:gray;
}
.wnStarPoint{
	line-height:15px;
	padding-left:10px;
	font-size:12px;
	color:red;
}
.wnInterest{
	line-height:15px;
	padding-left:10px;
	font-size:12px;
	color:black;
}
.wnrCountTd{
	height:15px;
	padding-left:10px;
	font-size:12px;
	color:gray;
}
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<!-- 서비스 상단 네비바 -->
	<jsp:include page="../../main/common/serviceNavbar.jsp"/>
	<!-- 웹소설 중단 네비바 -->
	<jsp:include page="../common/middleNavbar.jsp"/>
	<!-- 웹소설 장르 네비바 -->
	<jsp:include page="../common/genreNavbar.jsp"/>
	
	<div class="genreNav">
		<table class="genreMenu">
			<tr>
				<td class="genreItem" id="id1" onClick="location.href=''">추천</td>
				<td class="genreItem" id="2" onClick="genreMenu('GR_CTG3')">판타지</td>
				<td class="genreItem" id="3" onClick="genreMenu('GR_CTG8')">무협</td>
				<td class="genreItem" id="4" onClick="genreMenu('GR_CTG10')">로맨스</td>
				<td class="genreItem" id="5" onClick="genreMenu('GR_CTG1')">현대</td>
				<td class="genreItem" id="6" onClick="genreMenu('GR_CTG6')">공포</td>
				<td class="genreItem" id="7" onClick="location.href=''">완결</td>
			</tr>
		</table>
	</div>
	<script>
	function genreMenu(genre){
		$.ajax({
			url:"challengeGenre.wn",
			type:"get",
			data:{genre:genre},
			success:function(data){
				//console.dir(data.list[0]);
				//console.dir(data.pi);
					console.dir('${ contextPath}/resources/uploadFiles/webnovelMain/' + data.list[0].changeName);
					console.dir(data.list[0].wTitle);
					console.dir(data.list[0].nickname);
					
				
					
				for(var i = 0; i < data.list.length; i++){
					var wnListArea = $(".wnListArea");
					var wnList =$('<table class="wnList">');
					/* var tr = $('<tr>'); */
					var td = $('<td>');
					var wnImgBoxTd = $('<td class="wnImgBoxTd" colspan="2">');
					var wnImg = $('<img class="wnImg" src="${ contextPath }/resources/uploadFiles/webnovelMain/'+ data.list[i].changeName+'">');
					var tdC2 = $('<td colspan="2">');
					var wnTitle = $('<p class="wnTitle">').text(data.list[i].wTitle);
					var wnNicknameTd = $('<p class="wnNicknameTd">').text(data.list[i].nickname);
					var wnrCountTd = $('<p class="wnrCountTd">').text('회차수');
					var wnStarPoint = $('<p class="wnStarPoint">').text('별점');
					var wnInterest = $('<p class="wnInterest">').text('관심등록');
					
					
					var list = new Array();
					list[0] = wnImgBoxTd.append(wnImg);
					list[1] = tdC2.append(wnTitle);
					list[2] = td.append(wnNicknameTd), td.append(wnrCountTd);
					list[3] = wnNicknameTd;
					console.log(list.length);
					
					for(var j = 0; j < list.length; j++) {
						console.log(list[j]);
						var tr = $('<tr>');
						tr.append(list[j]);
						wnList.append(tr);
					}
					wnListArea.append(wnList);
					
					/* tr.append(wnImgBoxTd.append(wnImg));
					tr.append(tdC2.append(wnTitle));
					tr.append(wnNicknameTd); */
				//	tr.append(wnrCountTd);
				}
				
				
			},
			error:function(status){
				alert(status);
			}
		});
	}
	</script>
	<div class="container">
		<!-- 공지 이미지 -->
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<jsp:include page="../common/webnovelNotice.jsp"/>
			</div>
			<div class="col-sm-1"></div>
		</div>
		
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div class="lineUp">
					<select>
						<option>조회순</option>
						<option>최신순</option>
						<option>별점순</option>
						<option>관심등록순</option>
					</select>
				</div>
				<div class="wnListArea">
					<table class="wnList">
						<tr>
							<td class="wnImgBoxTd" colspan="2">
								<img class="wnImg" src="${ contextPath }/resources/images/logo.png">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<p class="wnTitle">제목제목제목</p>
							</td>
						</tr>
						<tr>
							<td>
								<p class="wnNicknameTd">닉네임</p>
							</td>
							<td>
								<p class="wnrCountTd">회차수</p>
							</td>
						</tr>
						<tr>
							<td>
								<p class="wnStarPoint">별점</p>
							</td>
							<td>
								<p class="wnInterest">관심등록</p>
							</td>
						</tr>
					</table>
				</div>
				
				
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>