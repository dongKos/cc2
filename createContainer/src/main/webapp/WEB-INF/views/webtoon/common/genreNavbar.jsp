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
	background-color: #2c3e50;
}
.genreMenu{
	margin:0 auto;
}
.genreItem{
	height:30px;
	width:100px;
	font-weight:bold;
	font-size:13px;
	color:white;
}
.genreItem:hover{
	cursor:pointer;
	color:#84CEFA;
}
.genreArea {
    width: 100%;
    height: 381px;
    padding: 5px;
}
.genreTable {
    display: inline-block;
    margin-right: 10px;
    border: 1px solid gray;
    border-radius: 4px;
	margin-bottom: 5px;
}

.genreImgBox {
    width: 130px;
    height: 130px;
    padding: 5px;
    border: 1px solid gray;
    border-radius: 8px;
}

.genreImg{
	height:100%;
	cursor:pointer;
	width:100%;
}
.genreTd{
	padding:5px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<div class="genreNav">
		<table class="genreMenu">
			<tr>
				<td class="middleItem" onClick="location.href='webtoonChallenge.wt'">추천</td>
				<td class="genreItem" id="2" onClick="genreMenu('GR_CTG1',1)">일상</td>
				<td class="genreItem" id="3" onClick="genreMenu('GR_CTG2',1)">개그</td>
				<td class="genreItem" id="4" onClick="genreMenu('GR_CTG3',1)">판타지</td>
				<td class="genreItem" id="5" onClick="genreMenu('GR_CTG4',1)">액션</td>
				<td class="genreItem" id="6" onClick="genreMenu('GR_CTG5',1)">로멘스</td>
				<td class="genreItem" id="7" onClick="genreMenu('GR_CTG6',1)">스릴러</td>
				<td class="genreItem" id="7" onClick="genreMenu('GR_CTG7',1)">스포츠</td>
			</tr>
		</table>
	</div>
	
	<script>
	function genreMenu(genre, currentPage){
		var gradeType = 1;
		
		$.ajax({
			url:"challengeGenre.wt",
			type:"get",
			data:{genre:genre, currentPage:currentPage, gradeType:gradeType},
			success:function(data){
				$(".recommendArea").remove();
				$(".genreArea").children().remove();
				$(".pagination").children().remove();
				
				for(var i = 0; i < data.list.length; i++){
					var genreArea = $(".genreArea");	
					var genreTable =$('<table class="genreTable">');
					var genreTd = $('<td class="genreTd">');
					var genreImgBox = $('<div class="genreImgBox"><img class="genreImg" src="${ contextPath }/resources/uploadFiles/webtoonMain/'+ data.list[i].changeName+'">');
					//var genreImg = $('<img class="genreImg" src="${ contextPath }/resources/uploadFiles/webtoonMain/'+ data.list[i].changeName+'">');
					var hiddenWid = $('<input type="hidden" id="wnWid" value="'+data.list[i].wid+'">')
					var wTitle = $('<p class="recommendTitle" align="center">'+data.list[i].wTitle+'</p>');
					
					var list = new Array();
					list[0] = genreTd.append(genreImgBox,hiddenWid);
					list[1] = genreTd.append(wTitle);
					
					for(var j = 0; j < list.length; j++) {
						var tr = $('<tr>');
						tr.append(list[j]);
						genreTable.append(tr);
					}
					genreArea.append(genreTable);
					
					
					
					$(".genreImg").click(function(){
						var wid = $(this).parents().parents().children("input").val();
						console.log(wid);
						location.href = "roundList.wt?wid=" + wid;
					});
					
					
					
					
				}
				
				$paging = $("#nPaging");
				$paging.html('');
				var currentPage = data.pi.currentPage;
				var startPage = data.pi.startPage;
				var endPage = data.pi.endPage;
				var maxPage = data.pi.maxPage;
				var wtGenre = '"'+genre+'"';
				
				console.log(currentPage);
				console.log(startPage);
				console.log(endPage);
				console.log(maxPage);
				console.log(wtGenre);
			         
				//이전
				if(currentPage <= 1){
					$paging.append("<li class='page-item'><a class='page-link'>이전</a></li>");
				}else{
					$paging.append("<li class='page-item'><a class='page-link' onclick='genreMenu("+ wtGenre +', '+ (currentPage -1) + ")'>이전</a></li>");
				}
				
				//숫자
				for(var i = startPage; i <= endPage; i++){
					if(i == currentPage){
						$paging.append("<li class='page-item'><a class='page-link'>" + i + "</a></li>");
					}else{
						$paging.append("<li class='page-item'><a class='page-link' onclick='genreMenu("+ wtGenre +', '+ i + ")'>" + i + "</a></li>");
					}
				}
				
				//다음
				if(currentPage >= maxPage){
					$paging.append("<li class='page-item'><a class='page-link'>다음</a></li>");
				}else{
					$paging.append("<li class='page-item'><a class='page-link' onclick='genreMenu("+ wtGenre +', '+ (currentPage + 1) + ")'>다음</a></li>");
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		/* $(function(){
			$(".genreItem").click(function(){
			    var gen = $(this).children('input').val();
				console.log(gen);
				location.href="genrecategory.wt?genre=" + gen;
			});
		}); */
	
	</script>
	
</body>
</html>






















