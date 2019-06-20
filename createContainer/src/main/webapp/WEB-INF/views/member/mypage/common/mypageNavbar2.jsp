<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.navbar-inverse .navbar-nav>li>a:hover {
	cursor: pointer;
	}
	
	.navbar-inverse {
		opacity: 0.9;
		background: skyblue;
		border: none;
		font-weight: bold;
	}
	
	.navbar-inverse .navbar-nav>li>a {
		color: black;
	}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav" id='selectmenu'>
					<li><a onclick="fnMove('0')">Home</a></li>
				</ul>
				<%-- 	<ul class="nav navbar-nav navbar-right">
					<li ><a style="font-family: 'Megrim', cursive; font-weight: bold; cursor: pointer;" onclick="goProfile()">님</a></li>
					<li ><a style="font-family: 'Megrim', cursive; font-weight: bold;" 
						href="<%= request.getContextPath()%>/logout.me"><span
							class="glyphicon glyphicon-log-in"></span> Logout</a></li>
				</ul> --%>
			</div>
		</div>
	</nav>
</body>
</html>