<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>작품 관리 - 휴재 내역 관리</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	//날짜 관련 함수
	Date.prototype.format = function(f) {    
	    if (!this.valueOf()) return " ";     
	    
	    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];    
	    var d = this;         
	    
	    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {        
	        switch ($1) {            
	           case "yyyy": return d.getFullYear();            
	           case "yy": return (d.getFullYear() % 1000).zf(2);            
	           case "MM": return (d.getMonth() + 1).zf(2);            
	           case "dd": return d.getDate().zf(2);            
	           case "E": return weekName[d.getDay()];            
	           case "HH": return d.getHours().zf(2);            
	           case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);            
	           case "mm": return d.getMinutes().zf(2);            
	           case "ss": return d.getSeconds().zf(2);            
	           case "a/p": return d.getHours() < 12 ? "오전" : "오후";            
	           default: return $1;        
	         }    
	    });
	}; 
	
	//한자리일경우 앞에 0을 붙여준다.
	String.prototype.string = function(len){
	    var s = '', i = 0; 
	    while (i++ < len) { s += this; } 
	    return s;
	}; 
	String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
	Number.prototype.zf = function(len){return this.toString().zf(len);};

	$(function(){
		//선택된 사이드 메뉴바 표시
		var selectedUl = $("#work").parent().children();
		var selectedLi = selectedUl.children().children().eq(4);
		selectedUl.css({"display":"block"});
		selectedLi.css({"color":"skyblue"});
	});
	
	function trClick(num){
		var currentPage = "<c:out value='${pi.currentPage}'/>";
		var cCode = num;
		
		console.log(cCode);
		console.log(currentPage);
		location.href="showWorkCloseDetail.ad?cCode=" + cCode + "&currentPage=" + currentPage;
	}
	
	function cType(currentPage){
		var type = $("#search").val();
		var currentPage = currentPage;
		console.log(currentPage);
		console.log(search);
		$.ajax({
			url:"closeType.ad",
			data:{type:type, currentPage:currentPage},
			type:"get",
			success:function(data){
				console.log(data);
				var table = $("#refundTable");
				var tbody = $("#refundTable tbody");
				tbody.html(" ");
			
				//테이블 영역 재생성
				for(var i = 0; i < data.list.length;i++){
					
					var date = new Date(data.list[i].uploadDate).format("yyyy-MM-dd");
					var tr = $("<tr onclick='trClick(1);'>");
					var wTitleTd = $("<td>").text(data.list[i].wTitle);
					
					//구분
					if(data.list[i].workType == 'WN'){
						var caTd = $("<td>").text("웹 소설");
					}else{
						var caTd = $("<td>").text("웹툰");
					}
					var appTd = $("<td>").text("승인대기");
					
					var dateTd = $("<td>").text(date);
					
					tr.append(wTitleTd);
					tr.append(caTd);
					tr.append(dateTd);
					tr.append(appTd);
					tbody.append(tr);
					table.append(tbody);
				}
				
				//페이징 영역 재생성
				
				var pagingArea = $("#pagingArea");
				pagingArea.empty();
				
				var currentPage = data.pi.currentPage;
				var startPage = data.pi.startPage;
				var endPage = data.pi.endPage;
				var maxPage = data.pi.maxPage;
				
				console.log("페이징 할때 currentPage" + currentPage);
				
				
				//이전 버튼 
				if(currentPage <= 1){
					pagingArea.text("[이전]");
				}else{
					var $button = $("<button>").text("[이전]").click(function(){
						mType(currentPage - 1);
					});
					pagingArea.append($button);
					//pagingArea.append("<button onclick='mType("+ (currentPage -1)+")'>[이전]</button>");
					console.log("이전 버튼 어디 갔니?");
				}
				
				//숫자 페이지 버튼
				for(var i = startPage; i < endPage; i++){
					if(i == currentPage){
						pagingArea.append(" <font color='red' size='4'><b>" + i + "</b></font>");
						
					}else{
						pagingArea.append("<button onclick='mType("+ i + ")'>" + i +"</button>");
					}
				}
				
				//다음 버튼
				if(currentPage >= maxPage){
					pagingArea.text("[다음]");
				}else{
					pagingArea.append("<button onclick='mType("+ (currentPage + 1)+")'>[다음]</button>");
				}
				
				
			},
			error:function(){
				console.log("실패!");
			}
		});
		
	};
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
                                	<select id="search" onchange="cType(1);">
                                		<option value="1">전체</option>
                                		<option value="2">웹툰</option>
                                		<option value="3">웹소설</option>
                                	</select>
                                
                                	<input type="text">
                                	<button class="btn btn-primary" type="submit">검색</button>
                                </div>
                                <div class="table-responsive table--no-card m-b-40">
                                    <table class="table table-borderless table-striped table-earning" id="refundTable">
                                        <thead>
                                            <tr>
                                                <th>작품이름</th>
                                                <th>구분</th>
                                                <th>등록일</th>
                                                <th class="text-right">승인상태</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="c" items="${list }">
                                            <tr onclick="trClick(${c.closedCode})">
                                            	<td>${c.wTitle}</td>
                                            	<c:if test="${c.workType eq 'WN' }">
                                            		<td>웹 소설</td>
                                            	</c:if>
                                            	<c:if test="${c.workType eq 'WT' }">
                                            		<td>웹툰</td>
                                            	</c:if>
                                                <td>${c.uploadDate}</td>
                                                <c:if test="${c.status eq 'N' }">
                                                	<td class="text-right">승인대기</td>
                                                </c:if>
                                                <c:if test="${c.status eq 'Y' }">
                                                	<td class="text-right">승인완료</td>
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
						                        <c:url var="blistBack" value="/showWorkClose.ad">
						                                <c:param name="currentPage" value="${pi.currentPage - 1 }"/>
						                        </c:url>
						                        <a href="${blistBack }">[이전]</a> &nbsp;
						                </c:if>
						                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						            <c:if test="${ p eq pi.currentPage }">
						               <font color="red" size="4"><b>[${ p }]</b></font>
						            </c:if>
						            <c:if test="${ p ne pi.currentPage }">
						               <c:url var="blistCheck" value="showWorkClose.ad">
						                  <c:param name="currentPage" value="${ p }"/>
						               </c:url>
						               <a href="${ blistCheck }">${ p }</a>
						            </c:if>
						         </c:forEach> 
						                
						                <c:if test="${pi.currentPage >= pi.maxPage}">
						                        &nbsp;[다음]
						                </c:if>
						                <c:if test="${pi.currentPage < pi.maxPage }">
						                        <c:url var="blistEnd" value="showWorkClose.ad">
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
