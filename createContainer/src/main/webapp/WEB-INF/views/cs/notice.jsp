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
<jsp:include page="../main/common/mainMenubar.jsp"/>
    <div class="col-sm-3">
  	 <jsp:include page="../cs/common/csSideNavbar.jsp"/>
    </div>
    <div class="col-sm-7">
    <div style="float:right; margin-bottom:2%;">
    <select name="" onchange="" onclick="return false;" id="noticeCategory"  class="select_mate">
	<option value="all"  >카테고리</option>
	<option value="wt">웹툰</option>
	<option value="wn" >웹소설</option>
	<option value="Ill">일러스트</option>
	<option value="etc">기타</option>
  </select>
    </div>
    
    
      <div class="point">
      
			<div id="all">
   <table class="table">
   
    <thead>
      <tr class="info">
        <th>제목</th>
        <th>작성일자</th>
        <th>카테고리</th>
         
        
      </tr>
    </thead>
    <tbody>
      <tr onclick="NoticeDetail.mg" id="detail">
        <td>전체</td>
        <td>전체</td>
        <td>3</td>
        
        
      </tr>      
     
      <tr>
        <td>1</td>
        <td>2</td>
        <td>3</td>
        
      </tr>
      <tr>
        <td>4</td>
        <td>5</td>
        <td>6</td>
        
      </tr>
      <tr>
        <td>7</td>
        <td>8</td>
        <td>9</td>
        
      </tr>
    </tbody>
  </table>
 </div>
 
 <div id="wt" hidden="true">
   <table class="table">
   
    <thead>
      <tr class="info">
        <th>웹툰</th>
        <th>작성일자</th>
        <th>카테고리</th>
         
        
      </tr>
    </thead>
    <tbody>
      <tr onclick="NoticeDetail.mg" id="detail">
        <td>전체</td>
        <td>전체</td>
        <td>3</td>
        
        
      </tr>      
     
      <tr>
        <td>1</td>
        <td>2</td>
        <td>3</td>
        
      </tr>
      <tr>
        <td>4</td>
        <td>5</td>
        <td>6</td>
        
      </tr>
      <tr>
        <td>7</td>
        <td>8</td>
        <td>9</td>
        
      </tr>
    </tbody>
  </table>
 </div>
 
 <div id="wn" hidden="true">
   <table class="table">
   
    <thead>
      <tr class="info">
        <th>웹소설</th>
        <th>작성일자</th>
        <th>카테고리</th>
         
        
      </tr>
    </thead>
    <tbody>
      <tr onclick="NoticeDetail.mg" id="detail">
        <td>전체</td>
        <td>전체</td>
        <td>3</td>
        
        
      </tr>      
     
      <tr>
        <td>1</td>
        <td>2</td>
        <td>3</td>
        
      </tr>
      <tr>
        <td>4</td>
        <td>5</td>
        <td>6</td>
        
      </tr>
      <tr>
        <td>7</td>
        <td>8</td>
        <td>9</td>
        
      </tr>
    </tbody>
  </table>
 </div>
 
 <div id="Ill" hidden="true">
   <table class="table">
   
    <thead>
      <tr class="info">
        <th>일러스트</th>
        <th>작성일자</th>
        <th>카테고리</th>
         
        
      </tr>
    </thead>
    <tbody>
      <tr onclick="NoticeDetail.mg" id="detail">
        <td>전체</td>
        <td>전체</td>
        <td>3</td>
        
        
      </tr>      
     
      <tr>
        <td>1</td>
        <td>2</td>
        <td>3</td>
        
      </tr>
      <tr>
        <td>4</td>
        <td>5</td>
        <td>6</td>
        
      </tr>
      <tr>
        <td>7</td>
        <td>8</td>
        <td>9</td>
        
      </tr>
    </tbody>
  </table>
 </div>
 
 <div id="etc" hidden="true">
   <table class="table">
   
    <thead>
      <tr class="info">
        <th>기타</th>
        <th>작성일자</th>
        <th>카테고리</th>
         
        
      </tr>
    </thead>
    <tbody>
      <tr onclick="NoticeDetail.mg" id="detail">
        <td>전체</td>
        <td>전체</td>
        <td>3</td>
        
        
      </tr>      
     
      <tr>
        <td>1</td>
        <td>2</td>
        <td>3</td>
        
      </tr>
      <tr>
        <td>4</td>
        <td>5</td>
        <td>6</td>
        
      </tr>
      <tr>
        <td>7</td>
        <td>8</td>
        <td>9</td>
        
      </tr>
    </tbody>
  </table>
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
	<script>
	$("#detail").click(function(){
		location.href="NoticeDetail.mg"
	})
	</script>
	
	
	<script>
	$("#noticeCategory").change(function(){
		var ctg = $(this).children("option:selected").val();
		
		if(ctg == "wt"){
			$("#wt").attr("hidden", false);
			$("#all").attr("hidden", true);
			$("#Ill").attr("hidden", true);
			$("#etc").attr("hidden", true);
			$("#wn").attr("hidden", true);
		}else if(ctg == "wn"){
			$("#wt").attr("hidden", true);
			$("#all").attr("hidden", true);
			$("#Ill").attr("hidden", true);
			$("#etc").attr("hidden", true);
			$("#wn").attr("hidden", false);

	
			
		}else if(ctg == "Ill"){
			$("#wt").attr("hidden", true);
			$("#all").attr("hidden", true);
			$("#Ill").attr("hidden", false);
			$("#etc").attr("hidden", true);
			$("#wn").attr("hidden", true);
		
		}else if(ctg == "etc"){
			$("#wt").attr("hidden", true);
			$("#all").attr("hidden", true);
			$("#Ill").attr("hidden", true);
			$("#etc").attr("hidden", false);
			$("#wn").attr("hidden", true);
		}else if(ctg == "all"){
			$("#wt").attr("hidden", true);
			$("#all").attr("hidden", false);
			$("#Ill").attr("hidden", true);
			$("#etc").attr("hidden", true);
			$("#wn").attr("hidden", true);
		}
		
		
		})
	
	</script>
	
	
</body>
</html>