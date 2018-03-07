<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->



	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="css/slick.css" />
	<link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

	
	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="css/style.css" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

<style type="text/css">
	.about{				
		padding-top:10px;
		padding-left:300px;
		padding-right:auto;
	}
	
	#first{
		width:953px;
	}
	
	.btns{
		align:center;
		width:500px;
		background:#FF7930;
		font-size:40px;
		border-radius:20px;
		font:font-family: 'Nanum Gothic', sans-serif;
		border:none;
		color:black;
		font-weight:bold;
		height:170px;
	}
	.btns:hover{
		background:#337517;
		color:white;
	}
	
	
</style>
<title>Insert title here</title>
</head>
<body>


	<!-- 메뉴바 -->
	
	<%@ include file="/views/user/common/menubar_main.jsp" %>
	<!-- /메뉴바 -->

	
	<!-- 페이지 -->
	
	<div class="about">
	
	<img alt="" src="img/8constitutions.png">	
	<img src="img/survey.png">
	
	<div>
		<button class="btns">간단 설문조사<br>하러 가기</button>&nbsp;
		<button class="btns">상세 설문조사<br> 하러 가기</button>	
	</div>
	</div>
	
	
	
	<!--/ 페이지 -->
	
	<!-- 푸터 -->
	<%@ include file="/views/user/common/footer.jsp" %>
	
	<!--/ 푸터 -->
	
	

</body>
</html>