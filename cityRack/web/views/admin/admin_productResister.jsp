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
		height: 800px;
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
	.productPosition {
		display:  inline-block;
		width: 40%;
		height: 100%;
		margin: 0.05em;
	}
	#titleImgArea {
		width: 500px;
		border: 2px dashed darkgray;
		text-align: center;
		display: table-cell;
		vertical-align: middle;
	}
	#contentImgArea {
		width: 500px;
		border: 2px dashed darkgray;
		text-align: center;
		display: table-cell;
		vertical-align: middle;
	}
	
	#titleImgArea:hover {
		cursor: pointer;
	}
	#contentImgArea:hover {
		cursor: pointer;
	}
	.resisterBt {
		padding: 10px;
	}
</style>
<title>상품 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>
		<div class="tableArea" align="center">
			<h2>상품 등록</h2><br>
			<table style="width: 40%;">
				<tr>
					<th width="25%" style="text-align: center; background: lightyellow">상품 코드</th>
					<!-- 상품코드 = 카테고리 코드  -->
					<th width="25%" style="text-align: center; background: lightyellow">
						<input type="text" class="form-control">
					</th>
					<th width="25%" style="text-align: center; background: lightyellow">진열 상태</th>
					<th width="25%" style="text-align: center; background: lightyellow">
						<input id="statusY" type="radio" name="status" value="Y">
						<label for="statusY">Y</label>&nbsp;&nbsp;
						<input id="statusN" type="radio" name="status" value="N">
						<label for="statusN">N</label>
					</th>
				</tr>
			</table>
			<br><br>
			<div class="productPosition">
				<table style="width: 80%; height: 70%">
					<tr>
						<td width="30%" style="text-align: center;">카테고리</td>
						<td width="70%" style="text-align: left;">
							<select class="form-control">
								<option value="">..</option>
								<option value="">..</option>
							</select>
						</td>
					</tr>
					<tr>
						<td style="text-align: center;">체질명</td>
						<td>
							<input style="margin: 5px;" type="radio" name="constitution" value="100">수음
							<input style="margin: 5px;" type="radio" name="constitution" value="200">수양
							<input style="margin: 5px;" type="radio" name="constitution" value="300">목음
							<input style="margin: 5px;" type="radio" name="constitution" value="400">목양<br>
							<input style="margin: 5px;" type="radio" name="constitution" value="500">금음
							<input style="margin: 5px;" type="radio" name="constitution" value="600">금양
							<input style="margin: 5px;" type="radio" name="constitution" value="700">토음
							<input style="margin: 5px;" type="radio" name="constitution" value="800">토양							
						</td>
					</tr>
					<tr>			 
						<td style="text-align: center;">상품명</td>
						<td colspan="2">
							<input class="form-control" id="pname" type="text" value="" name="pname">
						</td>
					</tr>
					<tr>			 
						<td style="text-align: center;">가격</td>
						<td colspan="2" style="text-align: left;">
							<input class="form-control" id="price" type="number" value="" name="price">
						</td>
					</tr>
					<tr>
						<td style="text-align: center;">체질명</td>
						<td>
							<input id="new" type="checkbox" name="new" value="new"> New
							<input id="hot" type="checkbox" name="hot" value="hot"> Hot
							<input id="sale" type="checkbox" name="sale" value="sale" onclick="saleSelected();"> Sale
							<div align="center" id="saleGroup" hidden="">
								<br>
								<label for="saleValues"> 할인율(%) : </label>
								<input id="saleValues" class="form-control" type="number" name="saleValues" min="1" max="100" value="1" style="width: 30%;">	
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="productPosition">
				<div style="margin-bottom: 50px">
					<table style="width:80%; height: 70%;">
						<tr>
							<td style="text-align: center; height: 60%">
								<div id="titleImgArea">
									<img id="titleImg" height="312px" width="70%">
								</div>
							</td>
						</tr>
						<tr>
							<td style="text-align: center;">
								<div id="contentImgArea">
									<img id="contentImg" height="200px" width="40%">
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>	
		</div>
		<div align="center" style="margin-top: -50px;">
				<input class="resisterBt" type="button" value="등록하기">
		</div>
		<div id="fileArea">
			<input type="file" id="file1" name="file1" onchange="LoadImg1(this);">
			<input type="file" id="file2" name="file2" onchange="LoadImg2(this);">
		</div>	
	</section>
	<script type="text/javascript">
		$(function() {
			$("#fileArea").hide();
			$("#titleImgArea").click(function () {
				$("#file1").click();
			});
			$("#contentImgArea").click(function () {
				$("#file2").click();
			});
		});
		
		function LoadImg1(value) {
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#titleImg").attr("src", e.target.result);
				}
			reader.readAsDataURL(value.files[0]);
			}
		}
		function LoadImg2(value) {
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#contentImg").attr("src", e.target.result);
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
		
		function saleSelected(){
			var selection = document.getElementById('sale').checked;
			console.log(selection);
			if(selection==true){
				document.getElementById('saleGroup').style.display='inline';
			} else {
				document.getElementById('saleGroup').style.display='none';
			}
		};
	</script>
	<%@ include file="/views/admin/common/footer.jsp" %>
</body>
</html>