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
		font-size: 12px;
 	}
 	th {
		background: lightgray;
	}
</style>
<title>재고 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>
		<div align="center">
		<h2>재고 상세</h2><br>
			<form action="" method="get">
				<input type="radio" value="warehosing" id="wareHosing" name="division">
				<label for="warehosing">입고</label>
				&nbsp;
				<input type="radio" value="release" id="release" name="division">
				<label for="release">폐기</label>
				&nbsp;
				<select id="searchCondition" name="searchCondition">
					<option value="date">등록날짜</option>
					<option value="selfLife">유통기한</option>
				</select>
				&nbsp;
				<span id="serachDate">
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
			<table style="width: 40%">
				<tr>
					<td colspan="6" style="text-align: center; font-size: 20px; background: lightyellow;">상품명 : main_도시락1</td>
				</tr>
				<tr>
					<th width="10%" style="text-align: center;">재고번호</th>
					<th width="10%" style="text-align: center;">재고구분</th>
					<th width="15%" style="text-align: center;">등록날짜</th>
					<th width="15%" style="text-align: center;">유통기한</th>				
					<th width="30%" style="text-align: center;">분류</th>
					<th width="10%" style="text-align: center;">수량</th>
				</tr>
				<tr>
					<td style="text-align: right;">100</td>
					<td style="text-align: left;">입고</td>
					<td>2016-05-26</td>
					<td>2016-06-01</td>
					<td style="text-align: left;">상품 입고</td>
					<td style="text-align: right;">30</td>
				</tr>
				<tr>
					<td style="text-align: right;">101</td>
					<td style="text-align: left;">출고</td>
					<td>2016-05-26</td>
					<td>2016-06-01</td>
					<td style="text-align: left;">상품 판매</td>
					<td style="text-align: right;">2</td>
				</tr>
				<tr>
					<td style="text-align: right;">102</td>
					<td style="text-align: left;">출고</td>
					<td>2016-05-26</td>
					<td>2016-06-01</td>
					<td style="text-align: left;">유통기한 초과 파기</td>
					<td style="text-align: right;">10</td>
				</tr>
			</table>
			<br>
			<div class="tableArea" align="center">
				<table style="width: 40%;" class="total">
					<tr>
						<td colspan="6" style="background: lightgray">합계</td>
					</tr>
					<tr>
						<td>입고량</td>
						<td>50</td>
						<td>출고량</td>
						<td>50</td>
						<td>재고량</td>
						<td>0</td>
					</tr>
				</table>
			</div>
		</div>	
			
	</section>
	<%@ include file="/views/admin/common/footer.jsp" %>
</body>
</html>