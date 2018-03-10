<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.cityrack.member.common.model.dto.Member" %>

<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>

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
<%-- 	<%@ include file="/views/user/common/menubar_myPage.jsp" %> --%>

	<!-- section -->
	<div class="section">
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
							<h2><%= loginUser.getM_name() %>님의 정보를 수정합니다.</h2>
							<table class="infoTable" align="center" width="450px">
									<tr>
										<td style="font-size:12px;" align="center"><strong>이메일</strong></td>
										<td colspan="3" align="center">
											<input type="text" name="email" value="<%= loginUser.getM_email() %>" readonly>
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;" align="center"><strong>비밀번호</strong></td>
										<td colspan="3" align="center">
											<input type="text" size="12">
											<button class="editBtn">변경하기</button>
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;" align="center"><strong>이름</strong></td>
										<td colspan="3" align="center">
											<input type="text" name="userName" value="<%= loginUser.getM_name() %>">
										</td>
									</tr>									
									<tr >
										<td rowspan="3" style="font-size:12px;" align="center"><strong>주소</strong></td>
										<td colspan="3" align="center">
											<input type="text" size="6px" value=" 123-456" name="address" id="address1">
											<button onclick="address(); return false;" class="editBtn">우편번호찾기</button>
										</td>
									<tr >	
										<td colspan="3" style="border-bottom:1px solid white;" align="center">
											<input type="text" size="30px" value=" 서울 강남구 테헤란로14길 6" name="address" id="address2">
										</td>
									</tr>
									<tr >
										<td colspan="3" align="center">
											<input type="text" size="30px" value=" 남도빌딩 2층" name="address" id="address3">
										</td>
									</tr>								
									<tr>
										<td style="font-size:12px;" align="center"><strong>휴대폰</strong></td>
										<td colspan="3" align="center">
											<input type="tel" name="phone" value="<%= loginUser.getM_phone() %>">&nbsp;
											<button class="editBtn" onclick="phone();">변경하기</button>
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;" align="center"><strong>전화번호</strong></td>
										<td colspan="3" align="center">
											<input type="tel" name="tel" value="<%= loginUser.getM_tel() %>">&nbsp;
											<button class="editBtn">변경하기</button>
										</td>
									</tr>		
							</table>
							<br/>
							<br/>
							<div align="center">
								<button class="primary-btn" onclick="before(); return false;">이전으로</button>
								<button class="primary-btn" type="submit" onclick="confirm();">수정완료</button>
							</div>
							
							<script>
							
								
								function phone(){
									
									var input = prompt('Message');
							           
									alert("휴대폰 번호를 '" + input + "'(으)로 수정합니다.");
									
									document.getElementById("phoneText").value = input;
									

								}
							
							
							
								function confirm(){
									
									var bool = confirm('수정하시겠습니까?');
									alert(bool);
								}
							
							
							
							
							
								function before(){
									location.href="myPage_info.jsp";	
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
	</div>
	<!-- /section -->
	
	<!-- 도로명주소 API -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	
		function address(){
		    
			new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		        }
		    }).open();
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
