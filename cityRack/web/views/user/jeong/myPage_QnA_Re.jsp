<%@page import="com.kh.cityrack.board.user.model.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<% Board b = (Board)request.getAttribute("b"); %>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>cityRack_myPage_question</title>

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



	<!-- section1 -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<form id="checkout-form" action="<%= request.getContextPath() %>/QnA_Re.bo" class="clearfix" method="post">
					<div class="col-md-12">
						<div class="order-summary clearfix">
							<div class="section-title">
								<h3 class="title">관리자용 문의글 답변작성</h3>
							</div>
							<br/>
							<div class="outer">
							<br/>
							<div align="center">
							<img src="views/user/jeong/img/알림.png" height="50px">&nbsp;
							<strong>답변 작성</strong>
							</div>
							<br/>
							<!-- 로그인유저 정보가져오기 -->
							<%
								Member m = (Member)session.getAttribute("loginUser");
							%>
							<% System.out.println("b확인:" + b); %>
							<input type="hidden" name="mno" value="<%=m.getM_no()%>">
							<input type="hidden" name="bno" value="<%=b.getBo_no()%>">
							<div class="tableArea" align="center">
								<table>
									<tr>
										<td width="40px" height="40px"><strong>체질</strong></td>
										<td>
											<select name="category">
												<option>------------</option>
												<option value="목양체질">목양체질</option>
												<option value="목음체질">목음체질</option>
												<option value="토양체질">토양체질</option>
												<option value="토음체질">토음체질</option>
												<option value="금양체질">금양체질</option>
												<option value="금음체질">금음체질</option>
												<option value="수양체질">수양체질</option>
												<option value="수음체질">수음체질</option>
											</select>
										</td>
										<td width="40px" height="40px"><strong>구분</strong></td>
										<td>
											<select name="division">
												<option>------------</option>
												<option value="게시글">게시글</option>
												<option value="답글">답글</option>
											</select>
										</td>
									</tr>
									<tr>
										<td height="40px"><strong>제목</strong></td>
										<td colspan="3">
											<input type="text" size="57" name="title">
										</td>
									</tr>
									<tr>
										<td height="40px"><strong>내용</strong></td>
										<td colspan="3">
											<textarea rows="15" cols="60" name="content" 
														style="resize:none; border:2px solid orange; border-radius: 20px;">
											</textarea>
										</td>
									</tr>							
								</table>
							<br/>
						<div align="center">
							<button onclick="cancel(); return false;" class="primary-btn">취소하기</button>&nbsp;
							<input type="submit" class="primary-btn" value="등록하기">
						</div>
						
						<script>
						
							function cancel(){
								location.href="myPage_QnA.jsp";
							}
						
						</script>
						
						</div>
						</div>
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

<!-- 푸터 -->
	<%@ include file="/views/user/common/footer.jsp" %>
	
	<!--/ 푸터 -->

	<!-- jQuery Plugins -->
	<script src="views/user/jeong/js/jquery.min.js"></script>
	<script src="views/user/jeong/js/bootstrap.min.js"></script>
	<script src="views/user/jeong/js/slick.min.js"></script>
	<script src="views/user/jeong/js/nouislider.min.js"></script>
	<script src="views/user/jeong/js/jquery.zoom.min.js"></script>
	<script src="views/user/jeong/js/main.js"></script>
</body>

</html>
