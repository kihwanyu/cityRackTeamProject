<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.cityrack.product.user.model.dto.Product, com.kh.cityrack.product.user.model.dto.Cart"  %>
<%

ArrayList<Cart> c = (ArrayList<Cart>)request.getAttribute("cartList");
HashMap<Product, Integer> foodprice = (HashMap<Product, Integer>)request.getAttribute("foodprice");
HashMap<Product, Integer> foodname = (HashMap<Product, Integer>)request.getAttribute("foodname");
Member m = (Member) request.getAttribute("loginUser");

System.out.println("foodname @cart.jsp " + foodname);
System.out.println("foodprice @cart.jsp " + foodprice);
System.out.println("foodname @cart.jsp " + c);
%>    
<!DOCTYPE html>
<html >

<head>
	<!-- <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags


	Google font
	<link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

	Bootstrap
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

	Slick
	<link type="text/css" rel="stylesheet" href="css/slick.css" />
	<link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

	nouislider
	<link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

	Font Awesome Icon
	<link rel="stylesheet" href="css/font-awesome.min.css">

	Custom stlylesheet
	<link type="text/css" rel="stylesheet" href="css/style.css" />
 -->
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

										<th><input type="checkbox" id="checkAll">전체선택</th>
										<th>상품</th>
										<th></th>
										<th class="text-center">가격</th>
										<th class="text-center">수량</th>
										<th class="text-center">총 금액</th>
										<th class="text-right"></th>
									</tr>								</thead>
								<tbody>
								<% for (int i = 0; i<c.size();i++){ %>
									<tr>
										<td><input type="checkbox" name="productCheck" class="checkboxes" value="<%=c.get(i).getProduct_code() %>"></td>
										<td class="thumb"><img src="<%=c.get(i).getPic1()%>" alt=""></td>
										<td class="details">
											<a href="#"><%=c.get(i).getProduct_code() %></a>
										</td>
										<% if(c.get(i).getDiscount()==0 ){%>
										<td class="price text-center"><strong><%=c.get(i).getPrice() %></strong></td>
										<%} else {%>
										<td class="price text-center"><strong><%=c.get(i).getDiscount()*c.get(i).getPrice() %></strong><br><del class="font-weak"><small><%=c.get(i).getPrice() %></small></del></td>
										<%} %>
										
										<td class="qty text-center"><input class="input" type="number" value="<%=c.get(i).getCart_amount() %>"></td>
										
										<% if(c.get(i).getDiscount()==0 ){%>
										<td class="total text-center"><strong class="primary-color"><%=c.get(i).getPrice() %></strong></td>
										<%} else {%>
										<td class="total text-center"><strong class="primary-color"><%=c.get(i).getDiscount()*c.get(i).getPrice() %></strong></td>
										<%} %>
										<td class="text-right"><button class="main-btn icon-btn"><i class="fa fa-close"></i></button></td>
									</tr>
								<%} %>	
									
								</tbody>
								<tfoot>
									<tr>
										<th class="empty" colspan="3"></th>
										<th>총 금액</th>
										<th colspan="2" class="sub-total" id="totalPrice">
										 <script type="text/javascript">
											$(function(){
												var totalPrice;
												var length = $(".total").length();
												for(int i = 0; i<length;i++){
													totalPrice += $(".total").eq(i).val();
												}
												
												console.log(totalPrice);
												
												$("#totalPrice").val(totalPrice);
												
											});										
										</script> 
										</th>
									</tr>
									<tr>
										<th class="empty" colspan="3"></th>
										<th>할인</th>
										<th colspan="2" class="sub-total">
										<script type="text/javascript">
											$(function(){
												var dc;
												var length = $(".font-weak").length();
												for(int i =0; i<length;i++){
													dc += $(".font-weak").eq(i).val();	
												}
												console.log(dc);
												
												$(".sub-total").val(dc*$("#totalPrice").val());
												
											});
											
											
										</script>
										</th>
									</tr>									
									<tr>
										<th class="empty" colspan="3"></th>
										<th>배송비</th>
										<td colspan="2">2,500</td>
									</tr>
									<tr>
										<th class="empty" colspan="3"></th>
										<th>결제금액</th>
										<th colspan="2" class="total" id="payThis">
										<script type="text/javascript">
											$(function(){
												var total = $(".total").val();
												var dc = $(".sub-total").val();
												var payThisAmount = total-dc;
												
												$("#payThis").val(payThisAmount);
											});
										</script>
										</th>
									</tr>
								</tfoot>
							</table>
							<div class="pull-right">
								<button class="primary-btn" onclick="deleteThis();">삭제하기</button>
								<button class="primary-btn">주문하기</button>
							</div>
							<script type="text/javascript">
							$(function(){
								$("#checkAll").change(function(){
									if(this.checked){
									$(".checkboxes").prop("checked",true);
									}
								});	
							});
							
							function deleteThis(){
									locaiton.href="<% request.getContextPath()%>/deleteCart.ct";
								}
								
							</script>
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
