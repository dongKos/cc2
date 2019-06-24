<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="header-wrap">
                        <form class="form-header" action="" method="POST">
                            <input class="au-input au-input--xl" type="text" name="search" placeholder="Search for datas &amp; reports..." />
                            <button class="au-btn--submit" type="submit">
                                <i class="zmdi zmdi-search"></i>
                            </button>
                        </form>
             			<div>
							<span>${loginUser.userName }님 안녕하세요!</span>&nbsp;&nbsp;&nbsp;&nbsp;
             				<button class="btn btn-primary" onclick="location.href='logout.me'">로그아웃</button>
             			</div>
                    </div>
                </div>
            </div>
</body>
</html>