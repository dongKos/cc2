<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>작품 관리 - 승인 대기 내역 상세</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#refundTable tr").click(function(){
			var num = $(this).children().eq(0).text();
		});
		
		//선택된 사이드 메뉴바 표시
		var selectedUl = $("#work").parent().children();
		var selectedLi = selectedUl.children().children().eq(2);
		selectedUl.css({"display":"block"});
		selectedLi.css({"color":"skyblue"});
		
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
                                <div class="m-b-25">
                                </div>
                                <div class="card">
                                    <div class="card-header">
                                        <i class="fa fa-user"></i>
                                        <strong class="card-title pl-2">승인 대기 상세보기</strong>	
                                    </div>
                                    <div class="card-body">
                                        <div class="mx-auto d-block">
                                            <img class="rounded-circle mx-auto d-block" src="images/icon/avatar-01.jpg" alt="Card image cap">
                                            <h4 class="my-3">자기소개</h4>
                                            <div class="location text-sm-center">
                                            	<input type="text" class="form-control" value="">
                                                </div><br>
                                        </div>
                                        <hr>
                                        <!-- 무료작품 -->
                                       <div class="mx-auto mt-5 d-block work-div">
                                       		<button class="btn form-control mb-3 fold-btn">
	                                       		<h2 class="my-3">
	                                       			작가의 등록작품
	                                       			<span style="float:right;">
	                                       				<font color="pink">[무료]</font>
	                                       			</span>
	                                       		</h2>
                                       		</button>
	                                      <div class="work-content">
	                                      
	                                      
	                                      
                                       	  </div>
	                                        
	                                        
                                       </div>
                                       <div class="btn-area">
	                                       <div class="row">
	                                  		<div class="col-lg-6" align="center">
	                                  			<button class="btn btn-warning" onclick="goBack();">뒤로가기</button>
	                                  		</div>
	                                  		<div class="col-lg-6" align="center">
	                                  			<button class="btn btn-primary" onclick="deleteMember()">강퇴하기</button>
	                                  		</div>
	                                       
	                                       </div>
                                       </div>
                                    </div>
                                </div>
                            </div>
                            
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
    <script src="${contextPath }/resources/js/admin/main.js"></script>

</body>


</html>
<!-- end document-->
