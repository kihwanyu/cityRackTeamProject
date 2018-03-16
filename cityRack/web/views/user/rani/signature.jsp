<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@page import="com.kh.cityrack.product.user.model.dto.Product"%>
<%@page import="com.kh.cityrack.product.user.model.dto.Pcategory"%>
<%@page import="com.kh.cityrack.product.user.model.dto.Cart"%>
<!DOCTYPE html>
<%	ArrayList<Product> pList = (ArrayList<Product>)request.getAttribute("pList");
	ArrayList<Pcategory> cList = (ArrayList<Pcategory>)request.getAttribute("cList"); 
	ArrayList<Cart> c =(ArrayList<Cart>)request.getAttribute("cart");
	
	System.out.println("pList :" + pList);
	System.out.println("cList :" + cList);
	System.out.println("cart :" + c);
	
	%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- popover  연결 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- / popover 연결 -->  
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->



	<!-- Google font -->
	
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="css/slick.css" />
	<link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />



	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="css/style.css" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

<script type="text/javascript">
$(document).ready(function() {
    $("div.food-tab-menu>div.list-group>a").click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.food-tab>div.select-tab-content").removeClass("active");
        $("div.food-tab>div.select-tab-content").eq(index).addClass("active");
    });
});
</script>

<style type="text/css">

body {
font-family: 'Nanum Gothic', sans-serif !important;
}
.innercontainer{
  background:black;
  z-index: 10;
  background-color: #ffffff;

  padding: 0 !important;  
  border-radius: 4px;
  -moz-border-radius: 4px;
 margin-bottom:600px;
  margin-top: 20px;  
  margin-left: 300px;
  margin-right:300px;

  height:400px;
  -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
  box-shadow: 0 6px 12px rgba(0,0,0,.175);
  -moz-box-shadow: 0 6px 12px rgba(0,0,0,.175);
  background-clip: padding-box;
  opacity: 0.97;
  filter: alpha(opacity=97);
}

.food-tab-container{
	background:black;
	padding-left:0px;
	border-radius:4px;
	width:100%;
}



div.food-tab-menu{
  padding-right: 0;
  padding-left: 0;
  padding-bottom: 0;
}
div.food-tab-menu div.list-group{
  margin-bottom: 0;
}
div.food-tab-menu div.list-group>a{
  margin-bottom: 0;
}
div.food-tab-menu div.list-group>a ,
div.food-tab-menu div.list-group>a .fa {
  color: #ff8c1a;
}
div.food-tab-menu div.list-group>a:first-child{
  border-top-right-radius: 0;
  -moz-border-top-right-radius: 0;
}
div.food-tab-menu div.list-group>a:last-child{
  border-bottom-right-radius: 0;
  -moz-border-bottom-right-radius: 0;
}
div.food-tab-menu div.list-group>a.active,
div.food-tab-menu div.list-group>a.active .glyphicon,
div.food-tab-menu div.list-group>a.active .fa{
  background-color: #ff8c1a;
  background-image: #ff8c1a;
  color: #ffffff;
}
div.food-tab-menu div.list-group>a.active:after{
  content: '';
  position: absolute;
  left: 100%;
  top: 80%;
  margin-top: -13px;
  border-left: 0;
  border-bottom: 13px solid transparent;
  border-top: 13px solid transparent;
  border-left: 10px solid #ff8c1a;
}

div.select-tab-content{
 /*  background-color: #ffffff; */
  /* border: 1px solid #eeeeee; */
  padding-left: 50px;
  padding-top: 10px;
}

div.food-tab div.select-tab-content:not(.active){
  display: none;
}
.row{
	margin-left:0px;
	margin-right:0px;
}
.text-center{
	font-weight:bold;
}
.list-group-item{
	position: relative;
    display: block;
    padding-left: 10px;
    padding-right:10px;
    color:black;
    padding-top: 30px;
    padding-bottom:30px;    
    background-color: white;
    border: 1px solid #ddd;
}

div.food-tab-menu div.list-group>a, div.food-tab-menu div.list-group>a .fa {
    color: black;
}

div.food-tab-menu div.list-group>a.active:after {
    content: '';
    position: absolute;
    left: 100%;
    top: 80%;
    margin-top: -13px;
    border-left: 0;
    border-bottom: 13px solid transparent;
    border-top: 13px solid transparent;
    border-left: 10px solid #ff8c1a;
}

a.list-group-item.active, a.list-group-item.active:hover, a.list-group-item.active:focus {
    z-index: 2;
    color: #fff;
    background-color: #428bca;
    border-color: #ff8c1a;
}

.foodimg{
border-radius:50%;
width:70%;
}

 td{

	text-align:center;
	align:center;
}

.tableArea a{
	color: #bbb;
}
.tableArea a:hover{
	color:#ff8c1a;
}
 .foodimg:hover{
 	cursor:pointer;
 	opacity:0.7;
 }
.col-lg-9 .col-md-9 .col-sm-9 .col-xs-9 .food-tab{
	height:100%;
	height:400px;
}


.select-tab-content, .select-tab-content.active{
	width:100%;
	height:100%;
	padding-top:20px;
    padding-right: 10px;
    padding-bottom: 10px;

}

@media screen and (min-width:1200px){ .col-lg-9{width:75%; height:400px} }

.food-tab-container{
	width:100%;

}

.tableArea{
	overflow-y:scroll;
	height:100%;
	color:#bbb;
}

.foodname{
	font-weight:bold;
	color:#bbb;
	
}

.selectFood{


height:400px;
background:#770029;
margin-top:40px;
margin-bottom: 40px;
border-radius:4px;
overflow-y:scroll;
}

.selectFood img{
	width:70%;
}

.selectFood h3,a, p{
	color:#f7f7f7;
}


.btns{
		align:center;
		width:300px;
		background:#FF7930;
		font-size:40px;
		border-radius:20px;
		font:font-family: 'Nanum Gothic', sans-serif;
		border:none;
		align:center;
		color:black;
		font-weight:bold;
		height:80px;
	}
.btns:hover{
		background:#337517;
		color:white;
	}


.buttons{
	
	margin-left:15%;
}

.btns{
	
	margin-right:20px;
}
/* 스크롤바 */
/* width */
::-webkit-scrollbar {
    width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
    box-shadow: inset 0 0 1px grey; 
    border-radius: 10px;
}
 
/* Handle */
::-webkit-scrollbar-thumb {
    background: navy; 
    border-radius: 10px;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
    background: #ff8c1a; 
}

#footer-logo{
	width:90%;
}
#header-logo{
	width:80%;
	height:100%;
}

.footer-list a{
	color:black;
}
</style>

<title>Insert title here</title>
</head>
<body>


	<!-- 메뉴바 -->
	
	<%@ include file="/views/user/common/menubar_main.jsp" %>
	<!-- /메뉴바 -->




	<!-- 시그니처 -->
	
	
	
	<%if(loginUser==null){%>
	<div style="margin-top:30px;padding-bottom:50px;">
	<h2 align="center">로그인이 필요한 서비스입니다.</h2>
	</div>
	<div >
	<button align="center" class="btns" style="font-size:30px;margin-left:40%; "onclick="location.href='views/user/rani/login.jsp'">로그인 하러 가기 </button>
	</div>
	
	<%} else{ %>
	
	<form action="<%=request.getContextPath() %>/getProducts.pr" method="post" id="getAllProducts">
	<!-- <script type="text/javascript">
		$(function(){
			$("#getAllProducts").submit();
		})
	</script> -->
	<h1 align="center" style="font-weight:bold;color:#004d1a;margin-top:50px;" >시그니처 도시락 </h1><br>
	<h4 align="center">여러분들의 체질에 맞게, 입맞에 맞게 골라보세요!</h4><br>
	<div class="innercontainer">
	
	<div class="row" >
        <div class="col-lg-5 col-md-5 col-sm-8 col-xs-9 food-tab-container" style="width:100%;">
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 food-tab-menu">
              <div class="list-group">
             	 <a href="#" class="list-group-item active text-center">
                  <%=cList.get(0).getCa_name() %>
                </a>
              <% for(int i = 1; i<cList.size();i++) {%>
                	  <a href="#" class="list-group-item text-center">
              	 <%=cList.get(i).getCa_name() %>
                </a>
               <%} %> 
              
               
              </div>
            </div>
            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9 food-tab">
                <!-- 처음 section -->
                <div class="select-tab-content active">
                                         
                      <div class="tableArea" >
                  	<table class="foodtable"  >
                  	
            		<% int row = 0; %> 
                  	<% for(int i = 0; i<pList.size();i++){  %>
                  	<% if( row % 2 == 0 ){%>
                  		 <tr>
                  		<% if( (cList.get(0).getCa_name()).equals(pList.get(i).getCa_code()) ){ %>                   			 			
	                  		<td>
	                  		  <img alt="" src="product_download_imgFiles/<%=pList.get(i).getP_pic1() %>" class="foodimg">
	                  		  <br><br>
	                  		  <p class="foodname" name="foodname" value="<%=pList.get(i).getP_name()%>"> <%=pList.get(i).getP_name() %> <a data-toggle="popover" data-content="<%=pList.get(i).getP_8constitution() %>"></a></p>
	                  		   <p class="foodprice"><%=pList.get(i).getP_price() %> 원</p><br> 
	                  		   <input class="input qty" name="amount" type="number" min="1" placeholder="0">
	                  		  <input type="hidden" name="foodname" value="<%=pList.get(i).getP_code()%>">	                  		  
	                  		  <input type="hidden" name="foodprice" value="<%=pList.get(i).getP_price() %>">
	                  		</td>
                  		<%
                  			row++; } %>
                  		<% } %>
                  		</tr>
                 	<% } %>
                  		      
                  	</table>
                   	
                  <!-- <script>
							$(document).ready(function(){
							    $('[data-toggle="popover"]').popover();   
							});
					</script>   -->
                   </div>  
                  
                    
                </div>
                <!-- 그 다음 section -->
                  		
		       	<% for(int j = 1; j<cList.size();j++){%>
		        	  <div class="select-tab-content">
		                  <div class="tableArea" >
		                  	<table class="foodtable"  >
		                  	<tr>
		             <% for(int i = 0; i<pList.size();i++){ %> 
		           		<% if(  (cList.get(j).getCa_name()).equals(pList.get(i).getCa_code()) ){ %>
		                  		
		                  			<td>
		                  			  <img src="product_download_imgFiles/<%=pList.get(i).getP_pic1() %>" class="foodimg">
		                  			  <br><br>
		                  			  <p class="foodname" name="foodname" value="<%=pList.get(i).getP_name() %>"><%=pList.get(i).getP_name() %><a data-toggle="popover" data-content="<%=pList.get(i).getP_8constitution() %>"></a></p>
		                  			   <p class="foodprice"><%=pList.get(i).getP_price() %> 원</p><br> 
		                  			     <input class="input qty" name="amount" type="number" min="1" placeholder="0">
		                  			  <input type="hidden" name="foodname" value="<%=pList.get(i).getP_code() %>"> 
		                  			  <input type="hidden" name="foodprice" value="<%=pList.get(i).getP_price() %>">
		                  			</td>		                		
	                 	<%} %>
	                  	</tr> 
	                  		<%} %>					          
	                  	</table>
				           </div>  
				           </div>
	           <% } %>
	           
	           
	           
	                  		      
        </div>
  </div>
  </div>
  </form>
   <!-- 선택 토핑  -->
	<br>
   <p style="color:black;">* 선택 상품을 담으시고 아래의 선택 토핑에서 수량을 조정해주십시오.</p>
   <p style="color:black;">* 상품을 중복 선택하실 수 없으며 양을 늘리고 싶으실 경우 수량을 늘려주십시오.</p>
   <p style="color:black;">* 수량의 1의 양은 메뉴마다 다를 수 있습니다.</p>
  
  <form id="selectSignature" action="<%=request.getContextPath() %>/insertCart.em" method="post" onsubmit="return false;" > 
  <div class="selectFood">
  	<br><h3 align="center" id="title" value="선택하신 토핑">선택하신 토핑</h3><br>
  	<table class="selectFoodTable">
  		<tr id="thisStays"></tr>
  		
  	</table>
  	</div>
  
    <!-- /선택 토핑  -->
    
    <div class="buttons" >
    		<button class="btns" id="clearAll">초기화 하기</button>
    		<button class="btns" id="submitBtn" onclick="confirmThis();">장바구니에 담기</button>
    </div>
    
    <script type="text/javascript">
  		var tdata="";
  		
  				
  			$(".foodimg").click(function(){
  				//이미지를 선택하면 선택한 토핑 푸드 테이블의 끝에서 첫번째 tr에 td를 추가한다.
  				//그리고 선택한 이미지의 td에 있는 내용을 전부 복사하여 붙여 넣는다.
  				
  				if(tdata==0){ 
  					$(".selectFoodTable").find("tr:nth-last-child(1)").append("<td class='tdata'></td>");
  	  				$(this).parent().children().clone(true).appendTo($(".selectFoodTable").find("tr:nth-last-child(1)").find("td:nth-last-child(1)"));
  				console.log( $(".selectFoodTable").find("td").children("p").eq(0).text() );
  				console.log( $(this).parent().children("p").eq(0).text()  );
  				} else {
  				
					for(var i = 0; i<tdata;i++){
						if($(this).parent().children("p").eq(0).text() ==  $(".selectFoodTable").find("td").eq(i).children("p").eq(0).text()){
							alert("중복된 상품입니다.");
						} else {
							$(".selectFoodTable").find("tr:nth-last-child(1)").append("<td class='tdata'></td>");
		  	  				$(this).parent().children().clone(true).appendTo($(".selectFoodTable").find("tr:nth-last-child(1)").find("td:nth-last-child(1)"));
		  	  				break;
						}
					}  				
  					
  					
  				}	
  				
	  		
  				//tdata에 td의 개수를 담는다.
	  			tdata = $(".tdata").length;
	  			//console.log("얍 : " + tdata);
	  			
	  			//td가 4개 배수 단위로 넘어가면 tr을 새로 생성한다.
	  			if(tdata % 4 == 0){
					$(".selectFoodTable").append("<tr></tr>");
				}
	  			
  			});
  			
  			//초기화 function 
  			$("#clearAll").click(function(){
  				$(".selectFoodTable").find("td").remove();
  	     		$(".selectFoodTable").find("tr").not("#thisStays").remove();
  	     		//console.log( "다시 " + tdata);
  	     	});
  			
  	 	 
  		
  			function confirmThis(){
    			var answer = confirm('고르신 토핑으로 만든 시그니처 도시락을 장바구니에 담으시겠습니까?');
    			// '예'를 클릭하면 form을 submit한다.
    			if(answer == true){
					 var $submitForm = $("#selectSignature");
					//$submitForm.attr("onsubmit","return true();");	 
					//console.log( $("#selectSignature").attr( 'action' ));
					/* console.log($(".selectFoodTable").find("td").children("p").eq(0).text());
					console.log($(".selectFoodTable").find("td").children("p").eq(1).text());
					 */
					 
					 console.log($(".tdata").length);
					 var data = {};
					 for(var i = 0; i<$(".tdata").length;i++){
						 data["foodname"+ i] = $(".selectFoodTable").find("td").eq(i).children("input").eq(1).val();
						 data["amount"+ i] = $(".selectFoodTable").find("td").eq(i).children("input").eq(0).val();
					 }
					 
					 console.log(data);
					
					   $.ajax({
					    type: "POST",
					    url:   $("#selectSignature").attr( 'action' ) ,
					   	data: data ,
					   	success:function(data){
					   		 confirm('장바구니에 담겼습니다. ');
					   		
					   		}
						});  
					
					} 
					   	   
			   
		    	} 
  			
  			
  		
  		
  	</script>
    </div>
  </form>
    
<%} %>
	
	<!-- /시그니처 -->

	<!-- 푸터 -->
	<%@ include file="/views/user/common/footer.jsp" %>
	
	<!--/ 푸터 -->


</body>
</html>