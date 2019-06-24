<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.profile table{
		width: 100%;
	}
	.profile table td {
		padding: 5px;
		text-align:center;
	}
	.profile table td img {
		weight: 100%;
		border-radius:50px;
		align:center;
	}
	#menus {
		border: 1px solid lightgray;
	}
	#menus ul {
		padding: 5px;
		margin: 0;
	}
	#menus ul #menuTitle {
		border-bottom: 1px solid lightgray; 
		text-align: center;
		
	}
	#menus ul li {
		list-style: none;
		line-height: 3em;
	}
	#menus ul li button {
		width: 100%;
	}
</style>
<script>
	//pageController 서블릿 요청 하는 함수
	function page(page){
		console.log(page);
		location.href="${contextPath}/"+ page + ".page";
	}
</script>
</head>
<body>
	
	<div id="menus">
		<ul>
			<li id="menuTitle">마이페이지</li>
			<li><button class="btn btn-primary" onclick="goNotice();">공지사항</button></li>
         	<li><button class="btn btn-primary" onclick="gointerestWa()">FAQ</button></li>
			<li><button class="btn btn-primary" onclick="goCreditPage();">사이트 이용안내</button></li>
		
		</ul>
	</div>
	<script>
		function goNotice(){
			location.href="mypgCredit.mg"
		}
		function goInfoPage(){
			location.href="mypgInfoPass.mg"
		}
		function gointerestWt(){
	        location.href="mypgIterestWt.mg";
	    }
	   
	</script>
</body>
</html>