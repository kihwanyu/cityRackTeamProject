<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.cityrack.member.common.model.dto.Member,
    								com.kh.cityrack.question.user.model.dto.* "%>
    								
<% 
	Member loginUser = (Member)session.getAttribute("loginUser"); 
%>

<!DOCTYPE html>
<html >
<!-- asd --><!-- sd -->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>cityRack</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

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
							<img src="views/user/jeong/img/logo.png" alt="">
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
											<p> <%=loginUser.getM_name()%> 님, 환영합니다. | <a onclick="logout();" >로그아웃 </a></p>
								</div>
							<%} %> 
							<ul class="custom-menu">
								<li><a href="views/user/jeong/myPage_info.jsp"><i class="fa fa-user-o"></i> 내 정보</a></li>
								<li><a href="<%=request.getContextPath() %>/selectList.bo"><i class="fa fa-heart-o"></i> 체질 Q / A</a></li>
								<li><a href="views/user/jeong/myPage_delivery.jsp"><i class="fa fa-check"></i> 주문배송조회</a></li>
								<li><a href="views/user/jeong/myPage_cs.jsp"><i class="fa fa-exchange"></i> 고객센터</a></li>
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

	<!-- 메뉴 네비게이션 -->
	<div id="navigation">
		<!-- container -->
		<div class="container">
			<div id="responsive-nav">
				<!-- category nav -->
				<div class="category-nav">
					<span class="category-header">8체질 바로가기 <i class="fa fa-list"></i></span>
					<ul class="category-list">
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" aria-expanded="true" href="views/user/jeong/product1.jsp">목양체질<i class="fa fa-angle-right"></i></a>
						</li>
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" aria-expanded="true" href="views/user/jeong/product2.jsp">목음체질<i class="fa fa-angle-right"></i></a>
						</li>						
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" aria-expanded="true" href="views/user/jeong/product3.jsp">수양체질<i class="fa fa-angle-right"></i></a>
						</li>						
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" aria-expanded="true" href="views/user/jeong/product4.jsp">수음체질<i class="fa fa-angle-right"></i></a>
						</li>						
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" aria-expanded="true" href="views/user/rani/toyang.jsp">토양체질<i class="fa fa-angle-right"></i></a>
						</li>						
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" aria-expanded="true" href="views/user/rani/toeum.jsp">토음체질<i class="fa fa-angle-right"></i></a>
						</li>						
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" aria-expanded="true" href="views/user/rani/keumyang.jsp">금양체질<i class="fa fa-angle-right"></i></a>
						</li>						
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" aria-expanded="true" href="views/user/rani/kumeum.jsp">금음체질<i class="fa fa-angle-right"></i></a>
						</li>	
						<li class="type_check">
							<a class="dropdown-toggle" aria-expanded="true" href="views/user/rani/survey.jsp">체질확인하러가기 Go!</a>
							<img src="views/user/jeong/img/help.png" height="135px" width="268px">
						</li>							
					</ul>

				</div>
				<!-- /카테고리 메뉴바 -->

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
										alert("<%= loginUser.getM_no() %>");
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
					</ul>
				</div>
				<!-- 메뉴 네비게이터 -->
			</div>
		</div>
		<!-- /container -->
	</div>
	<!-- /NAVIGATION -->

	<!-- 홈 -->
	<div id="home">
		<!-- container -->
		<div class="container">
			<!-- home wrap -->
			<div class="home-wrap">
				<!-- home slick -->
				<div id="home-slick">	<!--  메뉴 배너 광고 -->
					<!-- banner -->
					<div class="banner banner-1">
						<img src="views/user/jeong/img/main0.png" alt="">
						<div class="banner-caption text-center">
							<h1 class="white-color">베스트 식단</h1>
							<button class="primary-btn">보러가기</button>
						</div>
					</div>
					<!-- /banner -->

					<!-- banner -->
					<div class="banner banner-1">
						<img src="views/user/jeong/img/main1.png" alt="">
						<div class="banner-caption">
							<h1 class="primary-color">HOT DEAL<br><span class="white-color font-weak">신상품</span></h1>
							<button class="primary-btn">보러가기</button>
						</div>
					</div>
					<!-- /banner -->

					<!-- banner -->
					<div class="banner banner-1" align="center">
						<img src="views/user/jeong/img/main2.png" alt="">
						<div class="banner-caption">
							<h1 class="primary-color">체질에 따른 <br/><span class="white-color font-weak">건강한 식단</span></h1>
							<button class="primary-btn">체질조사하기</button>
						</div>
					</div>
					<!-- /banner -->
				</div>
				<!-- /home slick -->
			</div>
			<!-- /home wrap -->
		</div>
		<!-- /container -->
	</div>
	<!-- /HOME -->

	<!-- section --> <!-- 이미지 메뉴 -->
	<div class="section section-grey">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- banner -->
				<div class="col-md-8">
					<div class="banner banner-1">
						<img src="views/user/jeong/img/banner13.png" alt="">
						<div class="banner-caption text-center">
							<h1 class="primary-color"><br><span class="white-color font-weak">베스트리뷰</span></h1>
							<button class="primary-btn">보러가기</button>
						</div>
					</div>
				</div>
				<!-- /banner -->
			
				<!-- banner -->
				<div class="col-md-4 col-sm-6">
					<a class="banner banner-1" href="#">
						<img src="views/user/jeong/img/banner11.png" alt="">
						<div class="banner-caption text-center" 
							onclick="location.href='<%= request.getContextPath() %>/views/user/jeong/ingredient.jsp';">
							<h2 class="white-color">재료이야기</h2>
						</div>
						<script>
							
							$("#ingre").click(function(){
								
								location.href="<%= request.getContextPath() %>/views/user/jeong/ingredient.jsp";
							});
							
						
						</script>
					</a>
				</div>
				<!-- /banner -->

				<!-- banner -->
				<div class="col-md-4 col-sm-6">
					<a class="banner banner-1" href="#">
						<img src="views/user/jeong/img/banner12.png" alt="">
						<div class="banner-caption text-center">
							<h3 class="white-color">더 맛있게 즐기기</h3>
						</div>
					</a>
				</div>
				<!-- /banner -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->

	<script type="text/javascript">
	
		function logout(){
			location.href="<%= request.getContextPath()%>/Logout.em";
			
		}
	
	</script>

		<!-- 푸터용 메뉴바 -->
	<%@ include file="footer.jsp" %>



	<!-- jQuery Plugins -->
	<script src="views/user/jeong/js/jquery.min.js"></script>
	<script src="views/user/jeong/js/bootstrap.min.js"></script>
	<script src="views/user/jeong/js/slick.min.js"></script>
	<script src="views/user/jeong/js/nouislider.min.js"></script>
	<script src="views/user/jeong/js/jquery.zoom.min.js"></script>
	<script src="views/user/jeong/js/main.js"></script>

</body>

</html>
