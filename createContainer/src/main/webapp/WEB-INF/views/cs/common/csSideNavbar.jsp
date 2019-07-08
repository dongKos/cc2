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
		
		width:200px;
		height:20px;
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
	
	#logo{
	width:200px;
	
	}
	.mainLogo2 {
	width:200px;
	height:170px;
	
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
	<div id="logo">
	<img class="mainLogo2" src="${ contextPath }/resources/images/logo.png">
	</div>
	<div id="menus">
		<ul>
			
			<li><button class="btn btn-primary" onclick="goNotice();">공지사항</button></li>
         	<li><button class="btn btn-primary" onclick="goFaq();">FAQ</button></li>
			<li><button class="btn btn-primary" onclick="goGuide();">사이트 이용안내 / 약관</button></li>
			<li><button class="btn btn-primary" onclick="goQue();">일대일 문의</button></li>
		
		</ul>
	</div>
	<script>
		function goNotice(){
			location.href="NoticeList.mg"
		}
		function goFaq(){
			location.href="Faq.mg"
		}
		function goGuide(){
	        location.href="Guide.mg";
	    }
		function goQue(){
			location.href="mtmQue.mg";
		}
	   
	</script>
</body>
</html>