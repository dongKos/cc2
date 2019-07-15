<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  
<style>
 #navbar{
margin-top:20%;

} 
.container{
margin-top:10%;
}
.point{
border:1px solid #ececec;
height:550px;
margin-bottom:20%;


}

* {
  margin: 0;
  padding: 0;
}

body {
  font-family: 'Montserrat', sans-serif;
  background: #388E3C;
}

ul {
  list-style: none;
}

a {
  text-decoration: none;
}

h2 {
  text-align: center;
  margin: 20px auto;
  color: #fff;
}

.accordion-menu {
   
  width: 100%;
  max-width: 600px;
  margin: 60px auto 20px;
  background: #fff;
  border-radius: 4px;
}
.accordion-menu li.open .dropdownlink {
  color: #CDDC39;
  .fa-chevron-down {
    transform: rotate(180deg);
  }
}
.accordion-menu li:last-child .dropdownlink {
  border-bottom: 0;
}
.dropdownlink {
	
  cursor: pointer;
  display: block;
  padding: 15px 15px 15px 45px;
  font-size: 16px;
  border-bottom: 1px solid #ccc;
  color: #212121;
  position: relative;
  transition: all 0.4s ease-out;
  i {
    position: absolute;
    top: 17px;
    left: 16px;
  }
  .fa-chevron-down {
    right: 12px;
    left: auto;
  }
}

.submenuItems {
  display: none;
  background: #ececec;
  li {
    border-bottom: 1px solid #B6B6B6;
  }
}

.submenuItems a {
  display: block;
  color: #727272;
  padding: 12px 12px 12px 45px;
  transition: all 0.4s ease-out;
  &:hover {
    background-color: #CDDC39;
    color: #fff;
  }
}





</style>


</head>
<body>
<div class="container">


  <div class="row">
<jsp:include page="../member/mypage/common/mypageNavbar.jsp"/>
    <div class="col-sm-3">
  	 <jsp:include page="../cs/common/csSideNavbar.jsp"/>
    </div>
    <div class="col-sm-7">
 
      <div class="point">
   
   
    
	<ul class="accordion-menu">
  <li>
    <div class="dropdownlink"><i class="fa fa-road" aria-hidden="true"></i> 코인 어떻게 사용하나요?
      <i class="fa fa-chevron-down" aria-hidden="true"></i>
    </div>
    <ul class="submenuItems">
      <li><a href="#">이렇게 저렇게</a></li>
    
    </ul>
  </li>
  <li>
    <div class="dropdownlink"><i class="fa fa-paper-plane" aria-hidden="true"></i> 결제 했는데 코인이 사용되지 않아요.
      <i class="fa fa-chevron-down" aria-hidden="true"></i>
    </div>
    <ul class="submenuItems">
      <li><a href="#">잘 하셨어야죠</a></li>
    
    </ul>
  </li>
  <li>
    <div class="dropdownlink"><i class="fa fa-quote-left" aria-hidden="true"></i> 성인작품은 어떻게 보나요?
      <i class="fa fa-chevron-down" aria-hidden="true"></i>
    </div>
    <ul class="submenuItems">
      <li><a href="#">성인인증</a></li>
    
    </ul>
  </li>
  <li>
    <div class="dropdownlink"><i class="fa fa-motorcycle" aria-hidden="true"></i> 아이디 / 비밀번호를 잊어버렸어요.
      <i class="fa fa-chevron-down" aria-hidden="true"></i>
    </div>
    <ul class="submenuItems">
      <li><a href="#">안타깝네요</a></li>
      
    </ul>
  </li>
  
  <li>
    <div class="dropdownlink"><i class="fa fa-road" aria-hidden="true"></i> 회원가입 어떻게 하나요?
      <i class="fa fa-chevron-down" aria-hidden="true"></i>
    </div>
    <ul class="submenuItems">
      <li><a href="#">이렇게 저렇게</a></li>
    
    </ul>
  </li>
  
  <li>
    <div class="dropdownlink"><i class="fa fa-road" aria-hidden="true"></i> 작품 어떻게 올리나요?
      <i class="fa fa-chevron-down" aria-hidden="true"></i>
    </div>
    <ul class="submenuItems">
      <li><a href="#">이렇게 저렇게</a></li>
    
    </ul>
  </li>
  <li>
    <div class="dropdownlink"><i class="fa fa-road" aria-hidden="true"></i> 신고 어떻게 하나요?
      <i class="fa fa-chevron-down" aria-hidden="true"></i>
    </div>
    <ul class="submenuItems">
      <li><a href="#">이렇게 저렇게</a></li>
    
    </ul>
  </li><li>
    <div class="dropdownlink"><i class="fa fa-road" aria-hidden="true"></i> 회원 탈퇴 어떻게 하나요?
      <i class="fa fa-chevron-down" aria-hidden="true"></i>
    </div>
    <ul class="submenuItems">
      <li><a href="#">이렇게 저렇게</a></li>
    
    </ul>
  </li>
  
</ul><!-- 아코디언메뉴 -->
			
			
			
			
	</div> <!-- point -->
    </div>
    <div class="col-sm-2">
     <img src="${ contextPath }/resources/images/advertisement.png" width="100%">     
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
	
	
	
		<jsp:include page="../member/mypage/common/mypgFooter.jsp"/>

	

</body>
</html>