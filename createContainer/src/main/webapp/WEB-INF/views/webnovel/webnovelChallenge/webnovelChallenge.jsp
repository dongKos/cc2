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
.wnBestArea{
	border:1px solid lightgray;
}
.bestWn{
	margin:0 auto;
	cursor:pointer;
}
.bwnImg{
	width:94%;
	font-size:10px;
}
.bestImg{
	broder:1px solid lightgray;
	width:80px;
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
				<div class="wnBestArea">
					<div class="bestPi">
						<div class="leftBtn">
							<button class="piBtn" onclick="location.href='selectMainBestWnList.wn?currentPage'+"><</button>
						</div>
						<p class="bestMainTitle">베스트 도전작품</p>
						<div class="rightBtn">
							<button class="piBtn">></button>
						</div>
					</div>
				</div>
			</div>
			<script>
				$(document).ready(function(){
					
					var gradeType = 1;
					$.ajax({
						url:"selectMainBestWnList.wn",
						type:"get",
						data:{gradeType:gradeType},
						success:function(data){
							console.log(data);
							
							for(var i = 0; i < data.list.length; i++){
								var wnBestArea = $(".wnBestArea");
								var bestWn = $('<table class="bestWn" name="bestWn">');
								var bwnImg = $('<td class="bestImg"><img class="bwnImg" src="${ contextPath }/resources/uploadFiles/webnovelMain/'+ data.list[i].changeName+'">');
								var bestTitle = $('<td  class="bestTitle">').text(data.list[i].wTitle);
								var bestGenre = $('<td class="bestGenre">').text('장르 - ' + data.list[i].genreExplain);
								var stpAvg = data.list[i].spAvg;
								var hiddenWid = $('<input type="hidden" id="wnWid" value="'+data.list[i].wid+'">')
								var bestSpTd = $('<td class="bestSp">');
								
								var bestSp0 = $('<p class="starAvg">').append('<br>'+ data.list[i].spAvg + ' 점');
								var bestSp1 = $('<p class="starAvg">').append('&#11088; <br>'+ data.list[i].spAvg + ' 점');
								var bestSp2 = $('<p class="starAvg">').append('&#11088; &#11088; <br>'+ data.list[i].spAvg + ' 점');
								var bestSp3 = $('<p class="starAvg">').append('&#11088; &#11088; &#11088; <br>'+ data.list[i].spAvg + ' 점');
								var bestSp4 = $('<p class="starAvg">').append('&#11088; &#11088; &#11088; &#11088; <br>'+ data.list[i].spAvg + ' 점');
								var bestSp5 = $('<p class="starAvg">').append('&#11088; &#11088; &#11088; &#11088; &#11088; <br>'+ data.list[i].spAvg + ' 점');
								var list = new Array();
								list[0] = bwnImg;
								list[1] = bestTitle;
								list[2] = bestGenre;
								if(stpAvg >= 4.5){
									list[3] = bestSpTd.append(bestSp5,hiddenWid);
								}else if(stpAvg >= 3.5){
									list[3] =  bestSpTd.append(bestSp4,hiddenWid);
								}else if(stpAvg >= 2.5){
									list[3] =  bestSpTd.append(bestSp3,hiddenWid);
								}else if(stpAvg >= 1.5){
									list[3] =  bestSpTd.append(bestSp2,hiddenWid);
								}else if(stpAvg >= 1){
									list[3] =  bestSpTd.append(bestSp1,hiddenWid);
								}else{
									list[3] = bestSpTd.append(bestSp0,hiddenWid);
								}
								
								
								for(var j = 0; j < list.length; j++) {
									var tr = $('<tr>');
									tr.append(list[j]);
									bestWn.append(tr);
								}
								wnBestArea.append(bestWn);
								bestWn.append(tr);
							}
							
							
							
							$leftBtn = $(".leftBtn");
							$rightBtn = $(".rightBtn");
							$leftBtn.html('');
							$rightBtn.html('');
							var currentPage = data.pi.currentPage;
							var startPage = data.pi.startPage;
							var endPage = data.pi.endPage;
							var maxPage = data.pi.maxPage;
						    var left = "'selectMainBestWnList.wn?currentPage="+ (currentPage - 1) +"&gradeType=1'";
						    var right = "'selectMainBestWnList.wn?currentPage="+ (currentPage + 1) +"&gradeType=1'";
						    console.log(left);
						    console.log(right);
							//이전
							if(currentPage <= 1){
								$leftBtn.append('<button class="piBtn"><</button>');
							}else{
								$leftBtn.append('<button class="piBtn" onclick="location.href=' + left + '"><</button>');
							}
							
							//다음
							if(currentPage >= maxPage){
								$rightBtn.append('<button class="piBtn">></button>');
							}else{
								$rightBtn.append('<button class="piBtn" onclick="location.href=' + right + '">></button>');
							}
							
							
							$('.wnListArea').find($("table[name=wnList]")).on('click',function(){
								var wid = $(this).children().last().children().children('input').val();
								console.log(wid);
								location.href = "selectWnRoundList.wn?wid=" + wid;
							});
							
							
							
							
							
							
							$('.wnBestArea').find($(".bestWn")).on('click',function(){
								var wid = $(this).children().last().children().children('input').val();
								location.href = "selectWnRoundList.wn?wid=" + wid;
							});
							
						},
						error:function(status){
							alert(status);
						}
					});	
					
					
				});
				
			</script>
			<div class="col-sm-1"></div>
		</div><br><br>
		
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div class="wnListArea">
					<div class="lineUp">
						<select>
							<option>조회순</option>
							<option>최신순</option>
							<option>별점순</option>
							<option>관심등록순</option>
						</select>
					</div>
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