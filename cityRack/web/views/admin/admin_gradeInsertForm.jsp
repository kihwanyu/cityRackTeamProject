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
<title>회원 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>	
		<div class="tableArea" align="center">
			<h2>등급 추가</h2><br>
			<form action="<%=request.getContextPath() %>/GradeInsert.me" method="get">
				<table style="width: 30%">
					<tr>
						<td colspan="3">등급 추가</td>
					</tr>
					<tr>
						<td>등급명</td>
						<td colspan="2">
							<input type="text" name="grade_name">
						</td>
					</tr>
					<tr>
						<td>할인율</td>
						<td colspan="2">
							<select name="grade_discount">
							  <option value="5">5%</option>
							  <option value="10">10%</option>
							  <option value="15">15%</option>
							  <option value="20">20%</option>
							  <option value="25">25%</option>
							  <option value="30">30%</option>
							  <option value="35">35%</option>
							  <option value="40">40%</option>
							  <option value="45">45%</option>
							  <option value="50">50%</option>
							 
							</select>
						</td>
					</tr>
					
					<tr>
						<td colspan="3">
							<div>
								<button onclick="">추가</button>&nbsp;
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