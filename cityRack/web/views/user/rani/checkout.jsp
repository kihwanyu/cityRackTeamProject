<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.cityrack.product.user.model.dto.Cart" %>
<%

ArrayList<Cart> c = (ArrayList<Cart>)request.getAttribute("cartList");

System.out.println("cart @checkout.jsp : " + c);


%>    

</style>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.empty{
	
	border-top-style: none;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>E-SHOP HTML Template</title>
	<!-- 결제 모듈 js file import -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Google font  -- >
	
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/views/user/rani/css/bootstrap.min.css" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/views/user/rani/css/slick.css" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/views/user/rani/css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/views/user/rani/css/nouislider.min.css" />

	

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/views/user/rani/css/style.css" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->


<style type="text/css">
body{
	font-family: 'Nanum Gothic', sans-serif !important;
}
</style>


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
				<form role='order' id="checkout-form" class="clearfix" action="<%=request.getContextPath() %>/PaymentInsert.pay" method="post">
					<div class="col-md-6">
						<div class="billing-details">
							<!-- <p>Already a customer ? <a href="#">Login</a></p> -->
							<div class="section-title">
								<h3 class="title">Billing Details</h3>
							</div>
							<div class="form-group">
								<input class="input" type="text" id="name" name="name" placeholder="이름" value="<%=loginUser.getM_name()%>">
							</div>
							
							<%
								String[] addressArr = loginUser.getM_address().split("/");
								String postcode = addressArr[0];
								String address1 = addressArr[1];
								String address2 = addressArr[2];
							%>
							
							<div class="form-group">
								<input class="input" type="text" id="sample6_postcode" name="postcode" placeholder="우편번호" value="<%=postcode%>">
								</div>
							<div class="form-group">
								<input  class="input spans" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="background:#FF720D;border-radius:4px;border:none; color:"><br>
								</div>
							<div class="form-group">
								<input  class="input" type="text" name="address" id="sample6_address" placeholder="주소" value="<%=address1%>">
								</div>
							<div class="form-group">	
								<input  class="input" type="text" name="address2" id="sample6_address2" placeholder="상세주소" value="<%=address2%>">
								</div>
								
								<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
							<script>
							    function sample6_execDaumPostcode() {
							        new daum.Postcode({
							            oncomplete: function(data) {
							                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							
							                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
							                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							                var fullAddr = ''; // 최종 주소 변수
							                var extraAddr = ''; // 조합형 주소 변수
							
							                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							                    fullAddr = data.roadAddress;
							
							                } else { // 사용자가 지번 주소를 선택했을 경우(J)
							                    fullAddr = data.jibunAddress;
							                }
							
							                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
							                if(data.userSelectedType === 'R'){
							                    //법정동명이 있을 경우 추가한다.
							                    if(data.bname !== ''){
							                        extraAddr += data.bname;
							                    }
							                    // 건물명이 있을 경우 추가한다.
							                    if(data.buildingName !== ''){
							                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							                    }
							                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
							                }
							
							                // 우편번호와 주소 정보를 해당 필드에 넣는다.
							                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
							                document.getElementById('sample6_address').value = fullAddr;
							
							                // 커서를 상세주소 필드로 이동한다.
							                document.getElementById('sample6_address2').focus();
							            }
							        }).open();
							    }
							</script>

							<div class="form-group">
								<input class="input" type="tel" name="tel" placeholder="전화번호" value="<%=loginUser.getM_tel()%>">
							</div>
							<div class="form-group">
								<input class="input" type="tel" name="phone" placeholder="휴대폰" value="<%=loginUser.getM_phone()%>">
							</div>
							<div class="form-group">
							<textarea class="input" rows="5" cols="10" style="resize: none; height: 50px;" name="messeage" placeholder="메세지를 입력해주세요."></textarea>
							</div>
							<div class="form-group">
								<div class="input-checkbox">
									<label style="font-size: 15px; color: red;"> - 수령자의 정보가 다르다면 수정해주세요.</label>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="payments-methods">
							<div class="section-title">
								<h4 class="title">결제 수단</h4>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="payments" value="trans" id="payments-1" checked>
								<label for="payments-1">온라인 계좌이체</label>
								
							</div>
							<div class="input-checkbox">
								<input type="radio" name="payments" value="samsung" id="payments-2">
								<label for="payments-2">삼성 페이</label>
								
							</div>
							<div class="input-checkbox">
								<input type="radio" name="payments" value="card" id="payments-3">
								<label for="payments-3">신용카드</label>
							
							</div>
							<div class="input-checkbox">
								<input type="radio" name="payments" value="vbank" id="payments-4">
								<label for="payments-4">가상계좌</label>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="payments" value="phone" id="payments-5">
								<label for="payments-5">핸드폰 소액결제</label>
							</div>
						</div>
					</div>
					<!-- 주문확인 -->
					<div class="col-md-12">
						<div class="order-summary clearfix">
							<div class="section-title">
								<h3 class="title">주문 확인</h3>
							</div>
							<table class="shopping-cart-table table">
								<thead>
									<tr>
										<th>상품</th>
										<th></th>
										<th class="text-center">가격</th>
										<th class="text-center">수량</th>
										<th class="text-center">Total</th>
										<th class="text-right"></th>
									</tr>
								</thead>
								<tbody>
								<% for(int i = 0; i<c.size();i++){ %>
									<tr>
										<!-- 제품 정보 -->
										<td class="thumb"><img src="product_download_imgFiles/<%=c.get(i).getPic1()%>" alt=""></td>
										<td class="details">
											<a href="#"><%=c.get(i).getpName() %></a>
										</td>
										<!-- 가격 -->
										<% if(c.get(i).getDiscount()!=0){ %>
										<td class="price text-center">
											<strong><%=(c.get(i).getDiscount()*0.01 )* c.get(i).getPrice() %></strong><br>
											<del class="font-weak"><small><%=c.get(i).getPrice() %></small></del>
										</td>
										<%} else{ %>
										<td class="price text-center">
											<strong><%=c.get(i).getPrice() %></strong><br>
										</td>
										<%} %>
										<!-- 수량 -->
										<td class="qty text-center">
											<input class="input" type="text" value="<%=c.get(i).getCart_amount()%>">
										</td>
										<!-- 단가 * 수량 -->
										<td class="total text-center">
										<% if(c.get(i).getDiscount() != 0)  {%>
										<strong class=" primary-color"  ><%=(c.get(i).getDiscount()*0.01 )* c.get(i).getPrice() %> </strong>
										<input type="hidden" class="eachTotalPrice" name="totalPrice"  value=<%=(c.get(i).getDiscount()*0.01 )* c.get(i).getPrice() %>>
										<% } else {%>
										<strong class=" primary-color" ><%=c.get(i).getPrice() %></strong>
										<input type="hidden" class="eachTotalPrice" name="totalPrice" value=<%=c.get(i).getPrice() %>>
										<%} %>
										</td>
									</tr>
								<%} %>
								</tbody>
								<tfoot>
								<tr>
									 <tr>
										<th class="empty" colspan="3" style="border-top-style: none;"></th>
										<th>제품 총 금액</th>
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
												
												$("#totalPrice").html(totalPrice+"원");
												
											});										
										</script> 
										</th>
									</tr>
									<tr>
										<th class="empty" colspan="3" style="border-top-style: none;"></th>
										<th>배송료</th>
										<td colspan="2">2500원</td>
									</tr>
									<tr>
										<th class="empty" colspan="3" style="border-top-style: none;"></th>
										
										<th>결제금액</th>
										<th colspan="2" class="total" id="payThis">									
										</th>
									</tr>
								</tfoot>
							</table>
							<div class="pull-right">
								<input type="button" id="paymentBtn" class="primary-btn" style="padding-left: 70px; padding-right: 70px;" value="주문하기">
							</div>
						</div>

					</div>
					
					<input type="hidden" id='pay_pg' name="pay_pg">
					<input type="hidden" id="pay_paymethod" name="pay_paymethod">
					<input type="hidden" id="pay_merchant_uid" name="pay_merchant_uid">
					<input type="hidden" id="pay_name" name="pay_name">
					<input type="hidden" id="pay_amount" name="pay_amount">
					<input type="hidden" id="pay_buyer_name" name="pay_buyer_name">
					<input type="hidden" id="pay_buyer_tel" name="pay_buyer_tel">
					<input type="hidden" id="pay_buyer_addr" name="pay_buyer_addr">
					<input type="hidden" id="pay_buyer_postcode" name="pay_buyer_postcode">
					<input type="hidden" id="pay_imp_uid" name="pay_imp_uid">
					<input type="hidden" id="pay_apply_num" name="pay_apply_num">
					<input type="hidden" id="pay_buyer_email" name="pay_buyer_email">
					
				</form>
				
				<script type="text/javascript">
				$(function(){
					var formObj = $("form[role='order']");
					console.log(formObj);

					var total = parseInt($("#totalPrice").text());
					var deliveryFee = 2500;
					
					console.log("토탈 : " + total);
					console.log( "배송료 "+ deliveryFee);
					var payThisAmount = total+deliveryFee;
					
					$("#payThis").html(payThisAmount+"원");
					
					$('#paymentBtn').click(function(){
						var IMP = window.IMP; // 생략가능
						IMP.init('imp46573984'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
						var pg = 'inicis';
						var pay_pay_method = $(":radio[name='payments']:checked").val(); 
						var pay_amount = payThisAmount; // 만약 앞뒤로 공백이있다면 공백제거
						var pay_name = "test1";
						
						var pay_buyer_email = "<%=loginUser.getM_email()%>";
						var pay_buyer_name = "<%=loginUser.getM_name()%>";
						var pay_buyer_tel = "<%=loginUser.getM_phone()%>";
						var pay_buyer_address = "<%=address1+address2%>";
						var pay_buyer_postcode = "<%=postcode%>";
						
						IMP.request_pay({
						    pg : pg, 
						    pay_method : pay_pay_method,
						    merchant_uid : 'merchant_' + new Date().getTime(),
						    name : pay_name,
						    amount : pay_amount,
						    buyer_email : pay_buyer_email,
						    buyer_name : pay_buyer_name,
						    buyer_tel : pay_buyer_tel,
						    buyer_addr : pay_buyer_address,
						    buyer_postcode : pay_buyer_postcode,
						}, function(rsp) {
						    if ( rsp.success ) {
						        var msg = '결제가 완료되었습니다.';
						        msg += '고유ID : ' + rsp.imp_uid;
						        msg += '상점 거래ID : ' + rsp.merchant_uid;
						        msg += '결제 금액 : ' + rsp.paid_amount;
						        msg += '카드 승인번호 : ' + rsp.apply_num;
						        
						      	$('#pay_imp_uid').val(rsp.imp_uid); 
						      	$('#pay_merchant_uid').val(rsp.merchant_uid);
						      	$('#pay_amount').val(rsp.paid_amount);
						      	$('#pay_apply_num').val(rsp.apply_num);
						      	$('#pay_pg').val(pg);
						      	$('#pay_paymethod').val(pay_pay_method);
						      	$('#pay_name').val(pay_name);
						      	$('#pay_buyer_name').val(pay_buyer_name);
						      	$('#pay_buyer_tel').val(pay_buyer_tel);
						      	$('#pay_buyer_addr').val(pay_buyer_address);
						      	$('#pay_buyer_postcode').val(pay_buyer_postcode);
						      	$('#pay_buyer_email').val(pay_buyer_email);
								
						        formObj.submit();
						    } else {
						        var msg = '결제에 실패하였습니다.';
						        msg += '에러내용 : ' + rsp.error_msg;
						    }
						    alert(msg);
						});
					});
				});
				</script>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->

	<!-- 푸터 -->
	<%@ include file="/views/user/common/footer.jsp" %>
	
	<!--/ 푸터 -->


</body>
</html>