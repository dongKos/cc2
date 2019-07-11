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
	/* background-color: #f1f1f1; */
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

#whole{
	display: inline-block;
	width:31%;
    height: 160px;
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
	
	width: 150px;
	height: 120px;
	margin-top: 10px;
	margin-bottom:10px;
	
}
#todayWebtoon{
background-color: red;
	width: 80%;
	height: 150px;
	margin: 0 auto;
}
.thumbnail{
	width:90%;
	height:100%;
	margin: 0 auto;
}
.selectOption{
	margin-left:25%;
	margin-top:15%;
}
.webtoonArea{
	width:100%;
	height: 100%;
}
.whole{
	width:100%;
	table-layout:fixed;
}
.thumbnailComp{
	
	    width: 133px;
    height: 118px;
    padding-left: 21px;
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
	<jsp:include page="common/djcNavbar.jsp" />
	
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-8 content">
				<div id="middleTopCategory" >
					<div style="display: inline; margin-top: 0px; float:left;">
						<h4>완결웹툰</h4>
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
				<div class="webtoonArea">
					<c:forEach var="wtr" items="${list }">
						<table id="whole">
							<tbody>
								<tr>
									<td>
										<div id="area">
											<img class="thumbnailComp" src="${ contextPath }/resources/uploadFiles/webtoonMain/${ wtr.changeName }">
											<input type="hidden" value="${wtr.wid }" />
										</div>
										<p align="center">${wtr.wTitle}</p>
									</td>
								</tr>
							</tbody>
						</table>
					</c:forEach>
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
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<script>
		$(function(){
			
			$(".thumbnailComp").click(function(){
				var wid = $(this).siblings().val();
				console.log(wid);
				location.href="roundList.wt?wid=" + wid;
			});
			
			$(".challengeArea").click(function(){
				console.log("클릭");
				location.href="insertWork.wt";
			});

			
		});
	</script>
</body>
</html>









