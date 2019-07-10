<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	

	.container{
	margin-top:5%;
	}
	.point{
	margin-top:5%;
	}
	
	.cont_select_center {
  position: absolute;
  left: 50%;
  top:50%;
  margin-top: -30px;
  margin-left: -150px;
}

.cont_heg_50 {
  position: absolute;
  height: 50%;
  left: 0;
  top: 0;
  width: 100%;
background-color: #fd7b52;
}
/* ///  END DECORATION CSS  ///  */

.icon_select_mate {
  position: absolute;
  top:20px;
  right: 2%;
  font-size: 16px;
    height: 22px;
  transition: all 275ms;
}

.select_mate {
  position: relative;
  float: right;
  min-width:100px;
  width: 25%;
  min-height: 35px;
  font-family: 'Roboto';
  color: #777;
  font-weight: 300;
  background-color: #fff;
 
  border-radius: 3px;
  transition: all 375ms ease-in-out;
/* Oculto el elemento select */
  select {
  position: absolute;
  overflow: hidden;
  height: 0px;
  opacity: 0;  
    z-index: -1;
  }
}

.cont_list_select_mate {
  position: relative;
  float: left;
  width: 100%;
}

.cont_select_int {
 position: absolute;
  left: 0px;
  top: 0px;
  z-index: 999;
  overflow: hidden;
  height: 0px;
  width: 100%;
  background-color: #fff;
  padding: 0px;
  margin-bottom: 0px;
  margin-top: 0px;
  border-radius: 0px 0px 3px 3px;
  box-shadow: 1px 4px 10px -2px rgba(0, 0, 0, 0.2);
  transition: all 375ms ease-in-out;

	li {
	position: relative;
    float: left;
    width: 96%;
    border-bottom:1px solid #E0E0E0;
    background-color: #F5F5F5;
    list-style-type: none;
    padding: 10px 2%;
    margin: 0px;  
    transition: all 275ms ease-in-out;
    display: block;
    cursor:pointer;
		
		&:last-child {
        border-radius: 3px;
        border-bottom:0px; 

        }
         &:hover {
		background-color: #EEEEEE;
		 } 
     }

   .active {
   background-color: #EEEEEE;
   }

}

/* etiqueta <p> con la opcion selecionada  */
.selecionado_opcion {
    padding: 20px 2%;
    width: 96%;
    display: block;
    margin: 0px;
    cursor: pointer;
}
	
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="margin-top: 3.5%;">

	
	<jsp:include page="common/mypagebanner.jsp"/>
  
<div class="container">
  <div class="row">
  <jsp:include page="common/mypageNavbar.jsp"/>
    <div class="col-sm-3">
  	 	<jsp:include page="common/mypageSideNavbar.jsp"/>
    </div>
    <div class="col-sm-7">
      <div class="point">
			<!-- <ul class="nav nav-tabs">
			<li class="active" style="width:100%;"><a href="#" style="font-weight:bold;">내 문의 내역</a></li> -->
			
			
			 <table class="table">
			 
			 <div style="float:right; margin-bottom:2%;">
			 <select name="" onchange="" onclick="return false;" id=""  class="select_mate">
				<option value=""  >카테고리</option>
				<option value="1">웹툰</option>
				<option value="2" >웹소설</option>
				<option value="3">일러스트</option>
				<option value="4">기타</option>
			  </select>
			 </div>
    <thead>
      <tr class="info">
        <th style="display:none;">게시글 번호</th>
        <th>제목</th>
        <th>작성일자</th>
         <th>종류</th>
        <th>상태</th> 
      </tr>
    </thead>
    <tbody>
    <c:forEach var="oto" items="${ list }">
      <tr id="detail">
        <td style="display:none;">${ oto.bId }</td>
        <td>${ oto.bTitle }</td>
        <td>${ oto.uploadDate }</td>
        <td>${ oto.subCategory }</td>
        <c:if test="${ oto.status == 'N' }">
        <td>답변 대기중</td>
        </c:if>
        <c:if test="${ oto.status == 'Y' }">
        <td>답변 완료</td>
        </c:if>
        
      </tr>      
     </c:forEach>
    
    </tbody>
  </table>	
				
				
				
		</ul>
  					<br>
				</div>
    </div>
    <div class="col-sm-2">
     <img src="${ contextPath }/resources/images/advertisement.png" width="100%">     
    </div>
  </div>
</div>
<jsp:include page="common/mypgFooter.jsp"/>

</body>
<script>
	$("#detail").click(function(){
		location.href="queList.mg"
	})
	</script>




</html>