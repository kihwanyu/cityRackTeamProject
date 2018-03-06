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
			<h2>회원 탈퇴 정보</h2><br>
			<form action="" method="get">
				<select id="searchCondition" name="searchCondition" onchange="selectSearch();">
					<option value="email">이메일</option>
					<option value="date">탈퇴 날짜</option>
				</select>
				&nbsp;
				<input type="search" name="searchText" id="searchText">
				<span id="serachDate" hidden="">
					<input type="date" name="beforeDate" id="beforeDate"> -
					<input type="date" name="AfterDate" id="AfterDate" > 
				</span>
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
			<table style="width: 70%">
				<tr>
					<th width="10%" style="text-align: center;">번호</th>
					<th width="30%" style="text-align: center;">이메일</th>
					<th width="20%" style="text-align: center;">탈퇴날짜</th>
					<th width="30%" style="text-align: center;">탈퇴사유</th>
					<th width="30%" style="text-align: center;">취소</th>
				</tr>
				<tr>
					<td style="text-align: right;">1</td>
					<td>asd0526@naver.com</td>
					<td>2018-02-28</td>
					<td>재가입</td>
					<td><button onclick="dropOut();">취소</button></td>
				</tr>
				<tr>
					<td style="text-align: right;">2</td>
					<td>asd0516@naver.com</td>
					<td>2018-02-28</td>
					<td>관리자 임의 탈퇴</td>
					<td><button onclick="dropOut();">취소</button></td>
				</tr>
				<tr>
					<td style="text-align: right;">3</td>
					<td>asd0326@naver.com</td>
					<td>2018-02-28</td>
					<td>그냥.</td>
					<td><button onclick="dropOut();">취소</button></td>
				</tr>
			</table>	
			
		</div>
	</section>
	<%@ include file="/views/admin/common/footer.jsp" %>
	<script type="text/javascript">
		function selectSearch() {
			var selection = document.getElementById('searchCondition').value;
			console.log(selection);
			if(selection=='email'){
				document.getElementById('searchText').style.display='inline';
				document.getElementById('serachDate').style.display='none';
			} else {
				document.getElementById('searchText').style.display='none';
				document.getElementById('serachDate').style.display='inline';
			} 
		}
		function dropOut(){
			var result = window.confirm("홍길동님의 탈퇴를 정말로 취소시키시겠습니까?");
			if(result==true){
				
			} else {
				
			}
		}
	</script>
</body>
</html>