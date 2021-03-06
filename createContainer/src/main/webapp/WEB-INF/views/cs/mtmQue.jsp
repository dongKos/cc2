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
margin-top:8%;
}
.point{
margin-top:8%;
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


</head>
<body>
<div class="container">
  <div class="row">
<jsp:include page="../member/mypage/common/mypageNavbar.jsp"/>
    <div class="col-sm-3">
  	 <jsp:include page="../cs/common/csSideNavbar.jsp"/>
    </div>
    <div class="col-sm-7">
    <!-- <div class="dropdown">
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">카테고리
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a href="#">날짜별</a></li>
      <li><a href="#">카테고리별</a></li>
     
    </ul>
  </div> -->
    
    
      <div class="point">
	<div style="font-size:15px;">				
   	<label style="font-weight:bold; font-size:25px;">CC의 중심</label>
   	<label>은 항상</label>
   	<label style="font-weight:bold; color:blue; font-size:25px;">독자와 작가님</label>
   	<label>입니다.</label>
   	
 	</div>
 	<div>
 	<h6>cc를 이용하면서 느끼신 불편사항이나 궁금한 점을 알려주세요!<br>
   	여러분들의 소중한 의견으로 한 뼘 더 자라는 cc가 되겠습니다.</h6>
   	<h6 style="color:#c4c0c0">고객님의 요청사항을 정확히 확인하고, 빠르게 개선하기 위해 담당자가 연락을 드리겠습니다.<br>
	aliciakimwa@gamil.com</h6>
 	</div>
 	
 	<form action="insertMtmQue.mg">
 	<div style="border:1px solid #ececec; width:100%; height:400px; margin-bottom:10%;">
 	<table width="100%" style="text-align:center; height:100%;">
 	<tr style="border:1px solid #ececec; height:20px;">
 	
 	<td><input type="text" name="bTitle" id="bTitle" style="border:none; width:100%; height:30px; padding-left:30px;" placeholder="제목을 입력해주세요."  ></td>
 	<td>
 	<select name="subCategory" onchange="" onclick="return false;" id="subCategory"  class="select_mate">
	<option value=""  >카테고리</option>
	<option value="WT">웹툰</option>
	<option value="WN" >웹소설</option>
	<option value="ILL">일러스트</option>
	<option value="ETC">기타</option>
  </select></td>
 	</tr>
 	<tr>
 		<td colspan=3>
 		<textarea name="bContent" id="bContent" placeholder="내용을 입력해주세요" style="border:none; width:99%; height:95%; padding-left:30px;"></textarea>
 		
 		</td>
 	</tr>
 	
 	</table>
 	</div>
 			<div style="margin-bottom:10%; text-align:center;">
	  		<button type="submit" class="btn btn-info">확인</button>
 	</form>
			</div>
			
			
			
			










				</div> <!-- point -->
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
	
	
	<script>
	function goQueList(){
		location.href="queList.mg"
	}
	</script>
	
	
	<jsp:include page="../member/mypage/common/mypgFooter.jsp"/>
	
	
</body>
</html>







