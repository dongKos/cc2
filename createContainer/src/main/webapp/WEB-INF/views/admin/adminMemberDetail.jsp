<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>환불관리 페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	//이전 페이지로 돌아가기
	function goBack() {
		var currentPage = location.search.split("=")[2];
		location.href = "showMember.ad?currentPage=" + currentPage;
	}

	//회원 강퇴하기
	function deleteMember() {
		var userId = "<c:out value='${userId}'/>";
		var choice = window.confirm("정말로 강퇴 하시겠습니까?");

		if (choice) {
			location.href = "deleteMember.ad?userId=" + userId;
		}
	}

	$(function() {
		//선택된 사이드 메뉴바 표시
		var selectedUl = $("#member").parent().children();
		var selectedLi = selectedUl.children().children().eq(0);
		selectedUl.css({
			"display" : "block"
		});
		selectedLi.css({
			"color" : "skyblue"
		});

		$(".fold-btn").click(function() {
			var sib = $(this).siblings();
			sib.toggle();
		})

	});
</script>
<style>
.work-div div {
	display: table-cell;
	vertical-align: middle;
	text-align: center;
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
										<i class="fa fa-user"></i> <strong class="card-title pl-2">${ reqMember.userName}</strong>님의
										프로필 <B style="float: right;">가입일 : ${reqMember.joinDate }</B>
									</div>
									<div class="card-body">
										<div class="mx-auto d-block">
											<img class="rounded-circle mx-auto d-block"
												src="images/icon/avatar-01.jpg" alt="Card image cap">
											<h4 class="my-3">자기소개</h4>
											<div class="location text-sm-center">
												<input type="text" class="form-control"
													value="${reqMember.intro }">
											</div>
											<br>
										</div>
										<hr>

										<!-- 유료작품 -->
										<div class="mx-auto mt-5 d-block work-div">
											<button class="btn form-control mb-3 fold-btn">
												<h2 class="my-3">
													작가의 등록작품 <span style="float: right;"> <font
														color="pink">[유료]</font>
													</span>
												</h2>
											</button>
											<div class="work-content">
												<c:forEach var="w" items="${list }">
													<c:if test="${w.gradeType eq 2 }">
														<!-- 웹 소설 일때 -->
														<c:if test="${w.workType eq  'WN'}">
															<br>
															<div class="img-content mt-5">
																<img
																	src="${ contextPath }/resources/uploadFiles/webnovelMain/${ w.changeName }"
																	alt="Card image cap" width="300px"
																	style="height: 200px;">
															</div>
															<div class="info-content pl-5">
																<p align="left">
																	<font color="red">[웹소설]</font>
																</p>
																<p align="left" class="mb-2">
																	<span class="mr-5"
																		style="font-size: 24px; font-weight: bold; color: #333333;">${w.wTitle }</span>
																	<span class="ml-5"><strong>등록일</strong> : ${ w.wuploadDate}</span>&nbsp;&nbsp;&nbsp;<span><strong>조회수
																	</strong>: ${w.vCount }</span>
																</p>
																<br>
																<p align="left" class="mb-1">
																	<strong>작품소개</strong>
																</p>
																<p align="left" class="card-text">${ w.wIntro}</p>
															</div>
															<br>
															<hr>
														</c:if>
														<!-- 웹 툰 일때 -->
														<c:if test="${w.workType eq 'WT'}">
															<br>
															<div class="img-content mt-5">
																<img
																	src="${ contextPath }/resources/uploadFiles/webtoonMain/${ w.changeName }"
																	alt="Card image cap" width="300px"
																	style="height: 200px;">
															</div>
															<div class="info-content pl-5">
																<p align="left">
																	<font color="red">[웹툰]</font>
																</p>
																<p align="left" class="mb-2">
																	<span class="mr-5"
																		style="font-size: 24px; font-weight: bold; color: #333333;">${w.wTitle }</span>
																	<span class="ml-5"><strong>등록일</strong> : ${ w.wuploadDate}</span>&nbsp;&nbsp;&nbsp;<span><strong>조회수
																	</strong>: ${w.vCount }</span>
																</p>
																<br>
																<p align="left" class="mb-1">
																	<strong>작품소개</strong>
																</p>
																<p align="left" class="card-text">${ w.wIntro}</p>
															</div>
															<br>
															<hr>
														</c:if>
													</c:if>
												</c:forEach>
											</div>


										</div>

										<!-- 무료작품 -->
										<div class="mx-auto mt-5 d-block work-div">
											<button class="btn form-control mb-3 fold-btn">
												<h2 class="my-3">
													작가의 등록작품 <span style="float: right;"> <font
														color="pink">[무료]</font>
													</span>
												</h2>
											</button>
											<div class="work-content">
												<c:forEach var="w" items="${list }">
													<c:if test="${w.gradeType eq 1 }">
														<!-- 웹 소설 일때 -->
														<c:if test="${w.workType eq  'WN'}">
															<br>
															<div class="img-content mt-5">
																<img
																	src="${ contextPath }/resources/uploadFiles/webnovelMain/${ w.changeName }"
																	alt="Card image cap" width="300px"
																	style="height: 200px;">
															</div>
															<div class="info-content pl-5">
																<p align="left">
																	<font color="red">[웹소설]</font>
																</p>
																<p align="left" class="mb-2">
																	<span class="mr-5"
																		style="font-size: 24px; font-weight: bold; color: #333333;">${w.wTitle }</span>
																	<span class="ml-5"><strong>등록일</strong> : ${ w.wuploadDate}</span>&nbsp;&nbsp;&nbsp;<span><strong>조회수
																	</strong>: ${w.vCount }</span>
																</p>
																<br>
																<p align="left" class="mb-1">
																	<strong>작품소개</strong>
																</p>
																<p align="left" class="card-text">${ w.wIntro}</p>
															</div>
															<br>
															<hr>
														</c:if>
														<!-- 웹 툰 일때 -->
														<c:if test="${w.workType eq 'WT'}">
															<br>
															<div class="img-content mt-5">
																<img
																	src="${ contextPath }/resources/uploadFiles/webtoonMain/${ w.changeName }"
																	alt="Card image cap" width="300px"
																	style="height: 200px;">
															</div>
															<div class="info-content pl-5">
																<p align="left">
																	<font color="red">[웹툰]</font>
																</p>
																<p align="left" class="mb-2">
																	<span class="mr-5"
																		style="font-size: 24px; font-weight: bold; color: #333333;">${w.wTitle }</span>
																	<span class="ml-5"><strong>등록일</strong> : ${ w.wuploadDate}</span>&nbsp;&nbsp;&nbsp;<span><strong>조회수
																	</strong>: ${w.vCount }</span>
																</p>
																<br>
																<p align="left" class="mb-1">
																	<strong>작품소개</strong>
																</p>
																<p align="left" class="card-text">${ w.wIntro}</p>
															</div>
															<br>
															<hr>
														</c:if>
														<!-- 일러스트 일때 -->
														<c:if test=''>

														</c:if>
													</c:if>
												</c:forEach>
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
			<!-- END PAGE CONTAINER-->
		</div>

	</div>
	<!-- Main JS-->
	<script src="${contextPath }/resources/js/admin/main.js"></script>

</body>

</html>
<!-- end document-->
