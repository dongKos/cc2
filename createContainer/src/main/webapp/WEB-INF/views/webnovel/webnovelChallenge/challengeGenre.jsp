<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
</head>
<body>
	<div class="genreNav">
		<table class="genreMenu">
			<tr>
				<td class="genreItem" id="1" onClick="location.href='webnovelChallenge.wn'">추천</td>
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
			var gradeType = 1;
			$.ajax({
				url:"challengeGenre.wn",
				type:"get",
				data:{genre:genre, currentPage:currentPage, gradeType:gradeType},
				success:function(data){
					$(".newchallengeList").remove();
					$(".challengeList").children().remove();
					$(".recommendGenreArea").remove();
					$(".challengeList").append(
							'<p class="challengeMenu">장르별 도전 작품</p>'+
							'<div class="wnListArea"></div><div id="npagingArea" align="center">' +
							'<ul class="pagination" id="nPaging"></ul></div>'		
					);
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
				         
					//이전 버튼
					if(currentPage <= 1){
						$paging.append("<li class='page-item'><a class='page-link'>이전</a></li>");
					}else{
						$paging.append("<li class='page-item'><a class='page-link' onclick='genreMenu("+ wnGenre +', '+ (currentPage -1) + ")'>이전</a></li>");
					}
					//숫자 버튼
					for(var i = startPage; i <= endPage; i++){
						if(i == currentPage){
							$paging.append("<li class='page-item'><a class='page-link'>" + i + "</a></li>");
						}else{
							$paging.append("<li class='page-item'><a class='page-link' onclick='genreMenu("+ wnGenre +', '+ i + ")'>" + i + "</a></li>");
						}
					}
					//다음 버튼
					if(currentPage >= maxPage){
						$paging.append("<li class='page-item'><a class='page-link'>다음</a></li>");
					}else{
						$paging.append("<li class='page-item'><a class='page-link' onclick='genreMenu("+ wnGenre +', '+ (currentPage + 1) + ")'>다음</a></li>");
					}
					
					$('.wnListArea').find($("table[name=wnList]")).on('click',function(){
						var wid = $(this).children().last().children().children('input').val();
						console.log(wid);
						location.href = "selectWnRoundList.wn?wid=" + wid + "&gradeType=1";
					});
				},
				error:function(status){
					alert(status);
				}
			});
		}
	
	</script>
</body>
</html>