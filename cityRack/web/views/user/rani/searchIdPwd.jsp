<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<style type="text/css">
	body{
		font-family: 'Nanum Gothic', sans-serif !important;
	}
	
	.section-title{
		width:100%;
		margin-top:100px !important;	
  	  	position: relative;
    	border-bottom: 1px solid #DADADA;
	}
	
	.input{
		margin-bottom:10px;
	}
	
	button {
		width:100%;
		height:50px;
		font-size:13px;
		font-weight:bold;
		border:none;
		border-radius:4px;
		margin:auto;
	}
	
	button:hover{
		cursor:pointer;
	}
</style>
</head>

<body>

	<!-- 메뉴바 -->	
	<%@ include file="/views/user/common/menubar_main.jsp"  %>
	<!-- /메뉴바 -->

	<!-- 페이지 -->
	
	<form>
	<div class=container>
	<div class=row>
			<!-- 아이디 찾기 -->
			<div class="col-md-6">
			<div class="section-title">
				<h3 class="title">아이디 찾기</h3>
			</div>
			
			
			<input class="input" type="text" name="nameId" id="nameId" placeholder="이름을 입력해주세요.">
			<input class="input" type="tel" name="phoneId" id="phoneId" placeholder="전화번호를 입력해주세요(-제외)">
			<button type="submit">
				아이디 찾기
			</button>
			</div>
			
			<!-- /아이디 찾기 -->	
	</form>
	
	<form>
			<!-- 비밀번호 찾기 -->
			<div class="col-md-6">
			
			
			<div class="section-title">
				<h3 class="title">임시 비밀번호 발급</h3>
				
			</div>
			<input class="input" type="text" name="namePwd" id="namePwd" placeholder="이름을 입력해주세요.">
			<input class="input" type="text" name="emailPwd" id="emailPwd" placeholder="가입하신 이메일을 입력해주세요.">
			
			<button type="submit" align="center">
				임시 비밀번호 발급
			</button>
			<p>* 가입하신 이메일로 임시 비밀번호를 발급하여 보내드립니다.</p>
			</div>
			
			
			<!-- /비밀번호 찾기 -->
			
			
	</form>
	<!-- row -->
	</div>
	<!-- container -->
	</div>
	<!-- col-md-6 -->
	
	
	
	
	<!-- / 페이지 -->

	<!-- 푸터 -->
	<%@ include file="/views/user/common/footer.jsp" %>	
	<!--/ 푸터 -->


</body>
</html>