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
	//선택된 사이드 메뉴바 표시
	$(function(){
		var selectedUl = $("#board").parent().children();
		var selectedLi = selectedUl.children().children().eq(0);
		selectedUl.css({"display":"block"});
		selectedLi.css({"color":"skyblue"});
		
		var subCategory = "<c:out value='${b.subCategory}'/>";
		var caSpan = $("#subCategory");
		
		console.log(subCategory);
		if(subCategory == 'ETC'){
			caSpan.text("기타");
		}else if(subCategory == 'WT'){
			caSpan.text("웹툰");
		}else if(subCategory == 'WN'){
			caSpan.text("웹소설");
		}else{
			caSpan.text("일러스트");
		}
	});
	
	//답변하기
	function respond(){
		console.log("답변!");
	}
	
	//공지사항 수정
	function NoticeChange(){
		var bContent = $("#bContent").val();
		var bId = "<c:out value='${b.bId}'/>";
		console.log(bContent);
		console.log(bId);
		
		location.href="noticeChange.ad?bContent=" + bContent + "&bId=" + bId;
	}
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
										<div class="card-header">1:1 문의 상세보기  <span id="subCategory" style="float: right;"></span></div>
											<div class="card-body card-block">
										<form action="writeBoard.ad" method="post" 
											class="form-horizontal">
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">작성자</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="text" id="text-input" name="bTitle"
														placeholder="Text" class="form-control" value="${b.userId }" readonly>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">제목</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="text" id="text-input" name="bTitle"
													 	placeholder="Text" class="form-control" value="${b.bTitle }" readonly>
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
														class="form-control" style="resize: none;" readonly>${b.bContent }
														</textarea>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-12 col-md-12">
													<label for="respond">답변내용</label><br>
													<textarea name="respond" id="respond"
														rows="4" placeholder="답변 내용을 적어주세요 관리자님!"
														class="form-control" style="resize: none;">
														</textarea>
												</div>
											</div>
										</form>
										<div class="row">
											<div class="col-lg-12" style="text-align: right">
												<button class="btn btn-primary" id="completeNotice" onclick="respond();">답변하기</button>
											</div>

										</div>

									</div>
									</c:if>
									
									<!-- 공지사항 인경우 -->
									<c:if test="${b.boardCategory eq 'NTC' }">
										<div class="card-header">공지사항 상세보기 <span id="subCategory" style="float: right;"></span></div>
											<div class="card-body card-block">
										<form action="writeBoard.ad" method="post" 
											class="form-horizontal">
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">제목</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="text" id="text-input" name="bTitle"
														placeholder="Text" class="form-control" value="${b.bTitle }" readonly>
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
														class="form-control" style="resize: none;">${b.bContent }</textarea>
												</div>
											</div>
										</form>
										<div class="row">
											<div class="col-lg-12" style="text-align: right">
												<button class="btn btn-primary" id="completeNotice" type="submit" onclick="NoticeChange();">수정</button>
											</div>

										</div>
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
