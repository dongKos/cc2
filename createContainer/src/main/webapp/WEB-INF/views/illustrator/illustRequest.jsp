<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의뢰 페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/5.7.0/css/font-awesome.min.css">
<style>
.main-image {
	width: 100%;
	background: black;
	height: 300px;
}

.main-text {
	width: 100%;
	height: 300px;
}

.main-text textarea {
	width: 100%;
	height: 300px;
}
.form-group label{
	font-size: 16px;
	weight: bold;
}
</style>
</head>
<body>
	<jsp:include page="common/IllustTopNavbar.jsp" />
	<form action="IllRequest.ill" method="get" id="illRequest">
		<input type="hidden" name="illCode" value="${rlist[0].illCode}">
		<input type="hidden" id="userCoin" value="0">
		<div class="container">
			<br>
			<br>
			<div class="row">
				<div class="col-lg-4 main-image">
					<c:forEach var="illRequest" items="${ rlist }">
						<c:if test="${illRequest.aCategory eq 'ma' }">
							<img class="img-fluid"
								src="${contextPath }/resources/uploadFiles/illustrator/illPortfolio/${ illRequest.changeName }"
								style="width: 100%; height: 100%">
						</c:if>
					</c:forEach>
				</div>
				<div class="col-lg-8 main-text">
					<textarea style="resize: none; height: 300px; font-size: 16px;"
						id="illContent" name="illContent" placeholder="자세히 입력해주세요"
						class="form-control"></textarea>
				</div>
			</div>
			<hr style="border-color: black;">
			<div class="row">
				<div class="col-lg-12">
					<h2>가격정보</h2>
					<br>
					<br>
					<br>
					<br>
				</div>
				<table class="table table-bordered table-striped" id="priceTable">
					<thead align="center">
						<tr style="background: lightgray; font-size: 13px;">
							<th></th>
							<th>STANDARD<br>+700CC
							</th>
							<th>DELUXE<br>+1500CC
							</th>
							<th>PREMIUM<br>+3000CC
							</th>
						</tr>
					</thead>
					<tbody align="center" style="font-size: 12px;">
						<tr>
							<td>패키지설명</td>
							<td>소장용 일러스트(배경 X)<br>
							<br> 상업적 이용을 하지 않는 목적<br> 기본 A4/600dpi<br> * 사이즈
								제시 가능 *<br> *원본 편집 및 기타 사용 불가*
							</td>
							<td>소장용 일러스트(배경 O)<br>
							<br> 상업적 이용을 하지 않는 목적<br> 기본 A4/600dpi<br> * 사이즈
								제시 가능 *<br> *원본 편집 및 기타 사용 불가*
							</td>
							<td>상업적 이용<br>
							<br> 상업적 이용 목적<br> A4/300~600dpi<br> * 사이즈 제시 가능 *<br>
								* 계약서 작성 *
							</td>
						</tr>
						<tr>
							<td>고해상도 파일 제공</td>
							<td>V</td>
							<td>V</td>
							<td>V</td>
						</tr>
						<tr>
							<td>채색</td>
							<td>V</td>
							<td>V</td>
							<td>V</td>
						</tr>
						<tr>
							<td>전신</td>
							<td>V</td>
							<td>-</td>
							<td>V</td>
						</tr>
						<tr>
							<td>원본파일 제공</td>
							<td>-</td>
							<td>-</td>
							<td>V</td>
						</tr>
						<tr>
							<td>배경</td>
							<td>-</td>
							<td>V</td>
							<td>V</td>
						</tr>
						<tr>
							<td>상업적 이용 가능</td>
							<td>-</td>
							<td>-</td>
							<td>V</td>
						</tr>
						<tr>
							<td>시안 개수</td>
							<td>2</td>
							<td>2</td>
							<td>2</td>
						</tr>
						<tr>
							<td>피사체 개수</td>
							<td>1</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<tr>
							<td>수정 횟수</td>
							<td>1</td>
							<td>3</td>
							<td>3</td>
						</tr>
					</tbody>
				</table>
			</div>
			<br><br>
			<div class="row form-inline">
				<div class="form-group" align="center" style="width: 100%;">
					<label for="requestPackage">옵션을 선택해 주세요 : </label> <select
						id="requestPackage" style="font-size: 20px; margin-left: 1%;"
						class="form-control">
						<option value="20000">-------------</option>
						<option value="700">STANDARD +700CC</option>
						<option value="1500">DELUXE +1500CC</option>
						<option value="3000">PREMIUM +3000CC</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label for="totalPrice">최종결제CC : </label> <input type="text"
						id="totalPrice" name="totalPrice" value="${rlist[0].illPrice}"
						style="font-size: 20px; margin-left: 1%;" class="form-control">
				</div>
			</div>
			<br>
			<br>
			<br>

			<br>
			<br>
			
			<hr>
			<h2 class="mt-5">이용약관</h2>
			<br>
			<br> <input type="checkbox" required>&nbsp;&nbsp;&nbsp;<label style="font-size: 16px; weight: bold;">내용에
				동의 합니다</label> <br>
			<br>

			<textarea style="resize: none; width: 100%;" rows="10" class="form-control"></textarea>
			<br><br><br><br>
			<button type="button" class="btn btn-primary form-control mt-5"
				id="submitBtn" onclick="Requestsubmit();" style="height:50px; font-size:15px;">의뢰 신청하기</button>
		</div>
	</form>
	<script>
		$("#requestPackage").change(function() {
			var selectPrice = $(this).children("option:selected").val();
			selectPrice = parseInt(selectPrice);
			var Price = $
			{
				rlist[0].illPrice
			}
			;
			Price = parseInt(Price);
			$("#totalPrice").attr("value", Price + selectPrice);
			console.log($("#totalPrice").val());
		})

		function Requestsubmit() {
			var coin = Number($("#userCoin").val());
			var totalCoin = Number($("#totalPrice").val());

			if (coin >= totalCoin) {
				console.log("제출");
				$("#illRequest").submit();
			} else {
				alert("돈없음");
			}

		}

		$(document).ready(function() {
			//${contextPath}/resources/uploadFiles/writerProfile/fc430f965d9a4380aedc4eda0b4d92e0.PNG
			//var userId = ${ sessionScope.loginUser.userId };
			var userId = "<c:out value='${sessionScope.loginUser.userId}'/>";
			console.log(userId)
			$.ajax({
				url : "selectMemberMem.mg",
				type : "get",
				data : {
					userId : userId
				},
				success : function(data) {
					console.log("data : ", data);
					console.log(data.wallet);
					$("#userCoin").attr("value", data.wallet);
				},
				error : function(status) {
					console.log("status : ", status);

				}
			});

		})
	</script>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<footer class="footer text-center">
		<div class="container">
			<div class="row">

				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">ADDRESS</h4>
					<p class="lead mb-0"
						style="font-size: 18px; font-family: 'Do Hyeon', sans-serif;">
						서울특별시 강남구 테헤란로14길 6 <br>남도빌딩 2층, 3층, 4층
					</p>
				</div>

				<!-- Footer Social Icons -->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">COMPANY</h4>
					<p class="lead mb-0"
						style="font-size: 18px; font-family: 'Do Hyeon', sans-serif;">
						회사명 : CreateContainer<br> 대표이사 : 김동환 <br>
					</p>
				</div>

				<!-- Footer About Text -->
				<div class="col-lg-4">
					<h4 class="text-uppercase mb-4">INFORMATION</h4>
					<p class="lead mb-0"
						style="font-size: 18px; font-family: 'Do Hyeon', sans-serif;">
						카카오톡 : 김동환<br> 이메일 : CreateContainer@cc.kr <br> 대표번호 :
						010 - 0123 - 4567<br> 고객센터 : AM 10:00 ~ PM 10:00
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
</body>
</html>