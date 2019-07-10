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
    <div class="col-sm-7">
      <div class="point">
					<ul class="nav nav-tabs">
    					<li class="active" style="width:100%;"><a href="#" style="font-weight:bold;">회원 탈퇴 안내</a></li>
    					
  					</ul>
  					<br>
  					<textarea style="width: 100%; height: 200px; resize:none">1. 회원님의 작품과 큐레이션 등 모든 정보가 삭제되며 복구할 수 없습니다.
2. 다른 사람에게 큐레이션된 작품, 사람들과 이야기 나눈 댓글도 모두 삭제됩니다.
(단, 콜라보레이션에 당선된 작품은 별도로 보관됩니다. 이용약관 보기)
3. 외부로 공유된 회원님의 프로필 페이지와 작품 상세 페이지에 접속할 수 없습니다.
4. 콘텐츠샵 판매자로 가입되어 있는 경우, 먼저 판매자 탈퇴가 되어야 CC 회원 탈퇴가 가능합니다.
​​5. 후원 창작자센터에 가입되어 있는 경우, 먼저 창작자센터에서 탈퇴가 되어야 CC 회원 탈퇴가 가능합니다.
  					
  					</textarea>
				<br>
  					<!--  <h4 align="center" style="color:red;">어쩔고저쩌고 탈퇴하면 저쩌고 합니다.</h4>-->
  					<div style="text-align:center;">
  					<input type="checkbox" checked><label>&nbsp; 모든 사항을 읽었으며 이에 동의합니다.</label>
		  					<br>
  					<button type="button" class="btn btn-info" onclick="memberResign()">확인</button>
  					</div>
  					
				</div>
    </div>
    <div class="col-sm-2">
     <img src="${ contextPath }/resources/images/advertisement.png" width="100%">     
    </div>
  </div>
</div>


<script>

function memberResign(){
	location.href="memberResign.mg";
}

</script>
<jsp:include page="common/mypgFooter.jsp"/>

</body>
</html>