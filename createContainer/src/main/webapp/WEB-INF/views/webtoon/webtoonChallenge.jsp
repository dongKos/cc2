<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
.row.content {
	height: 1500px
}

/* Set gray background color and 100% height */
.sidenav {
	
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

table td {
	padding-left: 6px;
}

#sideCategory {
	list-style: none;
	display: inline;
}

#sideCategory li {
	display: inline-block;
	padding-left: 90px;
}

#new div {
	border: 0.5px solid black;
	width: 20%;
	height: 30%
}

#whole td {
	padding-bottom: 30px;
	padding-right: 5px;
}

#challengeArea {
	width: 80%;
	height: 170px;
	margin: 0 auto;
}

#event {
	width: 80%;
	height: 200px;
	margin: 0 auto;
}

#notice {
	width: 80%;
	height: 150px;
	margin: 0 auto;
}

#middleTopCategory div {
	display: inline;
}
#todayWebtoon{
	width: 80%;
	height: 150px;
	margin: 0 auto;
}
.recommendArea {
    width: 100%;
    height: 381px;
    padding: 5px;
}
.recommendTable {
    display: inline-block;
    margin-right: 10px;
    border: 1px solid gray;
    border-radius: 4px;
	margin-bottom: 5px;
}

.recommendImgBox {
    width: 130px;
    height: 130px;
    padding: 5px;
    border: 1px solid gray;
    border-radius: 8px;
}

.recommendImg{
	height:100%;
	width:100%;
	cursor:pointer;
}
.recommendTd{
	padding:5px;
}


.newChallengeArea{
	
	border: 1px solid black;
}
.newThumbnail{
	width:100%;
	height:90%;
	margin: 0 auto;
}

.thumbnailArea{
	    
    height: 115px;
    width: 120px;
}

.challengeArea{
	    width: 90%;
    height: 130px;
	border: 1px solid black;
}


</style>
</head>
<body style="margin-top: 3.5%;">
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
	<!-- 서비스 상단 네비바 -->
	<jsp:include page="../main/common/serviceNavbar.jsp" />
	<jsp:include page="common/webtoonMenubar.jsp" />
	
	
	<jsp:include page="common/genreNavbar.jsp" />
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-8 content">
				<div class="new">
					<table id="newTable">
						<h3>도전 신규</h3>
						<tbody>
							<tr>
								<c:forEach var="nwtr" items="${ newList }">
									<td class="newImgArea">
										<div class="thumbnailArea">
											<img class="newThumbnail" src="${contextPath}/resources/uploadFiles/webtoonMain/${ nwtr.changeName }">
											<p class="title" align="center">${ nwtr.wTitle }</p>
											<input type="hidden" value="${nwtr.wid }" />
										</div>
									</td>
								</c:forEach>
							</tr>
						</tbody>
					</table>
				</div>
				<hr>
				<div class="recommendArea">
					<div id="middleTopCategory">
						<div style="display: inline; margin-top: 0px;">
							<h4>추천 도전 만화</h4>
						</div>
					</div>
					<hr>
					<c:forEach var="wtr" items="${ list }">
						<table class="recommendTable">
							<tr>
								<td class="recommendTd">
									<div class="recommendImgBox">
										<img class="recommendImg" src="${ contextPath }/resources/uploadFiles/webtoonMain/${ wtr.changeName }">
										<input type="hidden" id="widVal" value="${ wtr.wid }"/>
									</div>
								</td>
							</tr>
							<tr>
								<td class="recommendTd">
									<p class="recommendTitle" align="center">${ wtr.wTitle }</p>
								</td>
							</tr>
						</table>
					</c:forEach>
					<div id="pagingArea" align="center">
						<c:if test="${ pi.currentPage <= 1 }">
							<button>이전</button>
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="wtBack" value="/webtoonChallenge.wt">
								<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
							</c:url>
							<button type="button" onclick="location.href='${ wtBack }'">이전</button>
						</c:if>
						
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<font color="red" size="4"><b>[${ p }]</b></font>
							</c:if>
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="wtBack" value="/webtoonChallenge.wt">
									<c:param name="currentPage" value="${ p }"/>
								</c:url>
								<a href="${ wtBack }">${ p }</a>
							</c:if>
						</c:forEach>
						
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							<button>다음</button>
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="wtBack" value="/webtoonChallenge.wt">
								<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
							</c:url>
							<button type="button" onclick="location.href='${ wtBack }'">다음</button>
						</c:if>
					</div>
					
				</div>
				
				<!-- 장르별 리스트 -->
				<div class="genreList">
					<div class="genreArea">
					
					</div>
					<div id="npagingArea" align="center">
						<ul class="pagination" id="nPaging">
						</ul>
					</div>
				</div>
			</div>
			<div class="col-sm-2 sidenav">
				<h2>베스트&nbsp;&nbsp;도전만화</h2>
			<div id="challengeArea1">
				<img class="challengeArea" src="${contextPath}/resources/uploadFiles/webtoonMain/real.JPG"/>
			</div>
				
				<br> <br> <br> <br>
				<div id="todayWebtoon">
					<br>
				</div>
				<br> <br> <br> <br>
				<div id="notice">
					<br>
					<h4 align="center">
					<a href="Faq.mg">공지사항</a></h4>
					<h4 align="center"><a href="#">만화FAQ</a></h4>
				</div>
				<br> <br>
				
			</div>
		<div class="col-sm-1"></div>
		</div>
	</div>
	<script>
	$(function(){
		
		$(".recommendImg").click(function(){
			var wid = $(this).siblings().val();
			console.log(wid);
			location.href = "roundList.wt?wid=" + wid;
		});
		
		$(".newThumbnail").click(function(){
			var wid = $(this).parents().children("input").val();
			console.log(wid);
			location.href = "roundList.wt?wid=" + wid;
		});

		$(".challengeArea").click(function(){
			console.log("클릭");
			location.href="insertWork.wt";
		});

	});
	</script>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<jsp:include page="../webnovel/common/webnovelFooter.jsp" />
</body>
</html>