<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wnBestArea">
		<div class="bestPi">
			<div class="leftBtn"></div>
			<p class="bestMainTitle">도전 TOP 5</p>
			<div class="rightBtn"></div>
			<p class="bestRank"></p>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			
			var currentPage = 1;
			var gradeType = 1;
			$.ajax({
				url:"selectMainBestWnList.wn",
				type:"get",
				data:{gradeType:gradeType, currentPage:currentPage},
				success:function(data){
					
					for(var i = 0; i < data.list.length; i++){
						$(".bestWn").remove();
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
					$bestRank = $(".bestRank");
					$bestRank.text('도전 '+currentPage+'등');
					//이전
					$leftBtn.append('<button class="piBtn" onclick="bestPagin('+ (maxPage) + ')"><</button>');
					//다음
					$rightBtn.append('<button class="piBtn" onclick="bestPagin('+ (currentPage + 1) + ')">></button>');
					
					
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
		
		function bestPagin(currentPage){
			var gradeType = 1;
			$.ajax({
				url:"selectMainBestWnList.wn",
				type:"get",
				data:{gradeType:gradeType, currentPage:currentPage},
				success:function(data){
					for(var i = 0; i < data.list.length; i++){
						$(".bestWn").remove();
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
					$bestRank = $(".bestRank");
					$bestRank.text('도전 '+currentPage+'등');
					//이전
					if(currentPage <= 1){
						$leftBtn.append('<button class="piBtn" onclick="bestPagin('+ (maxPage) + ')"><</button>');
					}else{
						$leftBtn.append('<button class="piBtn" onclick="bestPagin('+ (currentPage - 1 ) + ')"><</button>');
					}
					
					//다음
					if(currentPage >= maxPage){
						$rightBtn.append('<button class="piBtn" onclick="bestPagin('+ (startPage) + ')">></button>');
					}else{
						$rightBtn.append('<button class="piBtn" onclick="bestPagin('+ (currentPage + 1) + ')">></button>');
					}
					
					
					$('.wnBestArea').find($(".bestWn")).on('click',function(){
						var wid = $(this).children().last().children().children('input').val();
						location.href = "selectWnRoundList.wn?wid=" + wid;
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