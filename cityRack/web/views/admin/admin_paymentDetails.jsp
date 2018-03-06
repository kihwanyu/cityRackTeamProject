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
		height: 700px;
		margin-left: auto;
		margin-right: auto;
		font-size: 15px;
	}
	th, td {
		border: 1px solid black;
		padding: 10px;
		font-size: 14px;
	}
	th {
		background: lightyellow;
	}
	.paymentPosition {
		display:  inline-block;
		width: 40%;
		height: 100%;
		margin: 0.05em;
	}
</style>
<title>결제 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>
		<div class="tableArea" align="center">
			<h2>결제 상세</h2><br>
			<table style="width: 40%;">
				<tr>
					<th width="50%" style="text-align: center; background: lightyellow">주문 번호</th>
					<th width="50%" style="text-align: center; background: lightyellow">100000</th>
				</tr>
			</table>
			<br><br>
			<div class="paymentPosition">
				<table style="width: 80%">
					<tr>
						<th colspan="2" style="text-align: center;">결제 내역</th>
					</tr>
					<tr>
						<td width="30%" style="text-align: center;">결제 번호</td>
						<td width="70%" style="text-align: left;">100001</td>
					</tr>
					<tr>
						<td style="text-align: center;">PG사</td>
						<td style="text-align: left;">inicis</td>
					</tr>
					<tr>
						<td width="10%" style="text-align: center;">결제 수단</td>
						<td width="22%" style="text-align: left;">card</td>
					</tr>
					<tr>			 
						<td style="text-align: center;">상점 거래 ID</td>
						<td colspan="2" style="text-align: left;">20180301240000000</td>
					</tr>
					<tr>			 
						<td style="text-align: center;">주문명</td>
						<td colspan="2" style="text-align: left;">주문명:결제테스트</td>
					</tr>
					<tr>			 
						<td style="text-align: center;">결제 금액</td>
						<td colspan="2" style="text-align: left;">14000</td>
					</tr>
					<tr>			 
						<td style="text-align: center;">구매자 이메일</td>
						<td colspan="2" style="text-align: left;">import@sito.do</td>
					</tr>
					<tr>			 
						<td style="text-align: center;">구매자 이름</td>
						<td colspan="2" style="text-align: left;">홍길동</td>
					</tr>
					<tr>			 
						<td style="text-align: center;">구매자 전화번호</td>
						<td colspan="2" style="text-align: left;">010=1234=5678</td>
					</tr>
					<tr>			 
						<td style="text-align: center;">구매자 주소</td>
						<td colspan="2" style="text-align: left;">서울특별시 강남구 삼성동</td>
					</tr>
					<tr>			 
						<td style="text-align: center;">구매자 우편번호</td>
						<td colspan="2" style="text-align: left;">12323</td>
					</tr>
				</table>
			</div>
			<div class="paymentPosition">
				<div style="margin-bottom: 50px">
					<table style="width:80%">
						<tr>
							<th colspan="2" style="text-align: center;">결제 결과</th>
						</tr>
						<tr>
							<td width="30%" style="text-align: center;">고유 번호</td>
							<td width="70%" style="text-align: left;">100001</td>
						</tr>
						<tr>
							<td width="30%" style="text-align: center;">상점 거래 ID</td>
							<td width="70%" style="text-align: left;">20180301240000000</td>
						</tr>
						<tr>
							<td width="30%" style="text-align: center;">결제 금액</td>
							<td width="70%" style="text-align: left;">14,000</td>
						</tr>
						<tr>
							<td width="30%" style="text-align: center;">카드 승인 번호</td>
							<td width="70%" style="text-align: left;">18-11111111</td>
						</tr>
					</table>
				</div>
			<table style="width: 80%">
				<tr>			 
					<td width="30%" style="text-align: center;">결제 상태</td>
					<td colspan="2" style="text-align: center;">
						<select class="form-control" id="status" name="status" style="margin-bottom: 10px;">
							<option value="finsh">결제완료</option>
							<option value="cancle">결제취소</option>
						</select>
						<button class="btn btn-primary active" style="width: 100%">변경</button>
					</td>
				</tr>
			</table>
			</div>		
		</div>
	</section>
	<%@ include file="/views/admin/common/footer.jsp" %>
</body>
</html>