<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판관리 - 댓글</title>
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
	
	//상세보기 페이지 이동
	function trClick(num){
		console.log("상세보기 페이지 이동 용"+num);
	}
	
	$(function(){
		//선택된 사이드 메뉴바 표시
		var selectedUl = $("#board").parent().children();
		var selectedLi = selectedUl.children().children().eq(1);
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
	//검색버튼 - 에이잭스 구동
	function search(){
		var select1 = $("#select1").val();
		var select2 = $("#select2").val();
		
		console.log(select1 + " " + select2);
		
		$.ajax({
			url:"boardReplyType.ad",
			data:{select1:select1, select2:select2},
			type:"get",
			success:function(data){
				console.log(data);
				console.log(data.pi.currentPage);
				var table = $("#boardReplyTable");
				var tbody = $("#boardReplyTable tbody");
				
				tbody.html(" ");
				
				//테이블 영역 재생성
					for(var i = 0; i < data.list.length;i++){
					
					var date = new Date(data.list[i].uploadDate).format("yyyy-MM-dd");
					var tr = $("<tr onclick='trClick(" + data.list[i].bId + ")'>");
					var userIdTd = $("<td>").text(data.list[i].userId);
					var bTitleTd = $("<td>").text(data.list[i].bTitle);
					
					//구분
					if(data.list[i].boardCategory == 'OTO'){
						var categoryTd = $("<td>").text("1:1문의");
					}else{
						var categoryTd = $("<td>").text("공지사항");
					}
					
					//상세
					switch(data.list[i].subCategory){
						case "ETC" : 
							var otoTd = $("<td class='text-right'>").text("기타");
							break;
						case "WT" :
							var otoTd = $("<td class='text-right'>").text("웹툰");
							break;
						case "WN" : 
							var otoTd = $("<td class='text-right'>").text("웹소설");
							break;
						case "ILL" :
							var otoTd = $("<td class='text-right'>").text("일러스트");
							break;
					}
					
					var countTd = $("<td class='text-right'>").text(data.list[i].bCount);
					var dateTd = $("<td class='text-right'>").text(date);
					
					tr.append(userIdTd);
					tr.append(bTitleTd);
					tr.append(categoryTd);
					tr.append(otoTd);
					tr.append(countTd);
					tr.append(dateTd);
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
					pagingArea.append("<button onclick='boardPaging("+ (currentPage -1)+ ","+ select1+"," + select2 + ")'>[이전]</button>");
				}
				
				//숫자 페이지 버튼
				for(var i = startPage; i < endPage; i++){
					if(i == currentPage){
						pagingArea.append(" <font color='red' size='4'><b>" + i + "</b></font>");
						
					}else{
						pagingArea.append("<button onclick='boardPaging("+ i + ","+ select1+"," + select2 + ")'>" + i +"</button>");
					}
				}
				
				//다음 버튼
				if(currentPage >= maxPage){
					pagingArea.text("[다음]");
				}else{
					pagingArea.append("<button onclick='boardPaging("+ (currentPage + 1) + ","+ select1+"," + select2 + ")'>[다음]</button>");
				}
			},
			error:function(){
				console.log("실퍂!");
			}
		})
		
	}
	
	//페이징 에이젝스 처리(funcking fucking fuck)
	function boardPaging(currentPage, select1, select2){
		var select1 = select1;
		var select2 = select2;
		$.ajax({
			url:"boardReplyType.ad",
			data:{currentPage:currentPage, select1:select1, select2:select2},
			type:"get",
			success:function(data){
				console.log("페이징버튼을 눌렀을때"+data);
				//테이블 재 생성
				var table = $("#boardTable");
				var tbody = $('tbody');
				tbody.html(" ");
				
				//테이블 영역 재생성
				for(var i = 0; i < data.list.length;i++){
					
					var date = new Date(data.list[i].uploadDate).format("yyyy-MM-dd");
					var tr = $("<tr onclick='trClick(" + data.list[i].bId + ")'>");
					var userIdTd = $("<td>").text(data.list[i].userId);
					var bTitleTd = $("<td>").text(data.list[i].bTitle);
					
					//구분
					if(data.list[i].boardCategory == 'OTO'){
						var categoryTd = $("<td>").text("1:1문의");
					}else{
						var categoryTd = $("<td>").text("공지사항");
					}
					
					//상세
					switch(data.list[i].subCategory){
						case "ETC" : 
							var otoTd = $("<td class='text-right'>").text("기타");
							break;
						case "WT" :
							var otoTd = $("<td class='text-right'>").text("웹툰");
							break;
						case "WN" : 
							var otoTd = $("<td class='text-right'>").text("웹소설");
							break;
						case "ILL" :
							var otoTd = $("<td class='text-right'>").text("일러스트");
							break;
					}
					
					var countTd = $("<td class='text-right'>").text(data.list[i].bCount);
					var dateTd = $("<td class='text-right'>").text(date);
					
					
					tr.append(userIdTd);
					tr.append(bTitleTd);
					tr.append(categoryTd);
					tr.append(otoTd);
					tr.append(countTd);
					tr.append(dateTd);
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
					pagingArea.append("<button onclick='boardPaging("+ (currentPage -1)+ ","+ select1+"," + select2 + ")'>[이전]</button>");
				}
				
				//숫자 페이지 버튼
				for(var i = startPage; i < endPage; i++){
					if(i == currentPage){
						pagingArea.append(" <font color='red' size='4'><b>" + i + "</b></font>");
						
					}else{
						pagingArea.append("<button onclick='boardPaging("+ i + ","+ select1+"," + select2 + ")'>" + i +"</button>");
					}
				}
				
				//다음 버튼
				if(currentPage >= maxPage){
					pagingArea.text("[다음]");
				}else{
					pagingArea.append("<button onclick='boardPaging("+ (currentPage + 1) + ","+ select1+"," + select2 + ")'>[다음]</button>");
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
                                <div class="m-b-25 form-group">
                                	<select id="select1">
                                		<option value="1">전체</option>
                                		<option value="2">게시판</option>
                                		<option value="3">작품</option>
                                	</select>
                                	<select id="select2" style="display:none;">
                                		<option value="1" selected>전체</option>
                                		<option value="2">웹툰</option>
                                		<option value="3">웹 소설</option>
                                		<option value="4">일러스트</option>
                                	</select>
                                	<button class="btn btn-primary" onclick="search();">검색</button>
                                </div>
                                <div class="table-responsive table--no-card m-b-40">
                                    <table class="table table-borderless table-striped table-earning" id="boardReplyTable">
                                        <thead>
                                            <tr>
                                                <th>댓글코드</th>
                                                <th>아이디</th>
                                                <th>내용</th>
                                                <th class="text-right">구분</th>
                                                <th class="text-right">상세</th>
                                                <th class="text-right">작성일</th>
                                            </tr>
                                        </thead>
                                        <tbody>
	                                        <c:forEach var="r" items="${list }">
	                                            <tr onclick="trClick(${r.replyId})">
	                                                <td>${r.replyId }</td>
	                                                <td>${r.userId }</td>
	                                                <td>${r.replyContent }</td>
	                                                <c:if test="${r.rId eq 0 }">
		                                                <td class="text-right">게시판</td>
	                                                </c:if>
	                                                <c:if test="${r.bId eq 0 }">
		                                                <td class="text-right">작품</td>
	                                                </c:if>
	                                                
	                                                <c:if test="${r.workType eq 'WT' }">
		                                                <td class="text-right">웹툰</td>
	                                                </c:if>
	                                                <c:if test="${r.workType eq 'WN'}">
		                                                <td class="text-right">웹 소설</td>
	                                                </c:if>
	                                                <td class="text-right">${r.replyDate }</td>
	                                            </tr>
	                                        </c:forEach>
                                        </tbody>
                                    </table>
                                   <div id="pagingArea" align="center">
						                <c:if test="${pi.currentPage <= 1 }">
						                        [이전]&nbsp;
						                </c:if>
						                <c:if test="${pi.currentPage > 1 }">
						                        <c:url var="blistBack" value="/showBoardReply.ad">
						                                <c:param name="currentPage" value="${pi.currentPage - 1 }"/>
						                        </c:url>
						                        <a href="${blistBack }">[이전]</a> &nbsp;
						                </c:if>
						                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						            <c:if test="${ p eq pi.currentPage }">
						               <font color="red" size="4"><b>[${ p }]</b></font>
						            </c:if>
						            <c:if test="${ p ne pi.currentPage }">
						               <c:url var="blistCheck" value="showBoardReply.ad">
						                  <c:param name="currentPage" value="${ p }"/>
						               </c:url>
						               <a href="${ blistCheck }">${ p }</a>
						            </c:if>
						         </c:forEach> 
						                
						                <c:if test="${pi.currentPage >= pi.maxPage}">
						                        &nbsp;[다음]
						                </c:if>
						                <c:if test="${pi.currentPage < pi.maxPage }">
						                        <c:url var="blistEnd" value="showBoardReply.ad">
						                                <c:param name="currentPage" value="${pi.currentPage + 1 }"/>
						                        </c:url>
						                        <a href="${blistEnd }">&nbsp;[다음]</a>
						                </c:if>
						      	  </div>
                                    
                                </div>
                            </div>
                        </div>
                            <div align="right">
                            	<button class="btn btn-primary">삭제</button>
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
