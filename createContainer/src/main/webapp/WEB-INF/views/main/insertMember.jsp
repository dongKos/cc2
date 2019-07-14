<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreateContainer-회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/main.css">
</head>
<body>
	<div class="insertForm">
		<div class="logo">
			<a href="${ contextPath }/mainHome.me">
				<img class="logoImg" src="${ contextPath }/resources/images/logo.png">
			</a>
		</div>
		<form action="insertMember.me" method="post" novalidate>
			<table class="lineTable">
				<tr>
					<td class="hr"><hr></td>
					<td class="line"><h4>간단 가입</h4></td>
					<td class="hr"><hr></td>
				</tr>
			</table>
			
			<table class="step">
				<tr>
					<td><span class="second">1</span></td>
					<td class="hr"><hr></td>
					<td><span class="first">2</span></td>
				</tr>
			</table>
			<br><br><br>
			<div class="signUpBox">
				<label><span class="star">*</span>아이디</label>
				<input class="insertInput" type="text" name="userId" placeholder="아이디를 입력해주세요." maxlength="20" autofocus required>
				<label class="control-label " id="userIdResult"></label><br><br><br>
				
				<label><span class="star">*</span>비밀번호</label>
				<input class="password" id="password" type="password" name="userPwd" placeholder="비밀번호를 입력해주세요." maxlength="20" required>
				<input class="password2" id="password2" type="password" name="userPwd2" placeholder="비밀번호를 다시 한번 입력해주세요." maxlength="20" autofocus required>
				<label class="control-label " id="passwordResult"></label><br><br><br>
				
				<label><span class="star">*</span>이름</label>
				<input class="insertInput" type="text" name="userName" placeholder="이름을 입력해주세요." maxlength="20"  required><br><br>
				
				<label><span class="star">*</span>닉네임</label>
				<input class="insertInput" type="tel" name="nickName" placeholder="닉네임을 입력해주세요." maxlength="20"  required>
				<label class="control-label " id="nickNameResult"></label><br><br><br>
				
				<label><span class="star">*</span>전화번호</label>
				<input class="insertInput" type="text" name="phone" placeholder="01012345678  ( - 를 제외하고 입력하세요.)" maxlength="20"  required><br><br>
				
				<label><span class="star">*</span>이메일</label>
				<input class="insertInput" type="email" name="email" placeholder="이메일을 입력해주세요." maxlength="40"  required><br><br>
			</div>
			
			
			<table class="cTable">
				<tr>
					<td class="terms" colspan="2">
						<input id="cb1" type="checkbox" required><label for="cb1">모두 동의합니다.</label>
					</td>
				</tr>
				<tr>
					<td colspan="2"><hr></td>
				</tr>
				<tr>
					<td class="terms"><input id="cb2" class="subCheck" type="checkbox"><label for="cb2">이용약관 </label></td>
					<td class="agree"><span>(필수 동의)</span></td>
				</tr>
				<tr>
					<td class="terms"><input id="cb3" class="subCheck" type="checkbox"><label for="cb3">개인정보 취급방침 </label></td>
					<td class="agree"><span>(필수 동의)</span><br></td>
				</tr>
				<tr>
					<td class="terms"><input id="cb4" class="subCheck" type="checkbox"><label for="cb4">이벤트 알림 </label></td>
					<td class="agree"><span>(선택 동의)</span></td>
				</tr>
				<tr>
					<td colspan="2"><hr></td>
				</tr>
			</table>
			
			<br>
			<div class="divBox">
				<button id="submit" onsubmit="return check()" class="signUpBtn signUp">회원가입</button>
			</div>
		</form>
	</div>
	<br><br><br><br>
	
	
	<script>
		$(".signUpBtn").on("click", function(){
			var userId = $("input[name=userId]").val();
			var userPwd = $("input[name=userPwd]").val();
			var userPwd2 = $("input[name=userPwd2]").val();
			var userName = $("input[name=userName]").val();
			var nickName = $("input[name=nickName]").val();
			var phone = $("input[name=phone]").val();
			var email = $("input[name=email]").val();
			if(userId==""){
				alert("아이디를 입력하세요.");
				return false;
			}else if(userPwd==""){
				alert("비밀번호를 입력하세요.");
				return false;
			}else if(userPwd2==""){
				alert("비밀번호확인를 입력하세요.");
				return false;
			}else if(userName==""){
				alert("이름을 입력하세요.");
				return false;
			}else if(nickName==""){
				alert("닉네임을 입력하세요.");
				return false;
			}else if(phone==""){
				alert("전화번호를 입력하세요.");
				return false;
			}else if(email==""){
				alert("이메일 입력하세요.");
				return false;
			}else if($("input:checkbox[id=cb2]").is(":checked") == false){
	    		alert("이용약관 동의 확인");
	    		return false;
	    	}else if($("input:checkbox[id=cb3]").is(":checked") == false){
	    		alert("개인정보 취급방침 동의 확인");
	    		return false;
	    	}
		});
		
		$(function(){
			
			
			
		    $("#cb1").click(function(){
		        var chk = $(this).is(":checked");//.attr('checked');
		        if(chk) $(".subCheck").prop('checked', true);
		        else  $(".subCheck").prop('checked', false);
		    });
		    
		    $(".signUp").click(function(){
		    	
		    });
		});
		
		$("input[name=userId]").change(function(){
			var userId = $("input[name=userId]").val();
			$.ajax({
				url:"duplicationCheck.me",
				type:"post",
				data:{userId:userId},
				success:function(data){
					if(data > 0){
						$("#userIdResult").text("사용 불가능한 아이디 입니다.").css("color", "#FCACAC");
					}else if(data == 0){
						$("#userIdResult").text("사용 가능한 아이디 입니다.").css("color", "#45A5FA");
					}
				},
				error:function(status){
					alert(status);
				}
			});
		});
		$("input[name=nickName]").change(function(){
			var nickName = $("input[name=nickName]").val();
			console.log("젠장");
			$.ajax({
				url:"duplicationCheckNick.me",
				type:"post",
				data:{nickName:nickName},
				success:function(data){
					console.log(data);
					if(data > 0){
						console.log(data);
						$("#nickNameResult").text("사용 불가능한 닉네임 입니다.").css("color", "#FCACAC");
					}else if(data == 0){
						console.log(data);
						$("#nickNameResult").text("사용 가능한 닉네임 입니다.").css("color", "#45A5FA");
					}
				},
				error:function(status){
					alert(status);
				}
			});
		});
	
		
		
		$("#password2").change(function(){
			var password = $("#password").val();
			var password2 = $("#password2").val();
			console.log(password);
			console.log(password2);
			
			if(password == password2){
				$("#passwordResult").text("비밀번호가 일치합니다.").css("color", "#45A5FA");
				$("#submit").attr("disabled", false);
			}else{
				$("#passwordResult").text("비밀번호가 일치하지않습니다.").css("color", "#FCACAC");
				$("#submit").attr("disabled", true);
			}
		});
	</script>
</body>
</html>














