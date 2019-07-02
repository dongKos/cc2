<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판관리 - 게시글</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#refundTable tr").click(function(){
			var num = $(this).children().eq(0).text();
		});
		
		//선택된 사이드 메뉴바 표시
		var selectedUl = $("#board").parent().children();
		var selectedLi = selectedUl.children().children().eq(0);
		selectedUl.css({"display":"block"});
		selectedLi.css({"color":"skyblue"});
		
		//첫번째 셀렉트 박스 값이 있을 경우 두 번째 셀렉트 박스가 노출 되도록 합니다.
		var select1 = $("#select1");
		var select2 = $("#select2");
		select1.change(function(){
			if(select1.val() != 1){
				select2.css({"display":"inline-block"});
				$("#searchBtn").removeAttr("disabled");
			}else{
				select2.css({"display":"none"});
				$("#searchBtn").prop("disabled", true);
			}
		});
		
	});
	
	function search(){
		var select1 = $("#select1").val();
		var select2 = $("#select2").val();
		
		console.log(select1 + " " + select2);
		
		$.ajax({
			url:"boardType.ad",
			data:{select1:select1, select2:select2},
			type:"get",
			success:function(data){
				console.log(data);
				console.log(data.pi.currentPage);
				var table = $("#boardTable");
				var tbody = $("#boardTable tbody");
				
				tbody.html(" ");
				
				//테이블 영역 재생성
				for(var i = 0; i < data.list.length;i++){
					
					var date = new Date(data.list[i].joinDate).format("yyyy-MM-dd");
					var tr = $("<tr>");
					var userIdTd = $("<td>").text(data.list[i].userId);
					var userNameTd = $("<td>").text(data.list[i].userName);
					
					if(data.list[i].memberType == 1){
						var memberTypeTd = $("<td>").text("일반");
					}else{
						var memberTypeTd = $("<td>").text("프리미엄 작가");
					}
					var joinDateTd = $("<td class='text-right'>").text(date);
					
					if(data.list[i].wCount >= 5){
						var blackTd = $("<td class='text-right'>").text("블랙회원");
					}else{
						var blackTd = $("<td class='text-right'>").text("클린회원");
					}
					tr.append(userIdTd);
					tr.append(userNameTd);
					tr.append(memberTypeTd);
					tr.append(joinDateTd);
					tr.append(blackTd);
					tbody.append(tr);
					table.append(tbody);
				}
				
				
			},
			error:function(){
				console.log("실퍂!");
			}
		})
		
	}
</script>
</head>

<body class="animsition">
    <div class="page-wrapper">
        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block">
        	<jsp:include page="common/adminSideNavbar.jsp"/>
        </aside>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
           		<jsp:include page="common/adminTopNavbar.jsp"/>
            </header>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="m-b-25 form-group">
                                	<select id="select1">
                                		<option value="1">전체</option>
                                		<option value="2">1:1문의</option>
                                		<option value="3">공지사항</option>
                                	</select>
                                	<select id="select2" style="display:none;">
                                		<option value="1" selected>전체</option>
                                		<option value="2">웹툰</option>
                                		<option value="3">웹 소설</option>
                                		<option value="4">일러스트</option>
                                		<option value="5">기타</option>
                                	</select>
                                	<button class="btn btn-primary" type="submit" onclick="search();" id="searchBtn" disabled>검색하기</button>
                                </div>
                                <div class="table-responsive table--no-card m-b-40">
                                    <table class="table table-borderless table-striped table-earning" id="boardTable">
                                        <thead>
                                            <tr>
                                                <th>사용자아이디</th>
                                                <th>제목</th>
                                                <th>구분</th>
                                                <th class="text-right">상세</th>
                                                <th class="text-right">조회수</th>
                                                <th class="text-right">작성일</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="b" items="${list }">
                                            <tr>
                                                <td>${b.userId }</td>
                                                <td>${b.bTitle }</td>
                                              
                                                	<c:if test="${b.boardCategory eq 'OTO' }">
                                                		<td>1:1 문의</td>
                                                		
                                                		<c:choose>
                                                			<c:when test="${b.otoCategory eq 'WT' }">
                                                				<td class="text-right">웹툰</td>
                                                			</c:when>
                                                			<c:when test="${b.otoCategory eq 'WN' }">
                                                				<td class="text-right">웹소설</td>
                                                			</c:when>
                                                			<c:when test="${b.otoCategory eq 'ILL' }">
                                                				<td class="text-right">기타</td>
                                                			</c:when>
                                                			<c:otherwise>
                                                				<td class="text-right">일러스트</td>
                                                			</c:otherwise>
                                                		</c:choose>                                                		
                                                	</c:if>
                                                	<c:if test="${b.boardCategory eq 'NTC' }">
                                                		<td>공지사항</td>
                                                		<td class="text-right">해당없음</td>
                                                	</c:if>
                                                <td class="text-right">${b.bCount }</td>
                                                <td class="text-right">${b.uploadDate }</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                           <div id="pagingArea" align="center">
						                <c:if test="${pi.currentPage <= 1 }">
						                        [이전]&nbsp;
						                </c:if>
						                <c:if test="${pi.currentPage > 1 }">
						                        <c:url var="blistBack" value="/showBoard.ad">
						                                <c:param name="currentPage" value="${pi.currentPage - 1 }"/>
						                        </c:url>
						                        <a href="${blistBack }">[이전]</a> &nbsp;
						                </c:if>
						                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						            <c:if test="${ p eq pi.currentPage }">
						               <font color="red" size="4"><b>[${ p }]</b></font>
						            </c:if>
						            <c:if test="${ p ne pi.currentPage }">
						               <c:url var="blistCheck" value="showBoard.ad">
						                  <c:param name="currentPage" value="${ p }"/>
						               </c:url>
						               <a href="${ blistCheck }">${ p }</a>
						            </c:if>
						         </c:forEach> 
						                
						                <c:if test="${pi.currentPage >= pi.maxPage}">
						                        &nbsp;[다음]
						                </c:if>
						                <c:if test="${pi.currentPage < pi.maxPage }">
						                        <c:url var="blistEnd" value="showBoard.ad">
						                                <c:param name="currentPage" value="${pi.currentPage + 1 }"/>
						                        </c:url>
						                        <a href="${blistEnd }">&nbsp;[다음]</a>
						                </c:if>
						      	  </div>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="copyright">
                                    <p>Copyright © 2018 Colorlib. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>

    </div>
    <!-- Main JS-->
    <script src="${contextPath }/resources/js/admin/main.js"></script>

</body>

</html>
<!-- end document-->
