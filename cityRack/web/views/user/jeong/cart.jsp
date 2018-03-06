<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>E-SHOP HTML Template</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

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
						<a class="logo" href="#">
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
							<div class="loginDiv">
								<a href="#" class="text-uppercase">로그인</a> / <a href="#" class="text-uppercase">회원가입</a>
							</div>
							<ul class="custom-menu">
								<li><a href="#"><i class="fa fa-user-o"></i> 내 정보</a></li>
								<li><a href="#"><i class="fa fa-heart-o"></i> 체질 Q / A</a></li>
								<li><a href="#"><i class="fa fa-check"></i> 주문배송조회</a></li>
								<li><a href="#"><i class="fa fa-exchange"></i> 고객센터</a></li>
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
								<a href="#" class="text-uppercase">주문하러가기</a>
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
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" href="#">목양체질<i class="fa fa-angle-right"></i></a>
						</li>
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" href="#">목음체질<i class="fa fa-angle-right"></i></a>
						</li>						
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" href="#">수양체질<i class="fa fa-angle-right"></i></a>
						</li>						
						<li class="dropdown side-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" href="#">수음체질<i class="fa fa-angle-right"></i></a>
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
						
					</ul>
				</div>
				<!-- /category nav -->

				<!-- 메뉴 네비게이터 -->
				<div class="menu-nav">
					<span class="menu-header">메뉴 <i class="fa fa-bars"></i></span>
					<ul class="menu-list">
						<li><a href="#">전체상품보기</a></li>
						<li><a href="#">베스트상품</a></li>
						<li><a href="#">이벤트</a></li>
						<li class="dropdown mega-dropdown full-width"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">설문조사 <i class="fa fa-caret-down"></i></a>
							<div class="custom-menu">
								<div class="row">
									<div class="col-md-3">
										<div class="hidden-sm hidden-xs">
											<a class="banner banner-1">
												<img src="./img/logo.png" alt="">
											</a>
										</div>
										<hr>
										<ul class="list-links">
											<li><h3 class="list-links-title">간편설문조사</h3></li>
											<li>총 20문항으로, <br/>보다 간편하게 체질을 <br/>판단합니다.</li>
											<li><br/></li>
											<li><a href="survey_easy.jsp">간편설문조사하기 Go!</a></li>
										</ul>
									</div>
									<div class="col-md-3">
										<div class="hidden-sm hidden-xs">
											<a class="banner banner-1">
												<img src="./img/logo.png" alt="">
											</a>
										</div>
										<hr>
										<ul class="list-links">
										<li><h3 class="list-links-title">상세설문조사</h3></li>
											<li>총 65문항으로, <br/>보다 확실하게 체질을 <br/>판단합니다.</li>
											<li><br/></li>
											<li><a href="survey_detail.jsp">상세설문조사하기 Go!</a></li>
										</ul>
									</div>
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




	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<form id="checkout-form" class="clearfix">

					<div class="col-md-12">
						<div class="order-summary clearfix">
							<div class="section-title">
								<h3 class="title">장바구니</h3>
							</div>
							<table class="shopping-cart-table table">
								<thead>
									<tr>
										<th>상품</th>
										<th></th>
										<th class="text-center">가격</th>
										<th class="text-center">수량</th>
										<th class="text-center">총 금액</th>
										<th class="text-right"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="thumb"><img src="./img/땅콩조림.png" alt=""></td>
										<td class="details">
											<a href="#">땅콩조림</a>
										</td>
										<td class="price text-center"><strong>1,500</strong><br><del class="font-weak"><small>1,800</small></del></td>
										<td class="qty text-center"><input class="input" type="number" value="1"></td>
										<td class="total text-center"><strong class="primary-color">1,500</strong></td>
										<td class="text-right"><button class="main-btn icon-btn"><i class="fa fa-close"></i></button></td>
									</tr>
									<tr>
										<td class="thumb"><img src="./img/소고기장조림.png" alt=""></td>
										<td class="details">
											<a href="#">소고기장조림</a>
										</td>
										<td class="price text-center"><strong>2,000</strong></td>
										<td class="qty text-center"><input class="input" type="number" value="1"></td>
										<td class="total text-center"><strong class="primary-color">2,000</strong></td>
										<td class="text-right"><button class="main-btn icon-btn"><i class="fa fa-close"></i></button></td>
									</tr>
									<tr>
										<td class="thumb"><img src="./img/갈치조림.png" alt=""></td>
										<td class="details">
											<a href="#">갈치조림</a>
										</td>
										<td class="price text-center"><strong>2,500</strong></td>
										<td class="qty text-center"><input class="input" type="number" value="1"></td>
										<td class="total text-center"><strong class="primary-color">2,500</strong></td>
										<td class="text-right"><button class="main-btn icon-btn"><i class="fa fa-close"></i></button></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<th class="empty" colspan="3"></th>
										<th>총 금액</th>
										<th colspan="2" class="sub-total">6,000</th>
									</tr>
									<tr>
										<th class="empty" colspan="3"></th>
										<th>할인</th>
										<th colspan="2" class="sub-total">500</th>
									</tr>									
									<tr>
										<th class="empty" colspan="3"></th>
										<th>배송비</th>
										<td colspan="2">2,500</td>
									</tr>
									<tr>
										<th class="empty" colspan="3"></th>
										<th>결제금액</th>
										<th colspan="2" class="total">8,000</th>
									</tr>
								</tfoot>
							</table>
							<div class="pull-right">
								<button class="primary-btn">주문하기</button>
							</div>
						</div>

					</div>
				</form>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->





		<!-- 푸터용 메뉴바 -->
	<%@ include file="footer.jsp" %>
	
	
	<!-- jQuery Plugins -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>

</body>

</html>
