<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/5.7.0/css/font-awesome.min.css">
  <script>

		function support(){
			console.log("버튼눌림");
			location.href="illustSupportDetail.ill";
		}
		function request(){
			console.log("리퀘스트!");
			location.href="illustRequest.ill";
		}

  </script>
<style>
	td{
		border:1px solid black;
		width:100px;
		height:40px;
	}
	.test{
		width:100%;
		height:400px;
		border:1px solid black;
	}
	
	.service ul li{
		display: inline-block;
	}
	
	.content {
		margin: 0 auto;
		background: lightgray;
	}
	
	.img-content {
		width: 100%;
		color: white;
		background: black;
		height: 500px;
	}
	
	#priceTable {
		width: 100%;
	}
	
	.fixed-area {
		position: fixed;
		top: 90%;
		left: 90%;
	}
	
	.fixed-area  a{
		color: yellowgreen;
		font-size: 4em;
	}
</style>
</head>
<body>

<br><br>
<div class="container">
  <h2>Modal Example</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
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
  
</div>


	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<img src="${contextPath }/resources/images/logoEdit.png" style="width:100%; height:100%;">
			</div>
			<div class="col-md-6">
				<h2 style="display:inline-block;">우리 청춘에서만</h2>
				<button type="button" class="btn" style="background:#f5d142; color:white; display:inline-block; margin-left:30%; font-size:12px;">쪽지보내기</button><br><br><br>
				<h3>20000원~</h3><br>
				<i class="fas fa-user-circle" style="font-size:20px;"> 작가닉네임</i><br><br>
				<i class="fas fa-home" style="font-size:20px;"> 작가페이지 보러가기</i><br><br><br>
				<button type="button" class="btn" style="background:#f5d142; color:white; display:inline-block; font-size:12px; width:100%" onclick="support();">후원하기</button><br><br>
				<button type="button" class="btn" style="background:#f5d142; color:white; display:inline-block; font-size:12px; width:100%">추천하기</button><br><br>
				<button type="button" class="btn" style="background:#f5d142; color:white; display:inline-block; font-size:12px; width:100%" onclick="request();">의뢰하기</button><br><br>
				<button type="button" class="btn" style="background:#f5d142; color:white; display:inline-block; font-size:12px; width:100%">신고하기</button>
			</div>
		</div>
		<br><br><br>
		<div class="row">
			<div class="col-md-12">
				<h4>작가 신고 횟수 : 3</h4>
			
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>No</th>
							<th>신고내용</th>
							<th>횟수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>지정한 기간을 안지킴</td>
							<td>4</td>
						</tr>
					</tbody>
				</table>
				<div align="center">
					<input type="text" value="추천수  : 3">
				</div>
				<hr>
			</div>
		</div>
		<!-- 서비스 설명 ~~ -->
		<div class="row">
		
			<div class="service">
			
				<ul>
					<li>
						<button class="btn btn-primary">서비스 설명</button>
					</li>
					<li>
						<button class="btn btn-primary">가격정보</button>
					</li>
					<li>
						<button class="btn btn-primary">수정 및 재진행 안내</button>
					</li>
					<li>
						<button class="btn btn-primary">취소 및 환불 규정</button>
					</li>
				</ul>
			</div>
			
			<hr>
		</div>
		
		<!-- 상세 설명 -->
		<div class="row">
			<div class="col-lg-10 content">
				ontrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, 
				making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more 
				obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discover
				ed the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good
				 and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first
				  line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
		The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum 
		et Malorum" by Cicero are also reproduced in their exact original form, accompanie
			</div>
			<hr>
		</div>
		
		<!-- 파일형식, 이미지 -->
		<div class="row">
			<input type="text" value="JPG">
			<input type="text" value="PSD">
		</div>
		<br><br>
		<div class="row">
			<div class="img-content">
				asd
			</div>
		</div>
		<br><br>
		<div class="row">
			<div class="img-content">
				asd
			</div>
		</div>
		<br><br>
		<div class="row">
			<div class="img-content">
				asd
			</div>
		</div>
		<div class="row">
			<div class="img-content">
				asd
			</div>
		</div>
		<br><br>
		<div class="row">
				<table class="table table-bordered" id="priceTable">
					<thead>
					<tr>
						<th></th>
						<th>standard</th>
						<th>Deluxe</th>
						<th>Premium</th>
					</tr>
					</thead>
					<tbody>
						<tr>
							<td>니</td>
							<td>니</td>
							<td>니</td>
							<td>니</td>
						</tr>
							<tr>
							<td>니</td>
							<td>니</td>
							<td>니</td>
							<td>니</td>
						</tr>
							<tr>
							<td>니</td>
							<td>니</td>
							<td>니</td>
							<td>니</td>
						</tr>
							<tr>
							<td>니</td>
							<td>니</td>
							<td>니</td>
							<td>니</td>
						</tr>
						
					</tbody>
				</table>
				
		</div>
				<div align="right">
					<button class="btn btn-warning">의뢰</button>
				</div>
				
				<!-- 텍스트 설명 -->
				
				<div class="row">
					<h2>수정 및 재진행 안내</h2>
					<br><br>
					<div class="text">
					01. 전문가와 의뢰인 간의 상호 협의 후 청약철회가 가능합니다.

				02. 전문가의 귀책사유로 디자인작업을 시작하지 않았거나 혹은 이에 준하는 보편적인 관점에서 심각하게 잘못 이행한 경우 결제 금액 전체 환불이 가능합니다. 
				
				03. 전문가가 작업 기간 동안 지정된 서비스를 제공하지 못할 것이 확실한 경우 지급받은 서비스 비용을 일할 계산하여 작업물 개수와 작업 기간 일수만큼 공제하고 잔여 금액을 환불합니다.
				
				04. 서비스 받은 항목을 공제하여 환불하며, 공제 비용은 정가 처리됩니다.
				가. 소비자 피해 보상 규정에 의거하여 작업물 원본의 멸실 및 작업 기간 미이행 및 이에 상응하는 전문가 책임으로 인한 피해 발생 시, 전액 환불
				나. 시안 작업 진행된 상품 차감 환불
				ⓐ. '디자인'에 대한 금액이 서비스 내 별도 기재가 되지 않았거나, 디자인 상품 패키지 내 수정 횟수가 1회(1회 포함) 이상인 서비스 상품의 시안 or 샘플이 제공된 경우
				→ 구매금액의 10% 환불(디자인 비용이 별도 기재되어 있는 경우, 해당금액 차감 후 환불)
				※ 시안 제공 및 수정이 추가로 이뤄진 경우 환불 금액내 수정 횟수에 따라 분할하여 환불. 
				
				05. 주문 제작 상품 등 서비스 받은 항목이 없으며, 결제 후 1일 이내 작업이 진행되기 전 시점은 전액 환불 가능.
				
				06. 다만, 환불이 불가능한 서비스에 대한 사실을 표시사항에 포함한 경우에는 의뢰인의 환불요청이 제한될 수 있습니다.
				가. 고객의 요청에 따라 개별적으로 주문 제작되는 재판매가 불가능한 경우(인쇄, 이니셜 각인, 사이즈 맞춤 등) 
				ⓐ. 주문 제작 상품 특성상 제작(인쇄 등) 진행된 경우. 
				ⓑ. 인쇄 색상의 차이 : 모니터의 종류에 따라 색상의 차이가 발생하며,인쇄 시마다 합판 인쇄 방법의 특성상 색상 표현의 오차가 발생함.
				ⓒ. 디자인 서비스이며 수정 횟수가 존재하지 않았던 상품일 경우 시안 수령 후 환불 불가
					</div>
				</div>
				<br><br>
				<div class="row">
					<h2>후기</h2>
					<table class="table table-bordered">
					<thead>
						<tr>
							<th>No</th>
							<th>이름</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>지정한 기간을 안지킴</td>
							<td>4</td>
						</tr>
					</tbody>
				</table>
				</div>
				
				<div class="fixed-area">
					<a href="#">TOP</a>
				</div>
	</div>
</body>
</html>