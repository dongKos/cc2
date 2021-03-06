<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
.introArea{
	margin-top:30px;
	border:1px solid lightgray;
	padding: 15px 15px 15px 15px;
}
.introTable{
	width:100%;
	text-align:center;
	
}
.introImg{
	padding:5px 5px 5px 5px;
}
.introImg img{
	width:200px;
	height:160px;
}
.wnrBtn{
	width:160px;
	height:30px;
	border-radius:8px 8px 8px 8px;
	background-color:skyblue;
	color:white;
	border:1px solid skyblue;
	font-size:14px;
	font-weight:bold;
	cursor:pointer;
	margin-left:10px;
}
.wnrBtn:hover{
	background-color:#84CEFA;
	color:white;
}
.wnrTitle{
	font-weight:bold;
	font-size:17px;
}
.wnrIntro{
	padding:10px 30px 10px 30px;
	text-align:left;
}
.wnrListArea{
	margin-top:30px;
	width:100%;
	padding:0px 30px 0px 30px;
}
.wnrImg{
	width:170px;
}
.subImg{
	padding: 10px 10px 10px 10px;
}
.subImg img{
	width:140px;
	height:110px;
}
.wnrTable{
	border-top:1px solid lightgray;
	width:100%;
}
.wnrTable tr>td{
	height:47px;
}
.wnrContent{
	padding-left:30px;
}
.wnUpdateBtn{
	width:130px;
	height:25px;
	border-radius:8px 8px 8px 8px;
	background-color:skyblue;
	color:white;
	border:1px solid skyblue;
	font-size:14px;
	font-weight:bold;
	cursor:pointer;
}
.wnDeleteBtn{
	width:130px;
	height:25px;
	border-radius:8px 8px 8px 8px;
	background-color:white;
	color:skyblue;
	border:1px solid skyblue;
	font-size:14px;
	font-weight:bold;
	cursor:pointer;
}
.cancleBtn{
	width:100px;
	height:25px;
	border-radius:8px 8px 8px 8px;
	background-color:skyblue;
	color:white;
	border:1px solid skyblue;
	font-size:14px;
	font-weight:bold;
	cursor:pointer;
}
.deleteBtn{
	width:100px;
	height:25px;
	border-radius:8px 8px 8px 8px;
	background-color:white;
	color:skyblue;
	border:1px solid skyblue;
	font-size:14px;
	font-weight:bold;
	cursor:pointer;
}
.wnrBtnArea{
	text-align:right;
	padding-right:30px;
}
.wnrArea{
	padding:0px 20px 50px 20px;
}
.introImg{
	position:relative;
	width: 30%;
    height: 162px;
}
.wnStatus{ 
	position:absolute;
    top: 51px;
    left: 41px;
	width:60px;
	line-height:40px;
	z-index:100;
	font-size:18px;
	font-weight:bold;
	background-color: #ffffff;
	opacity: 0.5;
	color:red;
}
.subImg{
	position:relative;
}
.wnrStatus{
	text-align:center;
	position:absolute;
    top: 10px;
    left: 10px;
	width:40px;
	line-height:30px;
	z-index:100;
	font-size:16px;
	font-weight:bold;
	background-color: #ffffff;
	opacity: 0.5;
	color:red;
}
.wnrTitleArea{
	width:300px;
	line-height:40px;
	/* background-color:lightgray; */
	cursor:pointer;
}
.titleArea{
	width:100%;
	line-height:130px;
	cursor:pointer;
	margin-bottom:0px;
}
.modal{
	margin-top:30%;
}
.modal-title{
	font-weight:bold;
}
.modal-footer{
	text-align:center;
}
p{
    float: left;
    padding-left: 15%;
}
.mainThumbnail{
	width:50%;
	height:50%;
}

.reportTable{
	margin:0 auto;
	width:90%;
}
.reportRe{
	width:150px;
	
}
.reportContents{
	padding-top:20px;
}
.reportCa{
	text-align:right;
	height:50px;
	border-bottom:1px solid lightgray;
}
.reportSelect{
	width:120px;
}
.reportTextArea{
	background-color:white;
	padding:10px 10px 10px 10px;
	width:100%;
    height:140px;
    border:1px solid skyblue;
    border-radius: 10px;
}
.reportText{
	width:100%;
	height:100px;
	border:none;
	resize:none;
}
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<c:set var="userId" value="${ m.userId }"/>
	<!-- 서비스 상단 네비바 -->
	<jsp:include page="../main/common/serviceNavbar.jsp"/>
	<!-- 웹소설 중단 네비바 -->
	<jsp:include page="common/webtoonMenubar.jsp"/>
	<!-- 웹소설 회차 목록 -->
	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10 wnrArea">
				<div class="introArea">
				
					<table class="introTable">
						<tr>
							<td rowspan="3"width="210">
								<%-- <c:set var="workStatus" value="${ wt.workStatus }" />
								<c:if test="${ workStatus eq 'COMPLTE'}"> --%>
								<div class="introImg">
									<img class="mainThumbnail" src="${ contextPath }/resources/uploadFiles/webtoonMain/${ wt.changeName }">
								</div>
							<%-- 	</c:if>
								<c:if test="${ workStatus eq 'CLOSE'}">
								<div class="wnStatus">완결</div>
								<div class="introImg">
									<img src="${ contextPath }/resources/uploadFiles/webtoonMain/${ wt.changeName }">
								</div>
								</c:if> --%>
							</td>
							<td width="220" height="50%">
								<p class="wnrTitle">${ wt.wTitle }</p>
							</td>
							<td>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<p class="wtrIntro">${ wt.wIntro }</p>
							</td>
						</tr>
					
						<tr>
							<td colspan="2">
							<!-- 로그인 유저가 작가의 아이랑 동일 할경우 -->
							
							
							
							<c:if test="${ !empty sessionScope.loginUser}">
								<c:if test="${ loginUser.userId eq wt.userId}">
									<button class="wnrBtn" type="button" onclick="location.href='insertRoundFrom.wt?wid=' + ${wt.wid}">신규 회차 등록</button>
									<button class="wnrBtn" type="button" onclick="location.href='workUpdateForm.wt?wid=' + ${wt.wid}">작품 정보 수정</button>
									<button class="wnrBtn" type="button" onclick="location.href='updateRest.wt?wid='+ ${wt.wid}">휴재 신청</button>
								</c:if>
							<!-- 로그인유저와 작가의 아이디와 다를 경우 -->
								<c:if test="${loginUser.userId ne wt.userId }">
									<button class="wnrBtn" type="button" id="nullUser">관심작품등록</button>
									<button class="wnrBtn" type="button" onclick="location.href='anthorWork.wt?wid=' + ${wt.wid}">다른작품보기</button>
									<button class="wnrBtn" type="button" id="nullUser1" data-toggle="modal" data-target="#myModal1" >작품 신고</button>
									<input type="hidden" value="${wt.wid }"/>
								</c:if>
							</c:if>	
								<c:if test="${ empty sessionScope.loginUser}">
									<button class="wnrBtn" type="button" id="nullUser2">관심작품등록</button>
									<button class="wnrBtn" type="button" onclick="location.href='anthorWork.wt?wid=' + ${wt.wid}">다른작품보기</button>
									<button class="wnrBtn" type="button" id="nullUser3">작품 신고</button>
								</c:if>
								
							</td>
						</tr>
					</table>
				</div>
				
				
				
				
				
				
				
				
				
				
				<div class="modal fade" id="myModal1" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">신고하기</h4>
							</div>
							<div class="modal-body">
								<table class="reportTable">
									<tr>
										<td class="reportCa" colspan="2">
											신고유형 &nbsp;
											<select class="reportSelect" name="reportCategory">
												<option value="RE_CTG1">욕설</option>
												<option value="RE_CTG2">비방</option>
												<option value="RE_CTG3">인격모독</option>
												<option value="RE_CTG4">저작권침해</option>
												<option value="RE_CTG5">명예회손</option>
												<option value="RE_CTG6">청소년유해</option>
												<option value="RE_CTG7">불법음란</option>
												<option value="RE_CTG8">기타</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="reportRe">
											신고사유
										</td>
										<td class="reportContents">
											<div class="reportTextArea">
												<textarea class="reportText" name="reportText" cols="25" rows="20" placeholder="내용을 입력하세요."></textarea>
												<p class="cntrArea"><span class="cntrText">0 </span>/ 500</p>
											</div>
										</td>
									</tr>
								</table>
							</div>
							<div class="modal-footer">
								<button type="button" class="cancleBtn" data-dismiss="modal">취소하기</button>
								<button type="button" class="insertStarP" onclick="insertWorkReport()">신고하기</button>
							</div>
						</div>
					</div>
				</div>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				 <input type="hidden" name="wid" value="${wt.wid }">
				<div class="wnrListArea">
					<c:forEach var="wtr" items="${ list }" varStatus="status">
						<table class="wnrTable">
							<tr>
								<td rowspan="3" class="wnrImg">
									<div class="subImg">
										<%-- <c:if test="${ workStatus eq 'CLOSE'}">
						         			<div class="wnrStatus">완결</div>
									<img src="${ contextPath }/resources/uploadFiles/webtoonSub/${ wtr.changeName }">
								</c:if> --%>
										<%-- <c:if test="${ workStatus eq 'COMPLTE'}"> --%>
										<img class="roundThumbnail" src="${ contextPath }/resources/uploadFiles/webtoonSub/${ wtr.changeName }">
										<%-- </c:if> --%>
									</div>
								</td>
								<td colspan="2" class="wnrContent"></td>
							</tr>
							<tr>
								<td class="wnrContent">
									<p class="wnrTitleArea">${ wtr.rTitle }</p>
								</td>
								<td class="wnrBtnArea"><input type="hidden" name="rid" 
									value="${ wtr.rid }">
									<button class="wnUpdateBtn" name="wnUpdateBtn">회차 정보
										수정</button>
									<br>
								<br>
									<button class="wnDeleteBtn" name="wnDeleteBtn" type="button"
										class="btn btn-info btn-lg" data-toggle="modal"
										data-target="#myModal<c:out value="${status.index}" />">회차
										삭제</button></td>
							</tr>
							<tr>
								<td colspan="2" class="wnrContent">조회&nbsp; ${ wtr.vCount }
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${ wtr.ruploadDate }</td>
							</tr>
						</table>
						<div class="modal fade"
							id="myModal<c:out value="${status.index}" />" role="dialog">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">작품 삭제</h4>
									</div>
									<div class="modal-body">
										<p>
											정말로 삭제 하시겠습니까?<br>
											<br>삭제하시면 복구가 불가능합니다.
										</p>
									</div>
									<div class="modal-footer">
										<input type="hidden" class="wid" value="${ wnr.rid }">
										<button type="button" class="cancleBtn" data-dismiss="modal">취소하기</button>
										<button type="button" class="deleteBtn" name="deleteBtn">삭제하기</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					
					<script>
					
					$(function(){
						$('.wnrListArea').find($("button[name=deleteBtn]")).click(function(){
							var rid = $(this).parents().children("input").val();
							console.log(rid);
							location.href = "deleteWnRound.wn?rid=" + rid;
						});	
						
						$('.wnrListArea').find($("button[name=wnUpdateBtn]")).click(function(){
							var rid = $(this).parents().children("input").val();
							console.log("회차수정버튼눌림" + rid);
							location.href = "updateRoundForm.wt?rid=" + rid;
						});
						
						
						$('.roundThumbnail').click(function(){
							var rid = $(this).parents().parents().parents().parents()
							.children("tr").children("td").children("input").val();
							console.log(rid);
							console.log("test");
							var wid = $(this).parents().parents().parents().
							parents().parents().parents().children("input").val();
							console.log("wid : " + wid);
							location.href = "contentView.wt?rid=" + rid + "&wid=" + wid;
							
						});
						
						$("#nullUser").click(function(){
							var wid = $(this).siblings("input").val();
							alert("관심등록 성공!!")
							location.href = "attention.wt?wid=" + wid;
					
							});

						$("#nullUser1").click(function() {
								//신고로 메소드로 갈예정
							});
						
						$("#nullUser2").click(function(){
							alert("로그인이필요합니다")
							location.href = "loginForm.me";
							});

						$("#nullUser3").click(function() {
							alert("로그인이필요합니다")
							location.href = "loginForm.me";	
							});
						
						//작품신고 
						$('.reportText').keyup(function(){
							var inputLength=$(this).val().length;
							var remain=0+inputLength;
							
							$('.cntrText').html(remain);
							if(remain > 500){
								console.log("500자 이상!");
							 $('.cntrText').css('color','red');
							}
						});
						
						
						//작품신고
						
					});
				
					function insertWorkReport(){
					 	var reportType = 'WORK';
						var reportCategory = $(".reportSelect option:selected").val();
						var status = 'wait';
						var reportReason = $(".reportText").val();
						var wid = ${ wt.wid };
						console.log(reportType);
						console.log(reportCategory);
						console.log(status);
						console.log(reportReason);
						console.log(wid); 
						
						 $.ajax({
							url:"insertWorkReport.wt",
							type:"post",
							data:{reportType:reportType, reportCategory:reportCategory,
								  status:status, reportReason:reportReason, wid:wid},
							success:function(data){
								location.reload();
							},
							error:function(status){
								alert(status);
							}
						}); 
					}
					</script>
				</div>
				
				
				<div id="pagingArea" align="center">
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="wnrListBack" value="/roundList.wt?">
							<c:param name="wid" value="${ wt.wid }"/>
							<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ wnrListBack }">[이전]</a> &nbsp;
					</c:if>
					
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="4"><b>[${ p }]</b></font>
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="wnrListCheck" value="/roundList.wt?">
								<c:param name="wid" value="${ wt.wid }"/>
								<c:param name="currentPage" value="${ p }"/>
							</c:url>
							<a href="${ wnrListCheck }">${ p }</a>
						</c:if>
					</c:forEach>
					
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						&nbsp; [다음]
					</c:if>
					
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="wnrListEnd" value="/roundList.wt?">
							<c:param name="wid" value="${ wt.wid }"/>
							<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
						</c:url>						
						<a href="${ wnrListEnd }">&nbsp;[다음]</a>
					</c:if>
					
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
</body>
</html>















