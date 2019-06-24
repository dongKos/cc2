<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
/* #navbar{
margin-top:20%;

} */
.container{
margin-top:15%;
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
    <div class="dropdown">
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Dropdown Example
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a href="#">날짜별</a></li>
      <li><a href="#">카테고리별</a></li>
     
    </ul>
  </div>
    
    
      <div class="point">
					 <table class="table table-condensed">
    <thead>
      <tr>
        <th>게시글 번호</th>
        <th>구분</th>
        <th>아이디</th>
        <th>제목</th>
        <th>작성일자</th>
        
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>ㄱ</td>
        <td>ㅇㅇ</td>
        <td>ㅇㅇ</td>
        <td>ㅇㅇ</td>
      </tr>
      <tr>
        <td>1</td>
        <td>ㄱ</td>
        <td>ㅇㅇ</td>
        <td>ㅇㅇ</td>
        <td>ㅇㅇ</td>
      </tr>
      <tr>
        <td>1</td>
        <td>ㄱ</td>
        <td>ㅇㅇ</td>
        <td>ㅇㅇ</td>
        <td>ㅇㅇ</td>
      </tr>
    </tbody>
  </table>
  					<br>
				</div>
    </div>
    <div class="col-sm-2">
     <img src="${ contextPath }/resources/images/advertisement.png" width="100%">     
    </div>
  </div>
</div>
	<%-- 
	
	<div id=navbar>
	
	 --%>
	
	
	<!-- <div style="display:block;">
	 <table class="table table-condensed">
    <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
	
	
	</div>
	 -->
	
	
	</div>
	
	
</body>
</html>