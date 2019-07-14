<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/5.7.0/css/font-awesome.min.css">
</head>

<body>
	<div class="container">

		<div class="row">

	<form action="IllSelectBoard.ill" method="post">
		<table class="table table-striped"
				style="text-align: center; border: 1px;">

				<thead>
					<tr>
						<th colspan="1"
							style="background-color: #eeeeee; text-align: center;">후기 작성</th>
					</tr>
				</thead>


				<c:out value="${blist}"/>
				<tbody>

					<tr>
						<td><input type="text" class="form-control" placeholder="글제목"
							name="bTitle" maxlength="50" readonly="readonly">${blist[0].bTitle}</td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용"
								name="bContent" maxlength="2048" style="height: 350px" readonly="readonly">${blist[0].bContent}</textarea>
						</td>

					</tr>

				</tbody>

			</table>

			<input type="submit" class="btn btn-primary pull-right" value="글쓰기"> <input type="reset"
				class="btn btn-primary pull-right" value="취소">

			</form>
		</div>

	</div>
</body>
</html>