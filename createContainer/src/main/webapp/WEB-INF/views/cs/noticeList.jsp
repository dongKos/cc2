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
		<div>
		<hr>
		<table style="width:100%;">
		<tr>
		<td><label>제목</label></td>
		<td><label>날짜</label></td>
		</tr>
		</table>
		<hr>
		
		<div>
		안녕하세요. Create Container 마일리지 서비스입니다.<br><br>

		2019년 11월 20일, Create Container 코인 적립 혜택이 종료됩니다.<br><br>
		
		
		
		그간 많은 사랑으로 Create Container 마일리지를 아껴주신 회원 분들께 진심으로 감사드리며,<br><br>
		
		더 큰 혜택으로 다시 찾아 뵙도록 하겠습니다.<br>
		
		
		
		11월 01일까지 마일리지 적립 경로를 통해 적립하신 마일리지는 2019년 11월 20일까지 사용이 가능하며, 사용 기간 동안 사용하지 못하신 마일리지는 캐쉬로 전환 적립될 예정입니다.<br>
		
		
		
		Create Container 코인 적립 종료 :<br><br>
		
		-2019년 11월 20일(수) 23시 59분까지 진행한 적립 대상 거래에 한해 제공<br><br>
		
		
		
		Create Container 코인 사용 종료 :<br><br>
		
		-2016년 2월 4일(목) 23시 59분까지 사용 가능<br><br>
		
		
		
		앞으로 더 다양하고 특별한 혜택의 쇼핑 서비스를 제공해 드릴 것을 약속 드리며,<br>
		
		혜택 종료와 관련 궁금하신 사항은 고객센터를 이용하시면 빠르게 응대하도록 하겠습니다.<br><br>



		
		
		
		</div>
		</div>
   












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