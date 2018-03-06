<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

<style>
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	* {
		font-family: 'Nanum Gothic', serif;
		font-size: 15px;
		font-weight: bold;
	}
	header {
		margin-top: 20px;
	}
	footer{
		padding-bottom : 100px;
		background : black;
		color: white;
	}
	#menubar {
		margin-top : 20px;
		text-align: center;
	}
	#logo {
		height: 100%;
	}
	.menuNav {
		padding: 10px;
		text-align: center;
		margin-left: 20px;
		margin-right: 20px;
	}
	.home {
		background: gray; 
		border-top-left-radius:1em; 
		border-top-right-radius:1em; 
		border-bottom-right-radius:1em; 
		border-bottom-left-radius:1em;
	}
	table {
		border: 1px solid black;
		text-align: center;
		border-collapse: collapse;
		
	}	
	.tableArea {
		width: 100%;
		height: 500px;
		margin-left: auto;
		margin-right: auto;
	}
	th, td {
		border: 1px solid black;
		padding: 10px;
		font-size: 10px;
	}
</style>
<title>회원 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>
		<h1 align="center">메인화면입니다.</h1>	
	</section>
	<%@ include file="/views/admin/common/footer.jsp" %>
	<script type="text/javascript">
		function selectSearch() {
			var selection = document.getElementById('searchCondition').value;
			console.log(selection);
			if(selection=='email'){
				document.getElementById('searchText').style.display='inline';
				document.getElementById('serachDate').style.display='none';
				document.getElementById('status').style.display='none';
				document.getElementById('grade').style.display='none';
				document.getElementById('order').style.display='inline';
			} else if(selection=='name') {
				document.getElementById('searchText').style.display='inline';
				document.getElementById('serachDate').style.display='none';
				document.getElementById('status').style.display='none';
				document.getElementById('grade').style.display='none';
				document.getElementById('order').style.display='inline';
			} else if(selection=='birthday') {
				document.getElementById('searchText').style.display='none';
				document.getElementById('serachDate').style.display='inline';
				document.getElementById('status').style.display='none';
				document.getElementById('grade').style.display='none';
				document.getElementById('order').style.display='inline';
			} else if(selection=='status'){
				document.getElementById('searchText').style.display='none';
				document.getElementById('serachDate').style.display='none';
				document.getElementById('status').style.display='inline';
				document.getElementById('grade').style.display='none';
				document.getElementById('order').style.display='none';
			} else if(selection=='grade'){
				document.getElementById('searchText').style.display='none';
				document.getElementById('serachDate').style.display='none';
				document.getElementById('status').style.display='none';
				document.getElementById('grade').style.display='inline';
				document.getElementById('order').style.display='none';
			} else {
				document.getElementById('searchText').style.display='none';
				document.getElementById('serachDate').style.display='inline';
				document.getElementById('status').style.display='none';
				document.getElementById('grade').style.display='none';
				document.getElementById('order').style.display='inline';
			}
		}
		function dropOut(){
			var result = window.confirm("홍길동님을 정말로 탈퇴시키시겠습니까?");
			if(result==true){
				
			} else {
				
			}
		}
	</script>
</body>
</html>