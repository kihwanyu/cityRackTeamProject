<%@page import="com.kh.cityrack.product.admin.model.dto.Stock"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ArrayList<Stock> sList = (ArrayList<Stock>)request.getAttribute("sList");
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
			<h2>재고 정보</h2><br>
			<form action="" method="get">
				<select id="searchCondition" name="searchCondition">
					<option value="product_code">상품코드</option>
					<option value="product_name">상품명</option>
				</select>
				&nbsp;
				<input type="search" name="searchText" id="searchText">
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
			<table style="width: 30%">
				<tr>
					<th width="30%" style="text-align: center;">상품번호</th>
					<th width="70%" style="text-align: center;">상품명</th>
				</tr>
				<tr>
					<td style="text-align: left;">BB2300</td>
					<td style="text-align: left;">main_도시락1</td>
				</tr>
				
			</table>	
		</div>	
	</section>
	<script type="text/javascript">
	$(function() {
		$(".tableArea td").mouseenter(function () {
			$(this).parent().css({"background":"lightyellow","cursor":"pointer"});
		}).mouseout(function() {
			$(this).parent().css("background","white");
		}).click(function() {
			var num = $(this).parent().children().eq(0).text();
			location.href="<%= request.getContextPath()%>/views/admin/admin_stockDetails.jsp";
		});
	});
	</script>
	<%@ include file="/views/admin/common/footer.jsp" %>
</body>
</html>