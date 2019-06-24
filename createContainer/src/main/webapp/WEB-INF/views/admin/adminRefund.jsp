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
	$(function(){
		//상세보기 페이지 이동
		$("#refundTable tr").click(function(){
			var num = $(this).children().eq(0).text();
			
			location.href = "showRefundDetail.ad?num=" + num;
		});
		
		//선택된 사이드 메뉴바 표시
		var selectedUl = $("#refund").parent().children();
		var selectedLi = selectedUl.children().children().eq(0);
		selectedUl.css({"display":"block"});
		selectedLi.css({"color":"skyblue"});

		//처리 상태 조건 검색 ajax
		var status = $("#status");
		status.change(function(){
			var statusVal = $(this).val();
			console.log(statusVal);
			
			$.ajax({
				url:"refundStatus.ad",
				data:{statusVal:statusVal},
				success:function(data){
					console.log(data.list);
					
					var table = $('#refundTable tbody');
					table.remove();
					
					
				},
				error:function(){
					console.log("실패!");
				}
			})
		})
	})
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
                                	<input type="text">
                                	<button class="btn btn-primary" type="submit">검색</button>
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
                                            <tr>
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
