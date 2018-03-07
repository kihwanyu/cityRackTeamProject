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
</style>
<title>상품 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>	
		<div class="tableArea" align="center">
			<h2>카테고리 추가</h2><br>
			<form action="<%=request.getContextPath() %>/PcategoryInsert.pr" method="get">
				<table style="width: 30%">
					<tr>
						<td colspan="2">카테고리 추가</td>
					</tr>
					<tr>
						<td>카테고리명</td>
						<td>
							<input class="form-control" type="text" name="category_name">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div>
								<input type="submit" value="추가">&nbsp;
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