<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>

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

	

	<!-- Google font -->
	
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
	<!-- Bootstrap -->
	<!-- <link type="text/css" rel="stylesheet" href="/css/bootstrap.min.css" /> -->

	<!-- Slick -->
	<!-- <link type="text/css" rel="stylesheet" href="css/slick.css" />
	<link type="text/css" rel="stylesheet" href="css/slick-theme.css" /> -->

	<!-- nouislider -->
	<!-- <link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />
 -->

	<!-- Custom stlylesheet -->
<!-- 	<link type="text/css" rel="stylesheet" href="css/style.css" />
 -->
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->


<style type="text/css">

.section-grey {
    background: #F6F7F8;
}

.section {
   margin-top: 100px;
    padding-bottom: 30px;
}

article, aside, details, figcaption, figure, footer, header, hgroup, main, menu, nav, section, summary {
    display: block;
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<footer id="footer" class="section section-grey">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- footer widget -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="footer">
						<!-- footer logo -->
						<div class="footer-logo">
							<a class="logo" href="#">
		            <img src="<%=request.getContextPath() %>/views/user/rani/img/logo.png" alt="" id="footer-logo">
		          </a>
						</div>
						<!-- /footer logo -->
					</div>
				</div>
			

				<!-- 회사 소개 -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="footer">
						<h3 class="footer-header">회사소개</h3>
						<ul class="footer-list">
							<li><a href="#">서비스소개</a></li>
							<li><a href="#">개인정보처리방침</a></li>
							<li><a href="#">이용약관</a></li>
							<li><a href="#">공지사항</a></li>
							
						</ul>
					</div>
				</div>
				<!-- /회사 소개 -->

				<!-- 고객센터 -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="footer">
						<h3 class="footer-header">고객센터</h3>
						<ul class="footer-list">
							<li><a href="#">FAQ</a></li>
							<li><a href="#">고객센터</a></li>
							
						</ul>
					</div>
				</div>
				<!-- /고객센터 -->
				
				<!-- 배송 -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="footer">
						<h3 class="footer-header">주문 및 배송</h3>
						<ul class="footer-list">
							<li><a href="#">주문조회 / 배송조회</a></li>
							<li><a href="#">Q&A</a></li>
						</ul>
					</div>
				</div>
				<!-- /고객센터 -->
			

			</div>
			<!-- /row -->
			<hr>
			<!-- row -->
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<!-- footer copyright -->
					<div class="footer-copyright">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						<p alignt="center">@COPYRIGHTS</p>
						
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</div>
					<!-- /footer copyright -->
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</footer>
	<!-- /FOOTER -->
	
	
</body>
</html>