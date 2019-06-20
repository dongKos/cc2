<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>환불관리 페이지</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script>
 	function goBack(){
 		location.href="showRefund.ad";
 	}
 	
 	$(function(){
 		//선택된 사이드 메뉴바 표시
		var selectedUl = $("#report").parent().children();
		var selectedLi = selectedUl.children().children().eq(0);
		selectedUl.css({"display":"block"});
		selectedLi.css({"color":"skyblue"});
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
                            <div class="col-lg-8 col-lg-offset-2">
                                <div class="m-b-25">
                                </div>
                                <div class="card">
                                    <div class="card-header">관리자 승인대기</div>
                                    <div class="card-body">
                                        <div class="card-title">
                                            <h3 class="text-center title-2">신고 내역 상세보기</h3>
                                        </div>
                                        <hr>
                                        <form action="" method="post" novalidate="novalidate">
                                            <div class="form-group">
                                                <label for="cc-payment" class="control-label mb-1">사용자 ID</label>
                                                <input id="cc-pament" name="cc-payment" type="text" class="form-control" aria-required="true" aria-invalid="false" value="일반 사용자 01">
                                            </div>
                                            <div class="form-group has-success">
                                                <label for="cc-name" class="control-label mb-1">신고 게시물</label>
                                                <input id="cc-name" name="cc-name" type="text" class="form-control cc-name valid">
                                            </div>
                                            <div class="form-group">
                                                <label for="cc-number" class="control-label mb-1">신고 사유</label>
                                                <input id="cc-number" name="cc-number" type="tel" class="form-control cc-number identified visa" value="" data-val="true"
                                                    data-val-required="Please enter the card number" data-val-cc-number="Please enter a valid card number"
                                                    autocomplete="cc-number">
                                                <span class="help-block" data-valmsg-for="cc-number" data-valmsg-replace="true"></span>
                                            </div>
                                            <div>
                                            
                                            <div class="row">
                                            	<div class="col-lg-6">
                                            	   <button class="btn" onclick="goBack()">뒤로가기</button>
                                            	</div>
                                            	<div class="col-lg-6">
                                            	   <button id="payment-button" type="submit" class="btn btn-lg btn-info btn-block">
                                                    <span id="payment-button-amount">경고처리</span>
                                                   </button>
                                            	</div>
                                            </div>
                                            </div>
                                        </form>
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
