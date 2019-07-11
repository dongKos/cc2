<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>통계관리 - 작가통계</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#refundTable tr").click(function(){
			var num = $(this).children().eq(0).text();
		});
		
		//선택된 사이드 메뉴바 표시
		var selectedUl = $("#statistic").parent().children();
		var selectedLi = selectedUl.children().children().eq(2);
		selectedUl.css({"display":"block"});
		selectedLi.css({"color":"skyblue"});
		
		//Pie Chart
		
		var wtAvg = "<c:out value='${hmap.WT}'/>";
		var wnAvg = "<c:out value='${hmap.WN}'/>";
		var illAvg = "<c:out value='${hmap.ILL}'/>";
		try {
	
		    var ctx = document.getElementById("pieChart");
		    if (ctx) {
		      ctx.height = 200;
		      var myChart = new Chart(ctx, {
		        type: 'pie',
		        data: {
		          datasets: [{
		            data: [wtAvg, wnAvg, illAvg],
		            backgroundColor: [
		              "rgba(0, 123, 255,0.9)",
		              "rgba(0, 123, 255,0.7)",
		              "rgba(0, 123, 255,0.5)"
		            ],
		            hoverBackgroundColor: [
		              "rgba(0, 123, 255,0.9)",
		              "rgba(0, 123, 255,0.7)",
		              "rgba(0, 123, 255,0.5)"
		            ]
		
		          }],
		          labels: [
		            "웹툰",
		            "웹소설",
		            "일러스트"
		          ]
		        },
		        options: {
		          legend: {
		            position: 'top',
		            labels: {
		              fontFamily: 'Poppins',
		              fontSize : 20,
		              padding: 25,
		              fontColor: 'rgb(051, 051, 255)'
		            }
		
		          },
		          responsive: true
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
                                <div class="au-card m-b-30">
                                    <div class="au-card-inner">
                                        <h3 class="title-2 m-b-40">Pie Chart</h3>
                                        <canvas id="pieChart"></canvas>
                                    </div>
                                </div>
                            </div>
                    </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="m-b-25">
                                	<select>
                                		<option>웹툰</option>
                                		<option>웹 소설</option>
                                		<option>일러스트</option>
                                	</select>
                                	<input type="text">
                                	<button class="btn btn-primary" type="submit">검색</button>
                                </div>
                                <div class="table-responsive table--no-card m-b-40">
                                    <table class="table table-borderless table-striped table-earning" id="refundTable">
                                        <thead>
                                            <tr>
                                                <th>date</th>
                                                <th>order ID</th>
                                                <th>name</th>
                                                <th class="text-right">price</th>
                                                <th class="text-right">quantity</th>
                                                <th class="text-right">total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>2018-09-29 05:57</td>
                                                <td>100398</td>
                                                <td>iPhone X 64Gb Grey</td>
                                                <td class="text-right">$999.00</td>
                                                <td class="text-right">1</td>
                                                <td class="text-right">$999.00<input type="checkbox"></td>
                                                	
                                            </tr>
                                            <tr>
                                                <td>2018-09-28 01:22</td>
                                                <td>100397</td>
                                                <td>Samsung S8 Black</td>
                                                <td class="text-right">$756.00</td>
                                                <td class="text-right">1</td>
                                                <td class="text-right">$756.00<input type="checkbox"></td>
                                            </tr>
                                            <tr>
                                                <td>2018-09-27 02:12</td>
                                                <td>100396</td>
                                                <td>Game Console Controller</td>
                                                <td class="text-right">$22.00</td>
                                                <td class="text-right">2</td>
                                                <td class="text-right">$44.00<input type="checkbox"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                            <div align="right">
                            	<button class="btn btn-primary">삭제</button>
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
