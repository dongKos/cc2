<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class=" newchallengeList">
		<div class="col-sm-10 "><p class="challengeMenu">신규 프리미엄 작품</p></div>
		<div class="col-sm-2 "><div id="newPagingArea"></div>
		
		</div>
	</div>
	
	<script>
		Date.prototype.format = function(f) {
		    if (!this.valueOf()) return " ";
		 
		    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
		    var d = this;
		     
		    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
		        switch ($1) {
		            case "yyyy": return d.getFullYear();
		            case "yy": return (d.getFullYear() % 1000).zf(2);
		            case "MM": return (d.getMonth() + 1).zf(2);
		            case "dd": return d.getDate().zf(2);
		            case "E": return weekName[d.getDay()];
		            case "HH": return d.getHours().zf(2);
		            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
		            case "mm": return d.getMinutes().zf(2);
		            case "ss": return d.getSeconds().zf(2);
		            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
		            default: return $1;
		        }
		    });
		};
			 
		String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
		String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
		Number.prototype.zf = function(len){return this.toString().zf(len);};

		$(document).ready(function(){
			var currentPage = 1;
			var gradeType = 2;
			$.ajax({
				url:"selectNewRecommendList.wn",
				type:"get",
				data:{gradeType:gradeType, currentPage:currentPage},
				success:function(data){	
					var wuploadDate = new Date(data.list[0].wuploadDate).format("yyyy-MM-dd");
					$(".newchallengeList").children().remove();
					$(".newchallengeList").append(
							'<div class="col-sm-10 "><p class="challengeMenu">신규 프리미엄 작품</p></div>'+
							'<div class="col-sm-2 "><div id="newPagingArea"></div>'
					);
					for(var i = 0; i < data.list.length; i++){
						$newchallengeList = $(".newchallengeList");
						var nwnTable =$('<table class="nwnTable" name="nwnTable">');
						var newRecommendImgBox = $('<td class="newRecommendImgBox"><img class="newRecommendImg" src="${ contextPath }/resources/uploadFiles/webnovelMain/'+ data.list[i].changeName+'">');
						var newRecommendTitle = $('<td  class="newRecommendTitle">').text(data.list[i].wTitle);
						var newRecommendGenre = $('<td class="recommendGenre">').text('장르 - ' + data.list[i].genreExplain);
						var stpAvg = data.list[i].spAvg;
						var newRecommendSp = $('<td class="recommendSp">');
						var nickname = $('<td class="newNecommendNickname">').text(data.list[i].nickname + ' 작가');
						var newRecommendSp0 = $('<p class="newstarAvg">').append(data.list[i].spAvg + ' 점');
						var newRecommendSp1 = $('<p class="newstarAvg">').append('&#11088; '+ data.list[i].spAvg + ' 점');
						var newRrecommendSp2 = $('<p class="newstarAvg">').append('&#11088; &#11088; '+ data.list[i].spAvg + ' 점');
						var newRecommendSp3 = $('<p class="newstarAvg">').append('&#11088; &#11088; &#11088; '+ data.list[i].spAvg + ' 점');
						var newRecommendSp4 = $('<p class="newstarAvg">').append('&#11088; &#11088; &#11088; &#11088; '+ data.list[i].spAvg + ' 점');
						var newRecommendSp5 = $('<p class="newstarAvg">').append('&#11088; &#11088; &#11088; &#11088; &#11088; '+ data.list[i].spAvg + ' 점');
						var hiddenWid = $('<input type="hidden" id="wnWid" value="'+data.list[i].wid+'"><input type="hidden" id="wnUserId" value="'+data.list[i].userId+'">')
						
						var list = new Array();
						list[0] = newRecommendImgBox;
						list[1] = newRecommendTitle;
						list[2] = nickname;
						list[3] = newRecommendGenre;
						if(stpAvg >= 4.5){
							list[4] = newRecommendSp.append(newRecommendSp5, hiddenWid);
						}else if(stpAvg >= 3.5){
							list[4] =  newRecommendSp.append(newRecommendSp4, hiddenWid);
						}else if(stpAvg >= 2.5){
							list[4] =  newRecommendSp.append(newRecommendSp3, hiddenWid);
						}else if(stpAvg >= 1.5){
							list[4] =  newRecommendSp.append(newRecommendSp2, hiddenWid);
						}else if(stpAvg >= 1){
							list[4] =  newRecommendSp.append(newRecommendSp1, hiddenWid);
						}else{
							list[4] = newRecommendSp.append(newRecommendSp0, hiddenWid);
						}
						
						for(var j = 0; j < list.length; j++) {
							var tr = $('<tr>');
							tr.append(list[j]);
							nwnTable.append(tr);
						}
						$newchallengeList.append(nwnTable);
						nwnTable.append(tr);
						
						
					}
					$newPagingArea = $("#newPagingArea");
					$newPagingArea.html('');
					var currentPage = data.pi.currentPage;
					var startPage = data.pi.startPage;
					var endPage = data.pi.endPage;
					var maxPage = data.pi.maxPage;
					//이전
					$newPagingArea.append('<button class="piRbtn" onclick="selectNew('+ (maxPage) + ')"><</button>');
					//다음
					$newPagingArea.append('<button class="piRbtn" onclick="selectNew('+ (currentPage + 1) + ')">></button>');
					
					
					
					
					$('.newchallengeList').find($(".nwnTable")).on('click',function(){
						var wid = $(this).children().last().children().children('input').val();
						var authorId = $(this).children().last().children().children('input').eq(1).val();
						location.href = "selectWnRoundList.wn?wid="+wid +'&gradeType=2'+'&authorId='+authorId;
					});
					
					
					
					
					
					
				},
				error:function(status){
					alert(status);
				}
			});	
		});
		
		function selectNew(currentPage){
			var gradeType = 2;
			$.ajax({
				url:"selectNewRecommendList.wn",
				type:"get",
				data:{gradeType:gradeType, currentPage:currentPage},
				success:function(data){	
					var wuploadDate = new Date(data.list[0].wuploadDate).format("yyyy-MM-dd");
					$(".newchallengeList").children().remove();
					$(".newchallengeList").append(
							'<div class="col-sm-10 "><p class="challengeMenu">신규 프리미엄 작품</p></div>'+
							'<div class="col-sm-2 "><div id="newPagingArea"></div>'
					);
					for(var i = 0; i < data.list.length; i++){
						$newchallengeList = $(".newchallengeList");
						var nwnTable =$('<table class="nwnTable" name="nwnTable">');
						var newRecommendImgBox = $('<td class="newRecommendImgBox"><img class="newRecommendImg" src="${ contextPath }/resources/uploadFiles/webnovelMain/'+ data.list[i].changeName+'">');
						var newRecommendTitle = $('<td  class="newRecommendTitle">').text(data.list[i].wTitle);
						var newRecommendGenre = $('<td class="recommendGenre">').text('장르 - ' + data.list[i].genreExplain);
						var stpAvg = data.list[i].spAvg;
						var newRecommendSp = $('<td class="recommendSp">');
						var nickname = $('<td class="newNecommendNickname">').text(data.list[i].nickname + ' 작가');
						var newRecommendSp0 = $('<p class="newstarAvg">').append(data.list[i].spAvg + ' 점');
						var newRecommendSp1 = $('<p class="newstarAvg">').append('&#11088; '+ data.list[i].spAvg + ' 점');
						var newRrecommendSp2 = $('<p class="newstarAvg">').append('&#11088; &#11088; '+ data.list[i].spAvg + ' 점');
						var newRecommendSp3 = $('<p class="newstarAvg">').append('&#11088; &#11088; &#11088; '+ data.list[i].spAvg + ' 점');
						var newRecommendSp4 = $('<p class="newstarAvg">').append('&#11088; &#11088; &#11088; &#11088; '+ data.list[i].spAvg + ' 점');
						var newRecommendSp5 = $('<p class="newstarAvg">').append('&#11088; &#11088; &#11088; &#11088; &#11088; '+ data.list[i].spAvg + ' 점');
						var hiddenWid = $('<input type="hidden" id="wnWid" value="'+data.list[i].wid+'"><input type="hidden" id="wnUserId" value="'+data.list[i].userId+'">')
						
						var list = new Array();
						list[0] = newRecommendImgBox;
						list[1] = newRecommendTitle;
						list[2] = nickname;
						list[3] = newRecommendGenre;
						if(stpAvg >= 4.5){
							list[4] = newRecommendSp.append(newRecommendSp5, hiddenWid);
						}else if(stpAvg >= 3.5){
							list[4] =  newRecommendSp.append(newRecommendSp4, hiddenWid);
						}else if(stpAvg >= 2.5){
							list[4] =  newRecommendSp.append(newRecommendSp3, hiddenWid);
						}else if(stpAvg >= 1.5){
							list[4] =  newRecommendSp.append(newRecommendSp2, hiddenWid);
						}else if(stpAvg >= 1){
							list[4] =  newRecommendSp.append(newRecommendSp1, hiddenWid);
						}else{
							list[4] = newRecommendSp.append(newRecommendSp0, hiddenWid);
						}
						
						for(var j = 0; j < list.length; j++) {
							var tr = $('<tr>');
							tr.append(list[j]);
							nwnTable.append(tr);
						}
						$newchallengeList.append(nwnTable);
						nwnTable.append(tr);
						
						
						$newPagingArea = $("#newPagingArea");
						$newPagingArea.html('');
						var currentPage = data.pi.currentPage;
						var startPage = data.pi.startPage;
						var endPage = data.pi.endPage;
						var maxPage = data.pi.maxPage;
						
						//이전
						if(currentPage <= 1){
							$newPagingArea.append('<button class="piRbtn" onclick="selectNew('+ (maxPage) + ')"><</button>');
						}else{
							$newPagingArea.append('<button class="piRbtn" onclick="selectNew('+ (currentPage - 1) + ')"><</button>');
						}
						//다음
						if(currentPage >= maxPage){
							$newPagingArea.append('<button class="piRbtn" onclick="selectNew('+ (startPage) + ')">></button>');
						}else{
							$newPagingArea.append('<button class="piRbtn" onclick="selectNew('+ (currentPage + 1) + ')">></button>');
						}
						
						
						
						$('.newchallengeList').find($(".nwnTable")).on('click',function(){
							var wid = $(this).children().last().children().children('input').val();
							var authorId = $(this).children().last().children().children('input').eq(1).val();
							location.href = "selectWnRoundList.wn?wid="+wid +'&gradeType=2'+'&authorId='+authorId;
						});
					}
					
					
					
					
					
					
				},
				error:function(status){
					alert(status);
				}
			});	
			
		}
	</script>
</body>
</html>