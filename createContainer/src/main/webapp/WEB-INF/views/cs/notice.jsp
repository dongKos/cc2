<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>

.container{
margin-top:10%;
}
.point{
margin-top:10%;
}


</style>


</head>
<body>
<div class="container">
  <div class="row">
<jsp:include page="../main/common/mainMenubar.jsp"/>
    <div class="col-sm-3">
  	 <jsp:include page="../cs/common/csSideNavbar.jsp"/>
    </div>
    <div class="col-sm-7">
    <div class="dropdown">
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">카테고리
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a href="#">날짜별</a></li>
      <li><a href="#">카테고리별</a></li>
     
    </ul>
  </div>
    
    
      <div class="point">
					
   <table class="table">
    <thead>
      <tr class="info">
        <th>게시글 번호</th>
        <th>제목</th>
        <th>작성일자</th>
         <th>종류</th>
        
      </tr>
    </thead>
    <tbody>
      <tr onclick="">
        <td>게시글 번호</td>
        <td>제목</td>
        <td>작성일자</td>
        <td>종류</td>
        
      </tr>      
     
      <tr>
        <td>게시글 번호</td>
        <td>제목</td>
        <td>작성일자</td>
        <td>종류</td>
        
      </tr>
      <tr>
        <td>게시글 번호</td>
        <td>제목</td>
        <td>작성일자</td>
        <td>종류</td>
        
      </tr>
      <tr>
        <td>게시글 번호</td>
        <td>제목</td>
        <td>작성일자</td>
        <td>종류</td>
        
      </tr>
    </tbody>
  </table>
 












				</div>
    </div>
    <div class="col-sm-2">
     <img src="${ contextPath }/resources/images/advertisement.png" width="100%">     
    </div>
  </div>
</div>
	
	
	
	</div>
	<script>
	$(function() {
		  var Accordion = function(el, multiple) {
		    this.el = el || {};
		    // more then one submenu open?
		    this.multiple = multiple || false;
		    
		    var dropdownlink = this.el.find('.dropdownlink');
		    dropdownlink.on('click',
		                    { el: this.el, multiple: this.multiple },
		                    this.dropdown);
		  };
		  
		  Accordion.prototype.dropdown = function(e) {
		    var $el = e.data.el,
		        $this = $(this),
		        //this is the ul.submenuItems
		        $next = $this.next();
		    
		    $next.slideToggle();
		    $this.parent().toggleClass('open');
		    
		    if(!e.data.multiple) {
		      //show only one menu at the same time
		      $el.find('.submenuItems').not($next).slideUp().parent().removeClass('open');
		    }
		  }
		  
		  var accordion = new Accordion($('.accordion-menu'), false);
		})
	</script>
	
</body>
</html>