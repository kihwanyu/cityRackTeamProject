<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8"> 
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
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
		cursor:pointer;
	}
	body{
	font-family: 'Nanum Gothic', sans-serif;
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
	<img alt="" src="img/garlic-2556022_960_720.png" id="first">
	<img alt="" src="img/signature.png">
	
	<div>
		<button class="btns" onclick="goSignature();">시그니처 도시락 <br>만들러 가기</button>&nbsp;
		<button class="btns" onclick="check8c();">내 8체질<br> 확인하러 가기</button>
	</div>
	</div>
	<script type="text/javascript">
		function goSignature(){
			
		<% if (loginUser!=null) {%>
			location.href='<%=request.getContextPath()%>/getProducts.pr';
		<%} else {%>
			alert('로그인이 필요한 서비스입니다.');ㅣ
		<%}%>
		}
		
		function check8c(){
			
			<% if (loginUser!=null) {%>
				location.href='<%=request.getContextPath()%>/views/user/jeong/survey_easy.jsp';
			<%} else {%>
				alert('로그인이 필요한 서비스입니다.');ㅣ
			<%}%>
			}
			
	
	</script>
	
	
	<!--/ 페이지 -->
	
	

	<!-- 푸터 -->
	<%@ include file="/views/user/common/footer.jsp" %>
	
	<!--/ 푸터 -->

	
<!-- jQuery Plugins -->
  	<script src="<%=request.getContextPath() %>/views/user/jeong/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/views/user/jeong/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/views/user/jeong/js/slick.min.js"></script>
	<script src="<%=request.getContextPath() %>/views/user/jeong/js/nouislider.min.js"></script>
	<script src="<%=request.getContextPath() %>/views/user/jeong/js/jquery.zoom.min.js"></script>
	<script src="<%=request.getContextPath() %>/views/user/jeong/js/main.js"></script>  




</body>
</html>