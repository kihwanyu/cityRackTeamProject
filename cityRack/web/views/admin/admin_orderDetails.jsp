<%@page import="com.kh.cityrack.order.admin.model.dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.cityrack.order.admin.model.dto.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Order o = (Order)request.getAttribute("o");
	ArrayList<Product> pList = (ArrayList<Product>)request.getAttribute("pLIst"); 
%>
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
	@import url("views/admin/css/common.css");
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
			<h2>주문 상세</h2><br>
		</div>
		
		<br>
		<div class="tableArea" align="center">
			<table style="width: 65%;">
				<tr>
					<th width="10%" style="text-align: center; background: lightyellow">주문번호</th>
					<th width="10%" style="text-align: center; background: lightyellow">100000</th>
					<th width="10%" style="text-align: center; background: lightyellow">주문일자</th>
					<th width="10%" style="text-align: center; background: lightyellow">2018-03-01</th>
					<th width="10%" style="text-align: center; background: lightyellow">회원이메일</th>
					<th width="10%" style="text-align: center; background: lightyellow">asbs1234@naver.com</th>
					<th width="10%" style="text-align: center; background: lightyellow">주문상태</th>
					<th width="10%" style="text-align: center; background: lightyellow">준비중</th>
				</tr>
			</table>
			<br>
			<br>
			<table style="width: 65%">
				<tr>
					<th width="20%" style="text-align: center;">상품코드</th>
					<th width="20%" style="text-align: center;">상품명</th>
					<th width="10%" style="text-align: center;">수량(개)</th>
					<th width="20%" style="text-align: center;">가격(원)</th>
					<th width="10%" style="text-align: center;">할인율(%)</th>
					<th width="20%" style="text-align: center;">합계(원)</th>
					<!-- 도시락 외 3 클릭시 주문 정보 다 출력. -->
				</tr>
				<tr>
					<td style="text-align: left;">AA120523</td>
					<td style="text-align: left;">*********</td>
					<td style="text-align: right;">2</td>
					<td style="text-align: right;">10,000</td>
					<td style="text-align: right;">10</td>
					<td style="text-align: right;">20,000</td>
				</tr>
				
			</table>
			<br><br>
			<table style="width: 40%;">
				<tr>
					<th width="25%" style="text-align: center; background: lightyellow">등급 할인율(%)</th>
					<th width="25%" style="text-align: right; background: lightyellow">10</th>
					<th width="25%" style="text-align: center; background: lightyellow">총 가격(원)</th>
					<th width="25%" style="text-align: right; background: lightyellow">100,000</th>
				</tr>
			</table>	
		</div>	
	</section>
	<%@ include file="/views/admin/common/footer.jsp" %>
</body>
</html>