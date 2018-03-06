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
		font-size: 14px;
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
			<h2>주문 정보</h2><br>
			<form action="" method="get">
				<select id="searchCondition" name="searchCondition" onchange="selectSearch();">
					<option value="ono">주문번호</option>
					<option value="email">회원이메일</option>
					<option value="orderDate">주문일자</option>
					<option value="pname">상품명</option>
					<option value="ostatus">주문상태</option>
				</select>
				&nbsp;
				<input type="search" name="searchText" id="searchText">
				<span id="serachDate" hidden="">
					<input type="date" name="beforeDate" id="beforeDate"> -
					<input type="date" name="AfterDate" id="AfterDate" > 
				</span>
				<select id="ostatus" name="ostatus" hidden="">
					<option value="ready">준비중</option>
					<option value="allSet">준비완료</option>
					<option value="delivery">배송중</option>
					<option value="deliveryCompleted">배송완료</option>
					<option value="contractStandby">취소대기</option>
					<option value="contractCompleted">취소완료</option>		
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
			<table style="width: 80%">
				<tr>
					<th width="10%" style="text-align: center;">주문번호</th>
					<th width="7%" style="text-align: center;">주문일자</th>
					<th width="15%" style="text-align: center;">회원이메일</th>
					<th width="20%" style="text-align: center;">상품명</th>
					<th width="10%" style="text-align: center;">총가격(원)</th>
					<th width="6%" style="text-align: center;">주문상태</th>
					<th width="6%" style="text-align: center;">상태변경</th>
					<!-- 도시락 외 3 클릭시 주문 정보 다 출력. -->
				</tr>
				<tr>
					<td style="text-align: right;">100000</td>
					<td style="text-align: left;">2018-03-01</td>
					<td style="text-align: left;">abcd1234@naver.com</td>
					<td style="text-align: left;"><a href="<%=request.getContextPath()%>/views/admin/admin_orderDetails.jsp">********* 외 3</a></td>
					<td style="text-align: right;">56,000</td>
					<td>
						<select name="status">
							<option value="ready">준비중</option>
							<option value="allSet">준비완료</option>
							<option value="delivery">배송중</option>
							<option value="deliveryCompleted">배송완료</option>
							<option value="contractStandby">취소대기</option>
							<option value="contractCompleted">취소완료</option>
						</select>
					</td>
					<td><button onclick="dropOut();">변경</button></td>
				</tr>
				<tr>
					<td style="text-align: right;">100000</td>
					<td style="text-align: left;">2018-03-01</td>
					<td style="text-align: left;">abcd1234@naver.com</td>
					<td style="text-align: left;"><a href="<%=request.getContextPath()%>/views/admin/admin_orderDetails.jsp">********* 외 3</a></td>
					<td style="text-align: right;">56,000</td>
					<td>
						<select id="status" name="status">
							<option value="ready">준비중</option>
							<option value="allSet">준비완료</option>
							<option value="delivery">배송중</option>
							<option value="deliveryCompleted">배송완료</option>
							<option value="contractStandby">취소대기</option>
							<option value="contractCompleted">취소완료</option>
						</select>
					</td>
					<td><button onclick="dropOut();">변경</button></td>
				</tr>
				<tr>
					<td style="text-align: right;">100000</td>
					<td style="text-align: left;">2018-03-01</td>
					<td style="text-align: left;">abcd1234@naver.com</td>
					<td style="text-align: left;"><a href="<%=request.getContextPath()%>/views/admin/admin_orderDetails.jsp">********* 외 3</a></td>
					<td style="text-align: right;">56,000</td>
					<td>
						<select id="status" name="status">
							<option value="ready">준비중</option>
							<option value="allSet">준비완료</option>
							<option value="delivery">배송중</option>
							<option value="deliveryCompleted">배송완료</option>
							<option value="contractStandby">취소대기</option>
							<option value="contractCompleted">취소완료</option>
						</select>
					</td>
					<td><button onclick="dropOut();">변경</button></td>
				</tr>
			</table>	
		</div>	
	</section>
	<%@ include file="/views/admin/common/footer.jsp" %>
	<script type="text/javascript">
		function selectSearch() {
			var selection = document.getElementById('searchCondition').value;
			console.log(selection);
			if(selection=='ono'){
				document.getElementById('searchText').style.display='inline';
				document.getElementById('serachDate').style.display='none';
				document.getElementById('ostatus').style.display='none';
				document.getElementById('order').style.display='inline';
			} else if(selection=='email') {
				document.getElementById('searchText').style.display='inline';
				document.getElementById('serachDate').style.display='none';
				document.getElementById('ostatus').style.display='none';
				document.getElementById('order').style.display='inline';
			} else if(selection=='orderDate') {
				document.getElementById('searchText').style.display='none';
				document.getElementById('serachDate').style.display='inline';
				document.getElementById('ostatus').style.display='none';
				document.getElementById('order').style.display='inline';
			} else if(selection=='pname'){
				document.getElementById('searchText').style.display='inline';
				document.getElementById('serachDate').style.display='none';
				document.getElementById('ostatus').style.display='none';
				document.getElementById('order').style.display='inline';
			} else {
				document.getElementById('searchText').style.display='none';
				document.getElementById('serachDate').style.display='none';
				document.getElementById('ostatus').style.display='inline';
				document.getElementById('order').style.display='none';
			}
		}
		function dropOut(){
			var result = window.confirm("주문번호 : 100000 의 상태를 변경하시겠습니까?");
			if(result==true){
				
			} else {
				
			}
		}
	</script>
</body>
</html>