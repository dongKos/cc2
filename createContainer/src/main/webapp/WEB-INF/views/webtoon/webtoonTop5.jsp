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
	background-color: red;
	width: 80%;
	height: 170px;
	margin: 0 auto;
}

#event {
	background-color: red;
	width: 80%;
	height: 200px;
	margin: 0 auto;
}

#notice {
	background-color: red;
	width: 80%;
	height: 150px;
	margin: 0 auto;
}

#middleTopCategory div {
	display: inline;
}
#todayWebtoon{
background-color: red;
	width: 80%;
	height: 150px;
	margin: 0 auto;
}
.topImgArea{
	 width: 95px;
}

.thumbnailArea{
	width: 90px;
	height:100px;
}

.newThumbnail{
	width:100%;
	height:90%;
	margin: 0 auto;
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
.newTable{
	width:100%;
}
.recommendTable {
    display: inline-block;
    margin-right: 10px;
    border: 1px solid gray;
    border-radius: 4px;
	margin-bottom: 5px;
}

.totlamgBox {
    width: 130px;
    height: 130px;
    padding: 5px;
    border: 1px solid gray;
    border-radius: 8px;
}

.totalImg{
	height:100%;
	width:100%;
	cursor:pointer;
}
.totalTd{
	padding:5px;
}
#totalArea{
    width: 100%;
    height: 381px;
    padding: 5px;
}
.challengeArea{
	    width: 90%;
    height: 130px;
	border: 1px solid black;
}

</style>
</head>
<body style="margin-top: 3.5%;">
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<!-- 서비스 상단 네비바 -->
	<jsp:include page="../main/common/serviceNavbar.jsp" />
	<jsp:include page="common/webtoonMenubar.jsp" />
	<jsp:include page="common/genrePNavbar.jsp"/>
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-8 content">
				<div class="new">
					<table id="newTable">
						<h3>Top 5</h3>
						<tbody>
							<tr>
								<c:forEach var="nwtr" items="${ topList }">
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
				<div id="middleTopCategory">
					<div style="display: inline; margin-top: 0px; ">
						<h4>전체</h4>
					</div>
				</div>
				<hr>
				<div class="premium">
				<c:forEach var="wtr" items="${ totalList }">
						<table class="recommendTable">
							<tr>
								<td class="totalTd">
									<div class="totlamgBox">
										<img class="totalImg" src="${ contextPath }/resources/uploadFiles/webtoonMain/${ wtr.changeName }">
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
					</div>
					<div id="totlaAtrea">
				<div id="pagingArea" align="center">
						<c:if test="${ pi.currentPage <= 1 }">
							<button>이전</button>
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="wtBack" value="/webtoonTop5.wt">
								<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
							</c:url>
							<button type="button" onclick="location.href='${ wtBack }'">이전</button>
						</c:if>
						
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<font color="red" size="4"><b>[${ p }]</b></font>
							</c:if>
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="wtBack" value="/webtoonTop5.wt">
									<c:param name="currentPage" value="${ p }"/>
								</c:url>
								<a href="${ wtBack }">${ p }</a>
							</c:if>
						</c:forEach>
						
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							<button>다음</button>
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="wtBack" value="/webtoonTop5.wt">
								<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
							</c:url>
							<button type="button" onclick="location.href='${ wtBack }'">다음</button>
						</c:if>
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
					<h4 align="center">오늘 업데이트 된 웹툰</h4>
				</div>
				<br> <br> <br> <br>
				<div id="notice">
					<br>
					<h4 align="center">공지사항</h4>
					<ul>
						<li><a herf="#">공지사항1</a></li>
						<li><a herf="#">공지사항1</a></li>
						<li><a herf="#">공지사항1</a></li>
						<li><a herf="#">공지사항1</a></li>
					</ul>
				</div>
				<br> <br>
				<h4>
					<a href="#">만화FAQ</a>
				</h4>
			</div>

		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<script>
		$(function(){
			
			$(".newThumbnail").click(function(){
				var wid = $(this).parents().children("input").val();
				console.log(wid);
				location.href = "roundList.wt?wid=" + wid;
			});
				
			
			$(".totalImg").click(function(){
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
	<jsp:include page="../webnovel/common/webnovelFooter.jsp" />
</body>
</html>



















