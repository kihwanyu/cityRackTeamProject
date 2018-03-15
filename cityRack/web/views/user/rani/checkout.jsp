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
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="css/slick.css" />
	<link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

	

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="css/style.css" />

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
								<input class="input" type="text" name="name" placeholder="이름">
							</div>
							
							<div class="form-group">
								<input class="input" type="email" name="email" placeholder="이메일">
							</div>
							<div class="form-group">
								<input class="input" type="text" id="sample6_postcode" placeholder="우편번호">
								</div>
							<div class="form-group">
								<input  class="input spans" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="background:#FF720D;border-radius:4px;border:none; color:"><br>
								</div>
							<div class="form-group">
								<input  class="input" type="text" id="sample6_address" placeholder="주소">
								</div>
							<div class="form-group">	
								<input  class="input" type="text" id="sample6_address2" placeholder="상세주소">
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
								<input class="input" type="tel" name="city" placeholder="전화번호">
							</div>
						
							<div class="form-group">
								<div class="input-checkbox">
									<input type="checkbox" id="register" >
									<label class="font-weak" for="register">수령자의 정보와 주문자의 정보가 같습니다</label>
									
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
								<label for="payments-3">가상계좌</label>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="payments" value="phone" id="payments-4">
								<label for="payments-3">핸드폰 소액결제</label>
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
										<th colspan="2" class="total" id='pay_amount'>$97.50</th>
									</tr>
								</tfoot>
							</table>
							<div class="pull-right">
								<button class="primary-btn" style="padding-left: 70px; padding-right: 70px;">주문하기</button>
							</div>
						</div>

					</div>
					<input type="hidden" id='pay_no'>
					<input type="hidden" id='pay_pg'>
					<input type="hidden" id="pay_paymethod">
					<input type="hidden" id="pay_merchant_uid">
					<input type="hidden" id="pay_name">
					<input type="hidden" id="pay_buyer_name">
					<input type="hidden" id="pay_buyer_tel">
					<input type="hidden" id="pay_buyer_addr">
					<input type="hidden" id="pay_buyer_postcode">
					<input type="hidden" id="pay_imp_uid">
					<input type="hidden" id="pay_apply_num">
					<input type="hidden" id="pay_buyer_email">
					<input type="hidden" id="pay_status">
				</form>
				<script type="text/javascript">
				$(function(){
					
					var formObj = $("form[role='order']");
					
					console.log(formObj);
					/* 주문명은 상품 나열해주세요. */
					$('#paymentbtn').click(function(){
						var IMP = window.IMP; // 생략가능
						IMP.init('imp46573984'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
						
						var pay_pay_method = $(":radio[name='payments']:checked").val(); 
						var pay_amount = $("#pay_amount").val();
						var pay_name = "";
						
						var pay_buyer_email = <%=loginUser.getM_email()%>;
						IMP.request_pay({
						    pg : 'html5_inicis', // version 1.1.0부터 지원.
						    pay_method : pay_pay_method,
						    merchant_uid : 'merchant_' + new Date().getTime(),
						    name : pay_name,
						    amount : pay_amount,
						    buyer_email : 'iamport@siot.do',
						    buyer_name : '구매자이름',
						    buyer_tel : '010-1234-5678',
						    buyer_addr : '서울특별시 강남구 삼성동',
						    buyer_postcode : '123-456',
						    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
						}, function(rsp) {
						    if ( rsp.success ) {
						        var msg = '결제가 완료되었습니다.';
						        msg += '고유ID : ' + rsp.imp_uid;
						        msg += '상점 거래ID : ' + rsp.merchant_uid;
						        msg += '결제 금액 : ' + rsp.paid_amount;
						        msg += '카드 승인번호 : ' + rsp.apply_num;
						    } else {
						        var msg = '결제에 실패하였습니다.';
						        msg += '에러내용 : ' + rsp.error_msg;
						    }
						    alert(msg);
						    
						    
						    
						    formObj.submit();
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