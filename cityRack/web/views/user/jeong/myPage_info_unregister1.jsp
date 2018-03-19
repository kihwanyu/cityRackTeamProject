<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.cityrack.member.common.model.dto.Member"%>
<!DOCTYPE html>
<html lang="en">

<%
	Member loginUser = (Member) session.getAttribute("loginUser");
%>
<!-- sdfs --><!-- asd -->

<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>cityRack_myPage_un1</title>

<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Hind:400,700"
	rel="stylesheet">

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

</head>

<body>
	<!-- 마이페이지용 메뉴바 -->
	<%-- <%@ include file="/views/user/common/menubar_myPage.jsp"%> --%>

	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<form id="withdraw-form" class="clearfix"
					action="<%=request.getContextPath()%>/withdraw" method="post">

					<div class="col-md-12">
						<div class="order-summary clearfix">
							<div class="section-title">
								<h3 class="title">탈퇴하기</h3>
							</div>
							<div align="center">
								<br />
								<h4 align="center">탈퇴 사유를 적어주세요.</h4>
								<br /> <input type="text" size="100px" name="reason" id="reason"> <input
									type="text" name="mNo" value="<%=loginUser.getM_no()%>">
							</div>
							<br /> <br /> <br /> <br />
							<div align="center">
								<button onclick="before(); return false;" type="button"
									class="primary-btn">이전으로</button>
								<button onclick="unregister(); return false;" type="button"
									class="primary-btn" id="deleteBtn">탈퇴하기</button>
							</div>
						</div>
					</div>
				</form>

				<script>
					function before() {
						location.href = "myPage_info.jsp";
					}

					function unregister() {
						$("#withdraw-form").submit();
					}
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

	<!-- jQuery Plugins -->
	<script src="<%= request.getContextPath() %>/views/user/jeong/js/jquery.min.js"></script>
	<script src="<%= request.getContextPath() %>/views/user/jeong/js/bootstrap.min.js"></script>
	<script src="<%= request.getContextPath() %>/views/user/jeong/js/slick.min.js"></script>
	<script src="<%= request.getContextPath() %>/views/user/jeong/js/nouislider.min.js"></script>
	<script src="<%= request.getContextPath() %>/views/user/jeong/js/jquery.zoom.min.js"></script>
	<script src="<%= request.getContextPath() %>/views/user/jeong/js/main.js"></script>
</body>

</html>
