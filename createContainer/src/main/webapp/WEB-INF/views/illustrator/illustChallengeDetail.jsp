<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<script>
  function request() {
		var illCode = "<c:out value='${clist[0].illCode}'/>";
		console.log("리퀘스트!");
		location.href = "illChallengeRequest.ill?illCode=" + illCode;
	}
		
		function updateRecommendCount(){
			console.log("추천눌림");
			var illCode = "<c:out value='${clist[0].illCode}'/>";
			var userId = "<c:out value='${clist[0].userId}'/>";
			console.log(illCode);
			
			$.ajax({
				url:"IllRecommendCount.ill",
				data:{illCode:illCode, userId:userId},
				success:function(data){
					console.log(data);
					$("#recommendCount").val("추천수 : " + data);
					
				},
				error:function(){
					console.log("실패!");
				}
			})
		}
  </script>
<style>

.test {
	width: 100%;
	height: 400px;
	border: 1px solid black;
}
 	
.service ul li {
	display: inline-block;
}

.content {
	margin-left: 8%;
	background: lightgray;
}

.img-content {
	width: 100%;
	color: white;
	height: 500px;
}

#priceTable {
	width: 100%;
}

.fixed-area {
	position: fixed;
	top: 90%;
	left: 91.5%;
}

.fixed-area  a {
	color: yellowgreen;
	font-size: 4em; 	
}
h2 {
	font-size: 1.39rem !important;	 
}
</style>
</head>
<body>
	<jsp:include page="common/IllustTopNavbar.jsp" /><br>
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />
	<br>


	<!-- <div class="container">
  <h2>Modal Example</h2>
  Trigger the modal with a button
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

  Modal
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      Modal content
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div> -->

	<section class="page-section challenge" id="challenge">
		<div class="container" style="margin-top: -10%">
			<section style="width: 86%; margin-left: 7%">
				<div class="row">
					<div class="col-md-6">
						<c:forEach var="ill" items="${clist }">
							<c:if test="${ill.aCategory eq 'ma' }">
								<img
									src="${contextPath }/resources/uploadFiles/illustrator/illChallenge/${ill.changeName}"
									style="width: 100%; height: 100%;">
							</c:if>
						</c:forEach>
					</div>
					<div class="col-md-6">
						<h2 style="display: inline-block;">${clist[0].illTitle}</h2>
						<!-- <button type="button" class="btn" style="background:#f5d142; color:white; display:inline-block; margin-left:20%; font-size:12px;">쪽지보내기</button><br><br><br> -->
						<br>
						<br> <i class="fas fa-user-circle" style="font-size: 20px;">
							${clist[0].nickName}</i><br>
						<br> <a onclick="illustratorDetail()"><i
							class="fas fa-home" style="font-size: 20px;"> 작가페이지 보러가기</i></a><br>
						<br>
						<br>

						<c:if test="${ sessionScope.loginUser.userId == null }">
							<p style="font-size: 27px; font-family: 'Do Hyeon', sans-serif;">
								모든 기능은 <a href="${ contextPath }/loginForm.me"
									style="text-decoration: none">로그인</a> 후 사용 가능합니다.
							</p>
						</c:if>
						<c:if test="${ sessionScope.loginUser.userId != null }">
							<button type="button" class="btn"
								onclick="updateRecommendCount();"
								style="background: #f5d142; color: white; display: inline-block; font-size: 12px; width: 100%">추천하기</button>
							<br>
							<br>
							<button type="button" class="btn"
								style="background: #f5d142; color: white; display: inline-block; font-size: 12px; width: 100%"
								onclick="request();">의뢰하기</button>
							<br>
							<br>
							<button type="button" class="btn"
								style="background: #f5d142; color: white; display: inline-block; font-size: 12px; width: 100%"
								data-toggle="modal" data-target="#portfolioModal4">신고하기</button>
						</c:if>
						<script>
				function illustratorDetail(){
					var userId = "<c:out value='${clist[0].userId}'/>";
					console.log(userId);
					
					location.href="selectIllustratorDetail.ill?userId=" + userId;
				}
				</script>
					</div>
				</div>
			</section>
			<br>
			<br>
			<div class="row">
				<div style="margin-left: 8%; width: 83.3%; font-size: 13px">
					<div align="center">
						<input type="text" value="추천수 : ${clist[0].recommendCount}"
							id="recommendCount">
					</div>
				</div>
			</div>

			<!-- 상세 설명 -->
			<div class="row">
				<div style="margin-left: 8%; width: 83.3%; font-size: 13px">
					<hr style="border-color: black;">
					<h2>서비스 설명</h2>
					<br>
					<br>
					<br>
				</div>
				<div class="col-lg-10 content" style="font-size: 13px;">
					안녕하세요. 일러스트레이터 ${clist[0].nickName}입니다.<br>
					<br> 어릴 적부터 책을 보고 그 책의 내용을 그림으로 만날 수 있는 삽화에 반해 그림을 시작한게 어느덧
					일로서 이어가고 있습니다.<br> 일러스트레이터이기 전에 한명의 독자와 청자인 만큼 사람들이 처음 만날 표지의
					중요성과 그 표지가 전달해야하는 정보의 중요성을 잘 알고 있습니다.<br> 극중에서 묘사로 만날 수 있는,
					음악속에서 만날 수 있는 분위기들을 최대한 책과 음악을 보고 느낄 수 있는 모습에 맞춰서 개성강하고 다양하고 정확한
					인물들을 그리는 것을 목표로 그림을 그리고 있습니다.<br> 인물의 개성이 좀더 강하게 드러날 수 있는 소년만화
					계열의 그림을 그리고 있으며, 로고 타이틀 작업또한 가능합니다.<br>
					<br> 현대물, 판타지, 무협물, SF, 로맨스 가리지 않고 작업 가능하나 호쾌한 판타지와 무협물, 그리고
					인물과 인물사이의 관계성과 감정이 드러나야하는 로맨스에 특히 자신있습니다.<br>
					<br> 잘 부탁드립니다. 좋은 하루 되시길 바랍니다.<br>
					<br> *기본 작업 사이즈<br> A4/600dpi에서 작업. (출력 가능 사이즈)<br>
					별도의 작업 사이즈가 있다면 말해주시기 바랍니다.<br>
					<br>
					<br> *상업적 이용 및 작업 범위 - 저작재산권양도, 사용 가능 범위 계약서 작성<br>
					(수익발생을 목적으로 하는)유투브<br> (유료화 된) 웹소설 일러스트<br> (장기적 수익발생을
					목적으로 하는) 앨범아트<br> 상품 제작<br>
					<br> *비 상업적 이용 및 작업 범위 - 저작재산권 비양도, 사용가능 범위 계약서 작성<br>
					(수익발생을 목적으로 하지 않는) 유투브<br> 소장용 일러스트<br> (유료화 되지 않은) 웹소설
					일러스트 <br> ㄴ이 경우에는 추후 유료화될 시 상업적 이용에 대한 계약서를 작성하고 추가비용이 발생하며,<br>
					이에 대한 계약서를 작성하는 점 양해 바랍니다.<br>
					<br>
					<br> *작업에 사용되는 폰트는 대부분 무료 폰트나 직접 적어 사용 하고 있습니다.<br> *비상업용
					작업물은 완성 피드백 직후부터, 상업용 작업물은 상업작 공개 후(공개 날짜 협의 가능) 저의 포트폴리오로 용도로 사용 될
					수 있습니다.
				</div>
			</div>
			<br>
			<hr style="width: 86%; border-color: black;">
			<br>
			<div style="margin-left: 6.5%; width: 83.3%">
				<h2>작품</h2>
			</div>
			<br>
			<c:forEach var="ill" items="${ clist }">
				<c:if test="${ill.aCategory eq 'sub' }">
					<div class="row">
						<div style="margin-left: 8%; width: 83.3%">
							<img
								src="${contextPath }/resources/uploadFiles/illustrator/illChallenge/${ill.changeName}"
								style="width: 100%; height: 100%;">
						</div>
					</div>
					<br>
					<br>
				</c:if>
			</c:forEach>

			<hr style="border-color: black; width: 86%">
			<!-- 텍스트 설명 -->
			<div class="row">
				<div style="margin-left: 8%; width: 83.3%; font-size: 13px">
					<h2>수정 및 재진행 안내</h2>
				</div>
				<br>
				<br>
				<br>
				<div style="margin-left: 8%; width: 83.3%; font-size: 13px">
					01. 전문가와 의뢰인 간의 상호 협의 후 청약철회가 가능합니다.<br>
					<br> 02. 전문가의 귀책사유로 디자인작업을 시작하지 않았거나 혹은 이에 준하는 보편적인 관점에서 심각하게
					잘못 이행한 경우 결제 금액 전체 환불이 가능합니다.<br>
					<br> 03. 전문가가 작업 기간 동안 지정된 서비스를 제공하지 못할 것이 확실한 경우 지급받은 서비스 비용을
					일할 계산하여 작업물 개수와 작업 기간 일수만큼 공제하고 잔여 금액을 환불합니다.<br>
					<br> 04. 서비스 받은 항목을 공제하여 환불하며, 공제 비용은 정가 처리됩니다.<br> 가.
					소비자 피해 보상 규정에 의거하여 작업물 원본의 멸실 및 작업 기간 미이행 및 이에 상응하는 전문가 책임으로 인한 피해
					발생 시, 전액 환불<br> 나. 시안 작업 진행된 상품 차감 환불<br> ⓐ. '디자인'에 대한
					금액이 서비스 내 별도 기재가 되지 않았거나, 디자인 상품 패키지 내 수정 횟수가 1회(1회 포함) 이상인 서비스 상품의
					시안 or 샘플이 제공된 경우<br> → 구매금액의 10% 환불(디자인 비용이 별도 기재되어 있는 경우,
					해당금액 차감 후 환불)<br> ※ 시안 제공 및 수정이 추가로 이뤄진 경우 환불 금액내 수정 횟수에 따라
					분할하여 환불.<br>
					<br> 05. 주문 제작 상품 등 서비스 받은 항목이 없으며, 결제 후 1일 이내 작업이 진행되기 전 시점은
					전액 환불 가능.<br>
					<br> 06. 다만, 환불이 불가능한 서비스에 대한 사실을 표시사항에 포함한 경우에는 의뢰인의 환불요청이
					제한될 수 있습니다.<br> 가. 고객의 요청에 따라 개별적으로 주문 제작되는 재판매가 불가능한 경우(인쇄,
					이니셜 각인, 사이즈 맞춤 등)<br> ⓐ. 주문 제작 상품 특성상 제작(인쇄 등) 진행된 경우.<br>
					ⓑ. 인쇄 색상의 차이 : 모니터의 종류에 따라 색상의 차이가 발생하며,인쇄 시마다 합판 인쇄 방법의 특성상 색상 표현의
					오차가 발생함.<br> ⓒ. 디자인 서비스이며 수정 횟수가 존재하지 않았던 상품일 경우 시안 수령 후 환불 불가
				</div>
			</div>
			<br>
			<hr style="width: 86%; border-color: black; margin-left:6%">
			<div class="container">
			<input type="hidden" value="bTitle">
				<div style="margin-left: 5%; width: 88%; font-size: 13px">
				<h2>문의</h2><br><br><br>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>날짜</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="IllBoard" items="${blist }" varStatus="status">
								<tr onclick="BoardDetail();">
									<td>${status.index + 1 }</td>
									<td>${IllBoard.bTitle }</td>
									<td>${IllBoard.userId }</td>
									<td>${IllBoard.uploadDate }</td>
									<td>${IllBoard.bCount }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<div>
						<a href='#' onClick='fn_write()' class="btn btn-success">글쓰기</a>
					</div>
			</div>
			</div>


			<div class="fixed-area">
				<a href="#"
					style="text-decoration: none; font-size: 40px; font-family: 'Do Hyeon', sans-serif;">TOP</a>
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
	<!-- 모달 -->
	<div class="portfolio-modal modal fade" id="portfolioModal4"
		tabindex="-1" role="dialog" aria-labelledby="portfolioModal1Label"
		aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document"
			style="max-width: 600px !important">
			<div class="modal-content">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"> <i class="fas fa-times"
						style="color: #2c3e50;"></i>
					</span>
				</button>
				<div class="modal-body text-center">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<!-- Portfolio Modal - Title -->
								<h4
									class="portfolio-modal-title text-secondary text-uppercase mb-0"
									style="font-size: 2rem;">신고하기</h4>
								<div class="row">
									<div class="col-md-12">
										<form name="sentMessage" id="contactForm"
											novalidate="novalidate">
											<div class="control-group">
												<div
													class="form-group floating-label-form-group controls mb-0 pb-2"
													style="border: none;">
													<label>신고유형</label> <input class="form-control" id="name"
														type="text" placeholder="신고유형" required="required"
														style="background: white;"
														data-validation-required-message="Please enter your name."
														readonly> <select class="form-control mt-4"
														id="reportType">
														<option value="RE_CTG1">욕설</option>
														<option value="RE_CTG2">비방</option>
														<option value="RE_CTG3">인격모독</option>
														<option value="RE_CTG4">저작권침해</option>
														<option value="RE_CTG5">명예회손</option>
														<option value="RE_CTG6">청소년유해</option>
														<option value="RE_CTG7">불법음란</option>
														<option value="RE_CTG8">기타</option>
													</select>
													<p class="help-block text-danger"></p>
												</div>
											</div>
											<div class="control-group">
												<div
													class="form-group floating-label-form-group controls mb-0 pb-2">
													<label>신고사유</label>
													<textarea class="form-control" id="reportReason" rows="5"
														placeholder="신고사유" required="required"
														data-validation-required-message="Please enter a message."></textarea>
													<p class="help-block text-danger"></p>
												</div>
											</div>
											<br>
											<div id="success"></div>
										</form>
									</div>
								</div>


								<button class="btn btn-primary" href="#" data-dismiss="modal"
									style="background: #2c3e50; border: none;">
									<i class="fas fa-times fa-fw"></i> 닫기
								</button>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<button class="btn btn-primary"
									style="background: #2c3e50; border: none" onclick="report()">
									신고하기</button>
								<script>
										function report(){
											var reportType= $("#reportType").val();
											var reportReason = $("#reportReason").val();
											var illCode = "<c:out value='${clist[0].illCode}'/>";
											var userId = "<c:out value='${clist[0].userId}'/>";
											console.log(reportType);
											console.log(reportReason);
											console.log(illCode);
											location.href="IllChallengeReport.ill?rType=" + reportType + "&rReason=" + reportReason + "&illCode=" + illCode + "&userId=" + userId;
												
										}
										
										//글쓰기
										function fn_write(){
										    
										    var illCode = "<c:out value='${clist[0].illCode}'/>";
										    var userId = "<c:out value='${clist[0].userId}'/>";
										    
										    location.href="insertIllBoard.ill?illCode=" + illCode;
										    
										    
										}
										
										//글조회
										function BoardDetail(){
										    
											var bTitle = "<c:out value='$(#bTitle).val()'/>'";
											var userId = "<c:out value='${sessionScope.loginUser.userId}'/>";
											
											console.log(bTitle);
											console.log(userId);
											
											
											//location.href="selectIllBoard.ill?bTitle=" + bTitle;
										}
									</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>