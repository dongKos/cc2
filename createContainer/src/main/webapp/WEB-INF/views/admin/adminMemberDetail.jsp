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
	//이전 페이지로 돌아가기
	function goBack(){
		var currentPage = location.search.split("=")[2];
		location.href="showMember.ad?currentPage=" + currentPage;
		/* history.back(); */
	} 
 	$(function(){
 		//선택된 사이드 메뉴바 표시
		var selectedUl = $("#member").parent().children();
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
                                    <div class="card-header">
                                        <i class="fa fa-user"></i>
                                        <strong class="card-title pl-2">${ reqMember.userName}</strong>님의 프로필	
                                        <B style="float:right;">가입일 : ${reqMember.joinDate }</B>
                                    </div>
                                    <div class="card-body">
                                        <div class="mx-auto d-block">
                                            <img class="rounded-circle mx-auto d-block" src="images/icon/avatar-01.jpg" alt="Card image cap">
                                            <h4 class="my-3">자기소개</h4>
                                            <div class="location text-sm-center">
                                            	<input type="text" class="form-control" value="${reqMember.intro }">
                                                </div>
                                        </div>
                                       <div class="mx-auto mt-5 d-block">
                                       		<h4 class="my-3">작가의 등록작품</h4>
                                       		<img class="card-img-top" src="images/bg-title-01.jpg" alt="Card image cap">
	                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
	                                            content.
	                                        </p>
                                       </div>
                                       <hr>
                                       <div class="btn-area">
	                                       <div class="row">
	                                  		<div class="col-lg-6" align="center">
	                                  			<button class="btn btn-warning" onclick="goBack();">뒤로가기</button>
	                                  		</div>
	                                  		<div class="col-lg-6" align="center">
	                                  			<button class="btn btn-primary">수정완료</button>
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
