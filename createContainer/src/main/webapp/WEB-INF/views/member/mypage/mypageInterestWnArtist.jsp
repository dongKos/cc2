<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	img:hover {
		cursor:pointer;
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
    					<li style="width:33%;"><a href="attentionArtist.mg">웹툰</a></li>
    					<li class="active" style="width:33%;"><a href="attentionWnArtist.mg">웹소설</a></li>
    					 <li style="width:33%;"><a href="attentionWlArtist.mg">일러스트</a></li>
    					
    					
  					</ul>
  					<br>
  					<!-- 여기부터 -->
  					<div class="wnListDiv">
				
				<c:forEach var="m" items="${ list }">
				<div style="width:20%; float:left; margin:0 12px;">
					<table class="wnListTable">
						<tr>
							<td class="workImg">
								<div class="titleImg">
									<img class="writerImg" src="${ contextPath }/resources/uploadFiles/writerProfile/${ m.changeName }" width="150px" height="150px" style="border-radius:15px;">
									<input type="hidden" value="${ m.userId }">
								</div>
							</td>
						</tr>
						<tr>
						<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="contentTd" align="center">
								<span style="font-weight:bold;">${ m.nickName }</span> 작가
							</td>
						</tr>
						<tr>
						<td>&nbsp;</td>
						</tr>
					</table>
				</div>
				</c:forEach>
				
				
				
				<script>
					$(".writerImg").click(function(){
						var userId = $(this).parent().children("input").val();
						console.log(userId);
						location.href="selectWnList.wn?userId="+userId+"&gradeType=1";
						//selectWnList.wn?userId="+userId+"&gradeType=1";
					})
			
				</script>
				</div>
  					
  					
  					
  					
				</div>
    </div>
    <div class="col-sm-2">
     <img src="${ contextPath }/resources/images/advertisement.png" width="100%">     
    </div>
  </div>
</div>

<jsp:include page="common/mypgFooter.jsp"/>

</body>
</html>