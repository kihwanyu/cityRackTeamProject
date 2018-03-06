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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	@import url("css/common.css");
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
	th {
		background: lightgray;
	}
</style>
<title>회원 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>
		<div align="center">
			<h2>회원 정보</h2><br>
			<form action="" method="get">
				<input type="radio" value="m" id="male" name="gender" checked="checked">
				<label for="male">남성</label>
				&nbsp;
				<input type="radio" value=" female" id=" female" name="gender">
				<label for=" female">여성</label>
				&nbsp;&nbsp;
				<select id="searchCondition" name="searchCondition" onchange="selectSearch();">
					<option value="email">이메일</option>
					<option value="name">이름</option>
					<option value="birthday">생년월일</option>
					<option value="status">탈퇴여부</option>
					<option value="grade">등급</option>
					<option value="enrollDate">가입일</option>
				</select>
				&nbsp;
				<input type="search" name="searchText" id="searchText">
				<span id="serachDate" hidden="">
					<input type="date" name="beforeDate" id="beforeDate"> -
					<input type="date" name="AfterDate" id="AfterDate" > 
				</span>
				<select id="status" name="status" hidden="">
					<option value="Y">Y</option>
					<option value="N">N</option>
				</select>
				<select id="grade" name="grade" hidden="">
					<option value="diamond">다이아몬드</option>
					<option value="gold">골드</option>
					<option value="silver">실버</option>
					<option value="bronze">브론즈</option>		
				</select>
				&nbsp;
				<select id="order" name="order">
					<option value="asc">오름차순</option>
					<option value="desc">내림차순</option>
				</select>
				&nbsp;
				<input type="button" value="검색">
			</form>
		</div>
		
		<br>
		<div class="tableArea" align="center">
			<table style="width: 95%">
				<tr>
					<th width="4%" style="text-align: center;">번호</th>
					<th width="10%" style="text-align: center;">이메일</th>
					<th width="5%" style="text-align: center;">등급</th>
					<th width="10%" style="text-align: center;">비밀번호</th>
					<th width="4%" style="text-align: center;">이름</th>
					<th width="4%" style="text-align: center;">성별</th>
					<th width="7%" style="text-align: center;">생년월일</th>
					<th width="20%" style="text-align: center;">주소</th>
					<th width="7%" style="text-align: center;">전화번호</th>
					<th width="7%" style="text-align: center;">핸드폰번호</th>
					<th width="7%" style="text-align: center;">가입일</th>
					<th width="5%" style="text-align: center;">탈퇴여부</th>
					<th width="5%" style="text-align: center;">강제탈퇴</th>
				</tr>
				<tr>
					<td style="text-align: right;">100</td>
					<td>abcd1234@naver.com</td>
					<td>다이아몬드</td>
					<td>asdfasdfsafdf1234354dsafsadf</td>
					<td>홍길동</td>
					<td>남</td>
					<td>1994-05-26</td>
					<td>경기도 의정부시 금오동 282-29 4층</td>
					<td>031-000-0000</td>
					<td>010-000-0000</td>
					<td>2018-02-27</td>
					<td>Y</td>
					<td><button onclick="dropOut();">X</button></td>
				</tr>
				<tr>
					<td style="text-align: right;">100</td>
					<td>abcd1234@naver.com</td>
					<td>다이아몬드</td>
					<td>asdfasdfsafdf1234354dsafsadf</td>
					<td>홍길동</td>
					<td>남</td>
					<td>1994-05-26</td>
					<td>경기도 의정부시 금오동 282-29 4층</td>
					<td>031-000-0000</td>
					<td>010-000-0000</td>
					<td>2018-02-27</td>
					<td>Y</td>
					<td><button onclick="dropOut();">X</button></td>
				</tr>
				<tr>
					<td style="text-align: right;">100</td>
					<td>abcd1234@naver.com</td>
					<td>다이아몬드</td>
					<td>asdfasdfsafdf1234354dsafsadf</td>
					<td>홍길동</td>
					<td>남</td>
					<td>1994-05-26</td>
					<td>경기도 의정부시 금오동 282-29 4층</td>
					<td>031-000-0000</td>
					<td>010-000-0000</td>
					<td>2018-02-27</td>
					<td>Y</td>
					<td><button onclick="dropOut();">X</button></td>
				</tr>
			</table>	
		</div>	
	</section>
	<%@ include file="/views/admin/common/footer.jsp" %>
	<script type="text/javascript">
		
		function selectSearch() {
			var selection = document.getElementById('searchCondition').value;
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