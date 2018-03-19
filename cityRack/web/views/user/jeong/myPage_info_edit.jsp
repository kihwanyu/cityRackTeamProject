<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.cityrack.member.common.model.dto.Member" %>

<%
	//Member loginUser = (Member)session.getAttribute("loginUser");
	/* String[] address = loginUser.getM_address().split("/"); */
	
%>
<!-- sdfs --><!-- asd -->
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>cityRack_myPage_info_edit</title>
	
	

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/views/user/jeong/css/bootstrap.min.css" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/views/user/jeong/css/slick.css" />
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/views/user/jeong/css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/views/user/jeong/css/nouislider.min.css" />

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="<%= request.getContextPath() %>/views/user/jeong/css/font-awesome.min.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/views/user/jeong/css/style.css" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>

	.infoTable {
		background: #FFFFF0;
	}
	
		#password {
		border: 2px solid orange;
		border-radius: 10px;
	}
	
	
</style>

</head>

<body>
			<!-- 마이페이지용 메뉴바 -->
	<%@ include file="/views/user/common/menubar_myPage.jsp" %> 

		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<form id="checkout-form" class="clearfix"
					 action="<%= request.getContextPath() %>/updateMember.do" method="post">
					<div class="col-md-12">
						<div class="order-summary clearfix">
							<div class="section-title">
								<h3 class="title">내 정보 수정</h3>
							</div>
							<h4><%= loginUser.getM_name() %>님의 정보를 수정합니다.</h4>
							<br/>
							<br/>
							<h5 align="center">* 정보를 변경하신후, 수정완료를 눌러주세요. <br/> 변경되지 않은 정보는 가장 최근의 정보로 자동저장됩니다.</h5>
							
						<!-- 주소자르기 -->
							<% String[] address = loginUser.getM_address().split("/"); %>
							<div class="tableDiv">
							<table class="infoTable" align="center"  width="600px" style="border:2px solid orange;">
									<tr>
										<td style="font-size:12px;" align="center"><strong>이메일</strong></td>
										<td colspan="3" align="center">
											<input type="text" name="email" value="<%= loginUser.getM_email() %>" style="text-align:center;" readonly size="30px">
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;" align="center"><strong>비밀번호</strong></td>
										<td colspan="3" align="center">
											<input type="password" id="password" name="password"  size="23px" style="text-align:center;">
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;" align="center"><strong>이름</strong></td>
										<td colspan="3" align="center">
											<input type="text" name="name" value="<%= loginUser.getM_name() %>" readonly size="10px" style="text-align:center;" >
										</td>
									</tr>									
									<tr >
										<td rowspan="3" style="font-size:12px;" align="center"><strong>주소</strong></td>
										<td colspan="3" align="center">
											<input type="text" id="sample6_postcode" name="zipcode" value="<%= address[0] %>" size="10px" style="text-align:center;">
											<button type="button" class="editBtn" onclick="sample6_execDaumPostcode(); return false;">우편번호 찾기</button><br>
										</td>
									<tr >	
										<td colspan="3" style="border-bottom:1px solid white;" align="center">
											<input type="text" id="sample6_address" name="addr1" value="<%= address[1] %>" size="55px" style="text-align:center;">
										</td>
									</tr>
									<tr >
										<td colspan="3" align="center">
											<input type="text" id="sample6_address2" name="addr2" value="<%= address[2] %>" size="30px" style="text-align:center;">
										</td>
									</tr>								
									<tr>
										<td style="font-size:12px;" align="center"><strong>휴대폰</strong></td>
										<td colspan="3" align="center">
											<input type="text" name="phone" value="<%= loginUser.getM_phone() %>" size="20px" style="text-align:center;">&nbsp;
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;" align="center"><strong>전화번호</strong></td>
										<td colspan="3" align="center">
											<input type="text" name="tel" value="<%= loginUser.getM_tel() %>" size="20px" style="text-align:center;">&nbsp;
										</td>
									</tr>		
							</table>
							<br/>
							<br/>
							</div>
							<br/>
							<br/>
							<div align="center">
								<button class="primary-btn" type="button" onclick="before();">이전으로</button>
								<button class="primary-btn" id="submitBtn" type="submit" onclick="confirm();" disabled>수정완료</button>
							
							
							
							</div>
							<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
							<script>
								
							 	// 비밀번호가 빈칸이면 수정완료버튼 비활성화
								$("#password").change(function(){

									$("#submitBtn").removeAttr("disabled");
								});
							
								// 도로명주소 api
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
								 
																
									function confirm(){
										
											alert("회원정보 수정이 완료되었습니다.");
											location.href="views/user/jeong/index.jsp";
									}
								
								
									function before(){
										location.href="<%= request.getContextPath()%>/views/user/jeong/myPage_info.jsp";	
									}
								
							</script>
							
							<br/>
							<br/>
						</div>
					</div>
				</form>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	
	<!-- 도로명주소 API -->
<!-- 	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	
		function address(){
		    
			new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		        }
		    }).open();
		}
		
	</script> -->

<!-- 푸터 -->
	<%@ include file="/views/user/common/footer.jsp" %>
	
	<!--/ 푸터 -->

	<!-- jQuery Plugins -->
	<script src="<%= request.getContextPath() %>/views/user/jeong/js/jquery.min.js"></script>
	<script src="<%= request.getContextPath() %>views/user/jeong/js/bootstrap.min.js"></script>
	<script src="<%= request.getContextPath() %>views/user/jeong/js/slick.min.js"></script>
	<script src="<%= request.getContextPath() %>views/user/jeong/js/nouislider.min.js"></script>
	<script src="<%= request.getContextPath() %>views/user/jeong/js/jquery.zoom.min.js"></script>
	<script src="<%= request.getContextPath() %>views/user/jeong/js/main.js"></script>
</body>

</html>
