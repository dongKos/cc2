<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>신고관리 페이지</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

	//상세보기 페이지 이동
	function trClick(num){
		location.href = "showReportDetail.ad?num=" + num + "&currentPage=" + ${pi.currentPage};
	}

	//체크된 신고내역 처리
	function completeAll(){

		var td2 = $(".select");
		
		var reportIdArr = new Array();
		//선택된 애들 모두 선택해서 신고 
		td2.each(function(){
			if($(this).prop("checked")){
				var reportId = $(this).parent().parent().children().eq(0).text();
				reportIdArr.push(reportId);
			}
		});
		
		console.log(reportIdArr);
		if(reportIdArr.length >=1 ){
			location.href = "complteAllReport.ad?reportIdArr=" + reportIdArr;
		};
		
	}
	
	$(function(){
		
		
		//선택된 사이드 메뉴바 표시
		var selectedUl = $("#report").parent().children();
		var selectedLi = selectedUl.children().children().eq(0);
		selectedUl.css({"display":"block"});
		selectedLi.css({"color":"skyblue"});
		
		//전체 선택하는 체크박스 컨트롤
		var selectAll = $("#selectAll");
		
		selectAll.click(function(){
			if($(this).prop("checked")){
				$(".select").prop("checked", true);
			}else{
				$(".select").prop("checked", false);
			}
			
		});
		
		//신고대상 조건 검색 에이잭스
		$("#select").change(function(){
			var statusVal = $(this).val();
			$.ajax({
				url:"reportStatus.ad",
				data:{statusVal:statusVal},
				type:"get",
				success:function(data){
					console.log(data);
					console.log(data.list[1].status);
					//테이블 재 생성
					var table = $("#refundTable");
					var tbody = $('tbody');
					tbody.html(" ");
					
					for(var i = 0; i < data.list.length; i ++){
						var tr = $("<tr onclick='trClick(" + data.list[i].reportId + ")'>");
						var rCodeTd = $("<td>").text(data.list[i].reportId);
						var rUserTd = $("<td>").text(data.list[i].userId);
						var rTypeTd = $("<td>").text(data.list[i].reportType);
						var rReasonTd = $("<td>").text(data.list[i].reportReason);
						var rDateTd = $("<td class='text-right'>").text(data.list[i].reportDate);
						if(data.list[i].status == 'Y'){
							var statusTd = $("<td class='text-right'>").text("처리완료");
						}else{
							var statusTd = $("<td class='text-right'>").text("처리대기");
							statusTd.append($("<input type='checkbox' class='select'>"));
						}
						tr.append(rCodeTd);
						tr.append(rUserTd);
						tr.append(rTypeTd);
						tr.append(rReasonTd);
						tr.append(rDateTd);
						tr.append(statusTd);
						tbody.append(tr);
						table.append(tbody);
					}
					
					//페이징 처리 - 밑에 있는 애이잭스 페이징 함수를 통해서 페이징 한다
					var pagingArea = $("#pagingArea");
					pagingArea.html(" ");
					
					var currentPage = data.pi.currentPage;
					var	startPage = data.pi.startPage;
					var endPage = data.pi.endPage;
					var maxPage = data.pi.maxPage;
					
					console.log(currentPage + " " + startPage + " " + endPage + " " + maxPage);
					//이전 버튼 
					if(currentPage <= 1){
						pagingArea.text("[이전]");
					}else{
						pagingArea.append("<button onclick='reportPaging("+ (currentPage -1)+ ","+ statusVal+")'>[이전]</button>");
					}
					
					//숫자 페이지 버튼
					for(var i = startPage; i < endPage; i++){
						if(i == currentPage){
							pagingArea.append(" <font color='red' size='4'><b>" + i + "</b></font>");
							
						}else{
							pagingArea.append("<button onclick='reportPaging("+ i + ","+ statusVal+")'>" + i +"</button>");
						}
					}
					
					//다음 버튼
					if(currentPage >= maxPage){
						pagingArea.text("[다음]");
					}else{
						pagingArea.append("<button onclick='reportPaging("+ (currentPage + 1) + ","+ statusVal+")'>[다음]</button>");
					}
					
					
					
				},
				error:function(){
					console.log("싫패!");
				}
			});
		});	
		
	});
	
	
	//페이징 에이젝스 처리
	function reportPaging(currentPage, statusVal){
		var statusVal = statusVal;
		$.ajax({
			url:"reportStatus.ad",
			data:{currentPage:currentPage, statusVal:statusVal},
			type:"get",
			success:function(data){
				console.log(data);
				//테이블 재 생성
				var table = $("#refundTable");
				var tbody = $('tbody');
				tbody.html(" ");
				
				for(var i = 0; i < data.list.length; i ++){
					var tr = $("<tr onclick='trClick(" + data.list[i].reportId + ")'>");
					var rCodeTd = $("<td>").text(data.list[i].userId);
					var rDateTd = $("<td>").text(data.list[i].reportType);
					var rUserTd = $("<td>").text(data.list[i].reportReason);
					var priceTd = $("<td class='text-right'>").text(data.list[i].reportDate);
					if(data.list[i].status == 'Y'){
						var statusTd = $("<td class='text-right'>").text("처리완료");
					}else{
						var statusTd = $("<td class='text-right'>").text("처리대기");
						statusTd.append($("<input type='checkbox' class='select'>"));
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
				pagingArea.html(" ");
				
				//페이지 인포 정보도 data에 담겨서 오기 때문에 거기서 꺼내야함
				var currentPage = data.pi.currentPage;
				var	startPage = data.pi.startPage;
				var endPage = data.pi.endPage;
				var maxPage = data.pi.maxPage;
				
				console.log(currentPage + " " + startPage + "" + endPage + " " + maxPage);
				//이전 버튼 
				if(currentPage <= 1){
					pagingArea.text("[이전]");
				}else{
					pagingArea.append("<button onclick='reportPaging("+ (currentPage -1)+ ","+ statusVal+")'>[이전]</button>");
				}
				
				//숫자 페이지 버튼
				for(var i = startPage; i <= endPage; i++){
					if(i == currentPage){
						pagingArea.append(" <font color='red' size='4'><b>" + i + "</b></font>");
						
					}else{
						pagingArea.append("<button onclick='reportPaging("+ i + ","+ statusVal+")'>" + i +"</button>");
					}
				}
				
				//다음 버튼
				if(currentPage >= maxPage){
					pagingArea.append("[다음]");
				}else{
					pagingArea.append("<button onclick='reportPaging("+ (currentPage + 1) + ","+ statusVal+")'>[다음]</button>");
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
                                	<select id="select">
                               			<option selected>선택하세요</option>
                                		<option value="1">댓글</option>
                                		<option value="2">작품</option>
                                		<option value="3">회차</option>
                                		<option value="4">게시판</option>
                                	</select>
                                	<input type="checkbox" id="selectAll" ondblclick="this.checked=false">
                                	
                                	<input type="text">
                                	
                                	<button class="btn btn-primary" type="submit">검색</button>
                                </div>
                                <div class="table-responsive table--no-card m-b-40">
                                    <table class="table table-borderless table-striped table-earning" id="reportTable">
                                        <thead>
                                            <tr>
                                                <th>신고코드</th>
                                                <th>신고자</th>
                                                <th >대상</th>
                                                <th>사유</th>
                                                <th class="text-right">신고일</th>
                                                <th class="text-right">상태</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                             <c:forEach var="r" items="${list }" end="${pi.limit }">
	                                            <tr onclick="trClick(${r.reportId})">
	                                            	<td>${r.reportId }</td>
	                                                <td>${r.userId}</td>
	                                                <td>${r.reportType }</td>
	                                                <td>${r.reportReason }</td>
	                                                <td class="text-right">${r.reportDate }</td>
	                               			    	<td class="text-right">처리 완료<input type="checkbox" class="select"></td>            
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
						                        <c:url var="blistBack" value="/showReport.ad">
						                                <c:param name="currentPage" value="${pi.currentPage - 1 }"/>
						                        </c:url>
						                        <a href="${blistBack }">[이전]</a> &nbsp;
						                </c:if>
						                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						            <c:if test="${ p eq pi.currentPage }">
						               <font color="red" size="4"><b>[${ p }]</b></font>
						            </c:if>
						            <c:if test="${ p ne pi.currentPage }">
						               <c:url var="blistCheck" value="showReport.ad">
						                  <c:param name="currentPage" value="${ p }"/>
						               </c:url>
						               <a href="${ blistCheck }">${ p }</a>
						            </c:if>
						         </c:forEach> 
						                
						                <c:if test="${pi.currentPage >= pi.maxPage}">
						                        &nbsp;[다음]
						                </c:if>
						                <c:if test="${pi.currentPage < pi.maxPage }">
						                        <c:url var="blistEnd" value="showReport.ad">
						                                <c:param name="currentPage" value="${pi.currentPage + 1 }"/>
						                        </c:url>
						                        <a href="${blistEnd }">&nbsp;[다음]</a>
						                </c:if>
						      	  </div>
                                </div>
                            </div>
                            
                        </div>
                        
                        <div align="right">
                        	<button class="btn btn-primary" onclick="completeAll();">전체 처리</button>
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
