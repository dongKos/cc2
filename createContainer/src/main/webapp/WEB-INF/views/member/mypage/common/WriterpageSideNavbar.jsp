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
	<div class="profile">
		<table>
			<tr>
				<td><img src="${contextPath}/resources/images/icon/avatar-06.jpg"></td>
				<td>김동환님</td>
			</tr>
			<tr>
				<td colspan="2">
					보유포인트 : 5000원<br>
					보유이용권 : 0개
				</td>
				
			</tr>
		</table>
	</div>
	<div id="menus">
		<ul>
			<li id="menuTitle">작가페이지</li>
			<li><button class="btn btn-primary" onclick="goWriteMyWt();">My 웹툰</button></li>
            <li><button class="btn btn-primary" onclick="goWriteMyNo()">My 웹소설</button></li>
         	<li><button class="btn btn-primary" onclick="goAdministration();">정산 관리</button></li>
         	<li><button class="btn btn-primary" onclick="goSupport();">후원 신청</button></li>
			<li><button class="btn btn-primary" onclick="gowriterProfile()">작가 프로필</button></li>
			<li><button class="btn btn-primary" onclick="goReqPremium();">유료 작품 신청</button></li>
			<li><button class="btn btn-primary" onclick="goReqIllust()">일러스트 요청 목록</button></li>
			<li><button class="btn btn-primary" onclick="goRest()">휴재 내역</button></li>
		</ul>
	</div>
	<script>
		function gowriterProfile(){
			location.href="writerInfoPass.mg"
		}
		function goReqPremium(){
			location.href="writerReqPremium.mg"
		}
		function goReqIllust(){
			location.href="writerReqIllust.mg"
		}
		function goRest(){
			location.href="writerRest.mg"
		}
		function goWriteMyWt(){
	        location.href="writeWtFree.mg"
	    }
	    function goWriteMyNo(){
	        location.href="writeWnoFree.mg"
	    }
	    function goAdministration(){
	        location.href="Administration.mg"
	    }
	    function goSupport(){
	        location.href="Support.mg"
	    }

		

	</script>
</body>
</html>