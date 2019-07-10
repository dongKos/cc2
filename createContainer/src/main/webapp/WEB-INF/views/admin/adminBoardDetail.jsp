<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판관리 - 게시글</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

</script>
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
								<div class="card">
									<!-- 1:1 문의 인경우 -->
									<c:if test="${b.boardCategory eq  'OTO'}">
										<div class="card-header">1:1 문의 상세보기</div>
											<div class="card-body card-block">
										<form action="writeBoard.ad" method="post" 
											class="form-horizontal">
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="select" class=" form-control-label">카테고리</label>
												</div>
												<div class="col-12 col-md-9">
													<select name="subCategory" id="subCategory" class="form-control">
														<option value="0">카테고리를 선택하세요</option>
														<option value="WT">웹툰</option>
														<option value="WN">웹소설</option>
														<option value="ILL">일러스트</option>
														<option value="ETC">기타</option>
													</select>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">제목</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="text" id="text-input" name="bTitle"
														placeholder="Text" class="form-control">
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="textarea-input" class=" form-control-label">글
														내용</label>
												</div>
												<div class="col-12 col-md-9">
													<textarea name="bContent" id="bContent"
														rows="9" placeholder="내용을 적어주세요 관리자님!"
														class="form-control" style="resize: none;"></textarea>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-12" style="text-align: right">
													<button class="btn btn-primary" id="completeNotice" type="submit">등록</button>
												</div>
	
											</div>
										</form>

									</div>
									</c:if>
									
									<!-- 공지사항 인경우 -->
									<c:if test="${b.boardCategory eq 'NTC' }">
										<div class="card-header">공지사항 상세보기</div>
											<div class="card-body card-block">
										<form action="writeBoard.ad" method="post" 
											class="form-horizontal">
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="select" class=" form-control-label">카테고리</label>
												</div>
												<div class="col-12 col-md-9">
													<select name="subCategory" id="subCategory" class="form-control">
														<option value="0">카테고리를 선택하세요</option>
														<option value="WT">웹툰</option>
														<option value="WN">웹소설</option>
														<option value="ILL">일러스트</option>
														<option value="ETC">기타</option>
													</select>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">제목</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="text" id="text-input" name="bTitle"
														placeholder="Text" class="form-control">
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="textarea-input" class=" form-control-label">글
														내용</label>
												</div>
												<div class="col-12 col-md-9">
													<textarea name="bContent" id="bContent"
														rows="9" placeholder="내용을 적어주세요 관리자님!"
														class="form-control" style="resize: none;"></textarea>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-12" style="text-align: right">
													<button class="btn btn-primary" id="completeNotice" type="submit">등록</button>
												</div>
	
											</div>
										</form>

									</div>
									</c:if>
								
									
									<!-- card-body -->
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
