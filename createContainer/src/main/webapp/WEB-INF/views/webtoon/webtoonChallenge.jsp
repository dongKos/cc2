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
	background-color: #f1f1f1;
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

#whole td{
	padding-bottom:30px;
	padding-right:5px;
}
</style>
</head>
<body style="margin-top: 3.5%;">
	<%-- <jsp:include page='../common/navbar.jsp'/>
	<jsp:include page='common/webtoonNavbar.jsp'/>
	<jsp:include page='common/webtoonCategoryNavbar.jsp'/> --%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-9 content">
				<jsp:include page="common/webtoonMenubar.jsp" />
				<div class="new">
					<table id="new">
						<h3>오늘의 인기 만화</h3>
						<tbody>
							<tr>
								<td><img src="${contextPath}/resources/images/noimg.png"
								style="width: 100%;"></td>
								<td><img src="${contextPath}/resources/images/noimg.png"
								style="width: 100%;"></td>
								<td><img src="${contextPath}/resources/images/noimg.png"
								style="width: 100%;"></td>
								<td><img src="${contextPath}/resources/images/noimg.png"
								style="width: 100%;"></td>
								<td><img src="${contextPath}/resources/images/noimg.png"
								style="width: 100%;"></td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<hr>
				<div>
					<div style="display: inline-block;"><h3>추천 도전 만화</h3></div>
					<div style="display: inline-block; ">
						<ul id="sideCategory" style="padding-left: 149px;">
						<li><a href="#">조회수</a></li>
						<li><a href="#">인기순</a></li>
						<li><a href="#">별점순</a></li>
						</ul>
					</div>
				</div>
				<hr>
				<table id="whole">
					<tbody>
						<tr>
							<td><img src="${contextPath}/resources/images/noimg.png"
								style="width: 100%;"></td>
							<td><img src="${contextPath}/resources/images/noimg.png"
								style="width: 100%;"></td>
							<td><img src="${contextPath}/resources/images/noimg.png"
								style="width: 100%;"></td>
						</tr>
						<tr>
							<td><img src="${contextPath}/resources/images/noimg.png"
								style="width: 100%;"></td>
							<td><img src="${contextPath}/resources/images/noimg.png"
								style="width: 100%;"></td>
							<td><img src="${contextPath}/resources/images/noimg.png"
								style="width: 100%;"></td>
						</tr>
						<tr>
							<td><img src="${contextPath}/resources/images/noimg.png"
								style="width: 100%;"></td>
							<td><img src="${contextPath}/resources/images/noimg.png"
								style="width: 100%;"></td>
							<td><img src="${contextPath}/resources/images/noimg.png"
								style="width: 100%;"></td>
						</tr>
						<tr>
							<td><img src="${contextPath}/resources/images/noimg.png"
								style="width: 100%;"></td>
							<td><img src="${contextPath}/resources/images/noimg.png"
								style="width: 100%;"></td>
							<td><img src="${contextPath}/resources/images/noimg.png"
								style="width: 100%;"></td>
						</tr>
					</tbody>
				</table>
			</div>

			<%-- <div class="col-sm-3 sidenav">
				<jsp:include page="common/webtoonSideNavbar.jsp" />
			</div> --%>

		</div>
	</div>
	<%-- <jsp:include page='../common/footer.jsp' /> --%>
</body>
</html>