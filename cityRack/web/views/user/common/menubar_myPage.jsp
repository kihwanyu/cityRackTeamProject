<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.cityrack.member.common.model.dto.Member"%>
<% 
	Member loginUser = (Member)session.getAttribute("loginUser"); 
%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>E-SHOP HTML Template</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="../jeong/css/bootstrap.min.css" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="../jeong/css/slick.css" />
	<link type="text/css" rel="stylesheet" href="../jeong/css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="../jeong/css/nouislider.min.css" />

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="../jeong/css/font-awesome.min.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="../jeong/css/style.css" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>

<body>
	<!-- HEADER -->
	<header>
		<!-- header -->
		<div id="header">
			<div class="container">
				<div class="pull-left">
					<!-- 로고 -->
					<div class="header-logo">
					<a class="logo" href="<%= request.getContextPath() %>">
							<img src="./img/logo.png" alt="">
						</a>
					</div>
					<!-- /로고 -->
				</div>
				<div class="pull-right">
					<ul class="header-btns">
						<!-- Account -->
						<li class="header-account dropdown default-dropdown">
							<div class="dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-user-o"></i>
								</div>
								<strong class="text-uppercase">마이페이지 <i class="fa fa-caret-down"></i></strong>
							</div>
							<% if(loginUser == null){ %>
							<div class="loginDiv">
								<a href="views/user/rani/login.jsp" class="text-uppercase">로그인</a> / <a href="views/user/rani/join.jsp" class="text-uppercase">회원가입</a>
							</div>
							<%} else { %>
								<div class="loginDiv">
									<p><%=loginUser.getM_name() %>님, 환영합니다. </p>
								</div>
							<%} %>
							
							<%if(loginUser==null){ %>
							<ul class="custom-menu">													
								<li><a href="myPage_QnA.jsp"><i class="fa fa-heart-o"></i> 체질 Q / A</a></li>
								<li><a href="myPage_cs.jsp"><i class="fa fa-exchange"></i> 고객센터</a></li>							
							</ul>
							<%} else{ %>
							<ul class="custom-menu">
								<li><a id="goMyPage" href="myPage_info.jsp"><i class="fa fa-user-o"></i> 내 정보</a></li>							
								<li><a href="myPage_QnA.jsp"><i class="fa fa-heart-o"></i> 체질 Q / A</a></li>
								<li><a href="<%=request.getContextPath()%>/userOrderGetAll.or"><i class="fa fa-check"></i> 주문배송조회</a></li>
								<li><a href="myPage_cs.jsp"><i class="fa fa-exchange"></i> 고객센터</a></li>
								<li><a onclick="logout();"><i class="fa fa-unlock-alt"></i> 로그아웃</a></li>
							</ul>
							<%} %>
							<script type="text/javascript">
							
							</script>
						</li>
						
						
						<!-- /Account -->

						<!-- 장바구니 -->
						<li class="header-cart dropdown default-dropdown">
							<div class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-shopping-cart"></i>
									
								</div>
								<strong class="text-uppercase">장바구니</strong>
							</div>
							<div class="loginDiv">
							
								<a href="views/user/jeong/cart.jsp" class="text-uppercase">주문하러가기</a>
							
							</div>
						</li>
						<!-- /Cart -->

						<!-- Mobile nav toggle-->
						<li class="nav-toggle">
							<button class="nav-toggle-btn main-btn icon-btn"><i class="fa fa-bars"></i></button>
						</li>
						<!-- / Mobile nav toggle -->
					</ul>
				</div>
			</div>
			<!-- header -->
		</div>
		<!-- container -->
	</header>
	<!-- /HEADER -->

	<!-- NAVIGATION -->
	<div id="navigation">
		<!-- container -->
		<div class="container">
			<div id="responsive-nav">
				<!-- category nav -->
				<div class="category-nav">
					<span class="category-header">마이페이지</span>
				</div>
				<!-- /카테고리 메뉴바 -->

				<!-- 메뉴 네비게이터 -->
				<div class="menu-nav">
					<ul class="menu-list">
						<li><a href="../jeong/myPage_cart.jsp">장바구니</a></li>
						<li><a href="../jeong/myPage_delivery.jsp">주문배송조회</a></li>
						<li><a href="../jeong/myPage_QnA.jsp">체질 Q / A</a></li>
						<li><a href="../jeong/myPage_info.jsp">내 정보</a></li>
						<li><a href="../jeong/myPage_result.jsp">설문조사조회</a></li>
						<li><a href="../jeong/myPage_cs.jsp">고객센터</a></li>
					</ul>
				</div>
				<!-- 메뉴 네비게이터 -->
			</div>
		</div>
		<!-- /container -->
	</div>
	<!-- /NAVIGATION -->
	
	<script type="text/javascript">
	function logout(){
		location.href="<%= request.getContextPath()%>/Logout.em";
		
	}
	</script>

</body>
</html>