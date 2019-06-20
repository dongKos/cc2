<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner" style="height:400px;">
    <div class="carousel-item active">
      <img src="${contextPath }/resources/images/logo.png" alt="Los Angeles" style="max-width:100%; height:400px; align:center">
    </div>
    <div class="carousel-item">
      <img src="${contextPath }/resources/images/logo.png" alt="Chicago" style="max-width:100%; height:400px; align:center">
    </div>
    <div class="carousel-item">
      <img src="${contextPath }/resources/images/logo.png" alt="New York" style="max-width:100%; height:400px; align:center">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon" style="font-color:black;"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>

</div>
</body>
</html>