<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>통계관리 - 작가통계 상세페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		//선택된 사이드 메뉴바 표시
		var selectedUl = $("#statistic").parent().children();
		var selectedLi = selectedUl.children().children().eq(0);
		selectedUl.css({
			"display" : "block"
		});
		selectedLi.css({
			"color" : "skyblue"
		});

		//월별 통계를 담은 변수들
		var January = "<c:out value='${list[0]}'/>";
		var February = "<c:out value='${list[1]}'/>";
		var March = "<c:out value='${list[2]}'/>";
		var April = "<c:out value='${list[3]}'/>";
		var May = "<c:out value='${list[4]}'/>";
		var June = "<c:out value='${list[5]}'/>";
		var July = "<c:out value='${list[6]}'/>";
		var August = "<c:out value='${list[7]}'/>";
		var September = "<c:out value='${list[8]}'/>";
		var October = "<c:out value='${list[9]}'/>";
		var November = "<c:out value='${list[10]}'/>";
		var December = "<c:out value='${list[10]}'/>";

		//전체 통계를 담은 변수들
		var January2 = "<c:out value='${wholeList[0]}'/>";
		var February2 = "<c:out value='${wholeList[1]}'/>";
		var March2 = "<c:out value='${wholeList[2]}'/>";
		var April2 = "<c:out value='${wholeList[3]}'/>";
		var May2 = "<c:out value='${wholeList[4]}'/>";
		var June2 = "<c:out value='${wholeList[5]}'/>";
		var July2 = "<c:out value='${wholeList[6]}'/>";
		var August2 = "<c:out value='${wholeList[7]}'/>";
		var September2 = "<c:out value='${wholeList[8]}'/>";
		var October2 = "<c:out value='${wholeList[9]}'/>";
		var November2 = "<c:out value='${wholeList[10]}'/>";
		var December2 = "<c:out value='${wholeList[10]}'/>";
		//차트
		try {
			//bar chart
			var ctx = document.getElementById("barChart");
			if (ctx) {
				ctx.height = 200;
				var myChart = new Chart(ctx, {
					type : 'bar',
					defaultFontFamily : 'Poppins',
					data : {
						labels : [ 'January', 'February', 'March', 'April',
								'May', 'June', 'July', 'August', 'September',
								'October', 'November', 'December' ],
						datasets : [
								{
									label : "작가의 월별 매출",
									data : [ January, February, March, April,
											May, June, July, August, September,
											October, November, December ],
									borderColor : "rgba(0, 123, 255, 0.9)",
									borderWidth : "0",
									backgroundColor : "rgba(0, 123, 255, 0.5)",
									fontFamily : "Poppins"
								},
								{
									label : "전체 월별 매출",
									data : [ January2, February2, March2,
											April2, May2, June2, July2,
											August2, September2, October2,
											November2, December2 ],
									borderColor : "rgba(0,0,0,0.09)",
									borderWidth : "0",
									backgroundColor : "rgba(0,0,0,0.07)",
									fontFamily : "Poppins"
								} ]
					},
					options : {
						legend : {
							position : 'top',
							labels : {
								fontFamily : 'Poppins'
							}

						},
						scales : {
							xAxes : [ {
								ticks : {
									fontFamily : "Poppins"

								}
							} ],
							yAxes : [ {
								ticks : {
									beginAtZero : true,
									fontFamily : "Poppins"
								}
							} ]
						}
					}
				});
			}

		} catch (error) {
			console.log(error);
		}
	});

	//뒤로가기
	function goBack() {
		var currentPage = "<c:out value='${currentPage}'/>";
		location.href = "showStatistic.ad?currentPage=" + currentPage;
	}
</script>
</head>

<body class="animsition">
	<div class="page-wrapper">
		<!-- MENU SIDEBAR-->
		<aside class="menu-sidebar d-none d-lg-block">
			<jsp:include page="common/adminSideNavbar.jsp" />
		</aside>
		<!-- END MENU SIDEBAR-->

		<!-- PAGE CONTAINER-->
		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<header class="header-desktop">
				<jsp:include page="common/adminTopNavbar.jsp" />
			</header>
			<!-- HEADER DESKTOP-->

			<!-- MAIN CONTENT-->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="m-b-25"></div>
								<div class="au-card m-b-30">
									<div class="au-card-inner">
										<c:if test="${work eq null }">
											<h3 class="title-2 m-b-40">${ill[0].illTitle }수익통계</h3>
										</c:if>
										<c:if test="${ill eq null }">
											<h3 class="title-2 m-b-40">${work[0].wTitle}수익통계</h3>
										</c:if>

										<canvas id="barChart"></canvas>
									</div>
								</div>



							</div>
						</div>
						<div align="right">
							<button class="btn btn-primary" onclick="goBack()">뒤로</button>
						</div>

						<div class="row">
							<div class="col-md-12">
								<div class="copyright">
									<p>
										Copyright © 2018 Colorlib. All rights reserved. Template by <a
											href="https://colorlib.com">Colorlib</a>.
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT-->
			<!-- END PAGE CONTAINER-->
		</div>

	</div>
	<!-- Main JS-->
	<script src="${contextPath }/resources/js/admin/main2.js"></script>

</body>

</html>
<!-- end document-->
