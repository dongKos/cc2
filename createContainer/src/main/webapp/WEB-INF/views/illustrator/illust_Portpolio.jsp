<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Freelancer - Start Bootstrap Theme</title>

  <!-- Custom fonts for this theme -->
  <link href="${contextPath }/resources/vendor/illust/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

  <!-- Theme CSS -->
  <link href="${contextPath }/resources/css/illust/freelancer.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script>
		function portfolioWrite(){
			console.log("버튼눌림");
			location.href="illustPortfolioWrite.ill";
		}
		
	/* 	$(function(){
	        $(".portfolio-item").click(function(){
	           console.log("눌림");
	           //var illCode = ${illPortfolio.illCode};
	          // console.log(${illPortfolio.illCode});
	           
	           //location.href='selectIllPortfolioDetail.ill?illCode=' + ${illPortfolio.illCode};
	        })
	        
	     }) */

  </script>
</head>

<body id="page-top">
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<jsp:include page="common/IllustTopNavbar.jsp"/>

  
<jsp:include page="common/illustCarousel.jsp"/>


  <!-- Portfolio Section -->
  <section class="page-section portfolio" id="portfolio">
    <div class="container">

      <!-- Portfolio Section Heading -->
      <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">포트폴리오</h2>
      <c:choose>
      	<c:when test="${ sessionScope.loginUser.userId != null && sessionScope.loginUser.memberType == 2}">
      	<div style="width:100%; height:auto;">
      		<button type="button"; class="btn btn-warning" onclick="portfolioWrite()" style="font-size:18px; color:black; font-weight:middle; font-family: 'Nanum Gothic', sans-serif; align:right">글등록</button>
      	</div>
      	</c:when>
      <c:otherwise>
      	<p>글등록은 프리미엄 작가부터 가능합니다.</p>
      </c:otherwise>
      </c:choose>
	 
      <!-- Icon Divider -->
      <div class="divider-custom">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon">
          <i class="fas fa-star"></i>
        </div>
        <div class="divider-custom-line"></div>
      </div>

      <!-- Portfolio Grid Items -->
      <div class="row">
        <!-- Portfolio Item 1 -->
        <c:forEach var="illPortfolio" items="${ list }">
        <div class="col-md-6 col-lg-4">
        <input type="hidden" value="${illPortfolio.illCode }" id="illCode">
        <input type="hidden" value="${illPortfolio.userId }" id="illCode">
          <div class="portfolio-item mx-auto" data-target="#portfolioModal1">
            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
              <div class="portfolio-item-caption-content text-center text-white">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="${contextPath }/resources/uploadFiles/illustrator/illPortfolio/${ illPortfolio.changeName }">
          </div>
        </div>
        <script>
        $(function(){
	        $(".portfolio-item").click(function(){
	            var illCode = $(this).siblings().eq(0).val();
	            var userId = $(this).siblings().eq(1).val();
	         	location.href='selectIllPortfolioDetail.ill?illCode=' + illCode + '&userId=' + userId;
	        })
	        
	     })
		
        </script>
		</c:forEach>
    </div>
    </div>
  </section>

 <footer class="footer text-center">
		<div class="container">
			<div class="row">

				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">ADDRESS</h4>
					<p class="lead mb-0" style="font-size:18px; font-family: 'Do Hyeon', sans-serif;">
						서울특별시 강남구 테헤란로14길 6 <br>남도빌딩 2층, 3층, 4층
					</p>
				</div>

				<!-- Footer Social Icons -->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">COMPANY</h4>
					<p class="lead mb-0" style="font-size:18px; font-family: 'Do Hyeon', sans-serif;">
						회사명 : CreateContainer<br>
						대표이사 : 김동환 <br>
					</p>
				</div>

				<!-- Footer About Text -->
				<div class="col-lg-4">
					<h4 class="text-uppercase mb-4">INFORMATION</h4>
					<p class="lead mb-0" style="font-size:18px; font-family: 'Do Hyeon', sans-serif;">
						카카오톡 : 김동환<br>
						이메일 : CreateContainer@cc.kr <br>
						대표번호 : 010 - 0123 - 4567<br>
						고객센터 : AM 10:00 ~ PM 10:00
					</p>
				</div>

			</div>
		</div>
	</footer>

	<!-- Copyright Section -->
	<section class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; CreateContainer 2019</small>
		</div>
	</section>

  <!-- Bootstrap core JavaScript -->
  <script src="${contextPath }/resources/vendor/illust/jquery/jquery.min.js"></script>
  <script src="${contextPath }/resources/vendor/illust/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="${contextPath }/resources/vendor/illust/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact Form JavaScript -->
  <script src="${contextPath }/resources/js/illust/jqBootstrapValidation.js"></script>
  <script src="${contextPath }/resources/js/illust/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="${contextPath }/resources/js/illust/freelancer.min.js"></script>

</body>

</html>
