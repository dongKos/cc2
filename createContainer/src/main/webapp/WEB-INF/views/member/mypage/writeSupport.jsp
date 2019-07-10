<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.point{
	margin-top:10%;
	}
	
	
	
	.fileUpload {
    position: relative;
    overflow: hidden;
    margin: 10px;
}
.fileUpload input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 20px;
    cursor: pointer;
    opacity: 0;
    filter: alpha(opacity=0);
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

	
	<jsp:include page="common/writerbanner.jsp"/>
  
<div class="container">
  <div class="row">
  <jsp:include page="common/mypageNavbar.jsp"/>
    <div class="col-sm-3">
  	 	<jsp:include page="common/WriterpageSideNavbar.jsp"/>
    </div>
    <div class="col-sm-7">

      <div class="point">
      <form action="writerSupport.mg" method="post" enctype="multipart/form-data">
					<a href="Support.mg"></a>
  				<table style="width:100%; text-align:center" border="1">
  				<tr style="height:50px;">
  				
  				<td colspan="2"><label>후원 신청</label></td>
  				
  				</tr>
  				<tr style="height:50px;">
  				<td><label>후원 제목</label></td>
  				<td><input type="text" name="stitle" placeholder="제목을 입력하세요" style="border:none; text-align:center;"></td>
  				
  				</tr>
  				<tr style="height:50px;">
  				<td><label>후원 최소금액</label></td>
  				<td><input type="text" name="sprice" placeholder="적정 가격을 입력하세요" style="border:none; text-align:center;"><label>원</label></td>
  				
  				</tr>
  				<tr style="height:50px;">
  				<td><label>후원보상</label></td>
  				<td class="fileUpload btn btn-primary">
  				<span>Upload</span>
  				<input type="file" name="rewardFile" class="upload" style="margin:0 auto;"><br>
  				
  				
  				
	  				<!-- <div class="fileUpload btn btn-primary">
					    <span>Upload</span>
					    <input type="file" class="upload" />
					</div> -->
  				
  				</td>
  				
  				</tr>
  				<tr style="height:50px;">
  				<td><label>후원 내용</label></td>
  				<td style="margin:0 auto;">
  				<textarea name="scontent" placeholder="내용을 입력하세요" style="border:none; height:300px; width:80%;"></textarea>
  				</td>
  				
  				</tr>
  				
  				</table>	
  					
  					<hr>
  			<div align="center" style="margin-top:30px;">
  			<button type="submit" class="btn btn-info" >신청하기</button>
  			</div>
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
					location.href = "${ contextPath }/mypgInfoPass.mg";
			}, error:function(data) {
				alert("수정실패");
			}
		})
	})
</script>
<jsp:include page="common/mypgFooter.jsp"/>

</body>
</html>





