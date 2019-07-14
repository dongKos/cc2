<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>통계관리 - 매출통계</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		$("#refundTable tr").click(function() {
			var num = $(this).children().eq(0).text();
		});

		//선택된 사이드 메뉴바 표시
		var selectedUl = $("#statistic").parent().children();
		var selectedLi = selectedUl.children().children().eq(1);
		selectedUl.css({
			"display" : "block"
		});
		selectedLi.css({
			"color" : "skyblue"
		});

		//전체 매출 차트

		var wtAvg = "<c:out value='${hmap.WT}'/>";
		var wnAvg = "<c:out value='${hmap.WN}'/>";
		var illAvg = "<c:out value='${hmap.ILL}'/>";
		try {

			var ctx = document.getElementById("pieChart");
			if (ctx) {
				ctx.height = 200;
				var myChart = new Chart(ctx, {
					type : 'pie',
					data : {
						datasets : [ {
							data : [ wtAvg, wnAvg, illAvg ],
							backgroundColor : [ "rgba(0, 123, 255,0.9)",
									"rgba(0, 123, 255,0.7)",
									"rgba(0, 123, 255,0.5)" ],
							hoverBackgroundColor : [ "rgba(0, 123, 255,0.9)",
									"rgba(0, 123, 255,0.7)",
									"rgba(0, 123, 255,0.5)" ]

						} ],
						labels : [ "웹툰", "웹소설", "일러스트" ]
					},
					options : {
						legend : {
							position : 'top',
							labels : {
								fontFamily : 'Poppins',
								fontSize : 20,
								padding : 25,
								fontColor : 'rgb(051, 051, 255)'
							}

						},
						responsive : true
					}

				});
			}

		} catch (error) {
			console.log(error);
		}

		//월별 통계 차트

		try {
			//Sales chart
			var ctx = document.getElementById("sales-chart");
			if (ctx) {
				ctx.height = 150;
				var myChart = new Chart(
						ctx,
						{
							type : 'line',
							data : {
								labels : [ "Jan", "Feb", "Mar", "Apr", "May",
										"Jun", "Jul", "Aug", "Sep", "Oct",
										"Nov", "Dec" ],
								type : 'line',
								defaultFontFamily : 'Poppins',
								datasets : [
										{
											label : "webtoon",
											data : [
													"<c:out value='${wtList[0]}'/>",
													"<c:out value='${wtList[1]}'/>",
													"<c:out value='${wtList[2]}'/>",
													"<c:out value='${wtList[3]}'/>",
													"<c:out value='${wtList[4]}'/>",
													"<c:out value='${wtList[5]}'/>",
													"<c:out value='${wtList[6]}'/>",
													"<c:out value='${wtList[7]}'/>",
													"<c:out value='${wtList[8]}'/>",
													"<c:out value='${wtList[9]}'/>",
													"<c:out value='${wtList[10]}'/>",
													"<c:out value='${wtList[11]}'/>" ],
											backgroundColor : 'transparent',
											borderColor : 'rgba(220,53,69,0.75)',
											borderWidth : 3,
											pointStyle : 'circle',
											pointRadius : 5,
											pointBorderColor : 'transparent',
											pointBackgroundColor : 'rgba(220,53,69,0.75)',
										},
										{
											label : "webnovel",
											data : [
													"<c:out value='${wnList[0]}'/>",
													"<c:out value='${wnList[1]}'/>",
													"<c:out value='${wnList[2]}'/>",
													"<c:out value='${wnList[3]}'/>",
													"<c:out value='${wnList[4]}'/>",
													"<c:out value='${wnList[5]}'/>",
													"<c:out value='${wnList[6]}'/>",
													"<c:out value='${wnList[7]}'/>",
													"<c:out value='${wnList[8]}'/>",
													"<c:out value='${wnList[9]}'/>",
													"<c:out value='${wnList[10]}'/>",
													"<c:out value='${wnList[11]}'/>" ],
											backgroundColor : 'transparent',
											borderColor : 'rgba(40,167,69,0.75)',
											borderWidth : 3,
											pointStyle : 'circle',
											pointRadius : 5,
											pointBorderColor : 'transparent',
											pointBackgroundColor : 'rgba(40,167,69,0.75)',
										},
										{
											label : "illust",
											data : [
													"<c:out value='${illList[0]}'/>",
													"<c:out value='${illList[1]}'/>",
													"<c:out value='${illList[2]}'/>",
													"<c:out value='${illList[3]}'/>",
													"<c:out value='${illList[4]}'/>",
													"<c:out value='${illList[5]}'/>",
													"<c:out value='${illList[6]}'/>",
													"<c:out value='${illList[7]}'/>",
													"<c:out value='${illList[8]}'/>",
													"<c:out value='${illList[9]}'/>",
													"<c:out value='${illList[10]}'/>",
													"<c:out value='${illList[11]}'/>" ],
											backgroundColor : 'transparent',
											borderColor : 'rgba(255, 255, 59, 100)',
											borderWidth : 3,
											pointStyle : 'circle',
											pointRadius : 5,
											pointBorderColor : 'transparent',
											pointBackgroundColor : 'rgba(255, 255, 59, 100)',
										} ]
							},
							options : {
								responsive : true,
								tooltips : {
									mode : 'index',
									titleFontSize : 12,
									titleFontColor : '#000',
									bodyFontColor : '#000',
									backgroundColor : '#fff',
									titleFontFamily : 'Poppins',
									bodyFontFamily : 'Poppins',
									cornerRadius : 3,
									intersect : false,
								},
								legend : {
									display : false,
									labels : {
										usePointStyle : true,
										fontFamily : 'Poppins',
									},
								},
								scales : {
									xAxes : [ {
										display : true,
										gridLines : {
											display : false,
											drawBorder : false
										},
										scaleLabel : {
											display : false,
											labelString : 'Month'
										},
										ticks : {
											fontFamily : "Poppins"
										}
									} ],
									yAxes : [ {
										display : true,
										gridLines : {
											display : false,
											drawBorder : false
										},
										scaleLabel : {
											display : true,
											labelString : 'Value',
											fontFamily : "Poppins"

										},
										ticks : {
											fontFamily : "Poppins"
										}
									} ]
								},
								title : {
									display : false,
									text : 'Normal Legend'
								}
							}
						});
			}

		} catch (error) {
			console.log(error);
		}

	})
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
								<div class="card">
									<div class="card-header">
										<h4>매출 통계</h4>
									</div>
									<div class="card-body">
										<div class="custom-tab">
											<nav>
												<div class="nav nav-tabs" id="nav-tab" role="tablist">
													<a class="nav-item nav-link active"
														id="custom-nav-home-tab" data-toggle="tab"
														href="#custom-nav-home" role="tab"
														aria-controls="custom-nav-home" aria-selected="true">전체
														통계</a> <a class="nav-item nav-link"
														id="custom-nav-profile-tab" data-toggle="tab"
														href="#custom-nav-profile" role="tab"
														aria-controls="custom-nav-profile" aria-selected="false">월별
														통계</a>
												</div>
											</nav>
											<div class="tab-content pl-3 pt-2" id="nav-tabContent">
												<div class="tab-pane fade show active" id="custom-nav-home"
													role="tabpanel" aria-labelledby="custom-nav-home-tab">
													<canvas id="pieChart"></canvas>
												</div>
												<div class="tab-pane fade" id="custom-nav-profile"
													role="tabpanel" aria-labelledby="custom-nav-profile-tab">
													<br> <br>
													<canvas id="sales-chart"></canvas>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
						<!-- /# column -->
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="m-b-25">
								<select id="search">
									<option value="1">전체</option>
									<option value="2">작품</option>
									<option value="3">일러스트</option>
								</select>
								<button class="btn btn-primary" type="submit">검색</button>
							</div>
							<div class="table-responsive table--no-card m-b-40">
								<table
									class="table table-borderless table-striped table-earning"
									id="refundTable">
									<thead>
										<tr>
											<th>(사용/충전)</th>
											<th>(작품/일러)</th>
											<th>금액</th>
											<th class="text-right">거래일자</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="c" items="${list }">
											<tr>
												<c:if test="${c.cCategory eq 1 }">
													<td>사용</td>
												</c:if>
												<c:if test="${c.cCategory eq 2 }">
													<td>충전</td>
												</c:if>
												<c:if test="${c.illCode eq 0 }">
													<td>작품</td>
												</c:if>
												<c:if test="${c.rid eq 0 }">
													<td>일러스트</td>
												</c:if>
												<td>${c.cCount }</td>
												<td class="text-right">${c.cDate }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- 페이징 영역 -->
								<div id="pagingArea" align="center">
									<c:if test="${pi.currentPage <= 1 }">
						                        [이전]&nbsp;
						                </c:if>
									<c:if test="${pi.currentPage > 1 }">
										<c:url var="blistBack" value="/showStatisticCalculate.ad">
											<c:param name="currentPage" value="${pi.currentPage - 1 }" />
										</c:url>
										<a href="${blistBack }">[이전]</a> &nbsp;
						                </c:if>
									<c:forEach var="p" begin="${ pi.startPage }"
										end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<font color="red" size="4"><b>[${ p }]</b></font>
										</c:if>
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="blistCheck" value="showStatisticCalculate.ad">
												<c:param name="currentPage" value="${ p }" />
											</c:url>
											<a href="${ blistCheck }">${ p }</a>
										</c:if>
									</c:forEach>

									<c:if test="${pi.currentPage >= pi.maxPage}">
						                        &nbsp;[다음]
						                </c:if>
									<c:if test="${pi.currentPage < pi.maxPage }">
										<c:url var="blistEnd" value="showStatisticCalculate.ad">
											<c:param name="currentPage" value="${pi.currentPage + 1 }" />
										</c:url>
										<a href="${blistEnd }">&nbsp;[다음]</a>
									</c:if>
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
	<!-- Main JS-->
	<script src="${contextPath }/resources/js/admin/main2.js"></script>

</body>

</html>
<!-- end document-->
