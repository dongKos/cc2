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

#area {
	
	width: 60px;
	height: 80px;
	margin-right: 10px;
	margin-top: 10px;
	margin-bottom: 30px;
}

#todayWebtoon {
	background-color: red;
	width: 80%;
	height: 150px;
	margin: 0 auto;
}

#day {
	display: inline-block;
	margin-right: 20px;
}
.thumbnail{
	width:90%;
	height:100%;
	margin: 0 auto;
	display: inline-block;
}

.title{
	font-size: 4px;
}
.dayT{
	font-size: 20px;
}
.newThumbnail{
	width:100%;
	height:90%;
	margin: 0 auto;
}

.thumbnailArea{
	    width: 155px;
    height: 115px;
}
.weak{
	
}
.weakArea{
	text-align:center;
	padding:5px;
	display:inline-block;
	width: 110px;
    height: 1400px;
}
.weakTable{
    text-align: center;
    width: 100px;
    border-radius: 5px;
	margin-bottom:10px;
}
.imgBox{
    padding: 1px;
}
.thumbnailImg{
    margin-top: 5px;
    height: 93px;
    width: 80px;
}
.weakName{
	width:30px;
}
</style>
</head>
<body style="margin-top: 3.5%;">
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<!-- 서비스 상단 네비바 -->
	<jsp:include page="../main/common/serviceNavbar.jsp" />
	<jsp:include page="common/webtoonMenubar.jsp" />
	<jsp:include page="common/djcNavbar.jsp" />
	<jsp:include page="common/genreNavbar.jsp" />
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10 content">
				<div class="new">
					<table id="newTable">
						<h3>신규웹툰</h3>
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
				<div id="middleTopCategory">
					<div style="display: inline; margin-top: 0px;">
						<h4>요일별 전체 웹툰</h4>
					</div>
					<div style="display: inline; float: left;">
							<select class="selectOption">
								<option>조회순</option>
								<option>인기순</option>
								<option>별점순</option>
							</select>
					</div>
				</div>
				<hr>

				
				<hr>
				<div class="weakArea">
					<h2>월</h2>
					<c:forEach var="dwtr1" items="${ list1 }">
						<table class="weakTable">
							<tr>
								<td>
									<div class="imgBox">
										<img class="thumbnailImg" src="${ contextPath }/resources/uploadFiles/webtoonMain/${ dwtr1.changeName }">
										<input type="hidden" value="${ dwtr1.wid }"/>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<p class="title" align="center">${ dwtr1.wTitle }</p>
								</td>
							</tr>
						</table>
					</c:forEach>
				</div>
				<div class="weakArea">
					<h2>화</h2>
					<c:forEach var="dwtr2" items="${ list2 }">
						<table class="weakTable">
							<tr>
								<td>
									<div class="imgBox">
										<img class="thumbnailImg" src="${ contextPath }/resources/uploadFiles/webtoonMain/${ dwtr2.changeName }">
										<input type="hidden" id="widVal" value="${ dwtr2.wid }"/>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<p class="title" align="center">${ dwtr2.wTitle }</p>
								</td>
							</tr>
						</table>
					</c:forEach>
				</div>
				<div class="weakArea">
					<h2>수</h2>
					<c:forEach var="dwtr3" items="${ list3 }">
						<table class="weakTable">
							<tr>
								<td>
									<div class="imgBox">
										<img class="thumbnailImg" src="${ contextPath }/resources/uploadFiles/webtoonMain/${ dwtr3.changeName }">
										<input type="hidden" id="widVal" value="${ dwtr3.wid }"/>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<p class="title" align="center">${ dwtr3.wTitle }</p>
								</td>
							</tr>
						</table>
					</c:forEach>
				</div>
				<div class="weakArea">
					<h2>목</h2>
					<c:forEach var="dwtr4" items="${ list4 }">
						<table class="weakTable">
							<tr>
								<td>
									<div class="imgBox">
										<img class="thumbnailImg" src="${ contextPath }/resources/uploadFiles/webtoonMain/${ dwtr4.changeName }">
										<input type="hidden" id="widVal" value="${ dwtr4.wid }"/>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<p class="title" align="center">${ dwtr4.wTitle }</p>
								</td>
							</tr>
						</table>
					</c:forEach>
				</div>
				<div class="weakArea">
					<h2>금</h2>
					<c:forEach var="dwtr5" items="${ list5 }">
						<table class="weakTable">
							<tr>
								<td>
									<div class="imgBox">
										<img class="thumbnailImg" src="${ contextPath }/resources/uploadFiles/webtoonMain/${ dwtr5.changeName }">
										<input type="hidden" id="widVal" value="${ dwtr5.wid }"/>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<p class="title" align="center">${ dwtr5.wTitle }</p>
								</td>
							</tr>
						</table>
					</c:forEach>
				</div>
				<div class="weakArea">
					<h2>토</h2>
					<c:forEach var="dwtr6" items="${ list6 }">
						<table class="weakTable">
							<tr>
								<td>
									<div class="imgBox">
										<img class="thumbnailImg" src="${ contextPath }/resources/uploadFiles/webtoonMain/${ dwtr6.changeName }">
										<input type="hidden" id="widVal" value="${ dwtr6.wid }"/>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<p class="title" align="center">${ dwtr6.wTitle }</p>
								</td>
							</tr>
						</table>
					</c:forEach>
				</div>
				<div class="weakArea">
					<h2>일</h2>
					<c:forEach var="dwtr7" items="${ list7 }">
						<table class="weakTable">
							<tr>
								<td>
									<div class="imgBox">
										<img class="thumbnailImg" src="${ contextPath }/resources/uploadFiles/webtoonMain/${ dwtr7.changeName }">
										<input type="hidden" id="widVal" value="${ dwtr7.wid }"/>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<p class="title" align="center">${ dwtr7.wTitle }</p>
								</td>
							</tr>
						</table>
					</c:forEach>
				</div>
			</div>
			<div class="col-sm-1"></div>
			<!-- <div class="col-sm-2 sidenav">
				<h2>베스트도전만화</h2>
				<div id="challengeArea">
					<h3>도전만화 이미지</h3>
				</div>
				<br> <br> <br> <br>
				<div id="event">
					<br>
					<h4 align="center">이벤트</h4>
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
			</div> -->

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
		
		$(".thumbnailImg").click(function(){
			var wid = $(this).siblings().val();
			console.log(wid);
			location.href = "roundList.wt?wid=" + wid;
		});
	});
</script>
</body>
</html>





