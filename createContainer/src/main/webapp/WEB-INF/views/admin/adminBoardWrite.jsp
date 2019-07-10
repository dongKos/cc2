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
	//날짜 관련 함수
	Date.prototype.format = function(f) {
		if (!this.valueOf())
			return " ";

		var weekName = [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ];
		var d = this;

		return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
			switch ($1) {
			case "yyyy":
				return d.getFullYear();
			case "yy":
				return (d.getFullYear() % 1000).zf(2);
			case "MM":
				return (d.getMonth() + 1).zf(2);
			case "dd":
				return d.getDate().zf(2);
			case "E":
				return weekName[d.getDay()];
			case "HH":
				return d.getHours().zf(2);
			case "hh":
				return ((h = d.getHours() % 12) ? h : 12).zf(2);
			case "mm":
				return d.getMinutes().zf(2);
			case "ss":
				return d.getSeconds().zf(2);
			case "a/p":
				return d.getHours() < 12 ? "오전" : "오후";
			default:
				return $1;
			}
		});
	};

	//한자리일경우 앞에 0을 붙여준다.
	String.prototype.string = function(len) {
		var s = '', i = 0;
		while (i++ < len) {
			s += this;
		}
		return s;
	};
	String.prototype.zf = function(len) {
		return "0".string(len - this.length) + this;
	};
	Number.prototype.zf = function(len) {
		return this.toString().zf(len);
	};

	//상세보기 페이지 이동

	$(function() {
		//선택된 사이드 메뉴바 표시
		var selectedUl = $("#board").parent().children();
		var selectedLi = selectedUl.children().children().eq(0);
		selectedUl.css({
			"display" : "block"
		});
		selectedLi.css({
			"color" : "skyblue"
		});

	});
	
	//게시글 등록
	function board(){
		
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
									<div class="card-header">공지사항 작성</div>
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
