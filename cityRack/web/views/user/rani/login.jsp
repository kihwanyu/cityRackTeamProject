<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta  charset="UTF-8">
	<style type="text/css">
	.inputs input{		
		margin-bottom:5px;		
		
	}
	.inputs input:first-child{
		margin-top:50px;
	}
	
	
	.inputs button {
	background:#FF720D;	
	border:0px;
	color:black;
	width:700px;
	height:50px;
	border-radius:5px;
	margin-top:40px;
	font-size:15px;
	font-weight:bold;
			
	}
	
	.loginForm{
	
	margin-left:400px;
	margin-right:auto;	
	width:700px;
	height:300px;
	}
	
	.searchIdPwd{
		margin-top:50px;
	
	}
	.searchIdPwd h5{
		color:darkgray;
	}
	
</style>

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>E-SHOP HTML Template</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="views/user/rani/css/bootstrap.min.css" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="views/user/rani/css/slick.css" />
	<link type="text/css" rel="stylesheet" href="views/user/rani/css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="views/user/rani/css/nouislider.min.css" />

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="views/user/rani/css/font-awesome.min.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="views/user/rani/css/style.css" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		
		
<title>Insert title here</title>
</head>
<body>


	
	
	<!-- 로그인 -->
	
	<!-- section -->
	<div class="section" >
		<!-- container -->
		<div class="container" style="display: inline-block;  ">
			<!-- row -->
			<div class="row">
				<form action="<%=request.getContextPath()%>/login.do" method="post">
					 <div class="col-md-6"> 
						
						<div class="loginForm">
							<div class="section-title">
								<h3 class="title">로그인</h3>
							</div>
						
							<div class="inputs">
								<input class="input" type="email" name="email" placeholder="이메일 주소" >
								<input class="input" type="password" name="password" placeholder="비밀번호">
							
							<input type="submit" id="login" value="로그인"><br>
							<div class="searchIdPwd">
								<h5 align="center"><a>아이디 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>비밀번호 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>회원가입 하기</a></h5>
							</div>
							</div>
						</div>	
						
						
					 </div> 
				</form>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->

	   
	<!-- /로그인 -->

	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->
</body>
</html>