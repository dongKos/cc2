<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>작품 관리 - 승인 대기 내역 상세</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		$("#refundTable tr").click(function() {
			var num = $(this).children().eq(0).text();
		});

		//선택된 사이드 메뉴바 표시
		var selectedUl = $("#work").parent().children();
		var selectedLi = selectedUl.children().children().eq(2);
		selectedUl.css({
			"display" : "block"
		});
		selectedLi.css({
			"color" : "skyblue"
		});

	});
	
	//승인 완료 
	function completeApprove(){
		
		var result = window.confirm("정식 작품으로 승인하시겠습니까?");
		if(result){
			var aCode = "<c:out value='${list[0].aCode}'/>";
			console.log(aCode);
			
			$.ajax({
				url:"completeApprove.ad",
				data:{aCode:aCode},
				type:"post",
				success:function(data){
					console.log(data);
					window.alert("정식 작품으로 승인 완료 되었습니다.");
				},
				error:function(){
					console.log("실패!");
				}
			})
		}
	};
	
	function goBack(){
		var currentPage = "<c:out value='${currentPage}'/>";
		console.log(currentPage);
		location.href="showWorkApprove.ad?currentPage=" + currentPage;
	}
</script>
<style>
.work-div div {
	display: table-cell;
	vertical-align: middle;
	text-align: center;
	width: 400px;
}
</style>
</head>

<body class="animsition">
	<div class="page-wrapper">
		<!-- MENU SIDEBAR-->
		<aside class="menu-sidebar d-none d-lg-block">
			<jsp:include page="common/adminSideNavbar.jsp" />
		</aside>
		<!-- END MENU SIDEBAR-->

		<!-- PAGE CONTAINER-->
		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<header class="header-desktop">
				<jsp:include page="common/adminTopNavbar.jsp" />
			</header>
			<!-- HEADER DESKTOP-->

			<!-- MAIN CONTENT-->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="m-b-25"></div>
								<div class="card">
									<div class="card-header">
										<i class="fa fa-user"></i> <strong class="card-title pl-2">승인
											대기 상세보기</strong>
									</div>
									<div class="card-body">
										<div class="mx-auto d-block">
											<img class="rounded-circle mx-auto d-block"
												src="images/icon/avatar-01.jpg" alt="프로필사진">
											<h4 class="my-3"><strong>${list[0].userId }</strong> 작가</h4>
											<br>
										</div>
										<hr>
										<!-- 무료작품 -->
										<div class="mt-5 d-block work-div">
											<h2>승인 대기 내역</h2>
											<br>
											<div class="work-content">
												<br>
												<c:forEach var="a" items="${list }">
													<c:choose>
														<c:when test="${a.workType eq 'WT' }">
															<c:if test="${a.aCategory eq 'ma' }">
																<img
																	src="${ contextPath }/resources/uploadFiles/webtoonMain/${ a.changeName }">
															</c:if>
														</c:when>
														<c:when test="${a.workType eq 'WN' }">

															<!-- 메인 작품 -->
															<c:if test="${a.aCategory eq 'ma' }">
																<div class="img-content mt-5">
																	<img src="${ contextPath }/resources/uploadFiles/webnovelMain/${ a.changeName }">
																</div>
																<div class="info-content pl-5">
																	<p align="left">
																		<font color="red">[웹소설]</font>
																	</p>
																	<p align="left" class="mb-2">
																		<span class="mr-5"
																			style="font-size;: 24px; font-weight: bold; color: #333333;">${a.workTitle }</span>
																	</p>
																	<br>
																	<p align="left" class="mb-1">
																		<strong>정식 연재 희망일</strong>
																	</p>
																	<p align="left" class="card-text">${a.wishDate }</p>
																	<p align="left" class="mt-4">
																	<button type="button" class="btn btn-secondary mb-1" 
																		data-toggle="modal" data-target="#scrollmodal">상세보기
																	</button>
																	</p>

																	
																</div>

																<!--  -->

															</c:if>
														</c:when>
														<c:otherwise>
														</c:otherwise>
													</c:choose>
												</c:forEach>

											</div>


										</div>
										<br>
										<br>
										<div class="btn-area">
											<div class="row">
												<div class="col-lg-6" align="center">
													<button class="btn btn-warning" onclick="goBack();">뒤로가기</button>
												</div>
												<div class="col-lg-6" align="center">
													<button class="btn btn-primary" onclick="completeApprove()">승인완료</button>
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
									<p>
										Copyright © 2018 Colorlib. All rights reserved. Template by <a
											href="https://colorlib.com">Colorlib</a>.
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT-->
			<!-- 모달 -->
			<div class="modal fade" id="scrollmodal" tabindex="-1" role="dialog" aria-labelledby="scrollmodalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="scrollmodalLabel">${list[0].workTitle }</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<p>
								Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo
								risus, porta ac consectetur ac, vestibulum at eros.
								<br> Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum
								faucibus dolor auctor.
								<br> Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et.
								Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.
								<br> Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi
								leo risus, porta ac consectetur ac, vestibulum at eros.
								<br> Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum
								faucibus dolor auctor.
								<br> Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et.
								Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.
								<br> Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi
								leo risus, porta ac consectetur ac, vestibulum at eros.
								<br> Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum
								faucibus dolor auctor.
							
							</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-primary">Confirm</button>
						</div>
					</div>
				</div>
			</div>
			
			<!-- END PAGE CONTAINER-->
		</div>

	</div>
	<!-- Main JS-->
	<script src="${contextPath }/resources/js/admin/main.js"></script>

</body>


</html>
<!-- end document-->
