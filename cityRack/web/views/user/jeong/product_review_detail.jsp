<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.cityrack.board.user.model.dto.*, java.util.*" %>

<% 
	Board b = (Board)request.getAttribute("b"); 
	ArrayList<BoardFile> fileList = (ArrayList<BoardFile>)request.getAttribute("fileList"); 
	BoardFile titleImg = fileList.get(0);
	BoardFile detailImg1 = fileList.get(1);
	BoardFile detailImg2 = fileList.get(2);
	BoardFile detailImg3 = fileList.get(3);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>cityRack_product_review</title>

<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Hind:400,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="views/user/jeong/css/bootstrap.min.css" />

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="views/user/jeong/css/slick.css" />
<link type="text/css" rel="stylesheet" href="views/user/jeong/css/slick-theme.css" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet" href="views/user/jeong/css/nouislider.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="views/user/jeong/css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="views/user/jeong/css/style.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
	
	.outer {
		width:1000px;
		margin-left:auto;
		margin-right:auto;
	}
	
	.detail td {
		text-align:center;
		width:1000px;
		border:3px solid orange;
		padding:15px;
	}
		
	
	#contentArea {
		height:100px;
		text-indent: 20px;
		font-size: 21px;
		background-color: 	#FFEFD5;
	}
		
	
	/* 광고판 이미지 공간 */
	.carousel-inner {
	   width: 100%;
	   height: 360px;
	}
	
	.image {
	   height : auto;
	}
	
	#myCarousel{
		width: 1000px;
		margin: 0 auto;
		border: 3px solid orange;
	}
	
	/* 광고/공지판 버튼크기 */
	.carousel-control {
	   margin-top: 28%;
	   width: 5%;
	   height: 60px; 
	   font-size : 20px;
	   color: #fff;
	   opacity: .2;
	   font-size: 20px;
	}		
	
	.carousel-inner {
		border: 2px solid orange;
	}
	
	.item {
		width: 994px;
		height: 360px;
	}
	
	#like {
	 display: block;
	}
	
	.lift, .right {
		width: 20px;
		background: white;
	}
	
	.glyphicon {
		background: orange;
	}
	
</style>

</head>
<body>
	
	<!-- 메인페이지용 메뉴바 -->
	<%@ include file="/views/user/common/menubar_main.jsp"%>


	<br/>
	<div class="container">
		<div class="row">
			<div class="section-title">
				<h3 class="title">city樂 이용 후기</h3>
			</div>
		
	<br/>
	<br/>
	<div class="outer">
		<table class="detail" align="center">
			<tr>
				<td colspan="9">
					<label style="font-size:30px;"><%= b.getBo_title() %></label>
					  <input id="like1" type="image" src="views/user/jeong/img/like1.png" width="5%" align="right" >
					  <input id="like2" type="hidden" src="views/user/jeong/img/like2.png" width="5%" align="right" >
				</td>
			</tr>
			<tr>
				<td colspan="2">작성자 | 
				<label><%= b.getM_name() %></label></td>
				<td colspan="2">조회수 | 
				<label><%= b.getBo_hit() %></label></td>
				<td colspan="2">추천수 | 
				<label><%= b.getBo_recomm() %></label></td>
				<td colspan="2">작성일 | 
				<label><%= b.getBo_date() %></label></td>
			</tr>
		</table>
	</div>
	<script>
			/*  $("#like1").toggle(function() {
				$(this).attr("src","views/user/jeong/img/like2.png");
				
			}, function(){
				$(this).attr("src","views/user/jeong/img/like1.png");
			}); 
			 */
		
		/* 	$("#like1").click(function(){
				$("#like1").attr("src", $(this).attr("src"));
			}); */
			$("#like1").click(function(){
				if($(this).attr("src") == "views/user/jeong/img/like1.png"){
					$(this).attr("src", "views/user/jeong/img/like2.png");
				}else {
					$(this).attr("src", "views/user/jeong/img/like1.png");
				}
			});

		
		// $(this).attr("src","views/user/jeong/img/like2.png");
		//$(this).attr("src","views/user/jeong/img/like1.png");
	
	</script>
		
		<div id="myCarousel" class="carousel slide" data-ride="carousel" style="border:1px solid black;">
		      
		<!-- 광고판 실제 내용 -->
		      <div class="carousel-inner">
		           <div class="active item" align="center">
		              <img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= titleImg.getBf_name() %>" style="height:80%;" class = "image">
		           </div>
		   
		            <div class="item" align="center">
		              <img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= detailImg1.getBf_name() %>" style="height:80%;" class = "image">
		           </div>
		       
		           <div class="item" align="center">
		              <img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= detailImg2.getBf_name() %>" style="height:80%;" class = "image">
		           </div>
		           
		           <div class="item" align="center">
		              <img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= detailImg3.getBf_name() %>" style="height:80%;" class = "image">
		           </div>
		       </div>
		   
		<!-- 좌우 버튼 -->
		       <a class="left carousel-control" href="#myCarousel" data-slide="prev" style="width:40px;">
		            <span class="glyphicon glyphicon-chevron-left"></span>
		            <span class="sr-only">Previous</span>
		       </a>
		       <a class="right carousel-control" href="#myCarousel" data-slide="next" style="width:40px;">
		            <span class="glyphicon glyphicon-chevron-right"></span>
		            <span class="sr-only">Next</span>
		       </a>
				 </div>
				 <table class="detail" align="center">
					 <tr>
						<td colspan="9">
							<p id="contentArea"><%= b.getBo_content() %></p>
						</td>
					</tr>
				 </table>
				<br/>
				<br/>
				
				
				<div align="right">
				
					<button class="primary-btn" onclick="before();">뒤로가기</button>
				
				<!-- 작성자와 관리자만 삭제가능 -->
				<% 
				System.out.println(loginUser.getM_no() + "/" + b.getM_no());
				if(loginUser.getM_name().equals("관리자") || loginUser.getM_no() == b.getM_no()){ %>
				
					<button class="primary-btn" onclick="goDelete();">삭제하기</button>
			   		
		   		<% } %>
		   		
		   		</div>
		   		
	  		</div>
	  		
	  		<script>
	  		
	  			function before(){
	  				
	  				location.href="<%= request.getContextPath() %>/selectThumbList.tn";
	  			}
	  		
	  			function goDelete(){
	  				
	  				location.href="<%= request.getContextPath() %>/deleteThumbnail.tn?boNo=<%= b.getBo_no()%>";
	  			}
	  		
	  		</script>
		
		</div>
   		<br/>
   		<br/>
   		<br/>
   		<br/>
	
		<!-- 푸터용 메뉴바 -->
	<%@ include file="footer.jsp"%>

	<!-- jQuery Plugins -->
	<script src="views/user/jeong/js/jquery.min.js"></script>
	<script src="views/user/jeong/js/bootstrap.min.js"></script>
	<script src="views/user/jeong/js/slick.min.js"></script>
	<script src="views/user/jeong/js/nouislider.min.js"></script>
	<script src="views/user/jeong/js/jquery.zoom.min.js"></script>
	<script src="views/user/jeong/js/main.js"></script>
	
	
</body>
</html>