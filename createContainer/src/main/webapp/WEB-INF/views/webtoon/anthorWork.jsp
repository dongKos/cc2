<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
.thumbnail{
     width: 140px;
     height: 135px;
 }
 .subInfo{
   display: inline-block;
       padding-left: 50px;
 }
 .thumbnailArea{
 	display: inline-block;
 }
.totalArea{
	    height: 160px;
}
 
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<!-- 서비스 상단 네비바 -->
	<jsp:include page="../main/common/serviceNavbar.jsp"/>
	<!-- 웹소설 중단 네비바 -->
	<jsp:include page="common/webtoonMenubar.jsp"/>
	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
			<h3>${ list1.userName}&nbsp;&nbsp;&nbsp;&nbsp;님의 작품</h3>
			<hr>
				<c:forEach var="wtr" items="${list}">
					<table>
				<hr>
						<tbody class="thumbBody">
							<tr>
								<td>
									<div class="totalArea">
										<div class="thumbnailArea">
											<img class="thumbnail" src="${contextPath}/resources/uploadFiles/webtoonMain/${wtr.changeName }" />
											<input type="hidden" value="${wtr.wid }"/>
										</div>
										<td>
											<div class="subInfo">
												<h4>장르&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;${ wtr.genreExplain }</h4>
												<br>
												<h4>${ wtr.wTitle }</h4>
											</div>
										</td>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</c:forEach>
				
					<div id="pagingArea" align="center">
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="wnrListBack" value="/selectWnRoundList.wn?">
							<c:param name="wid" value="${ wn.wid }"/>
							<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ wnrListBack }">[이전]</a> &nbsp;
					</c:if>
					
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="4"><b>[${ p }]</b></font>
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="wnrListCheck" value="/selectWnRoundList.wn">
								<c:param name="wid" value="${ wn.wid }"/>
								<c:param name="currentPage" value="${ p }"/>
							</c:url>
							<a href="${ wnrListCheck }">${ p }</a>
						</c:if>
					</c:forEach>
					
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						&nbsp; [다음]
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="wnrListEnd" value="/selectWnRoundList.wn">
							<c:param name="wid" value="${ wn.wid }"/>
							<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
						</c:url>
						<a href="${ wnrListEnd }">&nbsp;[다음]</a>
					</c:if>
					
				</div>
			</div>
		</div>
	</div>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br><br>
	<br>
	<script>
		$(function(){
			$(".thumbnail").click(function(){
				var wid = $(this).parents().children("input").val();
				console.log(wid);
				
				location.href= "roundList.wt?wid="+ wid;
				
			});
		});
	</script>
</body>
</html>