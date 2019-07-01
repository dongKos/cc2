<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>환불관리 페이지</title>
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
	
	
	function mType(currentPage){
		var type = $("#mType").val();
		var currentPage = currentPage;
		console.log(currentPage);		
		$.ajax({
			url:"memberType.ad",
			data:{type:type, currentPage:currentPage},
			type:"get",
			success:function(data){
				console.log(data);
				var table = $("#memberTable");
				var tbody = $("#memberTable tbody");
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
	
	$(function(){
		$("#memberTable tr").click(function(){
			var num = $(this).children().eq(0).text();
			if(num == '아이디'){
				console.log("뿌엥");
			}else{
				location.href = "showMemberDetail.ad?num=" + num + "&currentPage=" + ${pi.currentPage};
			}
		});
		
		//선택된 사이드 메뉴바 표시
		var selectedUl = $("#member").parent().children();
		var selectedLi = selectedUl.children().children().eq(0);
		selectedUl.css({"display":"block"});
		selectedLi.css({"color":"skyblue"});
	});
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
                                	<select id="mType" onchange="mType(1);">
                                		<option value="3">선택하세요</option>
                                		<option value="1">일반회원</option>
                                		<option value="2">프리미엄 작가</option>
                                		<option value="4">블랙리스트</option>
                                		<option value="5">탈퇴회원</option>
                                	</select>
                                	<input type="text">
                                	<button class="btn btn-primary" type="submit">검색</button>
                                </div>
                                <div class="table-responsive table--no-card m-b-40">
                                    <table class="table table-borderless table-striped table-earning" id="memberTable">
                                        <thead>
                                            <tr>
                                                <th>아이디</th>
                                                <th>이름</th>
                                                <th>구분</th>
                                                <th class="text-right">가입일</th>
                                                <th class="text-right">블랙리스트</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="m" items="${list }" end="${pi.limit }">
                                            	<c:if test="${m.memberType ne 3 }">
		                                            <tr>
		                                            	<td style="display:none">${m.mno }</td>
		                                                <td>${m.userId}</td>
		                                                <td>${m.userName }</td>
		                                                
		                                                <c:choose>
		                                                	<c:when test="${m.memberType eq 1 }">
				                                                <td>일반</td>
		                                                	</c:when>
		                                                	<c:when test="${m.memberType eq 2 }">
		                                                		<td>프리미엄 작가</td>
		                                                	</c:when>
		                                                </c:choose>
		                                                
		                                                <td class="text-right">${m.joinDate }</td>
		                                                <c:if test="${m.wCount >= 5 }">
			                               			    	<td class="text-right">블랙 회원</td>            
		                                                </c:if>
		                                                <c:if test="${m.wCount < 5 }">
		                                                	<td class="text-right">클린 회원</td>	
		                                                </c:if>
		                                            </tr>
	                                            </c:if>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                     <!-- 페이징 영역 -->
                                    <div id="pagingArea" align="center">
						                <c:if test="${pi.currentPage <= 1 }">
						                        [이전]&nbsp;
						                </c:if>
						                <c:if test="${pi.currentPage > 1 }">
						                        <c:url var="blistBack" value="/showMember.ad">
						                                <c:param name="currentPage" value="${pi.currentPage - 1 }"/>
						                        </c:url>
						                        <a href="${blistBack }">[이전]</a> &nbsp;
						                </c:if>
						                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						            <c:if test="${ p eq pi.currentPage }">
						               <font color="red" size="4"><b>[${ p }]</b></font>
						            </c:if>
						            <c:if test="${ p ne pi.currentPage }">
						               <c:url var="blistCheck" value="showMember.ad">
						                  <c:param name="currentPage" value="${ p }"/>
						               </c:url>
						               <a href="${ blistCheck }">${ p }</a>
						            </c:if>
						         </c:forEach> 
						                
						                <c:if test="${pi.currentPage >= pi.maxPage}">
						                        &nbsp;[다음]
						                </c:if>
						                <c:if test="${pi.currentPage < pi.maxPage }">
						                        <c:url var="blistEnd" value="showMember.ad">
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
