<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.cityrack.member.common.model.dto.Member" %>
<%
	//Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!-- sdfsd --><!-- asd -->
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


<style>

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
				<form id="updateform" class="clearfix" method="post">

					<div class="col-md-12">
						<div class="order-summary clearfix">
							<div class="section-title">
								<h3 class="title">내 정보</h3>
							</div>
							<h2><%= loginUser.getM_name() %>님, 환영합니다!</h2>
							<table class="infoTable" align="center" width="600px" style="border:2px solid orange;">
									<tr>
										<td style="font-size:12px;" align="center">&nbsp;&nbsp;이메일</td>
										<td colspan="3" align="center">
											<input type="text" name="email" value="<%= loginUser.getM_email() %>" style="text-align:center;" readonly size="30px">
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;" align="center">&nbsp;&nbsp;비밀번호(입력)</td>
										<td colspan="3" align="center">
											<input type="password" name="password" id="password" size="22px" style="text-align:center;" >
											
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;" align="center">&nbsp;&nbsp;이름</td>
										<td colspan="3" align="center">
											<input type="text" name="name" value="<%= loginUser.getM_name( ) %>" readonly size="10px" style="text-align:center;" >
										</td>
									</tr>									
									<tr>
										<td width="200px" style="font-size:12px;" align="center">&nbsp;&nbsp;주소</td>
										<td colspan="3" style="border-bottom:1px solid white;" align="center">
											<input type="text" width="500px" name="address" value="<%= loginUser.getM_address() %>" readonly size="60px" style="text-align:center;">
										</td>
									</tr>						
									<!-- <tr>
										<td colspan="3" align="center"><label>남도빌딩 2층</label></td>
									
									</tr> -->		
									<tr>
										<td style="font-size:12px;" align="center">&nbsp;&nbsp;휴대폰</td>
										<td colspan="3" align="center">
											<input type="text" name="phone" value="<%= loginUser.getM_phone() %>" readonly readonly size="20px" style="text-align:center;">
										</td>
									</tr>
									<tr>
										<td style="font-size:12px;" align="center">&nbsp;&nbsp;전화번호</td>
										<td colspan="3" align="center">
											<input type="text" name="tel" value="<%= loginUser.getM_tel() %>" readonly readonly size="20px" style="text-align:center;">
										</td>
									</tr>		
							</table>
							<br/>
							<br/>
							<div align="center">
								<strong>* 정보 수정 또는 탈퇴를 원하시면 비밀번호를 한 번 더 입력하신 후, <br/>
										원하시는 버튼을 눌러주세요.</strong>
								<br/><br/><br/>
								<button onclick="edit($('form')); return false;" class="primary-btn">내 정보 수정하기</button>
								<button onclick="un1($('form')); return false;" class="primary-btn">탈퇴하기</button>
							</div>
							
							<script>
							
							
								function edit(form){
									
									var password = document.getElementById("password").value; // 입력한 비번
									var pwd1 = "<%= loginUser.getM_password() %>"; // 진짜 비번
									var pwd2; // 암호화된 입력한 비번
									var userId = "<%= loginUser.getM_email() %>";
									$.ajax({
										url: "<%= request.getContextPath() %>/equalsPwd.do",
										type: "post",
										data: {"userId": userId,
											"password": password},
										success: function(data){
											if(data === "success"){
												pwd2 = password;
												console.log(pwd2);
												location.href="myPage_info_edit.jsp";
											}else {
												alert("비밀번호를 확인해주세요.");
											}	
										},
										error: function(msg){
										}
									});
									
								}
								 
								 function un1(form){
									 	var password = document.getElementById("password").value; // 입력한 비번
										var pwd1 = "<%= loginUser.getM_password() %>"; // 진짜 비번
										var userId = "<%= loginUser.getM_email() %>";
										$.ajax({
											url: "<%= request.getContextPath() %>/equalsPwd.do",
											type: "post",
											data: {"userId": userId,
												"password": password},
											success: function(data){
												if(data === "success"){
													location.href="myPage_info_unregister1.jsp";
												}else {
													alert("비밀번호를 확인해주세요.");
												}	
											},
											error: function(msg){
											}
										});
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


		<!-- 푸터 -->
	<%@ include file="/views/user/common/footer.jsp" %>
	
	<!--/ 푸터 -->

	<!-- jQuery Plugins -->
	<script src="<%= request.getContextPath() %>/views/user/jeong/js/jquery.min.js"></script>
	<script src="<%= request.getContextPath() %>/views/user/jeong/js/bootstrap.min.js"></script>
	<script src="<%= request.getContextPath() %>/views/user/jeong/js/slick.min.js"></script>
	<script src="<%= request.getContextPath() %>/views/user/jeong/js/nouislider.min.js"></script>
	<script src="<%= request.getContextPath() %>/views/user/jeong/js/jquery.zoom.min.js"></script>
	<script src="<%= request.getContextPath() %>/views/user/jeong/js/main.js"></script>
</body>

</html>
