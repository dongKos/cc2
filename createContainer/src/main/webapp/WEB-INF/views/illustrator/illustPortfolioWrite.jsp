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

  <title>일러스트 포트폴리오 등록 페이지</title>

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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script>
     $(function(){
        $(".portfolio-item").click(function(){
           console.log("눌림");
           location.href="illustPortpolioDetail.ill";
        })
        
     })
  </script>
</head>

<body id="page-top">
<jsp:include page="common/IllustTopNavbar.jsp"/><br><br>

<form action="insertPortfolioIllust.ill" method="post" enctype="multipart/form-data">
<div class="container">
	<div class="row">
		<div class="col-md-12" align="center">
		<div class="form-group" style="width:100%; margin:30%; margin-top:0%">
  			<label for="usr" style="float:left; font-size:16px; font-family: 'Nanum Gothic', sans-serif;">작품제목 :&nbsp;&nbsp;&nbsp;</label>
  			<input type="text" class="form-control" placeholder="작품제목을 입력하세요" id="usr" style="float:left; width:30%; font-size:13px; font-family: 'Nanum Gothic', sans-serif;"><br><br><br><br>
  			<label for="usr" style="float:left; font-size:16px; font-family: 'Nanum Gothic', sans-serif;">작품금액 :&nbsp;&nbsp;&nbsp;</label>
  			<input type="text" class="form-control" placeholder="최소금액을 입력해주세요" id="usr" style="float:left; width:30%; font-size:13px; font-family: 'Nanum Gothic', sans-serif;"><br><br><br><br>
  			<label for="comment" style="float:left; font-size:16px; font-family: 'Nanum Gothic', sans-serif;">작품내용 :&nbsp;&nbsp;&nbsp;</label>
  			<textarea class="form-control" rows="5" placeholder="내용을 입력하세요" id="comment" style="resize:none; float:left; width:30%; font-size:13px; font-family: 'Nanum Gothic', sans-serif;"></textarea><br><br><br><br><br><br><br><br><br>
  			<label for="usr" style="float:left; font-size:16px; font-family: 'Nanum Gothic', sans-serif;">작업기간 :&nbsp;&nbsp;&nbsp;</label>
  			<input type="text" class="form-control" placeholder="작업기간을 입력하세요. ex)5일" id="usr" style="float:left; width:30%; font-size:13px; font-family: 'Nanum Gothic', sans-serif;"><br><br><br><br>
  			<label for="comment" style="float:left; font-size:16px; font-family: 'Nanum Gothic', sans-serif;">수정회차 :&nbsp;&nbsp;&nbsp;</label>
  			<input type="text" class="form-control" placeholder="수정회차를 입력하세요. ex)5회" id="usr" style="float:left; width:30%; font-size:13px; font-family: 'Nanum Gothic', sans-serif;"><br><br><br><br>
  			<label for="comment" style="float:left; font-size:16px; font-family: 'Nanum Gothic', sans-serif;">카테고리 :&nbsp;&nbsp;&nbsp;</label>
  			<label class="checkbox-inline" style="font-size:16px; font-family: 'Nanum Gothic', sans-serif; margin-left:-67.5%"><input type="checkbox" value="">일러스트</label>
			<label class="checkbox-inline" style="font-size:16px; font-family: 'Nanum Gothic', sans-serif;"><input type="checkbox" value="">캐릭터</label>
			<label class="checkbox-inline" style="font-size:16px; font-family: 'Nanum Gothic', sans-serif;"><input type="checkbox" value="">명함</label><br><br>
			<label class="checkbox-inline" style="font-size:16px; font-family: 'Nanum Gothic', sans-serif; margin-left:-62.3%"><input type="checkbox" value="">로고</label>
			<label class="checkbox-inline" style="font-size:16px; font-family: 'Nanum Gothic', sans-serif;"><input type="checkbox" value="">PPT</label>
			<label class="checkbox-inline" style="font-size:16px; font-family: 'Nanum Gothic', sans-serif;"><input type="checkbox" value="">북커버</label><br><br>
			<label class="checkbox-inline" style="font-size:16px; font-family: 'Nanum Gothic', sans-serif; margin-left:-62%"><input type="checkbox" value="">인물</label>
			<label class="checkbox-inline" style="font-size:16px; font-family: 'Nanum Gothic', sans-serif;"><input type="checkbox" value="">풍경</label>
			<label class="checkbox-inline" style="font-size:16px; font-family: 'Nanum Gothic', sans-serif;"><input type="checkbox" value="">포토샵</label><br><br>
			<label for="comment" style="float:left; font-size:16px; font-family: 'Nanum Gothic', sans-serif;">파일형식 :&nbsp;&nbsp;&nbsp;</label>
  			<label class="checkbox-inline" style="font-size:16px; font-family: 'Nanum Gothic', sans-serif; margin-left:-72.3%"><input type="checkbox" value="">PSD</label>
			<label class="checkbox-inline" style="font-size:16px; font-family: 'Nanum Gothic', sans-serif;"><input type="checkbox" value="">PNG</label>
			<label class="checkbox-inline" style="font-size:16px; font-family: 'Nanum Gothic', sans-serif;"><input type="checkbox" value="">JPG</label><br><br>
			
			<h3 style="float:left; font-size:16px; font-family: 'Nanum Gothic', sans-serif;">대표 이미지 :&nbsp;&nbsp;</h3>
			<input type="file" name="photo" style="float:left; font-size:13px; font-family: 'Nanum Gothic', sans-serif;"><br><br><br>
			
			<h3 style="float:left; font-size:16px; font-family: 'Nanum Gothic', sans-serif;">서브#1 이미지 :&nbsp;&nbsp;</h3>
			<input type="file" name="photo" style="float:left; font-size:13px; font-family: 'Nanum Gothic', sans-serif;"><br><br><br>
			
			<h3 style="float:left; font-size:16px; font-family: 'Nanum Gothic', sans-serif;">서브#2 이미지 :&nbsp;&nbsp;</h3>
			<input type="file" name="photo" style="float:left; font-size:13px; font-family: 'Nanum Gothic', sans-serif;"><br><br><br>
			
			<h3 style="float:left; font-size:16px; font-family: 'Nanum Gothic', sans-serif;">서브#3 이미지 :&nbsp;&nbsp;</h3>
			<input type="file" name="photo" style="float:left; font-size:13px; font-family: 'Nanum Gothic', sans-serif;"><br><br><br>
			
			<h3 style="float:left; font-size:16px; font-family: 'Nanum Gothic', sans-serif;">서브#4 이미지 :&nbsp;&nbsp;</h3>
			<input type="file" name="photo" style="float:left; font-size:13px; font-family: 'Nanum Gothic', sans-serif;"><br><br><br>
			
			<button type="submit" class="btn btn-warning" style="float:left; margin-left:6%; font-size:18px; border-color:lightblue; background:lightblue; color:black; font-weight:middle; font-family: 'Nanum Gothic', sans-serif;">등록하기</button>
			<button type="button" class="btn btn-warning" onclick="portfolioWrite()" style="float:left; margin-left:2%; font-size:18px; border-color:lightgray; background:lightgray; color:black; font-weight:middle; font-family: 'Nanum Gothic', sans-serif;">취소하기</button>
		</div>
		
		</div>
	</div>
</div>
</form>

  



  

  <!-- Footer -->
  <footer class="footer text-center">
    <div class="container">
      <div class="row">

        <!-- Footer Location -->
        <div class="col-lg-4 mb-5 mb-lg-0">
          <h4 class="text-uppercase mb-4">Location</h4>
          <p class="lead mb-0">2215 John Daniel Drive
            <br>Clark, MO 65243</p>
        </div>

        <!-- Footer Social Icons -->
        <div class="col-lg-4 mb-5 mb-lg-0">
          <h4 class="text-uppercase mb-4">Around the Web</h4>
          <a class="btn btn-outline-light btn-social mx-1" href="#">
            <i class="fab fa-fw fa-facebook-f"></i>
          </a>
          <a class="btn btn-outline-light btn-social mx-1" href="#">
            <i class="fab fa-fw fa-twitter"></i>
          </a>
          <a class="btn btn-outline-light btn-social mx-1" href="#">
            <i class="fab fa-fw fa-linkedin-in"></i>
          </a>
          <a class="btn btn-outline-light btn-social mx-1" href="#">
            <i class="fab fa-fw fa-dribbble"></i>
          </a>
        </div>

        <!-- Footer About Text -->
        <div class="col-lg-4">
          <h4 class="text-uppercase mb-4">About Freelancer</h4>
          <p class="lead mb-0">Freelance is a free to use, MIT licensed Bootstrap theme created by
            <a href="http://startbootstrap.com">Start Bootstrap</a>.</p>
        </div>

      </div>
    </div>
  </footer>

  <!-- Copyright Section -->
  <section class="copyright py-4 text-center text-white">
    <div class="container">
      <small>Copyright &copy; Your Website 2019</small>
    </div>
  </section>

  <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
  <div class="scroll-to-top d-lg-none position-fixed ">
    <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
      <i class="fa fa-chevron-up"></i>
    </a>
  </div>

  <!-- Portfolio Modals -->

  <!-- Portfolio Modal 1 -->
  <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-labelledby="portfolioModal1Label" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">
            <i class="fas fa-times"></i>
          </span>
        </button>
        <div class="modal-body text-center">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <!-- Portfolio Modal - Title -->
                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Log Cabin</h2>
                <!-- Icon Divider -->
                <div class="divider-custom">
                  <div class="divider-custom-line"></div>
                  <div class="divider-custom-icon">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Modal - Image -->
                <img class="img-fluid rounded mb-5" src="img/portfolio/cabin.png" alt="">
                <!-- Portfolio Modal - Text -->
                <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                <button class="btn btn-primary" href="#" data-dismiss="modal">
                  <i class="fas fa-times fa-fw"></i>
                  Close Window
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Portfolio Modal 2 -->
  <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-labelledby="portfolioModal2Label" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">
            <i class="fas fa-times"></i>
          </span>
        </button>
        <div class="modal-body text-center">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <!-- Portfolio Modal - Title -->
                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Tasty Cake</h2>
                <!-- Icon Divider -->
                <div class="divider-custom">
                  <div class="divider-custom-line"></div>
                  <div class="divider-custom-icon">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Modal - Image -->
                <img class="img-fluid rounded mb-5" src="img/portfolio/cake.png" alt="">
                <!-- Portfolio Modal - Text -->
                <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                <button class="btn btn-primary" href="#" data-dismiss="modal">
                  <i class="fas fa-times fa-fw"></i>
                  Close Window
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Portfolio Modal 3 -->
  <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-labelledby="portfolioModal3Label" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">
            <i class="fas fa-times"></i>
          </span>
        </button>
        <div class="modal-body text-center">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <!-- Portfolio Modal - Title -->
                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Circus Tent</h2>
                <!-- Icon Divider -->
                <div class="divider-custom">
                  <div class="divider-custom-line"></div>
                  <div class="divider-custom-icon">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Modal - Image -->
                <img class="img-fluid rounded mb-5" src="img/portfolio/circus.png" alt="">
                <!-- Portfolio Modal - Text -->
                <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                <button class="btn btn-primary" href="#" data-dismiss="modal">
                  <i class="fas fa-times fa-fw"></i>
                  Close Window
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Portfolio Modal 4 -->
  <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-labelledby="portfolioModal4Label" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">
            <i class="fas fa-times"></i>
          </span>
        </button>
        <div class="modal-body text-center">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <!-- Portfolio Modal - Title -->
                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Controller</h2>
                <!-- Icon Divider -->
                <div class="divider-custom">
                  <div class="divider-custom-line"></div>
                  <div class="divider-custom-icon">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Modal - Image -->
                <img class="img-fluid rounded mb-5" src="img/portfolio/game.png" alt="">
                <!-- Portfolio Modal - Text -->
                <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                <button class="btn btn-primary" href="#" data-dismiss="modal">
                  <i class="fas fa-times fa-fw"></i>
                  Close Window
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Portfolio Modal 5 -->
  <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-labelledby="portfolioModal5Label" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">
            <i class="fas fa-times"></i>
          </span>
        </button>
        <div class="modal-body text-center">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <!-- Portfolio Modal - Title -->
                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Locked Safe</h2>
                <!-- Icon Divider -->
                <div class="divider-custom">
                  <div class="divider-custom-line"></div>
                  <div class="divider-custom-icon">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Modal - Image -->
                <img class="img-fluid rounded mb-5" src="img/portfolio/safe.png" alt="">
                <!-- Portfolio Modal - Text -->
                <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                <button class="btn btn-primary" href="#" data-dismiss="modal">
                  <i class="fas fa-times fa-fw"></i>
                  Close Window
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Portfolio Modal 6 -->
  <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-labelledby="portfolioModal6Label" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">
            <i class="fas fa-times"></i>
          </span>
        </button>
        <div class="modal-body text-center">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <!-- Portfolio Modal - Title -->
                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Submarine</h2>
                <!-- Icon Divider -->
                <div class="divider-custom">
                  <div class="divider-custom-line"></div>
                  <div class="divider-custom-icon">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Modal - Image -->
                <img class="img-fluid rounded mb-5" src="img/portfolio/submarine.png" alt="">
                <!-- Portfolio Modal - Text -->
                <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                <button class="btn btn-primary" href="#" data-dismiss="modal">
                  <i class="fas fa-times fa-fw"></i>
                  Close Window
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

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
