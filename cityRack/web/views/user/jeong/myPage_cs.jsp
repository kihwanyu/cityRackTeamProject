<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

/* String str = request.getParameter("사랑해");
System.out.println(str); */
/* sd */
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>cityRack_myPage_cs</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/views/user/jeong/css/bootstrap.min.css" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/views/user/jeong/css/slick.css" />
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/views/user/jeong/css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/views/user/jeong/css/nouislider.min.css" />

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="<%= request.getContextPath() %>/views/user/jeong/css/font-awesome.min.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/views/user/jeong/css/style.css" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>

<body>
		<!-- 마이페이지용 메뉴바 -->
	<%@ include file="/views/user/common/menubar_myPage.jsp" %>

		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<form id="checkout-form" class="clearfix">
					<div class="col-md-12">
						<div class="order-summary clearfix">
							<div class="section-title">
								<h3 class="title">고객센터</h3>
							</div>
							<br/>
							<div align="center">
								 <img src="./img/고객센터.png" width="50%">
								<img src="./img/help.png" align="middle">
							</div>
							<br/>
						</div>
					</div>
				</form>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->

<!-- 푸터 -->
	<%@ include file="/views/user/common/footer.jsp" %>
	
	<!--/ 푸터 -->

	<!-- jQuery Plugins -->
	<script src="<%= request.getContextPath() %>/views/user/jeong/js/jquery.min.js"></script>
	<script src="<%= request.getContextPath() %>/views/user/jeong/js/bootstrap.min.js"></script>
	<script src="<%= request.getContextPath() %>/views/user/jeong/js/slick.min.js"></script>
	<script src="<%= request.getContextPath() %>/views/user/jeong/js/nouislider.min.js"></script>
	<script src="<%= request.getContextPath() %>/views/user/jeong/js/jquery.zoom.min.js"></script>
	<script src="<%= request.getContextPath() %>/views/user/jeong/js/main.js"></script>
</body>

</html>
