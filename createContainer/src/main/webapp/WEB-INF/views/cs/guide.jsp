<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  
<style>
 #navbar{
margin-top:20%;

} 
.container{
margin-top:15%;
}
.point{
border:1px solid #ececec;
height:500px;
margin-bottom:20%;


}







</style>


</head>
<body>
<div class="container">
  <div class="row">
<jsp:include page="../main/common/mainMenubar.jsp"/>
    <div class="col-sm-3">
  	 <jsp:include page="../cs/common/csSideNavbar.jsp"/>
    </div>
    <div class="col-sm-7">
    <h2>사이트 이용안내</h2>
      <div class="point">
	
			
			
			
			
	</div> <!-- point -->
    </div>
    <div class="col-sm-2">
     <img src="${ contextPath }/resources/images/advertisement.png" width="100%">     
    </div>
  </div>
</div>
	
	
	
	

	

</body>
</html>