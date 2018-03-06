<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- popover 연결 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- / popover 연결 -->  
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>E-SHOP HTML Template</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="css/slick.css" />
	<link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="css/font-awesome.min.css">

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
font-family: 'Nanum Gothic', sans-serif;
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




	<!-- 시그니처 -->
	
	<h1 align="center" style="font-weight:bold;color:#004d1a;">시그니처 도시락 </h1><br>
	<h4 align="center">여러분들의 체질에 맞게, 입맞에 맞게 골라보세요!</h4><br>
	<div class="innercontainer">
	
	<div class="row">
        <div class="col-lg-5 col-md-5 col-sm-8 col-xs-9 food-tab-container">
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 food-tab-menu">
              <div class="list-group">
              
                <a href="#" class="list-group-item active text-center">
                  	밥  / 면 류
                </a>
                <a href="#" class="list-group-item text-center">
              	  고 기 류
                </a>
                <a href="#" class="list-group-item text-center">
                	나 물 류
                </a>
                <a href="#" class="list-group-item text-center">
   			           장 아 찌 류
                </a>
                <a href="#" class="list-group-item text-center">
  		              해 물 류
                </a>
              </div>
            </div>
            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9 food-tab">
                <!-- 밥 section -->
                <div class="select-tab-content active">
                                         
                      <div class="tableArea" >
                  	<table class="foodtable"  >
                  	
                  		<tr>
                  			<td>
                  			  <img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			  <br><br>
                  			  <p class="foodname"><a data-toggle="popover" data-content="Some content inside the popover">간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			</td>
                  			<td> 
                  			<img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			<br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			</td>
           					
                  		</tr>
                  		<tr>
                  			<td>  
                  			<img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			<br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			</td>
                  			<td> 
                  			 <img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			 <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			 </td>
           					
           				
           					
                  		</tr>
                  		<tr>
                  			<td>  
                  			<img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			<br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			</td>
                  		
           					<td>
           					  <img alt="" src="img/crabpickle.jpg" class="foodimg">
           					  <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
           					 </td>
           				
           					
                  		</tr>               	
                  		<tr>
                  			<td>
							 <img alt="" src="img/crabpickle.jpg" class="foodimg">
							 <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
							</td>
                  			<td>
                  			  <img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			  <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			 </td>
                  		</tr>               	
                  		
                  		
                  	</table>
                  	
                  	<script>
							$(document).ready(function(){
							    $('[data-toggle="popover"]').popover();   
							});
							</script>
                   </div>  
                  
                    
                </div>
                <!-- 고기 section -->
                <div class="select-tab-content">
                     <div class="tableArea" >
                  	<table class="foodtable"  >
                  		<tr>
                  			<td>
                  			  <img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			  <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			</td>
                  			<td> 
                  			<img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			<br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			</td>
           					
                  		</tr>
                  		<tr>
                  			<td>  
                  			<img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			<br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			</td>
                  			<td> 
                  			 <img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			 <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			 </td>
           					
           				
           					
                  		</tr>
                  		<tr>
                  			<td>  
                  			<img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			<br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			</td>
                  		
           					<td>
           					  <img alt="" src="img/crabpickle.jpg" class="foodimg">
           					  <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
           					 </td>
           				
           					
                  		</tr>               	
                  		<tr>
                  			<td>
							 <img alt="" src="img/crabpickle.jpg" class="foodimg">
							 <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
							</td>
                  			<td>
                  			  <img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			  <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			 </td>
                  		</tr>               	
                  		
                  		
                  	</table>
                   </div>  
                </div>
    
                <!-- 나물 search -->
                <div class="select-tab-content">
                   
                  <div class="tableArea" >
                  	<table class="foodtable"  >
                  		<tr>
                  			<td>
                  			  <img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			  <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			</td>
                  			<td> 
                  			<img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			<br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			</td>
           					
                  		</tr>
                  		<tr>
                  			<td>  
                  			<img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			<br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			</td>
                  			<td> 
                  			 <img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			 <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			 </td>
           					
           				
           					
                  		</tr>
                  		<tr>
                  			<td>  
                  			<img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			<br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			</td>
                  		
           					<td>
           					  <img alt="" src="img/crabpickle.jpg" class="foodimg">
           					  <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
           					 </td>
           				
           					
                  		</tr>               	
                  		<tr>
                  			<td>
							 <img alt="" src="img/crabpickle.jpg" class="foodimg">
							 <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
							</td>
                  			<td>
                  			  <img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			  <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			 </td>
                  		</tr>               	
                  		
                  		
                  	</table>
                   </div>  
                  
                
                </div>
                <!-- 장아찌류 -->
                <div class="select-tab-content">
                  <div class="tableArea" >
                  	<table class="foodtable"  >
                  		<tr>
                  			<td>
                  			  <img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			  <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			</td>
                  			<td> 
                  			<img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			<br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			</td>
           					
                  		</tr>
                  		<tr>
                  			<td>  
                  			<img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			<br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			</td>
                  			<td> 
                  			 <img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			 <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			 </td>
           					
           				
           					
                  		</tr>
                  		<tr>
                  			<td>  
                  			<img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			<br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			</td>
                  		
           					<td>
           					  <img alt="" src="img/crabpickle.jpg" class="foodimg">
           					  <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
           					 </td>
           				
           					
                  		</tr>               	
                  		<tr>
                  			<td>
							 <img alt="" src="img/crabpickle.jpg" class="foodimg">
							 <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
							</td>
                  			<td>
                  			  <img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			  <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			 </td>
                  		</tr>               	
                  		
                  		
                  	</table>
                   </div>  
                  
                </div>
                <!-- 해물류 -->
                <div class="select-tab-content">
                 
                    <div class="tableArea" >
                  	<table class="foodtable"  >
                  		<tr>
                  			<td>
                  			  <img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			  <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			</td>
                  			<td> 
                  			<img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			<br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			</td>
           					
                  		</tr>
                  		<tr>
                  			<td>  
                  			<img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			<br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			</td>
                  			<td> 
                  			 <img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			 <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			 </td>
           					
           				
           					
                  		</tr>
                  		<tr>
                  			<td>  
                  			<img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			<br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			</td>
                  		
           					<td>
           					  <img alt="" src="img/crabpickle.jpg" class="foodimg">
           					  <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
           					 </td>
           				
           					
                  		</tr>               	
                  		<tr>
                  			<td>
							 <img alt="" src="img/crabpickle.jpg" class="foodimg">
							 <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
							</td>
                  			<td>
                  			  <img alt="" src="img/crabpickle.jpg" class="foodimg">
                  			  <br><br>
                  			  <p class="foodname"><a>간장 게장</a></p>
                  			  <p class="foodprice">2,000 원</p><br>
                  			 </td>
                  		</tr>               	
                  		
                  		
                  	</table>
                   </div>  
            </div>
        </div>
  </div>
  
  </div>
   <!-- 선택 토핑  -->
  <div class="selectFood">
  	<br><h3 align="center">선택하신 토핑</h3><br>
  	<table class="selectFoodTable">
  		<tr id="thisStays"></tr>
  		<tr></tr>
  	</table>
  	</div>
    <!-- /선택 토핑  -->
    
    <div class="buttons" >
    		<button class="btns" id="clearAll">초기화 하기</button>
    		<button class="btns">주문하기</button>
    </div>
    
    <script type="text/javascript">
  		var tdata;
  		$(function(){
  				
  			$(".foodimg").click(function(){
  				$(".selectFoodTable").find("tr:nth-last-child(1)").append("<td class='tdata'></td>");
  				$(this).parent().children().clone(true).appendTo($(".selectFoodTable").find("tr:nth-last-child(1)").find("td:nth-last-child(1)"));
	  		
	  			tdata = $(".tdata").length;
	  			//console.log("얍 : " + tdata);
	  			
	  			if(tdata % 4 == 0){
					$(".selectFoodTable").append("<tr></tr>");
				}
	  			
  			});
  			
  			
  			$("#clearAll").click(function(){
  				$(".selectFoodTable").find("td").remove();
  	     		$(".selectFoodTable").find("tr").not("#thisStays").remove();
  	     		//console.log( "다시 " + tdata);
  	     	});
  			
  		});
  	</script>
    
</div>
	
	<!-- /시그니처 -->


</body>
</html>