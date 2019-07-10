<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의뢰 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/5.7.0/css/font-awesome.min.css">
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
	
	.main-text textarea{
		width: 100%;
		height: 300px;
	}
  </style>
</head>
<body>
<jsp:include page="common/IllustTopNavbar.jsp"/>
	<form action="IllRequest.ill" method="get" id="illRequest">
	<input type="hidden" name="illCode" value="${rlist[0].illCode}">
	<input type="hidden" id="userCoin" value="0">
	<div class="container">
	<br><br>
		<div class="row">
			<div class="col-lg-4 main-image">
		<c:forEach var="illRequest" items="${ rlist }">
				<c:if test="${illRequest.aCategory eq 'ma' }">
				<img class="img-fluid" src="${contextPath }/resources/uploadFiles/illustrator/illPortfolio/${ illRequest.changeName }" style="width:100%; height:100%">
				</c:if>
		</c:forEach>
			</div>
			<div class="col-lg-8 main-text">
				<textarea style="resize:none;" id="illContent" name="illContent" placeholder="자세히 입력하새주세요"></textarea>
			</div>
		</div>
		<hr style="border-color:black;">
		<div class="row">
				<table class="col-lg-10 table table-bordered" id="priceTable">
				<div class="col-lg-10">
				<h2>가격정보</h2><br><br><br><br>
				</div>
					<thead align="center">
					<tr style="background:lightgray; font-size:13px;">
						<th></th>
						<th>STANDARD<br>+700CC</th>
						<th>DELUXE<br>+1500CC</th>
						<th>PREMIUM<br>+3000CC</th>
					</tr>
					</thead>
					<tbody align="center" style="font-size:12px;">
						<tr>
							<td>패키지설명</td>
							<td>소장용 일러스트(배경 X)<br><br>
								상업적 이용을 하지 않는 목적<br>
								기본 A4/600dpi<br>
								* 사이즈 제시 가능 *<br>
								*원본 편집 및 기타 사용 불가*</td>
							<td>소장용 일러스트(배경 O)<br><br>
								상업적 이용을 하지 않는 목적<br>
								기본 A4/600dpi<br>
								* 사이즈 제시 가능 *<br>
								*원본 편집 및 기타 사용 불가*</td>
							<td>상업적 이용<br><br>
								상업적 이용 목적<br>
								A4/300~600dpi<br>
								* 사이즈 제시 가능 *<br>
								* 계약서 작성 *</td>
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
		
		<h2 style="display:inline-block;">옵션을 선택해 주세요 : </h2>
				<select id="requestPackage" style="font-size:20px; display:inline-block;">
					<option value="20000">-------------</option>
					<option value="700">STANDARD +700CC</option>
					<option value="1500">DELUXE +1500CC</option>
					<option value="3000">PREMIUM +3000CC</option>
				</select>
				
		
		<h2 style="display:inline-block;">최종결제 CC : </h2>
		<input type="text" id="totalPrice" name="totalPrice" value="${rlist[0].illPrice}" style="display:inline-block;">
		<br><br>
		<button type="button" class="btn btn-primary form-control" id="submitBtn" onclick="Requestsubmit();">의뢰 신청하기</button>		
		
		<br><br>
		
		<hr>
		<h2 align="center">이용약관</h2>
		<br><br>
		
		<input type="checkbox" required><label>내용에 동의 합니다</label>
		
		<br><br>
		
		<textarea style="resize:none; width: 100%;" rows="10"></textarea>
		
	</div>
	</form>
		<script>
			$("#requestPackage").change(function(){
				var selectPrice = $(this).children("option:selected").val();
				selectPrice = parseInt(selectPrice);
				var Price = ${rlist[0].illPrice};
				Price = parseInt(Price);
				$("#totalPrice").attr("value", Price + selectPrice);
				console.log($("#totalPrice").val());
			})
			
			function Requestsubmit(){
				var coin = $("#userCoin").val();
				var totalCoin = $("#totalPrice").val();
				
				if(coin >= totalCoin){
					$("#illRequest").submit();
				}else {
					alert("돈없음");
				}
				
			}
			
			$(document).ready(function(){
				//${contextPath}/resources/uploadFiles/writerProfile/fc430f965d9a4380aedc4eda0b4d92e0.PNG
				//var userId = ${ sessionScope.loginUser.userId };
			var userId = "<c:out value='${sessionScope.loginUser.userId}'/>";
				console.log(userId)
			$.ajax({
				url:"selectMemberMem.mg",
				type:"get",
				data:{userId:userId},
				success:function(data){
					console.log("data : " , data);	
					console.log(data.wallet);
					$("#userCoin").attr("value",data.wallet);
				},
				error:function(status){
					console.log("status : " , status);
					
				}
			});
			
			})
		</script>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>