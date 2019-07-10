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
				<td class="testImg"><img id="profilePic" width="150px" height="150px;" src="${contextPath}/resources/uploadFiles/writerProfile/${sessionScope.chageName}"></td>
				<td>${ sessionScope.loginUser.nickName }</td>
			</tr>
			<tr>
				<td colspan="2">
					보유이용권 : <label id="coin" value="0"></label>개
				</td>
				
			</tr>
		</table>
	</div>
	<div id="menus">
		<ul>
			<li id="menuTitle">마이페이지</li>
			<li><button class="btn btn-primary" onclick="gointerestWt();">관심작품</button></li>
         	<li><button class="btn btn-primary" onclick="gointerestWa()">관심작가</button></li>
			<li><button class="btn btn-primary" onclick="goCreditPage();">포인트충전</button></li>
			<li><button class="btn btn-primary" onclick="goInfoPage();">개인정보관리</button></li>
			<li><button class="btn btn-primary" onclick="goIllustAf()">일러스트내역</button></li>
			<li><button class="btn btn-primary" onclick="goQuestion();">1:1문의내역</button></li>
			<li><button class="btn btn-primary" onclick="goReport()">신고 내역</button></li>
			<li><button class="btn btn-primary" onclick="goResign()">회원탈퇴</button></li>
		</ul>
	</div>
	<script>
		function goCreditPage(){
			location.href="mypgCredit.mg"
		}
		function goInfoPage(){
			location.href="mypgInfoPass.mg"
		}
		function gointerestWt(){
	        location.href="attentionListWt.mg";
	    }
	    function gointerestWa(){
	       	location.href="attentionArtist.mg";
	    }
	    function goIllustAf(){ 
	        location.href="mypgIllustAf.mg";
	    }
	    function goQuestion(){
	        location.href="mypgQue.mg";
	    }
	    function goResign(){
	        location.href="mypgResign.mg";
	    }
	    function goReport(){
	        location.href="mypgReport.mg";
	    }

	</script>
	<script>
		$(document).ready(function(){
			//${contextPath}/resources/uploadFiles/writerProfile/fc430f965d9a4380aedc4eda0b4d92e0.PNG
			//var userId = ${ sessionScope.loginUser.userId };
			var userId = "<c:out value='${sessionScope.loginUser.userId}'/>";
			console.log("userId : ", userId);
		 	$.ajax({
				url:"selectMember.mg",
				type:"get",
				data:{userId:userId},
				success:function(data){
					console.log("data : " , data);	
					var changeName = data.replace("\"","");
					console.log(changeName.replace("\"",""));
					$("#profilePic").attr("src", "${contextPath}/resources/uploadFiles/writerProfile/"+changeName.replace("\"",""));
				},
				error:function(status){
					console.log("status : " , status);
					
				}
			
			});  
		 	$.ajax({
				url:"selectMemberMem.mg",
				type:"get",
				data:{userId:userId},
				success:function(data){
					console.log("data : " , data);	
					$("#coin").text(data.wallet);
				},
				error:function(status){
					console.log("status : " , status);
					
				}
			
			});  
			
			/* console.log("우에")
			var userId = ${sessionScope.loginUser.userId}
			$.ajax({
				url:"selectMember.mg",
				type:"post",
				data:{userId:userId},
				success:function(data){
					console.log(data);
				},
				error:function(status){
					console.log("우ㅇㄹㄴㄹㅇ에")
				}
			}) */
		})
	</script>
</body>
</html>