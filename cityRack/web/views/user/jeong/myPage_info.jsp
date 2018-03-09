<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.cityrack.member.user.model.dto.Member" %>

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

	<title>cityRack_myPage_info</title>

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
								<h3 class="title">내 정보</h3>
							</div>
							<h2><%= loginUser.getM_name() %>님 환영합니다!</h2>
							<table class="infoTable" align="center" width="400px" style="border:2px solid orange;">
									<tr>
										<td style="font-size:12px;" align="center">&nbsp;&nbsp;이메일</td>
										<td colspan="3" align="center">
											<input type="text" name="email" value="<%= loginUser.getM_mail() %>" readonly>
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;" align="center">&nbsp;&nbsp;비밀번호</td>
										<td colspan="3" align="center">
											<input type="text" name="password" value="<%= loginUser.getM_password() %>" readonly>
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;" align="center">&nbsp;&nbsp;이름</td>
										<td colspan="3" align="center">
											<input type="text" name="name" value="<%= loginUser.getM_name() %>" readonly>
										</td>
									</tr>									
									<tr>
										<td rowspan="2" width="200px" style="font-size:12px;" align="center">&nbsp;&nbsp;주소</td>
										<td colspan="3" style="border-bottom:1px solid white;" align="center">
											<input type="text" name="address" value="<%= loginUser.getM_address() %>" readonly>
										</td>
									</tr>						
									<tr>
										<td colspan="3" align="center"><label>남도빌딩 2층</label></td>
									
									</tr>		
									<tr>
										<td style="font-size:12px;" align="center">&nbsp;&nbsp;휴대폰</td>
										<td colspan="3" align="center">
											<input type="text" name="phone" value="<%= loginUser.getM_phone() %>" readonly>
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;" align="center">&nbsp;&nbsp;전화번호</td>
										<td colspan="3" align="center">
											<input type="text" name="tel" value="<%= loginUser.getM_tel() %>" readonly>
										</td>
									</tr>		
							</table>
							<br/>
							<br/>
							<div align="center">
								<button onclick="edit(); return false;" class="primary-btn">내 정보 수정하기</button>
								<button onclick="un1(); return false;" class="primary-btn">탈퇴하기</button>
							</div>
							
							<script>
							
								 function edit(){
									location.href="myPage_info_edit.jsp";
								}
								 
								 function un1(){
									 location.href="myPage_info_unregister1.jsp";
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
