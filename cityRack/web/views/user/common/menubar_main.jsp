<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.cityrack.member.common.model.dto.Member"%>
<% String msg = String.valueOf(request.getAttribute("msg")); %>    
<% Member loginUser = (Member)session.getAttribute("loginUser"); %>
<!DOCTYPE html>
<html >

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/views/user/jeong/css/bootstrap.min.css" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/views/user/jeong/css/slick.css" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/views/user/jeong/css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/views/user/jeong/css/nouislider.min.css" />

	
	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/views/user/jeong/css/style.css" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<style type="text/css">
	#header-logo{
	width:80%;
	}
	body{
		font-family: 'Nanum Gothic', sans-serif;
	}
</style>

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
						<a class="logo" href="<%=request.getContextPath() %>">
							<img src="<%=request.getContextPath() %>/views/user/jeong/img/logo.png" style="width: 200px; height: 100px;"><!-- id="header-logo" -->
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
										<p><%=loginUser.getM_name() %>님, 환영합니다. | <a onclick="logout();" >로그아웃 </a></p>								
								</div>
							<%} %>
							<ul class="custom-menu">
								<li><a href="myPage_info.jsp"><i class="fa fa-user-o"></i> 내 정보</a></li>
								<li><a href="myPage_QnA.jsp"><i class="fa fa-heart-o"></i> 체질 Q / A</a></li>
								<li><a href="myPage_delivery.jsp"><i class="fa fa-check"></i> 주문배송조회</a></li>
								<li><a href="myPage_cs.jsp"><i class="fa fa-exchange"></i> 고객센터</a></li>
								<li><a href="#"><i class="fa fa-unlock-alt"></i> 로그아웃</a></li>
							</ul>
						</li>
						<!-- /Account -->

						<!-- 장바구니 -->
						<li class="header-cart dropdown default-dropdown">
							<div class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-shopping-cart"></i>
									<span class="qty">3</span>
								</div>
								<strong class="text-uppercase">장바구니</strong>
							</div>
							<div class="loginDiv">
								<a href="<%=request.getContextPath() %>/selectCart.ct" class="text-uppercase">주문하러가기</a>
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
				<div class="category-nav show-on-click">
					<span class="category-header">8체질 카테고리<i class="fa fa-list"></i></span>
					<ul class="category-list">
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" href="product1.jsp">목양체질<i class="fa fa-angle-right"></i></a>
						</li>
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" href="product2.jsp">목음체질<i class="fa fa-angle-right"></i></a>
						</li>						
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" href="#">토양체질<i class="fa fa-angle-right"></i></a>
						</li>						
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" href="#">토음체질<i class="fa fa-angle-right"></i></a>
						</li>						
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" href="#">금양체질<i class="fa fa-angle-right"></i></a>
						</li>						
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" href="#">금음체질<i class="fa fa-angle-right"></i></a>
						</li>						
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" href="product3.jsp">수양체질<i class="fa fa-angle-right"></i></a>
						</li>						
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" href="product4.jsp">수음체질<i class="fa fa-angle-right"></i></a>
						</li>						
						
					</ul>
				</div>
				<!-- /category nav -->

				<!-- 메뉴 네비게이터 -->
				<div class="menu-nav">
					<span class="menu-header">메뉴 <i class="fa fa-bars"></i></span>
					<ul class="menu-list">
						<li><a href="#">전체상품보기</a></li>
						<li><a href="#">베스트상품</a></li>
						<li><a href="<%=request.getContextPath() %>/getProducts.pr">시그니처 도시락</a></li>
						<li><a href="views/user/jeong/event.jsp">이벤트</a></li>
						<li class="dropdown mega-dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">설문조사 <i class="fa fa-caret-down"></i></a>
							<div class="custom-menu" width="300px">
								<div class="row">
									<div class="col-md-3">
										<div class="hidden-sm hidden-xs">
											<a class="banner banner-1">
												<img src="views/user/jeong/img/survey1.png" alt="">
											</a>
										</div>
										<hr>
										<ul class="list-links">
											<li><h3 class="list-links-title">간편설문조사</h3></li>
											<li>총 20문항으로, <br/>보다 간편하게 체질을 <br/>판단합니다.</li>
											<li><br/></li>
											<li><a href="views/user/jeong/survey_easy.jsp">간편설문조사하기 Go!</a></li>
										</ul>
									</div>
									<div class="col-md-3">
										<div class="hidden-sm hidden-xs">
											<a class="banner banner-1">
												<img src="views/user/jeong/img/survey2.png" alt="">
											</a>
										</div>
										<hr>
										<ul class="list-links">
										<li><h3 class="list-links-title">상세설문조사</h3></li>
											<li>총 65문항으로, <br/>보다 확실하게 체질을 <br/>판단합니다.</li>
											<li><br/></li>
											<li><a href="views/user/jeong/survey_detail.jsp">상세설문조사하기 Go!</a></li>
										</ul>
									</div>
									<div class="col-md-3">
										<div class="hidden-sm hidden-xs">
											<a class="banner banner-1">
												<img src="views/user/jeong/img/survey2.png" alt="">
											</a>
										</div>
										<hr>
										<ul class="list-links">
										<li><h3 class="list-links-title">설문조사결과</h3></li>
											<li>기존의 설문조사 결과로 <br/>체질의 특성과 음식을<br/>추천해드립니다.</li>
											<li><br/></li>
											<li>
												<!-- <a href="views/user/jeong/myPage_result.jsp">설문조사결과보기 Go!</a> -->
												<button type="button" onclick="goResult(); return false;" class="primary-btn">설문조사결과보기 Go!</button>
											</li>
										</ul>
									</div>
								<script>
										function goResult(){
											
										
										 <% 	
										
											// 로그인은 되어있는데
											if(loginUser != null){
												System.out.println(loginUser.getM_no());
												System.out.println(loginUser.getQ_8constitution());
												// 설문조사 한경우
												 if(loginUser.getQ_8constitution() != null){ 
												
												 %>
													 /* 회원번호도 넘기기 */
													location.href="<%= request.getContextPath()%>/selectCon?mNo=" + "<%= loginUser.getM_no() %>";
													request.setAttribute(q_8constitution);
													<%-- location.href="<%= request.getContextPath() %>/views/user/jeong/myPage_cs.jsp?사랑해="+ "사랑해"; --%>
													
											<%	
												// 설문조사 안한경우
												 } else {  %>
													/*  설문조사 먼저 하라구 알림창 */
												 alert("먼저 체질 설문조사를 진행해주세요."); 
											<%	 } 
											} else { 
											
											%>
												/*  로그인 후 이용할 수 있는 서비스라고 */
												alert("로그인 후 이용하실 수 있는 서비스입니다.");
										<%	} %> 
										 
										}	
												
								</script>
								</div>
							</div>
						</li>
						<li><a onclick="goReview(); return false;">city樂 후기</a></li>
					</ul>
				</div>
				
				<script>
				
					function goReview(){
						
						location.href="/cityRack/selectThumbList.tn";
					}
				
				</script>
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
	
	
	<!-- 	<!-- jQuery Plugins -->
	<!-- <script src="views/user/jeong/js/jquery.min.js"></script>
	<script src="views/user/jeong/js/bootstrap.min.js"></script>
	<script src="views/user/jeong/js/slick.min.js"></script>
	<script src="views/user/jeong/js/nouislider.min.js"></script>
	<script src="views/user/jeong/js/jquery.zoom.min.js"></script>
	<script src="views/user/jeong/js/main.js"></script>  -->

</body>
</html>