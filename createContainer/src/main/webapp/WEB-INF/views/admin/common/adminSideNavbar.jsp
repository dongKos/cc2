<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Title Page-->
    <title>관리자 페이지</title>

    <!-- Fontfaces CSS-->
    <link href="${contextPath }/resources/vendor/admin/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="${contextPath }/resources/vendor/admin/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="${contextPath }/resources/vendor/admin/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="${contextPath }/resources/vendor/admin/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="${contextPath }/resources/vendor/admin/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="${contextPath }/resources/vendor/admin/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="${contextPath }/resources/vendor/admin/wow/animate.css" rel="stylesheet" media="all">
    <link href="${contextPath }/resources/vendor/admin/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="${contextPath }/resources/vendor/admin/slick/slick.css" rel="stylesheet" media="all">
    <link href="${contextPath }/resources/vendor/admin/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="${contextPath }/resources/vendor/admin/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="${contextPath }/resources/css/admin/theme.css" rel="stylesheet" media="all">
  
    
    
    
</head>
<body>
       <div class="logo">
           <a href="adminMain.ad">관리자 페이지</a>
       </div>
       <div class="menu-sidebar__content js-scrollbar1">
           <nav class="navbar-sidebar">
               <ul class="list-unstyled navbar__list">
               <!-- 환불관리 -->
                   <li class="has-sub">
                       <a class="js-arrow" href="#" id="refund">환불관리</a>
                       <ul class="list-unstyled navbar__sub-list js-sub-list">
                           <li>
                               <a href="showRefund.ad">환불 내역 관리</a>
                           </li>
                           
                       </ul>
                   </li>
                  
                  <!-- 회원관리 -->
                   <li class="has-sub">
                       <a class="js-arrow" href="#" id="member">회원관리</a>
                       <ul class="list-unstyled navbar__sub-list js-sub-list">
                           <li>
                               <a href="showMember.ad">회원 목록 조회</a>
                           </li>
                          
                       </ul>
                   </li>
                   <!-- 게시판관리 -->
                   <li class="has-sub">
                       <a class="js-arrow" href="#" id="board">게시판관리</a>
                       <ul class="list-unstyled navbar__sub-list js-sub-list">
                           <li>
                               <a href="showBoard.ad">게시글 관리</a>
                           </li>
                           <li>
                               <a href="showBoardReply.ad">댓글 관리</a>
                           </li>
                           
                       </ul>
                   </li>
                   
                   <!-- 통계관리 -->
                   <li class="has-sub">
                       <a class="js-arrow" href="#" id="statistic">통계관리</a>
                       <ul class="list-unstyled navbar__sub-list js-sub-list">
                           <li>
                               <a href="showStatistic.ad">작가 통계</a>
                           </li>
                           <li>
                               <a href="showStatisticPoint.ad">포인트 내역</a>
                           </li>
                           <li>
                               <a href="showStatisticCalculate.ad">정산 관리</a>
                           </li>
                       </ul>
                   </li>
                       
                   <!-- 신고관리 -->
                   <li class="has-sub">
                       <a class="js-arrow" href="#" id="report">신고관리</a>
                       <ul class="list-unstyled navbar__sub-list js-sub-list">
                           <li>
                               <a href="showReport.ad">신고 조회</a>
                           </li>
                       </ul>
                   </li>
                   
	<!-- 작품관리-->
                   <li class="has-sub">
                       <a class="js-arrow" href="#" id="work">작품관리</a>
                       <ul class="list-unstyled navbar__sub-list js-sub-list">
                           <li>
                               <a href="showWork.ad">작품 조회</a>
                           </li>
                           <li>
                               <a href="showWorkApprove.ad">승인 대기 내역 조회</a>
                           </li>
                           <li>
                               <a href="showWorkDormant.ad">후원 대기 내역 조회</a>
                           </li>
                       </ul>
                   </li>
                   
           
               </ul>
           </nav>
       </div>
        <!-- Jquery JS-->
        
   <script src="${contextPath }/resources/vendor/admin/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="${contextPath }/resources/vendor/admin/bootstrap-4.1/popper.min.js"></script>
    <script src="${contextPath }/resources/vendor/admin/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="${contextPath }/resources/vendor/admin/slick/slick.min.js">
    </script>
    <script src="${contextPath }/resources/vendor/admin/wow/wow.min.js"></script>
    <script src="${contextPath }/resources/vendor/admin/animsition/animsition.min.js"></script>
    <script src="${contextPath }/resources/vendor/admin/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="${contextPath }/resources/vendor/admin/counter-up/jquery.waypoints.min.js"></script>
    <script src="${contextPath }/resources/vendor/admin/counter-up/jquery.counterup.min.js">
    </script>
    <script src="${contextPath }/resources/vendor/admin/circle-progress/circle-progress.min.js"></script>
    <script src="${contextPath }/resources/vendor/admin/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="${contextPath }/resources/vendor/admin/chartjs/Chart.bundle.min.js"></script>
    <script src="${contextPath }/resources/vendor/admin/select2/select2.min.js">
    </script>
</body>
</html>