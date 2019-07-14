<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>관리자 메인페이지</title>
<!-- Main JS-->
<script>
	$(function(){
		var wtAvg = "<c:out value='${hmap.WT}'/>";
		var wnAvg = "<c:out value='${hmap.WN}'/>";
		var illAvg = "<c:out value='${hmap.ILL}'/>";
		
		// Percent Chart
	    var ctx = document.getElementById("percent-chart");
	    if (ctx) {
	      ctx.height = 280;
	      var myChart = new Chart(ctx, {
	        type: 'doughnut',
	        data: {
	          datasets: [
	            {
	              label: "My First dataset",
	              data: [wtAvg, wnAvg, illAvg],
	              backgroundColor: [
	                '#00b5e9',
	                '#fa4251',
	                '#00ad5f'
	              ],
	              hoverBackgroundColor: [
	                '#00b5e9',
	                '#fa4251',
	                '#00ad5f'
	              ],
	              borderWidth: [
	                0, 0, 0
	              ],
	              hoverBorderColor: [
	                'transparent',
	                'transparent',
	                'transparent'
	                
	              ]
	            }
	          ],
	          labels: [
	            'webtoon',
	            'webnovel',
	            'illust'
	          ]
	        },
	        options: {
	          maintainAspectRatio: false,
	          responsive: true,
	          cutoutPercentage: 55,
	          animation: {
	            animateScale: true,
	            animateRotate: true
	          },
	          legend: {
	            display: false
	          },
	          tooltips: {
	            titleFontFamily: "Poppins",
	            xPadding: 15,
	            yPadding: 10,
	            caretPadding: 0,
	            bodyFontSize: 16
	          }
	        }
	      });
	    }
	});
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
							<div class="col-md-12">
								<div class="overview-wrap">
									<h2 class="title-1">전체 통계</h2>
								</div>
							</div>
						</div>
						<div class="row m-t-25">
							<div class="col-sm-6 col-lg-3">
								<div class="overview-item overview-item--c1">
									<div class="overview__inner">
										<div class="overview-box clearfix">
											<div class="icon">
												<i class="zmdi zmdi-account-o"></i>
											</div>
											<div class="text">
												<h2>10368</h2>
												<span>회원 현황</span>
											</div>
										</div>
										<div class="overview-chart">
											<canvas id="widgetChart1"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-lg-3">
								<div class="overview-item overview-item--c2">
									<div class="overview__inner">
										<div class="overview-box clearfix">
											<div class="icon">
												<i class="zmdi zmdi-shopping-cart"></i>
											</div>
											<div class="text">
												<h2>388,688</h2>
												<span>판매 현황</span>
											</div>
										</div>
										<div class="overview-chart">
											<canvas id="widgetChart2"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-lg-3">
								<div class="overview-item overview-item--c3">
									<div class="overview__inner">
										<div class="overview-box clearfix">
											<div class="icon">
												<i class="zmdi zmdi-calendar-note"></i>
											</div>
											<div class="text">
												<h2>1,086</h2>
												<span>신규 작품 </span>
											</div>
										</div>
										<div class="overview-chart">
											<canvas id="widgetChart3"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-lg-3">
								<div class="overview-item overview-item--c4">
									<div class="overview__inner">
										<div class="overview-box clearfix">
											<div class="icon">
												<i class="zmdi zmdi-money"></i>
											</div>
											<div class="text">
												<h2>\1,060,386</h2>
												<span>영업 이익</span>
											</div>
										</div>
										<div class="overview-chart">
											<canvas id="widgetChart4"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6">
								<div class="au-card recent-report">
									<div class="au-card-inner">
										<h3 class="title-2">판매 보고</h3>
										<div class="chart-info">
											<div class="chart-info__left">
												<div class="chart-note">
													<span class="dot dot--blue"></span> <span>work</span>
												</div>
												<div class="chart-note mr-0">
													<span class="dot dot--green"></span> <span>illust</span>
												</div>
											</div>
											<div class="chart-info__right">
												<div class="chart-statis">
													<span class="index incre"> <i
														class="zmdi zmdi-long-arrow-up"></i>25%
													</span> <span class="label">work</span>
												</div>
												<div class="chart-statis mr-0">
													<span class="index decre"> <i
														class="zmdi zmdi-long-arrow-down"></i>10%
													</span> <span class="label">illust</span>
												</div>
											</div>
										</div>
										<div class="recent-report__chart">
											<canvas id="recent-rep-chart"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="au-card chart-percent-card">
									<div class="au-card-inner">
										<h3 class="title-2 tm-b-5">매출 통계</h3>
										<div class="row no-gutters">
											<div class="col-xl-6">
												<div class="chart-note-wrap">
													<div class="chart-note mr-0 d-block">
														<span class="dot dot--blue"></span> <span>webtoon</span>
													</div>
													<div class="chart-note mr-0 d-block">
														<span class="dot dot--red"></span> <span>webnovel</span>
													</div>
													<div class="chart-note mr-0 d-block">
														<span class="dot dot--green"></span> <span>illust</span>
													</div>
												</div>
											</div>
											<div class="col-xl-6">
												<div class="percent-chart">
													<canvas id="percent-chart"></canvas>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-9">
								<h2 class="title-1 m-b-25">작품 랭킹</h2>
								<div class="table-responsive table--no-card m-b-40">
									<table
										class="table table-borderless table-striped table-earning"
										id="workTable">
										<thead>
											<tr>
												<th>작가 아이디</th>
												<th class="text-center">작품이름</th>
												<th class="text-center">작품 구분</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="w" items="${list }">
												<tr onclick="trClick(${w.wid})">
													<td>${w.userId }</td>
													<td>${w.wTitle }</td>
													<c:if test="${w.workType eq 'WT' }">
														<td class="text-center">웹툰</td>
													</c:if>
													<c:if test="${w.workType eq 'WN' }">
														<td class="text-center">웹소설</td>
													</c:if>
												</tr>
											</c:forEach>
									</table>
								</div>
							</div>
							<div class="col-lg-3">
								<h2 class="title-1 m-b-25">작가 랭킹</h2>
								<div
									class="au-card au-card--bg-blue au-card-top-countries m-b-40">
									<div class="au-card-inner">
										<div class="table-responsive">
											<table class="table table-top-countries">
												<tbody>
													<c:forEach var="m" items="${list2 }">
														<tr>
															<td>${m.userId }</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
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
	<script src="${contextPath }/resources/js/admin/main.js"></script>

</body>

</html>
<!-- end document-->
