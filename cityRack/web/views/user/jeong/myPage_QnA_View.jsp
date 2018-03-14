<%@page import="com.kh.cityrack.board.user.model.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Board b = (Board)request.getAttribute("b");
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>cityRack_myPage_QnA_View</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="views/user/jeong/css/bootstrap.min.css" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="views/user/jeong/css/slick.css" />
	<link type="text/css" rel="stylesheet" href="views/user/jeong/css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="views/user/jeong/css/nouislider.min.css" />

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="views/user/jeong/css/font-awesome.min.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="views/user/jeong/css/style.css" />

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

					<div class="section-title">
						<h3 class="title">문의내용</h3>
					</div>
						<div>
							<table class="table table-striped">
								<tr>
									<th width="100" align="center">NO</th>
									<td name="bcount"><%=b.getBo_no() %></td>
								</tr>
								<tr>
									<th width="100" align="center">제목</th>
									<td name="title"><%=b.getBo_title() %></td>
								</tr>
								<tr>
									<th width="100" align="center">작성자</th>
									<td name="writer"><%=b.getM_name() %></td>
								</tr>
								<tr>
									<th width="100" align="center">내용</th>
									<td name="content"><%=b.getBo_content() %></td>
								</tr>
							</table>
						</div>
					
					
					
							
					<br/>
					<br/>
					<br/>
					<div class="col-md-qq">
						<div class="order-summary clearfix">
							
						</div>
					</div>
				</form>
				<br/>
				<br/>
				<br/>
				<div align="right">
					<button onclick="location.href='<%=request.getContextPath()%>/selectList.bo'" class="primary-btn">이전으로</button>
				</div>
				
				<script>
				
					function before(){
						location.href="myPage_QnA.jsp";
					}
				
				</script>
				
				<br/>
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
