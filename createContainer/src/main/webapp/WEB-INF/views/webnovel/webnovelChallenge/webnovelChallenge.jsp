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
				<td class="genreItem" id="2" onClick="genreMenu('GR_CTG3',1)">판타지</td>
				<td class="genreItem" id="3" onClick="genreMenu('GR_CTG8',1)">무협</td>
				<td class="genreItem" id="4" onClick="genreMenu('GR_CTG10',1)">로맨스</td>
				<td class="genreItem" id="5" onClick="genreMenu('GR_CTG1',1)">현대</td>
				<td class="genreItem" id="6" onClick="genreMenu('GR_CTG6',1)">공포</td>
				<td class="genreItem" id="7" onClick="genreMenu('CLOSE',1)">완결</td>
			</tr>
		</table>
	</div>
	<script>
		function genreMenu(genre, currentPage){
			$.ajax({
				url:"challengeGenre.wn",
				type:"get",
				data:{genre:genre, currentPage:currentPage},
				success:function(data){
					$(".wnList").remove();
					for(var i = 0; i < data.list.length; i++){
						var wnListArea = $(".wnListArea");
						var wnList =$('<table class="wnList" name="wnList">');
						var td = $('<td>');
						var wnImgBoxTd = $('<td class="wnImgBoxTd" colspan="2">');
						var wnStatus = $()
						var wnImg = $('<img class="wnImg" src="${ contextPath }/resources/uploadFiles/webnovelMain/'+ data.list[i].changeName+'">');
						var tdC2 = $('<td colspan="2">');
						var wnTitle = $('<p class="wnTitle">').text(data.list[i].wTitle);
						var wnNicknameTd = $('<p class="wnNicknameTd">' +data.list[i].nickname+ '</p><p class="wnrCountTd">'+'회차수'+'</p>');
						var wnStarPoint = $('<p class="wnStarPoint">' +'별점'+ '</p><p class="wnInterest">'+'관심등록'+'</p>');
						var hiddenWid = $('<input type="hidden" id="wnWid" value="'+data.list[i].wid+'">')
						var list = new Array();
						list[0] = wnImgBoxTd.append(wnImg);
						list[1] = tdC2.append(wnTitle);
						list[2] = td.append(wnNicknameTd, wnStarPoint, hiddenWid);
						
						for(var j = 0; j < list.length; j++) {
							var tr = $('<tr>');
							tr.append(list[j]);
							wnList.append(tr);
						}
						wnListArea.append(wnList);
					}
					
					$paging = $("#nPaging");
					$paging.html('');
					var currentPage = data.pi.currentPage;
					var startPage = data.pi.startPage;
					var endPage = data.pi.endPage;
					var maxPage = data.pi.maxPage;
					var wnGenre = '"'+genre+'"';
				         
					//이전
					if(currentPage <= 1){
						$paging.append("<li class='page-item'><a class='page-link'>이전</a></li>");
					}else{
						$paging.append("<li class='page-item'><a class='page-link' onclick='genreMenu("+ wnGenre +', '+ (currentPage -1) + ")'>이전</a></li>");
					}
					
					//숫자
					for(var i = startPage; i <= endPage; i++){
						if(i == currentPage){
							$paging.append("<li class='page-item'><a class='page-link'>" + i + "</a></li>");
						}else{
							$paging.append("<li class='page-item'><a class='page-link' onclick='genreMenu("+ wnGenre +', '+ i + ")'>" + i + "</a></li>");
						}
					}
					
					//다음
					if(currentPage >= maxPage){
						$paging.append("<li class='page-item'><a class='page-link'>다음</a></li>");
					}else{
						$paging.append("<li class='page-item'><a class='page-link' onclick='genreMenu("+ wnGenre +', '+ (currentPage + 1) + ")'>다음</a></li>");
					}
					
					
					$('.wnListArea').find($("table[name=wnList]")).on('click',function(){
						var wid = $(this).children().last().children().children('input').val();
						console.log(wid);
						location.href = "selectWnRoundList.wn?wid=" + wid;
					});
					
					
					/* if(data.list[i].userId == '${sessionScope.loginUser.userId}'){
						$('.wnListArea').find($("table[name=wnList]")).on('click',function(){
							var wid = $(this).children().last().children().children('input').val();
							console.log(wid);
							location.href = "selectWnRoundList.wn?wid=" + wid;
						});
					}else{
						$('.wnListArea').find($("table[name=wnList]")).on('click',function(){
							var wid = $(this).children().last().children().children('input').val();
							console.log(wid);
							location.href = "selectWnRoundListCnt.wn?wid=" + wid;
						});
					} */
					
					
					
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
			<div class="col-sm-7">
				
				<jsp:include page="../common/webnovelNotice.jsp"/>
				
			</div>
			<div class="col-sm-3">
				<p>베스트 도전작품</p><br>
				<img style="width:100%; hegiht:300px !important;"src="${ contextPath }/resources/images/logo.png"/>
			</div>
			<div class="col-sm-1"></div>
		</div><br><br>
		
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
				<div id="npagingArea" align="center">
					<ul class="pagination" id="nPaging">
					
					</ul>
				</div>
				
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>