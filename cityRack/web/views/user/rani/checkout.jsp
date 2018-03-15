<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
				<form role='order' id="checkout-form" class="clearfix">
					<div class="col-md-6">
						<div class="billing-details">
							<!-- <p>Already a customer ? <a href="#">Login</a></p> -->
							<div class="section-title">
								<h3 class="title">Billing Details</h3>
							</div>
							<div class="form-group">
								<input class="input" type="text" id="buyer_name" name="name" placeholder="이름" value="<%=loginUser.getM_name()%>">
							</div>
							
							<div class="form-group">
								<input class="input" type="email" id="buyer_email" name="email" placeholder="이메일" value="<%=loginUser.getM_email()%>">
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
								<input class="input" type="tel" name="phone" placeholder="전화번호" value="<%=loginUser.getM_phone()%>">
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
									<tr>
										<td class="thumb"><img src="./img/baby-octopus.jpg" alt=""></td>
										<td class="details">
											<a href="#">쭈꾸미 볶음</a>
											
										</td>
										<td class="price text-center"><strong>$32.50</strong><br><del class="font-weak"><small>$40.00</small></del></td>
										<td class="qty text-center"><input class="input" type="number" value="1"></td>
										<td class="total text-center"><strong class="primary-color">$32.50</strong></td>
										<td class="text-right"><button class="main-btn icon-btn"><i class="fa fa-close"></i></button></td>
									</tr>
									
									
								</tbody>
								<tfoot>
									<tr>
										<th class="empty" colspan="3"></th>
										<th>제품 총 금액</th>
										<th colspan="2" class="sub-total">$97.50</th>
									</tr>
									<tr>
										<th class="empty" colspan="3"></th>
										<th>배송료</th>
										<td colspan="2">Free Shipping</td>
									</tr>
									<tr>
										<th class="empty" colspan="3"></th>
										<th>주문 총 금액</th>
										<th colspan="2" class="total" id="total" >10000</th>
									</tr>
								</tfoot>
							</table>
							<div class="pull-right">
								<input type="button" id="paymentBtn" class="primary-btn" style="padding-left: 70px; padding-right: 70px;" value="주문하기">
							</div>
						</div>

					</div>
					
					<input type="hidden" id='pay_pg'>
					<input type="hidden" id="pay_paymethod">
					<input type="hidden" id="pay_merchant_uid">
					<input type="hidden" id="pay_name">
					<input type="hidden" id="pay_amount">
					<input type="hidden" id="pay_buyer_name">
					<input type="hidden" id="pay_buyer_tel">
					<input type="hidden" id="pay_buyer_addr">
					<input type="hidden" id="pay_buyer_postcode">
					<input type="hidden" id="pay_imp_uid">
					<input type="hidden" id="pay_apply_num">
					<input type="hidden" id="pay_buyer_email">
					
				</form>
				<script type="text/javascript">
				$(function(){
					
					var formObj = $("form[role='order']");
					
					console.log(formObj);
					/* 주문명은 상품 나열해주세요. 
					장바구니에서 상품을 가져올 때 productStr에 상품을 누적해서 
					productStr을 pay_name 넣어준다.
					예) 단무지 단무지 단무지
					*/
					
					$('#paymentBtn').click(function(){
						var IMP = window.IMP; // 생략가능
						IMP.init('imp46573984'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
						var pg = 'html5_incis';
						var pay_pay_method = $(":radio[name='payments']:checked").val(); 
						var pay_amount = $("#total").html().trim(); // 만약 앞뒤로 공백이있다면 공백제거
						var pay_name = "";
						<%-- var pay_name = <%=productStr %>; --%>
						
						var pay_buyer_email = $('#buyer_email').val();
						var pay_buyer_name = $('#buyer_name').val();
						var pay_buyer_tel = $('#buyer_tel').val();
						var pay_buyer_address = $('#sample6_address').val();
						var pay_buyer_postcode = $('#sample6_postcode').val();
						
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
						    //m_redirect_url : 'https://www.yourdomain.com/payments/complete'
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