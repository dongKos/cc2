<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/5.7.0/css/font-awesome.min.css">
  <script>
  	function reward(){
  		location.href="illustSupportReward.ill";
  	}
  </script>
  <style>
  	.main-img {
  		width: 100%;
  		background: pink;
  		height: 500px;
  	}
  </style>
</head>
<body>
<jsp:include page="common/IllustTopNavbar.jsp"/>
	<div class="container">
		<div class="row">
			<div class="main-img">
				asd
			</div>
		</div>
		
		<div class="row">
			<div class="img">
				<img alt="프로필 이미지">
			</div>
			<div class="profile">
				<h3>작가이름</h3>
				<p>#일러스트#일러스트#일러스트</p>	
			</div>
			<br>
			<button class="btn btn-primary form-control" onclick="reward();">후원하기</button>
		</div>
		<div class="row">
			<h2>작가소개</h2>
			<div class="text">
				사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살 수 있는 것이다 석가는 무엇을 위하여 설산에서<br>

청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에<br>
 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 따뜻한<br>

가는 노년에게서 구하지 못할 바이며 오직 우리 청춘에서만 구할 수 있는 것이다 청춘은 인생의 황금시대다 우리는 이 황금시대의 가치를 충분히 발휘하기 위하여 이 황금시대를 영원히 붙잡아 두기 위하여
			</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>