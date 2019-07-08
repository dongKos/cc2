<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>작품관리 - 일러스트 조회</title>
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
		var selectedLi = selectedUl.children().children().eq(1);
		selectedUl.css({"display":"block"});
		selectedLi.css({"color":"skyblue"});
		
	});
	//검색버튼 - 에이잭스 구동
	function search(){
		var select1 = $("#select1").val();
		
		console.log(select1);
		
		$.ajax({
			url:"illType.ad",
			data:{select1:select1},
			type:"get",
			success:function(data){
				console.log(data);
				console.log(data.pi.currentPage);
				var table = $("#illTable");
				var tbody = $("#illTable tbody");
				
				tbody.html(" ");
				
				//테이블 영역 재생성
				for(var i = 0; i < data.list.length;i++){
				
					var tr = $("<tr onclick='trClick(" + data.list[i].wid + ")'>");
					var userIdTd = $("<td>").text(data.list[i].userId);
					var nameTd = $("<td>").text(data.list[i].illTitle);
					
					//프리미엄구분
					if(data.list[i].illType == "chall"){
						var categoryTd = $("<td>").text("도전하기");
					}else{
						var categoryTd = $("<td>").text("포트폴리오");
					}
					
					var recTd = $("<td>").text(data.list[i].recommndCount);
					
					tr.append(userIdTd);
					tr.append(nameTd);
					tr.append(categoryTd);
					tr.append(recTd);
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
				
				//이전 버튼 
				if(currentPage <= 1){
					pagingArea.text("[이전]");
				}else{
					pagingArea.append("<button onclick='boardPaging("+ (currentPage -1)+ ","+ select1+ ")'>[이전]</button>");
				}
				
				//숫자 페이지 버튼
				for(var i = startPage; i < endPage; i++){
					if(i == currentPage){
						pagingArea.append(" <font color='red' size='4'><b>" + i + "</b></font>");
						
					}else{
						pagingArea.append("<button onclick='boardPaging("+ i + ","+ select1+")'>" + i +"</button>");
					}
				}
				
				//다음 버튼
				if(currentPage >= maxPage){
					pagingArea.text("[다음]");
				}else{
					pagingArea.append("<button onclick='boardPaging("+ (currentPage + 1) + ","+ select1+")'>[다음]</button>");
				}
			},
			error:function(){
				console.log("실퍂!");
			}
		})
		
	}
	
	//애이작스 페이징 처리
	function boardPaging(currentPage, select1){
		var select1 = select1;
		var select2 = select2;
		$.ajax({
			url:"illType.ad",
			data:{currentPage:currentPage, select1:select1},
			type:"get",
			success:function(data){
				console.log("페이징버튼을 눌렀을때"+data);
				//테이블 재 생성
				var table = $("#illTable");
				var tbody = $('tbody');
				tbody.html(" ");
				
				//테이블 영역 재생성
				//테이블 영역 재생성
				for(var i = 0; i < data.list.length;i++){
				
					var tr = $("<tr onclick='trClick(" + data.list[i].wid + ")'>");
					var userIdTd = $("<td>").text(data.list[i].userId);
					var nameTd = $("<td>").text(data.list[i].illTitle);
					
					//프리미엄구분
					if(data.list[i].illType == "chall"){
						var categoryTd = $("<td>").text("도전하기");
					}else{
						var categoryTd = $("<td>").text("포트폴리오");
					}
					
					var recTd = $("<td>").text(data.list[i].recommndCount);
					
					tr.append(userIdTd);
					tr.append(nameTd);
					tr.append(categoryTd);
					tr.append(recTd);
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
					pagingArea.append("<button onclick='boardPaging("+ (currentPage -1)+ ","+ select1+")'>[이전]</button>");
				}
				
				//숫자 페이지 버튼
				for(var i = startPage; i < endPage; i++){
					if(i == currentPage){
						pagingArea.append(" <font color='red' size='4'><b>" + i + "</b></font>");
						
					}else{
						pagingArea.append("<button onclick='boardPaging("+ i + ","+ select1+")'>" + i +"</button>");
					}
				}
				
				//다음 버튼
				if(currentPage >= maxPage){
					pagingArea.text("[다음]");
				}else{
					pagingArea.append("<button onclick='boardPaging("+ (currentPage + 1) + ","+ select1+")'>[다음]</button>");
				}
			},
			error:function(){
				console.log("실패!");
			}
		})
	}
	//상세보기 페이지 이동
	function trClick(num){
		console.log(num);
	};
</script>
</head>

<body class="animsition">
    <div class="page-wrapper">
        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block" style="width:18%;">
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
                                	<select id="select1">
                                		<option value="1">전체</option>
                                		<option value="2">도전하기</option>
                                		<option value="3">프리미엄</option>
                                	</select>
                                
                                	<button class="btn btn-primary" type="submit" onclick="search();" id="searchBtn">검색하기</button>
                                </div>
                                <div class="table-responsive table--no-card m-b-40">
                                    <table class="table table-borderless table-striped table-earning" id="illTable">
                                        <thead>
                                            <tr>
                                                <th>작가 아이디</th>
                                                <th>작품이름</th>
                                                <th>작품 구분</th>
                                                <th class="text-right">추천 수</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="ill" items="${list }">
                                        		<tr onclick="trClick(${ill.illCode})">
	                                                <td>${ill.userId }</td>
	                                                <td>${ill.illTitle}</td>
	                                                <c:if test="${ill.illType eq 'pri'}">
		                                                <td class="text-center">포트폴리오</td>
	                                                </c:if>
	                                                 <c:if test="${ill.illType eq 'chall'}">
		                                                <td class="text-center">도전</td>
	                                                </c:if>
	                                                <td class="text-right">${ill.recommendCount }</td>
                                            	</tr>
                                        	</c:forEach>
                                    </table>
                                    <!-- 페이징 영역 -->
                                    <div id="pagingArea" align="center">
						                <c:if test="${pi.currentPage <= 1 }">
						                        [이전]&nbsp;
						                </c:if>
						                <c:if test="${pi.currentPage > 1 }">
						                        <c:url var="blistBack" value="/showIllust.ad">
						                                <c:param name="currentPage" value="${pi.currentPage - 1 }"/>
						                        </c:url>
						                        <a href="${blistBack }">[이전]</a> &nbsp;
						                </c:if>
						                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						            <c:if test="${ p eq pi.currentPage }">
						               <font color="red" size="4"><b>[${ p }]</b></font>
						            </c:if>
						            <c:if test="${ p ne pi.currentPage }">
						               <c:url var="blistCheck" value="showIllust.ad">
						                  <c:param name="currentPage" value="${ p }"/>
						               </c:url>
						               <a href="${ blistCheck }">${ p }</a>
						            </c:if>
						         </c:forEach> 
						                
						                <c:if test="${pi.currentPage >= pi.maxPage}">
						                        &nbsp;[다음]
						                </c:if>
						                <c:if test="${pi.currentPage < pi.maxPage }">
						                        <c:url var="blistEnd" value="showIllust.ad">
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
