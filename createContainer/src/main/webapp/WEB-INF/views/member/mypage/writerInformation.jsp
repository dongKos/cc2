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

	
	<jsp:include page="common/writerbanner.jsp"/>
  
<div class="container">
  <div class="row">
  <jsp:include page="common/mypageNavbar.jsp"/>
    <div class="col-sm-3">
  	 	<jsp:include page="common/WriterpageSideNavbar.jsp"/>
    </div>
    <div class="col-sm-7" style="text-align:center;">
					<ul class="nav nav-tabs">
    					<li class="active" style="width:100%;"><a href="#" style="font-weight:bold;">회원 정보 수정</a></li>
    					
  					</ul>
      <div class="point" style="width:80%; margin:0 auto;">
  					<br>
  					
  					
  					
  					<form action="memberUpdate.mg" class="form-horizontal" method="post" style="margin-top:50px;" enctype="multipart/form-data">
  					
  					
  					
  					<!-- input name, vo name이랑 맞추기 -->
  					<div class="form-group">
    					<img src="${contextPath}/resources/uploadFiles/writerProfile/defaultProfile.jpg" id="thumbnail" width="150px;" height="150px">
    					<div class="col-sm-12" style="text-align:center;">
    						<input type="file" name="photo" id="profilePhoto" onchange="loadImg(this, 1)">
    						<br>
    						<img src="${ contextPath }/resources/images/mypage/upload.png" id="img1Area" width="30px" style="margin:0 auto;">
    					</div>
  					</div> 
  					<div class="form-group">
    					<div class="col-sm-12">
      						<textarea id="introduce" style="resize:none; margin-top:50px;" cols="60" rows="6" name="intro">작가 소개글을 적어주세요.</textarea>
    					</div>
  					</div> 
  					
  					
  					<button class="btn btn-info" type="submit">수정</button>
  					</form>
				</div>
    </div>
    <div class="col-sm-2">
     <img src="${ contextPath }/resources/images/advertisement.png" width="100%">     
    </div>
  </div>
</div>
<script>
		$(function(){
			
			$("#profilePhoto").hide();
			 $("#img1Area").click(function(){
				 $("#profilePhoto").click();
			 })
			
		})
		function loadImg(value, num){
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function(e){
					switch(num){
					case 1 :
						$("#thumbnail").attr("src", e.target.result); break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
</script>
<script>
		$(document).ready(function(){
			//${contextPath}/resources/uploadFiles/writerProfile/fc430f965d9a4380aedc4eda0b4d92e0.PNG
			//var userId = ${ sessionScope.loginUser.userId };
			var userId = "<c:out value='${sessionScope.loginUser.userId}'/>";
			console.log("userId : ", userId);
		 	$.ajax({
				url:"selectMember.mg",
				type:"get",
				data:{userId:userId},
				success:function(data){
					console.log("data : " , data);	
					var changeName = data.replace("\"","");
					console.log(changeName.replace("\"",""));
					$("#thumbnail").attr("src", "${contextPath}/resources/uploadFiles/writerProfile/"+changeName.replace("\"",""));
				},
				error:function(status){
					console.log("status : " , status);
					
				}
			});  
			
			/* console.log("우에")
			var userId = ${sessionScope.loginUser.userId}
			$.ajax({
				url:"selectMember.mg",
				type:"post",
				data:{userId:userId},
				success:function(data){
					console.log(data);
				},
				error:function(status){
					console.log("우ㅇㄹㄴㄹㅇ에")
				}
			}) */
		})
	</script>
	<jsp:include page="common/mypgFooter.jsp"/>
	
</body>
</html>