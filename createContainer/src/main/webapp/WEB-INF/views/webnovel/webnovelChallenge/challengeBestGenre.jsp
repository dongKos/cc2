<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		var gradeType = 1;
		$(document).ready(function(){
			var genre = 'GR_CTG3';
			var currentPage = 1;
			$.ajax({
				url:"selectRecommendGenreList.wn",
				type:"get",
				data:{gradeType:gradeType, genre:genre, currentPage:currentPage},
				success:function(data){
					$(".challengeList").children().remove();
					$(".challengeList").append(
						'<div class="recommendGenreArea">' + 
							'<p class="challengeMenu">장르별 추천작' + 
								'<select class="selectGenre" onchange="selectGenre()">' +
									'<option>장르선택</option>' +
									'<option value="GR_CTG3">판타지</option>' +
									'<option value="GR_CTG8">무협</option>' +
									'<option value="GR_CTG10">로맨스</option>' +
									'<option value="GR_CTG1">현대</option>' +
									'<option value="GR_CTG6">공포</option>' +
								'</select>' +
							'</p>' +
							'<p class="challengeMenuName">' + data.list[0].genreExplain + '</p>' +
							'<div class="rPagingBtn">' +
							'</div><br>'+
							'<input type="hidden" id="hiddenGenre" value="'+ genre +'"/>'+
						'</div>'
					);
					for(var i = 0; i < data.list.length; i++){
						$recommendGenreArea = $(".recommendGenreArea");
						var recommendWn = $('<table class="recommendWn" name="recommendWn">');
						var recommendImgBox = $('<td class="recommendImgBox" rowspan="5"><img class="recommendImg" src="${ contextPath }/resources/uploadFiles/webnovelMain/'+ data.list[i].changeName+'">');
						var recommendTitle = $('<td  class="recommendTitle">').text(data.list[i].wTitle);
						var recommendGenre = $('<td class="recommendGenre">').text('장르 - ' + data.list[i].genreExplain);
						var stpAvg = data.list[i].spAvg;
						var hiddenWid = $('<input type="hidden" id="wnWid" value="'+data.list[i].wid+'"><input type="hidden" id="wnUserId" value="'+data.list[i].userId+'">')
						var recommendSp = $('<td class="recommendSp">');
						var nickname = $('<td class="recommendNickname">').text(data.list[i].nickname + ' 작가');
						var recommendSp0 = $('<p class="starAvg">').append('<br>'+ data.list[i].spAvg + ' 점');
						var recommendSp1 = $('<p class="starAvg">').append('&#11088; <br>'+ data.list[i].spAvg + ' 점');
						var recommendSp2 = $('<p class="starAvg">').append('&#11088; &#11088; <br>'+ data.list[i].spAvg + ' 점');
						var recommendSp3 = $('<p class="starAvg">').append('&#11088; &#11088; &#11088; <br>'+ data.list[i].spAvg + ' 점');
						var recommendSp4 = $('<p class="starAvg">').append('&#11088; &#11088; &#11088; &#11088; <br>'+ data.list[i].spAvg + ' 점');
						var recommendSp5 = $('<p class="starAvg">').append('&#11088; &#11088; &#11088; &#11088; &#11088; <br>'+ data.list[i].spAvg + ' 점');
						
						var list = new Array();
						list[0] = recommendImgBox;
						list[1] = recommendTitle;
						list[2] = nickname;
						list[3] = recommendGenre;
						if(stpAvg >= 4.5){
							list[4] = recommendSp.append(recommendSp5,hiddenWid);
						}else if(stpAvg >= 3.5){
							list[4] =  recommendSp.append(recommendSp4,hiddenWid);
						}else if(stpAvg >= 2.5){
							list[4] =  recommendSp.append(recommendSp3,hiddenWid);
						}else if(stpAvg >= 1.5){
							list[4] =  recommendSp.append(recommendSp2,hiddenWid);
						}else if(stpAvg >= 1){
							list[4] =  recommendSp.append(recommendSp1,hiddenWid);
						}else{
							list[4] = recommendSp.append(recommendSp0,hiddenWid);
						}
						
						for(var j = 0; j < list.length; j++) {
							var tr = $('<tr>');
							tr.append(list[j]);
							recommendWn.append(tr);
						}
						$recommendGenreArea.append(recommendWn);
						recommendWn.append(tr);
						
						$rPagingBtn = $(".rPagingBtn");
						$rPagingBtn.html('');
						var currentPage = data.pi.currentPage;
						var startPage = data.pi.startPage;
						var endPage = data.pi.endPage;
						var maxPage = data.pi.maxPage;
						$bestRank = $(".bestRank");
						$bestRank.text('도전 '+currentPage+'등');
						//이전
						$rPagingBtn.append('<button class="piRbtn" onclick="rPaging('+ (maxPage) + ')"><</button>');
						//다음
						$rPagingBtn.append('<button class="piRbtn" onclick="rPaging('+ (currentPage + 1) + ')">></button>');
						$('.recommendGenreArea').find($(".recommendWn")).on('click',function(){
							var wid = $(this).children().last().children().children('input').val();
							var authorId = $(this).children().last().children().children('input').eq(1).val();
							location.href = "selectWnRoundList.wn?wid="+wid +'&gradeType=1'+'&authorId='+authorId;
						});
					}
				},
				error:function(status){
					alert(status);
				}
			});	
		});
		function selectGenre(){
			var genre = $(".selectGenre option:selected").val()
			var currentPage = 1;
			$.ajax({
				url:"selectRecommendGenreList.wn",
				type:"get",
				data:{gradeType:gradeType, genre:genre, currentPage:currentPage},
				success:function(data){
					$(".challengeList").children().remove();
					$(".challengeList").append(
						'<div class="recommendGenreArea">' + 
							'<p class="challengeMenu">장르별 추천작' + 
								'<select class="selectGenre" onchange="selectGenre()">' +
									'<option>장르선택</option>' +
									'<option value="GR_CTG3">판타지</option>' +
									'<option value="GR_CTG8">무협</option>' +
									'<option value="GR_CTG10">로맨스</option>' +
									'<option value="GR_CTG1">현대</option>' +
									'<option value="GR_CTG6">공포</option>' +
								'</select>' +
							'</p>' +
							'<p class="challengeMenuName">' + data.list[0].genreExplain + '</p>' +
							'<div class="rPagingBtn">' +
							'</div><br>'+
							'<input type="hidden" id="hiddenGenre" value="'+ genre +'"/>'+
						'</div>'
					);
					for(var i = 0; i < data.list.length; i++){
						$recommendGenreArea = $(".recommendGenreArea");
						var recommendWn = $('<table class="recommendWn" name="recommendWn">');
						var recommendImgBox = $('<td class="recommendImgBox" rowspan="5"><img class="recommendImg" src="${ contextPath }/resources/uploadFiles/webnovelMain/'+ data.list[i].changeName+'">');
						var recommendTitle = $('<td  class="recommendTitle">').text(data.list[i].wTitle);
						var recommendGenre = $('<td class="recommendGenre">').text('장르 - ' + data.list[i].genreExplain);
						var stpAvg = data.list[i].spAvg;
						var hiddenWid = $('<input type="hidden" id="wnWid" value="'+data.list[i].wid+'"><input type="hidden" id="wnUserId" value="'+data.list[i].userId+'">')
						var recommendSp = $('<td class="recommendSp">');
						var nickname = $('<td class="recommendNickname">').text(data.list[i].nickname + ' 작가');
						var recommendSp0 = $('<p class="starAvg">').append('<br>'+ data.list[i].spAvg + ' 점');
						var recommendSp1 = $('<p class="starAvg">').append('&#11088; <br>'+ data.list[i].spAvg + ' 점');
						var recommendSp2 = $('<p class="starAvg">').append('&#11088; &#11088; <br>'+ data.list[i].spAvg + ' 점');
						var recommendSp3 = $('<p class="starAvg">').append('&#11088; &#11088; &#11088; <br>'+ data.list[i].spAvg + ' 점');
						var recommendSp4 = $('<p class="starAvg">').append('&#11088; &#11088; &#11088; &#11088; <br>'+ data.list[i].spAvg + ' 점');
						var recommendSp5 = $('<p class="starAvg">').append('&#11088; &#11088; &#11088; &#11088; &#11088; <br>'+ data.list[i].spAvg + ' 점');
						var list = new Array();
						list[0] = recommendImgBox;
						list[1] = recommendTitle;
						list[2] = nickname;
						list[3] = recommendGenre;
						if(stpAvg >= 4.5){
							list[4] = recommendSp.append(recommendSp5,hiddenWid);
						}else if(stpAvg >= 3.5){
							list[4] =  recommendSp.append(recommendSp4,hiddenWid);
						}else if(stpAvg >= 2.5){
							list[4] =  recommendSp.append(recommendSp3,hiddenWid);
						}else if(stpAvg >= 1.5){
							list[4] =  recommendSp.append(recommendSp2,hiddenWid);
						}else if(stpAvg >= 1){
							list[4] =  recommendSp.append(recommendSp1,hiddenWid);
						}else{
							list[4] = recommendSp.append(recommendSp0,hiddenWid);
						}
						for(var j = 0; j < list.length; j++) {
							var tr = $('<tr>');
							tr.append(list[j]);
							recommendWn.append(tr);
						}
						$recommendGenreArea.append(recommendWn);
						recommendWn.append(tr);
						
						$rPagingBtn = $(".rPagingBtn");
						$rPagingBtn.html('');
						var currentPage = data.pi.currentPage;
						var startPage = data.pi.startPage;
						var endPage = data.pi.endPage;
						var maxPage = data.pi.maxPage;
						$bestRank = $(".bestRank");
						$bestRank.text('도전 '+currentPage+'등');
						//이전
						$rPagingBtn.append('<button class="piRbtn" onclick="rPaging('+ (maxPage) + ')"><</button>');
						//다음
						$rPagingBtn.append('<button class="piRbtn" onclick="rPaging('+ (currentPage + 1) + ')">></button>');
						$('.recommendGenreArea').find($(".recommendWn")).on('click',function(){
							var wid = $(this).children().last().children().children('input').val();
							var authorId = $(this).children().last().children().children('input').eq(1).val();
							location.href = "selectWnRoundList.wn?wid="+wid +'&gradeType=1'+'&authorId='+authorId;
						});
					}
				},
				error:function(status){
					alert(status);
				}
			});	
		}
		function rPaging(currentPage){
			var genre = $("#hiddenGenre").val();
			console.log(genre);
			$.ajax({
				url:"selectRecommendGenreList.wn",
				type:"get",
				data:{gradeType:gradeType, genre:genre, currentPage:currentPage},
				success:function(data){
					console.log(data);
					$(".challengeList").children().remove();
					$(".challengeList").append(
						'<div class="recommendGenreArea">' + 
							'<p class="challengeMenu">장르별 추천작' + 
								'<select class="selectGenre" onchange="selectGenre()">' +
									'<option>장르선택</option>' +
									'<option value="GR_CTG3">판타지</option>' +
									'<option value="GR_CTG8">무협</option>' +
									'<option value="GR_CTG10">로맨스</option>' +
									'<option value="GR_CTG1">현대</option>' +
									'<option value="GR_CTG6">공포</option>' +
								'</select>' +
							'</p>' +
							'<p class="challengeMenuName">' + data.list[0].genreExplain + '</p>' +
							'<div class="rPagingBtn">' +
							'</div><br>'+
							'<input type="hidden" id="hiddenGenre" value="'+ genre +'"/>'+
						'</div>'
					);
					for(var i = 0; i < data.list.length; i++){
						$recommendGenreArea = $(".recommendGenreArea");
						var recommendWn = $('<table class="recommendWn" name="recommendWn">');
						var recommendImgBox = $('<td class="recommendImgBox" rowspan="5"><img class="recommendImg" src="${ contextPath }/resources/uploadFiles/webnovelMain/'+ data.list[i].changeName+'">');
						var recommendTitle = $('<td  class="recommendTitle">').text(data.list[i].wTitle);
						var recommendGenre = $('<td class="recommendGenre">').text('장르 - ' + data.list[i].genreExplain);
						var stpAvg = data.list[i].spAvg;
						var hiddenWid = $('<input type="hidden" id="wnWid" value="'+data.list[i].wid+'"><input type="hidden" id="wnUserId" value="'+data.list[i].userId+'">')
						var recommendSp = $('<td class="recommendSp">');
						var nickname = $('<td class="recommendNickname">').text(data.list[i].nickname + ' 작가');
						var recommendSp0 = $('<p class="starAvg">').append('<br>'+ data.list[i].spAvg + ' 점');
						var recommendSp1 = $('<p class="starAvg">').append('&#11088; <br>'+ data.list[i].spAvg + ' 점');
						var recommendSp2 = $('<p class="starAvg">').append('&#11088; &#11088; <br>'+ data.list[i].spAvg + ' 점');
						var recommendSp3 = $('<p class="starAvg">').append('&#11088; &#11088; &#11088; <br>'+ data.list[i].spAvg + ' 점');
						var recommendSp4 = $('<p class="starAvg">').append('&#11088; &#11088; &#11088; &#11088; <br>'+ data.list[i].spAvg + ' 점');
						var recommendSp5 = $('<p class="starAvg">').append('&#11088; &#11088; &#11088; &#11088; &#11088; <br>'+ data.list[i].spAvg + ' 점');
						var list = new Array();
						list[0] = recommendImgBox;
						list[1] = recommendTitle;
						list[2] = nickname;
						list[3] = recommendGenre;
						if(stpAvg >= 4.5){
							list[4] = recommendSp.append(recommendSp5,hiddenWid);
						}else if(stpAvg >= 3.5){
							list[4] =  recommendSp.append(recommendSp4,hiddenWid);
						}else if(stpAvg >= 2.5){
							list[4] =  recommendSp.append(recommendSp3,hiddenWid);
						}else if(stpAvg >= 1.5){
							list[4] =  recommendSp.append(recommendSp2,hiddenWid);
						}else if(stpAvg >= 1){
							list[4] =  recommendSp.append(recommendSp1,hiddenWid);
						}else{
							list[4] = recommendSp.append(recommendSp0,hiddenWid);
						}
						for(var j = 0; j < list.length; j++) {
							var tr = $('<tr>');
							tr.append(list[j]);
							recommendWn.append(tr);
						}
						$recommendGenreArea.append(recommendWn);
						recommendWn.append(tr);
						$rPagingBtn = $(".rPagingBtn");
						$rPagingBtn.html('');
						var currentPage = data.pi.currentPage;
						var startPage = data.pi.startPage;
						var endPage = data.pi.endPage;
						var maxPage = data.pi.maxPage;
						$bestRank = $(".bestRank");
						$bestRank.text('도전 '+currentPage+'등');
						//이전
						if(currentPage <= 1){
							$rPagingBtn.append('<button class="piRbtn" onclick="rPaging('+ (maxPage) + ')"><</button>');
						}else{
							$rPagingBtn.append('<button class="piRbtn" onclick="rPaging('+ (currentPage - 1) + ')"><</button>');
						}
						//다음
						if(currentPage >= maxPage){
							$rPagingBtn.append('<button class="piRbtn" onclick="rPaging('+ (startPage) + ')">></button>');
						}else{
							$rPagingBtn.append('<button class="piRbtn" onclick="rPaging('+ (currentPage + 1) + ')">></button>');
						}
						$('.recommendGenreArea').find($(".recommendWn")).on('click',function(){
							var wid = $(this).children().last().children().children('input').val();
							var authorId = $(this).children().last().children().children('input').eq(1).val();
							location.href = "selectWnRoundList.wn?wid="+wid +'&gradeType=1'+'&authorId='+authorId;
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