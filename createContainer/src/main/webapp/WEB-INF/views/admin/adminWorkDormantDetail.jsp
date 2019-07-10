<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>작품 관리 - 후원 관리 상세</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
		//선택된 사이드 메뉴바 표시
		var selectedUl = $("#work").parent().children();
		var selectedLi = selectedUl.children().children().eq(3);
		selectedUl.css({"display":"block"});
		selectedLi.css({"color":"skyblue"});
	})
	
	//승인 완료
	function completeDormant(){
		var sCode = "<c:out value='${reqSup.scode}'/>";
		var result = window.confirm("승인 하시겠습니까?");
		
		if(result){
			location.href="completeDormant.ad?sCode=" + sCode;
		}		
		
	}
	
	//뒤로가기
	function goBack(){
		var currentPage = "<c:out value='${currentPage}'/>";
		
		location.href="showWorkDormant.ad?currentPage=" + currentPage;
	}
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
                        	<div class="col-lg-8">
                        	 <div class="card-body card-block">
                                        <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class=" form-control-label">제목</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="text-input" name="text-input" placeholder="Text" class="form-control"
                                                     		value="${reqSup.stitle }">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="email-input" class=" form-control-label">등록일</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="email" id="email-input" name="email-input" placeholder="Enter Email" class="form-control"
                                                    		value="${reqSup.uploadDate }">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="textarea-input" class=" form-control-label">내용</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input name="textarea-input" id="textarea-input" placeholder="Content..." class="form-control" style="resize: none;" value="${reqSup.scontent }">
                                                    
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="textarea-input" class=" form-control-label">후원 리워드 </label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <img src="${contextPath }/resources/uploadFiles/writerProfile/${reqSup.changeName}">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                              </div>
                        </div>
                        <div class="row">
                        	<div class="col-md-6" align="left">
                        		<button class="btn btn-primary" onclick="goBack()">뒤로가기</button>
                        	</div>
	                       <div class="col-md-6" align="right">
	                       	<button class="btn btn-primary" onclick="completeDormant()">승인</button>
	                       	<button class="btn btn-warning" onclick="goBack()">승인 거절</button>
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
