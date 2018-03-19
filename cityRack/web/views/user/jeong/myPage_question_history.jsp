<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>cityRack_myPage_question_history</title>

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

					<div class="section-title">
						<h3 class="title">내 질문내역</h3>
					</div>
							
					<br/>
					<br/>
					<br/>
					<div class="col-md-qq">
						<div class="order-summary clearfix">
							<table class="question-table table">
								<thead>
									<tr>
										<th class="text-center">번호</th>
										<th colspan="2">제목</th>
										<th class="text-center">작성자</th>
										<th class="text-center">작성일</th>
										<th class="text-center">답변상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td align="center">1</td>
										<td class="details" colspan="2">
											<a href="#">58년 개띠..금양체질..질문드립니다..</a>
										</td>
										<td class="price text-center">city****@naver.com</td>
										<td align="center">2018/02/18</td>
										<td align="center">답변대기</td>
										<td class="text-right"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</form>
				<br/>
				<br/>
				<br/>
				<div align="right">
					<button onclick="before(); return false;" class="primary-btn">이전으로</button>
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
