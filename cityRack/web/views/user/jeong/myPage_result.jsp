<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>cityRack_myPage_result</title>

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
								<h3 class="title">설문조사결과</h3>
							</div>
							<br/>
							<br/>
							<h3 align="center">ㅇㅇㅇ님의 체질을 알려드립니다!</h3>
							<br/>
							<br/>
							<div align="center">
								<img src="./img/체질.png" alt="" height="300px">
								<img src="./img/목양.png" alt="" height="300px">
							</div>
							<br/>
							<br/>
							<br/>
							<div align="center">
								<h3>목양체질 총 정리</h3>
								<br/>
								
								<pre><br/>1. 건강한 목양체질은 항상 땀이 많으며, 쇠약할 땐 땜을 흘려주면 몸이 가벼워지며 건강해집니다. 
								<br/>2. 폐가 작기에 말하는 것을 피곤하게 생각합니다. 그래서 말을 잘 안 하는 과묵한 사람이 많습니다. 또 작은 폐로 인해 노래를 잘 못하는 음치가 많습니다.
								<br/>3. 보통 풍채가 좋고 체구가 큰 사람이 많습니다. 어깨가 좁고 몸 아래로 갈수록 굵어져서 허리가 가장 큰 것이 특징입니다.
								<br/>4. 채식, 생선을 즐기시거나 육식을 적게 하면, 피곤하고 눈이 아프며 발이 답답하게 됩니다.
								<br/>5. 육식과 온수욕을 즐기게 되면 살이 희고, 채식과 생선을 즐기며 냉수욕을 자주 하게 되면 피부색이 어둡고 검어집니다.
								<br/>6. 평균보다 혈압이 높아야 건강하며 의욕도 왕성합니다.
								<br/>7. 목양체질은 왼쪽 발을 잘 삐며, 왼쪽으로 오는 병이 많습니다.
								</pre>
							</div>
							<br/>
							<br/>							
							<div align="center">
								<button onclick="history(); return false;" class="primary-btn">설문조사 히스토리</button>
								<button onclick="again(); return false;" class="primary-btn">8체질 설문조사 다시하기</button>
							</div>
							
							<script>
							
								function history(){
									location.href="myPage_survey_history.jsp";	
								}
								
								function again(){
									location.href="../rani/survey.jsp";
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
l>