<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>통계관리 - 작가통계 상세페이지</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#refundTable tr").click(function(){
			var num = $(this).children().eq(0).text();
		});
		
		//선택된 사이드 메뉴바 표시
		var selectedUl = $("#statistic").parent().children();
		var selectedLi = selectedUl.children().children().eq(0);
		selectedUl.css({"display":"block"});
		selectedLi.css({"color":"skyblue"});
		
		//차트
		try {
		    //bar chart
		    var ctx = document.getElementById("barChart");
		    if (ctx) {
		      ctx.height = 200;
		      var myChart = new Chart(ctx, {
		        type: 'bar',
		        defaultFontFamily: 'Poppins',
		        data: {
		        	labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
		          datasets: [
		            {
		              label: "My First dataset",
		              data: [65, 59, 80, 81, 56, 55, 40, 55, 40, 56, 81, 32, 32],
		              borderColor: "rgba(0, 123, 255, 0.9)",
		              borderWidth: "0",
		              backgroundColor: "rgba(0, 123, 255, 0.5)",
		              fontFamily: "Poppins"
		            },
		            {
		              label: "My Second dataset",
		              data: [28, 48, 40, 19, 86, 27, 90, 12, 60, 50, 32, 100],
		              borderColor: "rgba(0,0,0,0.09)",
		              borderWidth: "0",
		              backgroundColor: "rgba(0,0,0,0.07)",
		              fontFamily: "Poppins"
		            }
		          ]
		        },
		        options: {
		          legend: {
		            position: 'top',
		            labels: {
		              fontFamily: 'Poppins'
		            }

		          },
		          scales: {
		            xAxes: [{
		              ticks: {
		                fontFamily: "Poppins"

		              }
		            }],
		            yAxes: [{
		              ticks: {
		                beginAtZero: true,
		                fontFamily: "Poppins"
		              }
		            }]
		          }
		        }
		      });
		    }


		  } catch (error) {
		    console.log(error);
		  }
	});
</script>
</head>

<body class="animsition">
    <div class="page-wrapper">
        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block">
        	<jsp:include page="common/adminSideNavbar.jsp"/>
        </aside>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
           		<jsp:include page="common/adminTopNavbar.jsp"/>
            </header>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="m-b-25">
                                	<!-- <input type="text">
                                	<button class="btn btn-primary" type="submit">검색</button> -->
                                </div>
                                 <div class="au-card m-b-30">
                                    <div class="au-card-inner">
                                        <h3 class="title-2 m-b-40">작품 상세 통계</h3>
                                        <canvas id="barChart"></canvas>
                                    </div>
                                </div>
                                
                                
                                
	                          </div>
	                        </div>
                            <div align="right">
                            	<button class="btn btn-primary">뒤로</button>
                            </div>
                        
                        <div class="row">
                            <div class="col-md-12">
                                <div class="copyright">
                                    <p>Copyright © 2018 Colorlib. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
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
