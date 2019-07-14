<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
.wtList {
	text-align: center;
}

.insertWtBtn:hover {
	background-color: #84CEFA;
	color: white;
}

.wtMenu {
	width: 100%;
	border-bottom: 1px solid lightgray;
	margin-bottom: 30px;
}

.wtWork {
	height: 40px;
}

.wtWork tr>td {
	width: 140px;
	color: gray;
	font-weight: bold;
}

.wtWork tr>td:hover {
	color: skyblue;
	cursor: pointer;
}

.wtListDiv {
	width: 100%;
	margin-bottom: 50px;
}

.titleImg {
	position: relative;
	padding: 0px 0px 0px 0px;
	cursor: pointer;
}

.titleImg img {
	width: 150px;
	height: 120px;
}

.contentTd {
	width: 50%;
}

.introImg {
	width: 34%;
	height: 125px;
}

.workImg {
	width: 10%;
	border-right: 1px solid lightgray;
}

.titleArea {
	width: 100%;
	cursor: pointer;
	margin-bottom: 0px;
}

.testImg {
	width: 100%;
	height: 100%;
}

.mainThumbnail {
	width: 200%;
	margin-left: 85%;
	margin-top: -13%;
	height: 100%;
}

.wnrBtn {
	width: 160px;
	height: 30px;
	border-radius: 8px 8px 8px 8px;
	background-color: skyblue;
	color: white;
	border: 1px solid skyblue;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	margin-left: 10px;
}

.wnrBtn:hover {
	background-color: #84CEFA;
	color: white;
}

.starPoitn {
	text-align: left;
}

.content {
	width: 90%;
}

.optionBtn {
	width: 530px;
}

.anthorWork {
	width: 160px;
	height: 30px;
	border-radius: 8px 8px 8px 8px;
	background-color: skyblue;
	color: white;
	border: 1px solid skyblue;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	margin-left: 10px;
}

.replyArea {
	margin: 0 auto;
	width: 80%;
}

.replyInsertArea {
	background-color: white;
	padding: 10px 10px 10px 10px;
	width: 100%;
	height: 140px;
	border: 1px solid skyblue;
	border-radius: 10px;
}

.replyBtnArea {
	width: 100%;
}

.replyText {
	width: 100%;
	height: 100px;
	border: none;
	resize: none;
}

.cntArea {
	float: right;
}

.replyBtn {
	float: right;
	width: 100px;
	line-height: 30px;
	border-radius: 8px 8px 8px 8px;
	background-color: skyblue;
	color: white;
	border: 1px solid skyblue;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	margin-left: 10px;
}

.replyListArea {
	background-color: white;
	padding: 20px 20px 20px 20px;
	width: 100%;
	border: 1px solid skyblue;
	border-radius: 10px;
}

.cntArea {
	font-size: 15px;
}

.replyList {
	background-color: white;
	width: 100%;
	margin-bottom: 20px;
	padding-left: 10px;
}

.replycontents {
	width: 80%;
	padding-left: 10px;
	padding-top: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid gray;
	color: gray;
}

.replyListTr {
	
}

.replyNickname {
	font-size: 14px;
	height: 30px;
	padding-left: 10px;
	font-weight: bold;
}

.replyReportBtn {
	float: right;
	width: 120px;
	line-height: 25px;
	border-radius: 8px 8px 8px 8px;
	background-color: white;
	color: skyblue;
	border: 1px solid skyblue;
	font-size: 13px;
	font-weight: bold;
	cursor: pointer;
	margin-left: 10px;
}

.replyArea {
	background-color: #FAFAFA;
	height: 100%;
	width: 80%;
	padding: 30px;
}
.RoundArea{
	width: 100%;
    padding-left: 135px;
}

.roundImg{
	width: 140px;
    height: 150px;
}
.roundTable{
	display:inline-block;
}
.roundTd{
   padding-right: 30px;
}

#replyContent{
	
}

#replyNickName{

}
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<jsp:include page="../main/common/serviceNavbar.jsp" />
	<jsp:include page="common/webtoonMenubar.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10 wtList">
				<div class="wtMenu">
				
				</div>
			<div class="introArea">
					<table class="introTable">
						<tr>
							<td rowspan="3"width="210">
								<div class="introImg">
									<img class="mainThumbnail" src="${ contextPath }/resources/uploadFiles/webtoonMain/${ wt.changeName }">
								</div>
							
							</td>
							<td width="220" height="50%">
								<p class="wnrTitle">${ wt.wTitle }</p>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<p class="wtrIntro">${ wt.wIntro }</p>
							</td>
						</tr>
						<tr>
							<td class="attention" colspan="2">
							<div class="optionBtn">
								<button class="wnrBtn" type="button" onclick="location.href='attention.wt?wid=' + ${wt.wid}">관심웹툰</button>
								<button class="wnrBtn" type="button">첫화보기</button>
								<button class="anthorWork" type="button" onclick="location.href='anthorWork.wt?wid=' + ${wt.wid}">
								작가의 다른 작품 보기</button>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<hr>
				<div class="starPoitn">
					<form action="insertStarPoint.wt" method="post">
									<select class="starPoint" name="starPoint">
										<option value="5">
											5점 : &#11088; &#11088; &#11088; &#11088; &#11088;
										</option>
										<option value="4">
											4점 : &#11088; &#11088; &#11088; &#11088;
										</option>
										<option value="3">
											3점 : &#11088; &#11088; &#11088;
										</option>
										<option value="2">
											2점 : &#11088; &#11088;
										</option>
										<option value="1">
											1점 : &#11088;
										</option>
									</select>
									<input type="hidden" name="rid" value="${ wr.rid }">
									<input type="hidden" name="gradeType" value="${wt.gradeType }">
									<input type="hidden" name="currentPage" value="${ pi.currentPage }">
									<input type="hidden" name="wid" value="${ wt.wid }">
									
										<c:if test="${ empty sessionScope.loginUser }">
											<button class="insertStarP"  type="button" onclick="login()">별점주기</button>
										</c:if>
										
										<c:if test="${ !empty sessionScope.loginUser }">
											<button type="submit" class="insertStarP1" >별점주기</button>
										</c:if>
								</form>
				</div>
				<hr>
				<div class="contentArea">
					<img class="content" src="${ contextPath }/resources/uploadFiles/webtoonContent/${ wr.changeName }">
				</div>
				
				<hr>
				<br> <br>
			<br><br>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
	
	
	
	<div class="RoundArea">
		<c:forEach var="wr" items="${ list }">
		<table class="roundTable">
			<tbody>
				<tr>
					<td class="roundTd">
						<img class="roundImg" src="${ contextPath }/resources/uploadFiles/webtoonSub/${ wr.changeName }">
						<p align="center">${wr.rTitle }</p>
						<input type="hidden" class="rid" value="${ wr.rid }"/>
						<input type="hidden" class="wid" value="${wt.wid }"/>
					</td>
				</tr>
			</tbody>		
		</table>
		</c:forEach>
	</div>
	
	<div id="pagingArea" align="center">
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="wnrListBack" value="/contentView.wt?wid='${ wt.wid }'&rid=${ wr.rid }">
							<c:param name="wid" value="${ wt.wid }"/>
							<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ wnrListBack }">[이전]</a> &nbsp;
					</c:if>
					
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="4"><b>[${ p }]</b></font>
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="wnrListCheck" value="/contentView.wt?wid='${ wt.wid }'&rid=${ wr.rid }">
								<c:param name="wid" value="${ wt.wid }"/>
								<c:param name="currentPage" value="${ p }"/>
							</c:url>
							<a href="${ wnrListCheck }">${ p }</a>
						</c:if>
					</c:forEach>
					
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						&nbsp; [다음]
					</c:if>
					
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="wnrListEnd" value="/contentView.wt?wid='${ wt.wid }'&rid=${ wr.rid }">
							<c:param name="wid" value="${ wt.wid }"/>
							<c:param name="rid" value="${ wr.rid }"/>
							<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
						</c:url>						
						<a href="${ wnrListEnd }">&nbsp;[다음]</a>
					</c:if>
				</div>
	
	
	
	
	<div class="replyArea">
		<br>
		<p>댓글</p>
		<div class="replyInsertArea">
		<input class="ridArea" type="hidden" value="${wr.rid }"/>
		<input class="widArea" type="hidden" value="${ wt.wid }"/>
			<textarea class="replyText" name="replyText" cols="25" rows="20"
				placeholder="댓글을 입력하세요."></textarea>
			<p class="cntArea">
				<span class="cntText">0 </span>/ 500
			</p>
		</div>
		<div class="replyBtnArea">
			<br>
			<c:if test="${ empty sessionScope.loginUser }">
				<button type="button" class="replyBtn" onclick="login()">등록</button>
			</c:if>
			<c:if test="${ !empty sessionScope.loginUser }">
				<button type="button" class="replyBtn" onclick="insertReply()" >등록</button>
			</c:if>
		</div>
		<br>
		
		<br>
		<div class="replyListArea">
			<c:forEach var="replyList" items="${ rList }" varStatus="status">
				<h4 id="replyContent">${ replyList.replyContent } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${ replyList.nickname }</h4>
			</c:forEach>
				
		</div>
		
				<div id="pagingArea" align="center">
					<c:if test="${ rPi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ rPi.currentPage > 1 }">
						<c:url var="wnrListBack" value="/roundList.wt?">
							<c:param name="wid" value="${ wt.wid }"/>
							<c:param name="currentPage" value="${ rPi.currentPage - 1 }"/>
						</c:url>
						<a href="${ wnrListBack }">[이전]</a> &nbsp;
					</c:if>
					
					<c:forEach var="p" begin="${ rPi.startPage }" end="${ rPi.endPage }">
						<c:if test="${ p eq rPi.currentPage }">
							<font color="red" size="4"><b>[${ p }]</b></font>
						</c:if>
						<c:if test="${ p ne rPi.currentPage }">
							<c:url var="wnrListCheck" value="/roundList.wt">
								<c:param name="wid" value="${ wt.wid }"/>
								<c:param name="currentPage" value="${ p }"/>
							</c:url>
							<a href="${ wnrListCheck }">${ p }</a>
						</c:if>
					</c:forEach>
					
					<c:if test="${ rPi.currentPage >= rPi.maxPage }">
						&nbsp; [다음]
					</c:if>
					
					<c:if test="${ rPi.currentPage < rPi.maxPage }">
						<c:url var="wnrListEnd" value="/roundList.wt">
							<c:param name="wid" value="${ wt.wid }"/>
							<c:param name="currentPage" value="${ rPi.currentPage + 1 }"/>
						</c:url>						
						<a href="${ wnrListEnd }">&nbsp;[다음]</a>
					</c:if>
				</div>
				
		<div id="npagingArea" align="center">
			<ul class="pagination" id="nPaging">

			</ul>
		</div>
	</div>
	
	
	
	
	
	

	<script>
	
	function login(){
		alert("로그인이필요합니다")
		location.href = "loginForm.me";	
	};
	
	$(function(){
		
		$(".insertStarP1").click(function(){
			alert("별점등록완료 !!")
		});
		
		$(".roundImg").click(function(){
			var wid = $(this).parents().children(".wid").val();
			var rid = $(this).parents().children(".rid").val();
			
			location.href = "contentView.wt?rid=" + rid + "&wid=" + wid;
		});
		
		
		
	});
	
	
	
	
	
	
	
	$(document).ready(function(){
		console.log(rid);
		var currentPage = 1;
		$.ajax({
			url:"selectWebtoonReply.wt",
			type:"get",
			data:{rid:rid, currentPage:currentPage},
			success:function(data){
				
				for(var i = 0; i < data.list.length; i++){
					var replyListArea = $(".replyListArea");
					var replyList =$('<table class="replyList">');
					var replyNickname = $('<td class="replyNickname">' + data.list[i].nickname +'<button class="replyReportBtn" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal0'+i+'" name="replyReportBtn">신고하기</button>');
					var replyNicknameOk = $('<td class="replyNickname">' + data.list[i].nickname +'<button class="replyReportBtn" type="button" name="replyReportBtn">신고완료</button>');
					var replyNicknameNo = $('<td class="replyNickname">' + data.list[i].nickname + '<button class="replyReportBtn" type="button" onclick="deleteReply('+data.list[i].replyId+')">삭제하기</button>');
					var replycontents = $('<td class="replycontents">').text(data.list[i].replyContent);
					var hiddenReplayId = $('<input type="hidden" id="replyId" value="'+data.list[i].replyId+'">')
					var userIdCk = data.list[0].userId;
					var replyId = data.list[i].replyId;
					var commentId = data.list[i].commentId
					var userId = '${wt.userId}';
					var list = new Array();
					
					if(userId == userIdCk){
						list[0] = replyNicknameNo;
					}else if(replyId == userIdCk){
						list[0] = replyNicknameOk;
					}else if(commentId == 0){
						list[0] = replyNickname;
					}
					list[1] = replycontents;
					list[2] = hiddenReplayId;
					
					for(var j = 0; j < list.length; j++) {
						
						var tr = $('<tr>');
						tr.append(list[j]);
						replyList.append(tr);
					}
					replyListArea.append(replyList);
					replyList.append(tr);
				
					$(this)
				
					$paging = $("#nPaging");
					$paging.html('');
					
					
				
					$('.replyListArea').find($(".insertReplyReport"+i+"")).on('click',function(){
						var reportType = 'REPLY';
						var reportCategory = $(this).parent().parent().find($('.reportSelect option:selected')).val();
						var status = 'WAIT';
						var reportReason = $(this).parent().parent().find($(".reportText")).val();
						var replyId = $(this).parent().find($(".replyId")).val();
						
					});
				}
				
				
				var currentPage = data.pi.currentPage;
				var startPage = data.pi.startPage;
				var endPage = data.pi.endPage;
				var maxPage = data.pi.maxPage;
			         
				//이전
				if(currentPage <= 1){
					$paging.append("<li class='page-item'><a class='page-link'>이전</a></li>");
				}else{
					$paging.append("<li class='page-item'><a class='page-link' onclick='rPaging("+ (currentPage -1) + ")'>이전</a></li>");
				}
				
				//숫자
				for(var i = startPage; i <= endPage; i++){
					if(i == currentPage){
						$paging.append("<li class='page-item'><a class='page-link'>" + i + "</a></li>");
					}else{
						$paging.append("<li class='page-item'><a class='page-link' onclick='rPaging("+ i + ")'>" + i + "</a></li>");
					}
				}
				
				//다음
				if(currentPage >= maxPage){
					$paging.append("<li class='page-item'><a class='page-link'>다음</a></li>");
				}else{
					$paging.append("<li class='page-item'><a class='page-link' onclick='rPaging("+ (currentPage + 1) + ")'>다음</a></li>");
				}
			},
			error:function(status){
				alert(status);
			}
		});
		$('.replyText').keyup(function(){
			var inputLength=$(this).val().length;
			var remain=0+inputLength;
			
			$('.cntText').html(remain);
			if(remain > 500){
				console.log("500자 이상!");
			 $('.cntText').css('color','red');
			}
		});
		
	});
	
	
	
	
	

	
	function insertReply(){
		var wid = $(".widArea").val();
		var rid = $(".ridArea").val();
		var replyContent = $(".replyText").val();
		console.log(rid);
		console.log(replyContent);
		$.ajax({
			url:"insertWebtoonReply.wt",
			type:"post",
			data:{rid:rid, wid:wid, replyContent:replyContent},
			success:function(data){
				location.reload();
			},
			error:function(status){
				alert(status);
			}
		});
	};
	
	
	function rPaging(currentPage){
		$.ajax({
			url:"selectWebtoonReply.wt",
			type:"post",
			data:{rid:rid, currentPage:currentPage},
			success:function(data){
				console.log(data.pi);
				$(".replyListArea").children().remove();
				for(var i = 0; i < data.list.length; i++){
					var replyListArea = $(".replyListArea");
					var replyList =$('<table class="replyList">');
					var replyNickname = $('<td class="replyNickname">닉네임 - ' + data.list[i].nickname +'<button class="replyReportBtn">신고하기</button>');
					var replycontents = $('<td class="replycontents">').text(data.list[i].replyContent);
					var replyReport = $('<td class="replyReport"><button class="replyReportBtn">신고하기</button>');
					var hiddenReplayId = $('<input type="hidden" id="wnWid" value="'+data.list[i].replayId+'">')
					
					var list = new Array();
					
					list[0] = replyNickname;
					list[1] = replycontents;
					list[2] = hiddenRePlayId;
					
					for(var j = 0; j < list.length; j++) {
						
						var tr = $('<tr>');
						tr.append(list[j]);
						replyList.append(tr);
					}
					replyListArea.append(replyList);
					replyList.append(tr);
				}
				
				
				$paging = $("#nPaging");
				$paging.html('');
				var currentPage = data.pi.currentPage;
				var startPage = data.pi.startPage;
				var endPage = data.pi.endPage;
				var maxPage = data.pi.maxPage;
			         
				//이전
				if(currentPage <= 1){
					$paging.append("<li class='page-item'><a class='page-link'>이전</a></li>");
				}else{
					$paging.append("<li class='page-item'><a class='page-link' onclick='rPaging("+ (currentPage -1) + ")'>이전</a></li>");
				}
				
				//숫자
				for(var i = startPage; i <= endPage; i++){
					if(i == currentPage){
						$paging.append("<li class='page-item'><a class='page-link'>" + i + "</a></li>");
					}else{
						$paging.append("<li class='page-item'><a class='page-link' onclick='rPaging("+ i + ")'>" + i + "</a></li>");
					}
				}
				
				//다음
				if(currentPage >= maxPage){
					$paging.append("<li class='page-item'><a class='page-link'>다음</a></li>");
				}else{
					$paging.append("<li class='page-item'><a class='page-link' onclick='rPaging("+ (currentPage + 1) + ")'>다음</a></li>");
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

































