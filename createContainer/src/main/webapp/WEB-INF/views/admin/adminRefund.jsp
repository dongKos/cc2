<%@ 
	page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>환불관리 페이지</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	//상세보기 페이지 이동
	function trClick(num){
		location.href = "showRefundDetail.ad?num=" + num + "&currentPage=" + ${pi.currentPage};
	}

	$(function(){
		//선택된 사이드 메뉴바 표시
		var selectedUl = $("#refund").parent().children();
		var selectedLi = selectedUl.children().children().eq(0);
		selectedUl.css({"display":"block"});
		selectedLi.css({"color":"skyblue"});

		//처리 상태 조건 검색 ajax
		var status = $("#status");
		status.change(function(){
			var statusVal = $(this).val();
			
			$.ajax({
				url:"refundStatus.ad",
				data:{statusVal:statusVal},
				success:function(data){
					
					//테이블 재 생성
					var table = $("#refundTable");
					var tbody = $('tbody');
					tbody.html(" ");
					
					for(var i = 0; i < data.list.length; i ++){
						var tr = $("<tr onclick='trClick(" + data.list[i].refundCode + ")'>");
						var rCodeTd = $("<td>").text(data.list[i].refundCode);
						var rDateTd = $("<td>").text(data.list[i].requestDate);
						var rUserTd = $("<td>").text(data.list[i].userId);
						var priceTd = $("<td class='text-right'>").text(data.list[i].price);
						if(data.list[i].status == 'Y'){
							var statusTd = $("<td class='text-right'>").text("처리완료");
						}else{
							var statusTd = $("<td class='text-right'>").text("처리대기");
						}
						tr.append(rCodeTd);
						tr.append(rDateTd);
						tr.append(rUserTd);
						tr.append(priceTd);
						tr.append(statusTd);
						tbody.append(tr);
						table.append(tbody);
					}
					
					//페이징 처리 - 밑에 있는 애이잭스 페이징 함수를 통해서 페이징 한다
					var pagingArea = $("#pagingArea");
					pagingArea.html("");
					
					var currentPage = ${pi.currentPage};
					var startPage = ${pi.startPage};
					var endPage = ${pi.endPage};
					var maxPage = ${pi.maxPage};
					
					//이전 버튼 
					if(currentPage <= 1){
						pagingArea.text("[이전]");
					}else{
						pagingArea.append("<button onclick='refundPaging("+ (currentPage -1)+ ","+ statusVal+")'>[이전]</button>");
					}
					
					//숫자 페이지 버튼
					for(var i = startPage; i < endPage; i++){
						if(i == currentPage){
							pagingArea.append(" <font color='red' size='4'><b>" + i + "</b></font>");
							
						}else{
							pagingArea.append("<button onclick='refundPaging("+ i + ","+ statusVal+")'>" + i +"</button>");
						}
					}
					
					//다음 버튼
					if(currentPage >= maxPage){
						pagingArea.text("[다음]");
					}else{
						pagingArea.append("<button onclick='refundPaging("+ (currentPage + 1) + ","+ statusVal+")'>[다음]</button>");
					}
					
				},
				error:function(){
					console.log("실패!");
				}
			});
		});
		
	});
	
	//페이징 에이젝스 처리(funcking fucking fuck)
	function refundPaging(currentPage, statusVal){
		var statusVal = statusVal;
		$.ajax({
			url:"refundStatus.ad",
			data:{currentPage:currentPage, statusVal:statusVal},
			type:"get",
			success:function(data){
				console.log(data);
				//테이블 재 생성
				var table = $("#refundTable");
				var tbody = $('tbody');
				tbody.html(" ");
				
				for(var i = 0; i < data.list.length; i ++){
					var tr = $("<tr onclick='trClick(" + data.list[i].refundCode + ")'>");
					var rCodeTd = $("<td>").text(data.list[i].refundCode);
					var rDateTd = $("<td>").text(data.list[i].requestDate);
					var rUserTd = $("<td>").text(data.list[i].userId);
					var priceTd = $("<td class='text-right'>").text(data.list[i].price);
					if(data.list[i].status == 'Y'){
						var statusTd = $("<td class='text-right'>").text("처리완료");
					}else{
						var statusTd = $("<td class='text-right'>").text("처리대기");
					}
					tr.append(rCodeTd);
					tr.append(rDateTd);
					tr.append(rUserTd);
					tr.append(priceTd);
					tr.append(statusTd);
					tbody.append(tr);
					table.append(tbody);
				}
				
				//페이징 처리
				var pagingArea = $("#pagingArea");
				pagingArea.html("");
				
				//페이지 인포 정보도 data에 담겨서 오기 때문에 거기서 꺼내야함
				var currentPage = data.pi.currentPage;
				var	startPage = data.pi.startPage;
				var endPage = data.pi.endPage;
				var maxPage = data.pi.maxPage;
				
				//이전 버튼 
				if(currentPage <= 1){
					pagingArea.text("[이전]");
				}else{
					pagingArea.append("<button onclick='refundPaging("+ (currentPage -1)+ ","+ statusVal+")'>[이전]</button>");
				}
				
				//숫자 페이지 버튼
				for(var i = startPage; i <= endPage; i++){
					if(i == currentPage){
						pagingArea.append(" <font color='red' size='4'><b>" + i + "</b></font>");
						
					}else{
						pagingArea.append("<button onclick='refundPaging("+ i + ","+ statusVal+")'>" + i +"</button>");
					}
				}
				
				//다음 버튼
				if(currentPage >= maxPage){
					pagingArea.append("[다음]");
				}else{
					pagingArea.append("<button onclick='refundPaging("+ (currentPage + 1) + ","+ statusVal+")'>[다음]</button>");
				}
			},
			error:function(){
				console.log("실패!");
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
                                <div class="m-b-25">
                                	<select id="status">
                                		<option selected>선택하세요</option>
                                		<option value="1">처리대기</option>
                                		<option value="2">처리완료</option>
                                	</select>
                                </div>
                                <div class="table-responsive table--no-card m-b-40">
                                    <table class="table table-borderless table-striped table-earning" id="refundTable">
                                        <thead>
                                            <tr>
                                                <th>번호</th>
                                                <th>등록일</th>
                                                <th>사용자 ID</th>
                                                <th class="text-right">가격</th>
                                                <th class="text-right">상태</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="r" items="${list }" end="${pi.limit }">
                                            <tr onclick="trClick(${r.refundCode});">
                                                <td>${r.refundCode}</td>
                                                <td>${r.requestDate }</td>
                                                <td>${r.userId }</td>
                                                <td class="text-right">${r.price }</td>
                                                <c:if test="${ r.status eq 'N'}">
                                               		 <td class="text-right">처리 대기</td>
                                                </c:if>
                                                <c:if test="${r.status eq 'Y' }">
                                			    	<td class="text-right">처리 완료</td>            
                                                </c:if>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <!-- 페이징 영역 -->
                                    <div id="pagingArea" align="center">
						                <c:if test="${pi.currentPage <= 1 }">
						                        [이전]&nbsp;
						                </c:if>
						                <c:if test="${pi.currentPage > 1 }">
						                        <c:url var="blistBack" value="/showRefund.ad">
						                                <c:param name="currentPage" value="${pi.currentPage - 1 }"/>
						                        </c:url>
						                        <a href="${blistBack }">[이전]</a> &nbsp;
						                </c:if>
						                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						            <c:if test="${ p eq pi.currentPage }">
						               <font color="red" size="4"><b>[${ p }]</b></font>
						            </c:if>
						            <c:if test="${ p ne pi.currentPage }">
						               <c:url var="blistCheck" value="showRefund.ad">
						                  <c:param name="currentPage" value="${ p }"/>
						               </c:url>
						               <a href="${ blistCheck }">${ p }</a>
						            </c:if>
						         </c:forEach> 
						                
						                <c:if test="${pi.currentPage >= pi.maxPage}">
						                        &nbsp;[다음]
						                </c:if>
						                <c:if test="${pi.currentPage < pi.maxPage }">
						                        <c:url var="blistEnd" value="showRefund.ad">
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
