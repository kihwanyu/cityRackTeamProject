<%@page import="com.kh.cityrack.board.user.model.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Board b = (Board)request.getAttribute("b");
	Member m = (Member)session.getAttribute("loginUser");
	
	Board rb = (Board)request.getAttribute("rb");
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
						<div class="tableArea">
			<table align="center" width="800px" class="question-table table">
				<tr>
					<td width="80"><b>번호</b></td>
					<td>
						<span><%= b.getBo_no() %></span>
					</td>
					<td><b>제목</b></td>
					<td colspan="3">
						<span><%= b.getBo_title()  %></span>
					</td>
				</tr>
				<tr>
					<td><b>작성자</b></td>
					<td width="80">
						<span><%= b.getM_name()  %></span>
					</td>
					<td width="80"><b>조회수</b></td>
					<td width="50">
						<span><%= b.getBo_hit()  %></span>
					</td>
					<td width="80"><b>작성일</b></td>
					<td>
						<span><%= b.getBo_date() %></span>
					</td>
					
				</tr>
				<tr>
					<td colspan="6"><b>내용</b></td>
				</tr>
				<tr>
					<td colspan="6">
						<p id="content"><%= b.getBo_content() %></p>
					</td>
				</tr>
			</table>
		</div>
		
		<hr>
		<!-- 답변 내용 b.getStatus 'Y' 일때 보여지도록-->
		
		<div>
		<% System.out.println("rb :"+ rb); %>
		<table>
			<%if(rb != null){ %>
			
			<tr>
				<td><h4>문의하신글에 대한 답변입니다.</h4></td>
				
			</tr>
			<tr>
				<td><h5><%=rb.getBo_content() %></h5></td>
			<tr>
			<%} %>
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
					<button onclick="location.href='<%=request.getContextPath() %>/replyResult.bo?num=<%=b.getBo_no() %>'" class="primary-btn">답변확인</button>
					<% System.out.println(m); %>
					<%if(m.getM_no() == 10001){ %>
					<button onclick="location.href='<%=request.getContextPath() %>/reList.bo?num=<%=b.getBo_no() %>'" class="primary-btn">답변작성</button>
					<% } %>
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
