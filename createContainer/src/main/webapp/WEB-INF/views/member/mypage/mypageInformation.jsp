<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
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
    <div class="col-sm-7" style="text-align:center;">
					<ul class="nav nav-tabs">
    					<li class="active" style="width:100%;"><a href="#" style="font-weight:bold;">회원 정보 수정</a></li>
    					
  					</ul>
      <div class="point" style="width:80%; margin:0 auto;">
  					<br>
  					<form class="form-horizontal" action="memberUpdate2.mg" method="post">
  					<div class="form-group">
    					<label class="control-label col-sm-2" for="userId">아이디:</label>
    					<div class="col-sm-10">
      						<input type="text" class="form-control" id="userId" name="userId" placeholder="dd" readonly value="${ sessionScope.loginUser.userId }">
    					</div>
  					</div> 
  					<div class="form-group">
    					<label class="control-label col-sm-2" for="userName">이름:</label>
    					<div class="col-sm-10">
      						<input type="text" class="form-control" id="userName" name="userName" placeholder="dd" readonly value="${ sessionScope.loginUser.userName }">
    					</div>
  					</div>
  					<div class="form-group">
    					<label class="control-label col-sm-2" for="nickName">닉네임:</label>
    					<div class="col-sm-10">
      						<input type="text" class="form-control" id=nickName name="nickName" placeholder="사용할 닉네임을 입력하세요." value="${ sessionScope.loginUser.nickName }">
    					</div>
  					</div>  
  					<div class="form-group">
    					<label class="control-label col-sm-2" for="phone">전화번호:</label>
    					<div class="col-sm-10">
      						<input type="text" class="form-control" id="phone" name="phone" placeholder="전화번호를 입력 해 주세요." value="${ sessionScope.loginUser.phone }">
    					</div>
  					</div> 
  					<div class="form-group">
    					<label class="control-label col-sm-2" for="email">이메일:</label>
    					<div class="col-sm-10">
      						<input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력 해 주세요." value="${ sessionScope.loginUser.email }">
    					</div>
  					</div> 
  					<div class="form-group">
    					<label class="control-label col-sm-2" for="birthday">생년월일:</label>
    					<div class="col-sm-10">
      						
									<input type="date" class="form-control" id="birthday" name="birthday" placeholder="생년월일을 선택 해 주세요." value="${ sessionScope.loginUser.birthday }">
    					</div>
  					</div> 
  					<button type="button" class="btn btn-info" id="modify">수정</button>
  					</form>
				</div>
    </div>
    <div class="col-sm-2">
     <img src="${ contextPath }/resources/images/advertisement.png" width="100%">     
    </div>
  </div>
</div>
<script>
	$("#modify").click(function(){
		var userId = $("#userId").val();
		var nickName = $("#nickName").val();
		var phone = $("#phone").val();
		var email = $("#email").val();
		var birthday = $("#birthday").val();
		$.ajax({
			url:'memberUpdate2.mg',
			type:'POST',
			data:{userId:userId,nickName:nickName,phone:phone,email:email,birthday:birthday},
			success:function(data) {
					alert("수정이 완료 되었습니다. 다시 로그인 해 주세요.")
					location.href = "${ contextPath }/loginForm.me";
			}, error:function(data) {
				alert("수정실패");
			}
		})
	}) 
</script>
<script>
	$("#birthYear").change(function(){
		var birthYear = $("#birthYear").children("option:selected").val();
		var birthMonth = $("#birthMonth").children("option:selected").val();
		var birthDay = $("#birthDay").children("option:selected").val();
		
		$("#birthday").attr("value", birthYear + "/" + birthMonth + "/" + birthDay);
	})
	$("#birthMonth").change(function(){
		var birthYear = $("#birthYear").children("option:selected").val();
		var birthMonth = $("#birthMonth").children("option:selected").val();
		var birthDay = $("#birthDay").children("option:selected").val();
		
		$("#birthday").attr("value", birthYear + "/" + birthMonth + "/" + birthDay);
	})
	$("#birthDay").change(function(){
		var birthYear = $("#birthYear").children("option:selected").val();
		var birthMonth = $("#birthMonth").children("option:selected").val();
		var birthDay = $("#birthDay").children("option:selected").val();
		
		$("#birthday").attr("value", birthYear + "/" + birthMonth + "/" + birthDay);
	})
</script>
</body>
</html>