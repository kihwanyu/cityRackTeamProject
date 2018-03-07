<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>cityRack_myPage_delivery</title>

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
		<!-- 마이페이지용 메뉴바 -->
	<%@ include file="/views/user/common/menubar_myPage.jsp" %>



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
								<h3 class="title">주문배송조회</h3>
							</div>
							<table class="shopping-cart-table table">
								<thead>
									<tr>
										<th>주문번호</th>
										<th class="text-center">상품</th>
										<th class="text-center">결제금액</th>
										<th class="text-center">배송상태</th>
										<th class="text-center">배송조회</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><a href="#">20180223000031</a></td>
										<td class="details">
											<a href="#">소고기 장조림 외 4건..</a>
										</td>
										<td class="price text-center"><strong>15,000</strong></td>
										<td class="price text-center">배송중</td>
										<td align="center"><button class="primary-btn">배송조회하기</button></td>
										<td class="text-right"></td>
									</tr>
									<tr>
										<td><a href="#">20180223000023</a></td>
										<td class="details">
											<a href="#">새송이버섯볶음 외 2건..</a>
										</td>
										<td class="price text-center"><strong>8,000</strong></td>
										<td class="price text-center">배송완료</td>
										<td align="center"><button class="primary-btn">배송조회하기</button></td>
										<td class="text-right"></td>
									</tr>
									<tr>
										<td><a href="#">20180223000001</a></td>
										<td class="details">
											<a href="#">땅콩조림 외 3건..</a>
										</td>
										<td class="price text-center"><strong>12,000</strong></td>
										<td class="price text-center">배송완료</td>
										<td align="center"><button class="primary-btn">배송조회하기</button></td>
										<td class="text-right"></td>
									</tr>									
								</tbody>
							</table>
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
	<script src="views/user/jeong/js/jquery.min.js"></script>
	<script src="views/user/jeong/js/bootstrap.min.js"></script>
	<script src="views/user/jeong/views/user/jeong/js/slick.min.js"></script>
	<script src="views/user/jeong/js/nouislider.min.js"></script>
	<script src="views/user/jeong/js/jquery.zoom.min.js"></script>
	<script src="views/user/jeong/js/main.js"></script>
</body>

</html>
