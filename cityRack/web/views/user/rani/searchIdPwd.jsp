<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String alert = (String)request.getAttribute("alert"); %>    
<!DOCTYPE html >
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	
	<form id="idForm" action="<%=request.getContextPath()%>/searchId.em" method="post">
	<div class=container>
	<div class=row>
			<!-- 아이디 찾기 -->
			<div class="col-md-6">
			<div class="section-title">
				<h3 class="title">아이디 찾기</h3>
			</div>
			
			
			<input class="input" type="text" name="nameId" id="nameId" placeholder="이름을 입력해주세요.">
			<input class="input" type="tel" name="phoneId" id="phoneId" placeholder="전화번호를 입력해주세요(-제외)">
			<button type="submit" class="submitBtn">
				아이디 찾기
			</button>
			</div>
			
			<!-- /아이디 찾기 -->	
	</form>
	
	<form id="pwdForm"  action="<%=request.getContextPath()%>/searchPwd.em" method="post" >
			<!-- 비밀번호 찾기 -->
			<div class="col-md-6">
			
			<div class="section-title">
				<h3 class="title">임시 비밀번호 발급</h3>
				
			</div>
			<input class="input" type="text" name="namePwd" id="namePwd" placeholder="이름을 입력해주세요.">
			<input class="input" type="text" name="emailPwd" id="emailPwd" placeholder="가입하신 이메일을 입력해주세요.">
			
			<button type="submit" align="center" class="submitBtn" >
				임시 비밀번호 발급
			</button>
			<p>* 가입하신 이메일로 임시 비밀번호를 발급하여 보내드립니다.</p>
			<p id="#reportResult"></p>
			
			</div>
			
			
			<!-- /비밀번호 찾기 -->
			
			<script type="text/javascript">
					
			
			 $("#pwdForm").submit(function(event) {

			      /* stop form from submitting normally */
			      event.preventDefault();

			      /* get the action attribute from the <form action=""> element */
			      var $form = $( this ),
			      url = $form.attr( 'action' );

			      /* Send the data using post with element id name and name2*/
			      var posting = $.post( url, { name: $('#namePwd').val(), email: $('#emailPwd').val() } );

			      /* Alerts the results */
			      posting.done(function( data ) {
			        alert(data);
			      });
			    });
		
			/*  $(".submitBtn").click(function(){
				$.ajax({
					url:"searchPwd.em",
					type:"post",
					success:function(data){						
						alert(data);
						alert('object');
					}, 
					error:function(data){
						alert(data);
					}
				});
			});  */
			</script>
			
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