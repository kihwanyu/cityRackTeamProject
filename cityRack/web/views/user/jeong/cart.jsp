<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.cityrack.product.user.model.dto.Product, com.kh.cityrack.product.user.model.dto.Cart"  %>
<%

ArrayList<Cart> c = (ArrayList<Cart>)request.getAttribute("cartList");

Member m = (Member) request.getAttribute("loginUser");
System.out.println("cart @cart.jsp " + c);
%>    
<!DOCTYPE html>
<html >

<head>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<style type="text/css">
	.btns{
		align:center;
		width:300px;
		background:#FF7930;
		font-size:40px;
		border-radius:20px;
		font:font-family: 'Nanum Gothic', sans-serif;
		border:none;
		align:center;
		color:black;
		font-weight:bold;
		height:80px;
	}
.btns:hover{
		background:#337517;
		color:white;
	}


.buttons{
	
	margin-left:15%;
}

.btns{
	
	margin-right:20px;
	margin-bottom:100px;
}

body{
	font-family: 'Nanum Gothic', sans-serif !important;
}
</style>


</head>

<body>
	

	<!-- 메뉴바 -->
	
	<%@ include file="/views/user/common/menubar_main.jsp" %>
	<!-- /메뉴바 -->


	<%if(loginUser==null){%>
	<div style="margin-top:30px;padding-bottom:50px;">
	<h2 align="center">로그인이 필요한 서비스입니다.</h2>
	</div>
	<div >
	<button align="center" class="btns" style="font-size:30px;margin-left:40%; "onclick="location.href='views/user/rani/login.jsp'">로그인 하러 가기 </button>
	</div>
	
	<%} else{ %>


	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<form id="cartForm" class="clearfix" action="<%=request.getContextPath() %>/goCheckOut.or" method="post">

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
									</tr>
								</thead>
								<tbody>
								<% for (int i = 0; i<c.size();i++){ %>
									<tr>
										<td><input type="checkbox" name="productCheck" class="checkboxes" value="<%=c.get(i).getProduct_code() %>" id="<%=c.get(i).getProduct_code() %>"></td>
										<td class="thumb"><img src="product_download_imgFiles/<%=c.get(i).getPic1()%>" alt=""></td>
										<td class="details">
											<a href="#"><label for="<%=c.get(i).getProduct_code() %>"><%=c.get(i).getpName() %></label></a>
											<input type="hidden" value="<%=c.get(i).getProduct_code() %>" name="pcode" class="pcode">
										</td>
										<!-- 단가가격 -->
										<% if(c.get(i).getDiscount()==0 ){%>
										<td class="price text-center" value="<%=c.get(i).getPrice() %>">
											<strong><%=c.get(i).getPrice() %></strong>
										</td>										
										<%} else {%>
										<td class="price text-center" >
											<strong><%=c.get(i).getDiscount()*c.get(i).getPrice() %></strong><br>
											<del class="font-weak"><small><%=c.get(i).getPrice() %></small></del>
											<input type="hidden" value="<%=c.get(i).getDiscount()*c.get(i).getPrice() %>" name="dc" class="dcAmount">
											
										</td>
										<%} %>
										<!-- 수량 -->
										<td class="qty text-center" >
										<input class="input qty" name ="quantity" type="number" min="1" value="<%=c.get(i).getCart_amount() %>">
										</td>
										<!-- 단가*수량 -->
										<% if(c.get(i).getDiscount()==0 ){%>
										<td class="total text-center" >
											<strong class="primary-color"><%=c.get(i).getPrice()*c.get(i).getCart_amount() %></strong>
											<input type="hidden" class="eachTotalPrice" name="totalPrice"  value=<%=c.get(i).getPrice()*c.get(i).getCart_amount() %>>
										</td>
										<%} else {%>
										<td class="total text-center" value=<%=c.get(i).getDiscount()*c.get(i).getPrice()*c.get(i).getCart_amount() %>>
											<strong class="primary-color"><%=c.get(i).getDiscount()*c.get(i).getPrice()*c.get(i).getCart_amount() %></strong>
											<input type="hidden" class="eachTotalPrice" name="totalPrice" value=<%=c.get(i).getDiscount()*c.get(i).getPrice()*c.get(i).getCart_amount() %>>
										</td>
										<%} %>
										
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
												var totalPrice = 0;
												var length = $(".total").length;
												console.log("length : " + length);
												
												for(var i = 0; i<length-1;i++){
													totalPrice += parseInt($(".eachTotalPrice").eq(i).val());
												}
												
												console.log("totalPrice : " + totalPrice);
												
												$("#totalPrice").html(totalPrice);
												
											});										
										</script> 
										</th>
									</tr>
									<tr>
										<th class="empty" colspan="3"></th>
										<th>할인</th>
										<th colspan="2" class="sub-total" id="dcAmount">
										<script type="text/javascript">
											$(function(){
												var dc = 0;
												var length = $(".font-weak").length;
												for(var i =0; i<length-1;i++){
													dc += parseInt($(".dcAmount").eq(i).val());	
												}
												console.log("dc : " + dc);
												
												$("#dcAmount").html(dc*$("#totalPrice").val());
												
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
												
												var total = parseInt($("#totalPrice").text());
												var dc = parseInt($("#dcAmount").text());
												var deliveryFee = 2500;
												
												console.log("토탈 : " + total);
												console.log("디스카운트 " + dc);
												console.log( "배송료 "+ deliveryFee);
												var payThisAmount = total-dc+deliveryFee;
												
												$("#payThis").html(payThisAmount);
											
												
											});
											
											
										</script>
										</th>
									</tr>
								</tfoot>
							</table>
							<div class="pull-right">
								<button class="primary-btn" onclick="deleteThis();">삭제하기</button>
								<button class="primary-btn" onclick="editThis();">수정하기</button>
								<button class="primary-btn" onclick="goCheckOut();">주문하기</button>
							</div>
							<script type="text/javascript">
							$(function(){
								$("#checkAll").change(function(){
									if(this.checked){
										$(".checkboxes").prop("checked",true);
									} else {
										$(".checkboxes").prop("checked",false);
									}
								});	
							});
							
							
						
							/* $(function(){
								var count = 0;
								data = [];
								 $(".checkboxes").change(function(){									
										//console.log("윽 : " + $(this).val());
										count++;
										data += $(this).val() + "/";
										console.log(data);
									});
						 
							}); */
							
							//장바구니 삭제
							 function deleteThis(){
								 
								$("#cartForm").attr({"action": "<%=request.getContextPath()%>/deleteCart.ct" , "method":"post"}).submit();
							} 
							 
							
							//장바구니 수정
							function editThis(){
								$("#cartForm").attr({"action" : "<%=request.getContextPath()%>/editCart.ct", "method":"post"}).submit();
							}
							
							
							 function goCheckOut(){
								 var question = confirm('장바구니에 담긴 상품들로 주문하시겠습니까?');
								 
								 if(question == true){
									$("#cartForm").submit();
								 }
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

<%} %>

<!-- 푸터 -->
	<%@ include file="/views/user/common/footer.jsp" %>
	
	<!--/ 푸터 -->

</body>

</html>
