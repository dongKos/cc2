<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="margin-top: 3.5%;">

	
	<jsp:include page="common/writerbanner.jsp"/>
  
<div class="container">
  <div class="row">
  <jsp:include page="common/mypageNavbar.jsp"/>
    <div class="col-sm-3">
  	 	<jsp:include page="common/WriterpageSideNavbar.jsp"/>
    </div>
    <div class="col-sm-7">
      <div class="point">
					<ul class="nav nav-tabs">
    					<li class="active" style="width:50%; text-align:center;"><a href="writerReqPremium.mg" style="font-weight:bold;">유료 작품 신청</a></li>
    					<li style="width:50%; text-align:center;"><a href="writerReqPortfolio.mg">정식 포트폴리오 신청</a></li>
    					
  					</ul>
  					<ul class="nav nav-tabs">
    					<li style="width:50%; text-align:center;"><a href="writerReqPremium.mg" style="">웹툰</a></li>
    					<li style="width:50%; text-align:center;"><a href="writerReqPremium2.mg">웹 소설</a></li>
    					
  					</ul>
  					<br>
  			<div class="wnListDiv">
				
				<c:forEach var="wn" items="${ list }">
				<div style="width:20%; float:left; margin:0 12px;">
					<table class="wnListTable">
						<tr>
							<td class="workImg">
								<div class="titleImg">
									<img src="${ contextPath }/resources/uploadFiles/webnovelMain/${ wn.changeName }" width="150px" height="150px" style="border-radius:15px;">
									<input type="hidden" value="${ wn.wid }">
								</div>
							</td>
						</tr>
						<tr>
						<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="contentTd" align="center">
								${ wn.wTitle }
							</td>
						</tr>
						<tr>
						<td>&nbsp;</td>
						</tr>
					</table>
				</div>
				</c:forEach>
				
				
				
				<script>
					$(function(){
						$('.wnListDiv').find('td').children('button').click(function(){
							var wid = $(this).parents().parents().children("td").eq(1).children("input").val();
							
							location.href = "selectWnUpdateOne.wn?wid=" + wid;
						});
						$('.wnListDiv').find('td').children('div').children('img').click(function(){
							var wid = $(this).parents().children("input").val();
							location.href = "selectReqForm.mg?wid=" + wid;
						});
					});
			
				</script>
				</div>
				<div style="clear:both;"></div>
				<div id="pagingArea" align="center">
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="wnListBack" value="/writerReqPremium2.mg">
							<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ wnListBack }">[이전]</a> &nbsp;
					</c:if>
					
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="4"><b>[${ p }]</b></font>
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="wnListCheck" value="/writerReqPremium2.mg">
								<c:param name="currentPage" value="${ p }"/>
							</c:url>
							<a href="${ wnListCheck }">${ p }</a>
						</c:if>
					</c:forEach>
					
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						&nbsp; [다음]
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="wnListEnd" value="/writerReqPremium2.mg">
							<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
						</c:url>
						<a href="${ wnListEnd }">&nbsp;[다음]</a>
					</c:if>
					
				</div>
	  </div>
    </div>
    <div class="col-sm-2">
     <img src="${ contextPath }/resources/images/advertisement.png" width="100%">     
    </div>
  </div>
</div>
<script>
</script>
</body>
</html>