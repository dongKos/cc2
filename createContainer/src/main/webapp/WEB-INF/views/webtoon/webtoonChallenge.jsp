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
	padding: 5px;
}
</style>
</head>
<body style="margin-top: 3.5%;">
	<%-- <jsp:include page='../common/navbar.jsp'/>
	<jsp:include page='common/webtoonNavbar.jsp'/>
	<jsp:include page='common/webtoonCategoryNavbar.jsp'/> --%>
	<jsp:include page="common/webtoonMenubar.jsp" />
	<div class="container-fluid">
		<div class="row">

			<div class="col-sm-9 content">
				<div class="new">
					<h3>오늘의 인기 만화</h3>
					<table id="new">
						<tbody>
							<tr>
								<td><img src="${contextPath}/resources/images/3.png"
									style="width: 100%;"></td>
								<td><img src="${contextPath}/resources/images/3.png"
									style="width: 100%;"></td>
								<td><img src="${contextPath}/resources/images/3.png"
									style="width: 100%;"></td>
								<td><img src="${contextPath}/resources/images/3.png"
									style="width: 100%;"></td>
								<td><img src="${contextPath}/resources/images/3.png"
									style="width: 100%;"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
				<br>
				<h3>전체</h3>
				<table id="whole">
					<tbody>
						<tr>
							<td><img src="${contextPath}/resources/images/3.png"
								style="width: 100%;"></td>
							<td><img src="${contextPath}/resources/images/3.png"
								style="width: 100%;"></td>
							<td><img src="${contextPath}/resources/images/3.png"
								style="width: 100%;"></td>
						</tr>
						<tr>
							<td><img src="${contextPath}/resources/images/3.png"
								style="width: 100%;"></td>
							<td><img src="${contextPath}/resources/images/3.png"
								style="width: 100%;"></td>
							<td><img src="${contextPath}/resources/images/3.png"
								style="width: 100%;"></td>
						</tr>
						<tr>
							<td><img src="${contextPath}/resources/images/3.png"
								style="width: 100%;"></td>
							<td><img src="${contextPath}/resources/images/3.png"
								style="width: 100%;"></td>
							<td><img src="${contextPath}/resources/images/3.png"
								style="width: 100%;"></td>
						</tr>
						<tr>
							<td><img src="${contextPath}/resources/images/3.png"
								style="width: 100%;"></td>
							<td><img src="${contextPath}/resources/images/3.png"
								style="width: 100%;"></td>
							<td><img src="${contextPath}/resources/images/3.png"
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