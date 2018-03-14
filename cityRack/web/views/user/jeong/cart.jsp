<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.cityrack.product.user.model.dto.Product"  %>
<%HashMap<Product, Integer> hmap = (HashMap<Product, Integer>)request.getAttribute("hmap");
System.out.println(hmap);%>    
<!DOCTYPE html>
<html >

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


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
	

	<!-- 메뉴바 -->
	
	<%@ include file="/views/user/common/menubar_main.jsp" %>
	<!-- /메뉴바 -->


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
	
	

</body>

</html>
