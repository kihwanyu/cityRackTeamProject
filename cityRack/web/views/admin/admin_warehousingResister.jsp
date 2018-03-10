<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String pcode = request.getParameter("pcode");
%>
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
</style>
<title>상품 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>	
		<div class="tableArea" align="center">
			<h2>입고 등록</h2><br>
			<form action="<%=request.getContextPath() %>/stockInsert.pr" method="get">
				<table style="width: 30%">
					<tr>
						<td colspan="2">입고 등록</td>
					</tr>
					<tr>
						<td width="30%">재고 구분</td>
						<td>
							<input class="form-control" type="text" value="입고" name="divsion" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>상품 코드</td>
						<td>
							<input class="form-control" type="text" value="<%=pcode%>" name="pcode" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>유통기한</td>
						<td>
							<input class="form-control" type="date" name="selflife">
						</td>
					</tr>
					<tr>
						<td>분류</td>
						<td>
							<select id="note" class="form-control" name="note">
								<option value="상품 입고">상품 입고</option>
								<option value="기타">기타</option>						
							</select>
						</td>
					</tr>
					<tr>
						<td>수량</td>
						<td>
							<input id="amount" class="form-control" type="number" name="amount" min="1" max="100" value="1">	
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div>
								<input type="submit" value="등록">
							</div>
						</td>
					<tr>
				</table>
			</form>
		</div>
	</section>
	<%@ include file="/views/admin/common/footer.jsp" %>
	
</body>
</html>