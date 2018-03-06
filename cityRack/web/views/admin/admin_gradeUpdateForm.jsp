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
<title>등급 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>	
		<div class="tableArea" align="center">
			<h2>등급 수정</h2><br>
			<form action="" method="get">
				<table style="width: 25%">
					<tr>
						<td colspan="2">등급 수정</td>
					</tr>
					<tr>
						<td width="30%">등급명</td>
						<td>
							<input class="form-control" type="text" name="garde_name">
						</td>
					</tr>
					<tr>
						<td>할인율</td>
						<td>
							<input id="garde_discount" class="form-control" type="number" name="garde_discount" min="1" max="100" value="1">
						</td>
					</tr>
					
					<tr>
						<td colspan="2">
							<div>
								<button onclick="">수정</button>&nbsp;
								<button onclick="">삭제</button>&nbsp;
							</div>
						</td>
					<tr>
				</table>
			</form>
		</div>
		<script type="text/javascript">
			function dropOut(){
				var result = window.confirm("관리자등급을 삭제하시겠습니까?");
				if(result==true){
					
				} else {
					
				}
			}
		</script>
	</section>
	
	<%@ include file="/views/admin/common/footer.jsp" %>
	
</body>
</html>