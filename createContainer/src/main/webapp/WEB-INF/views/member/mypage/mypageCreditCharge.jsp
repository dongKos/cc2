<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	li {
		list-style:none;
	}
	.coinCount {
		height:50px;
	}
	.btnclass {
  background-color: #008CBA; /* Green */
  border: none;
  color: white;
  padding: 10px 10px;
  width:70px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  border-radius:3px;
  font-weight:bold;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="margin-top: 3.5%;">

	
	<jsp:include page="common/mypagebanner.jsp"/>
  
<div class="container">
  <div class="row">
  <jsp:include page="common/mypageNavbar.jsp"/>
    <div class="col-sm-3">
  	 	<jsp:include page="common/mypageSideNavbar.jsp"/>
    </div>
    <div class="col-sm-7">
      <div class="point">
					<ul class="nav nav-tabs">
    					<li style="width:50%; text-align:center;"><a href="mypgCredit.mg">CC 충전/사용 내역</a></li>
    					<li class="active" style="width:50%; text-align:center;"><a href="mypgCreditCharge.mg" style="font-weight:bold;">CC 충전</a></li>
    					
  					</ul>
  					<br>
  					<table width="100%;">
  						<tr>
  							<td colspan=3 align="center" style="text-align:center;"><div width=100%;><label>보유중인 CC : <label><label id="coin" value="0">${ date.wallet }</label><label>개</label></div><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">CC 환불 신청</button> </td>
  						</tr>
  						<tr>
  						<td colspan=3>
  						<hr>
  						</td>
  						</tr>
  						<tr>
  							<td style="padding-left:10px; width:20%;"><h4>CC란?</h4> </td>
  							<td colspan=2>만화,장르소설 작품 감상을 위해 필요한 전용 결제수단이며,<br> 일러스트 구매, 후원 등 CreateContainer 에서 사용 가능한 화폐입니다.</td>
  						</tr>
  						<tr>
  						<td colspan=3>
  						<hr>
  						</td>
  						</tr>
  						<tr>
  							<td rowspan=5 style="padding-left:10px; width:20%; height:10px;"><h4>CC결제</h4> </td>
  							<td class="coinCount">
  							<span>
  												<img src="${ contextPath }/resources/images/icon/coin.png" width="20px;">
  												<span>CC 1개</span>
  											</span>
  							</td>
  							<td style="padding-right:10px;" align="right">
  								<input class="btnclass" type="button" value="100" id="hund" onclick="gopay100()">
  							</td>
  						</tr>
  						<tr>
  							<td class="coinCount">
  							<span>
  												<img src="${ contextPath }/resources/images/icon/coin.png" width="20px;">
  												<span>CC 10개</span>
  											</span>
  							</td>
  							<td style="padding-right:10px;" align="right">
  								<input class="btnclass" type="button" value="1000">
  							</td>
  						</tr>
  						<tr>
  							<td class="coinCount">
  							<span>
  												<img src="${ contextPath }/resources/images/icon/coin.png" width="20px;">
  												<span>CC 30개</span>
  											</span>
  							</td>
  							<td style="padding-right:10px;" align="right">
  								<input class="btnclass" type="button" value="3000">
  							</td>
  						</tr>
  						<tr>
  							<td class="coinCount">
  							<span>
  												<img src="${ contextPath }/resources/images/icon/coin.png" width="20px;">
  												<span>CC 50개</span>
  											</span>
  							</td>
  							<td style="padding-right:10px;" align="right">
  								<input class="btnclass" type="button" value="5000">
  							</td>
  						</tr>
  						<tr>
  							<td class="coinCount">
  							<span>
  												<img src="${ contextPath }/resources/images/icon/coin.png" width="20px;">
  												<span>CC 100개</span>
  											</span>
  							</td>
  							<td style="padding-right:10px;" align="right">
  								<input class="btnclass" type="button" value="10000">
  							</td>
  						</tr>
  							
  					<tr>
  						<td colspan=3>
  						<hr>
  						</td>
  					</tr>
  						
  					</table>
				</div>
				<div style="display:none;">
				<input type="text" id="userId" value="${sessionScope.loginUser.userId}">
				</div>
    </div>
    <div class="col-sm-2">
     <img src="${ contextPath }/resources/images/advertisement.png" width="100%">     
    </div>
  </div>
</div>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">CC 환불 신청하기</h4>
        </div>
        	<form action="refundRequest.mg" method="POST">
        <div class="modal-body">
          <p>환불 할 CC개수</p>
          <input type="text" placeholder="환불 개수를 입력 하세요." style="width:100%;" name="price" id="price">
          <p>
          <p>환불 사유</p>
          <textarea placeholder="환불 사유를 입력 하세요." style="width:100%; height:200px;" name="refundReason" id="refundReason"></textarea>
        </div>
        <div class="modal-footer">
        <button type="submit" class="btn btn-default" onclick="">요청</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
          </form>
      </div>
      
    </div>
  </div>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
function gopay100(){
	IMP.init('imp41924715');
	var userId = $("#userId").attr("value");
	console.log(userId);
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : 'CC 코인 결제',
	    amount : 100, //판매 가격
	    buyer_email : '${sessionScope.loginUser.email}',
	    buyer_name : '${ sessionScope.loginUser.userName }',
	    buyer_tel : '${ sessionScope.loginUser.phone }',
	    buyer_addr : '0',
	    buyer_postcode : '0'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        var price = rsp.paid_amount;
	        var applynum = rsp.apply_num;
	        var status = new Array();
			
	        
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
			location = "/cc/paycomplete.mg?userId=" + userId + "&price=" + price;
	        console.log(rsp.apply_num);
	        


	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	     alert(msg); 
	});
}
	

</script>
<script>
		$(document).ready(function(){
			//${contextPath}/resources/uploadFiles/writerProfile/fc430f965d9a4380aedc4eda0b4d92e0.PNG
			//var userId = ${ sessionScope.loginUser.userId };
			var userId = "<c:out value='${sessionScope.loginUser.userId}'/>";
			console.log("userId : ", userId);
		 	$.ajax({
				url:"selectMemberMem.mg",
				type:"get",
				data:{userId:userId},
				success:function(data){
					console.log("data : " , data);	
					$("#coin").text(data.wallet);
				},
				error:function(status){
					console.log("status : " , status);
					
				}
			
			});  
			
		})
	</script>
	<jsp:include page="common/mypgFooter.jsp"/>
	
</body>
</html>