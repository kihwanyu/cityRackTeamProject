<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>E-SHOP HTML Template</title>

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
	<%@ include file="menubar_myPage.jsp" %>




	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				
				<form id="checkout-form" class="clearfix">

					<div class="section-title">
						<h3 class="title">체질 Q & A</h3>
					</div>
							
					<div class="col-md-q" align="center">
						<img src="./img/q.png" alt="" width="15%">
						<a href="#"><b>목양체질</b></a> / 
						<a href="#"><b>목음체질</b></a> / 
						<a href="#"><b>토양체질</b></a> / 
						<a href="#"><b>토음체질</b></a> / 
						<a href="#"><b>금양체질</b></a> / 
						<a href="#"><b>금음체질</b></a> / 
						<a href="#"><b>수양체질</b></a> / 
						<a href="#"><b>수음체질</b></a>
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
										<td align="center">3</td>
										<td class="details" colspan="2">
											<a href="#">58년 개띠..금양체질..질문드립니다..</a>
										</td>
										<td class="price text-center">city****@naver.com</td>
										<td align="center">2018/02/18</td>
										<td align="center">답변대기</td>
										<td class="text-right"></td>
									</tr>
									<tr>
										<td align="center">2</td>
										<td class="details" colspan="2">
											<a href="#">토음체질과 수음체질이 함께 먹으면 좋은 반찬 추천해주세요~</a>
										</td>
										<td class="price text-center">city****@naver.com</td>
										<td align="center">2018/02/18</td>
										<td align="center">답변대기</td>
										<td class="text-right"></td>
									</tr>
									<tr>
										<td align="center">1</td>
										<td class="details" colspan="2">
											<a href="#">목양체질입니다. 미역초무침 괜찮나요??</a>
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
				
				<!-- Search -->
				<div class="question-search" align="center">
					<form>
						<input class="input search-input" type="text" placeholder="키워드를 입력하세요" size="60px">
						<select class="input search-categories">
							<option value="0">제목</option>
							<option value="1">제목+내용</option>
						</select>
						<button class="search-btn"><i class="fa fa-search"></i></button>
					</form>
				</div>
				<!-- /Search -->
				<br/>
				<br/>
				<div align="right">
					<button class="primary-btn">질문하기</button>
					<button class="primary-btn">내 질문내역</button>
				</div>
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
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>
</body>

</html>
