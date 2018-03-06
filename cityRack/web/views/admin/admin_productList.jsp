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
<title>Insert title here</title>
<style type="text/css">
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
	.statusButton {
		display:  inline-block;
		width: 40%;
		height: 50%;
		margin: 0.05em;	
		
	}
</style>
</head>
<body>
	<%@ include file="../admin/common/header.jsp" %>
	<div align="center">
		<h2>상품 정보</h2><br>
		<form action="" method="get">
			<input type="checkbox" value="new" id="new" name="new">
			<label for="new">NEW</label>
			&nbsp;
			<input type="checkbox" value="sale" id="sale" name="sale">
			<label for="new">SALE</label>
			&nbsp;
			<input type="checkbox" value="hot" id="hot" name="hot">
			<label for="hot">HOT</label>
			&nbsp;&nbsp;
			<select id="searchCondition" name="searchCondition" onchange="selectSearch();">
				<option value="pcode">상품코드</option>
				<option value="pdate">등록일</option>
				<option value="pcategory">카테고리명</option>
				<option value="constitution">체질명</option>
				<option value="pname">상품명</option>
				<option value="status">진열상태</option>
			</select>
			&nbsp;
			<input type="search" name="searchText" id="searchText">
			<span id="serachDate" hidden="">
				<input type="date" name="beforeDate" id="beforeDate"> -
				<input type="date" name="AfterDate" id="AfterDate" > 
			</span>
			<select id="status" name="status" hidden="">
				<option value="Y">Y</option>
				<option value="N">N</option>
			</select>
			<select id="pcategory" name="pcategory" hidden="">
				<option value="100">..</option>
			</select>
			<!-- 카테고리 테이블에있는 카테고리를 jsp를 통해 옵션값을 넣어준다. -->
			<select id="constitution" name="constitution" hidden="">
				<option value="100">수양</option>
				<option value="200">수음</option>
				<option value="300">목양</option>
				<option value="400">목음</option>
				<option value="500">금양</option>
				<option value="600">금음</option>
				<option value="700">토양</option>
				<option value="800">토음</option>
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
		<table style="width: 90%">
				<tr>
					<th width="7%" style="text-align: center;">상품코드</th>
					<th width="7%" style="text-align: center;">등록일</th>
					<th width="10%" style="text-align: center;">카테고리명</th>
					<th width="7%" style="text-align: center;">체질명</th>
					<th width="25%" style="text-align: center;">상품명</th>
					<th width="7%" style="text-align: center;">가격(원)</th>
					<th width="10%" style="text-align: center;">이벤트</th>
					<th width="10%" style="text-align: center;">할인율(%)</th>
					<th width="5%" style="text-align: center;">진열 상태</th>		
					<th width="9%" style="text-align: center;">입고/폐기</th>
				</tr>
			<tr>
				<td style="text-align: right;">100</td>
				<td style="text-align: center;">2018-03-04</td>
				<td style="text-align: left;">반찬</td>
				<td style="text-align: left;">토양</td>
				<td style="text-align: left;"><a href="<%= request.getContextPath()%>/views/admin/admin_productUpadate.jsp">소세지야채볶음</a></td>
				<td style="text-align: right;">10,000</td>
				<td style="text-align: left;">New Hot Sale</td>
				<td style="text-align: right;">10</td>
				<td>Y</td>
				<td>
					<div class="statusButton">
						<button type="button" style="font-size: 13px;" onclick="warehousing();">입고</button>
					</div>
					<div class="statusButton">
						<button type="button" style="font-size: 13px;" onclick="release();">폐기</button>
					</div>						  
				</td>
			</tr>
		</table>
		<br>
		<div align="center">
			<button class="resisterBt" onclick="location.href='<%=request.getContextPath()%>/views/admin/admin_productResister.jsp'">상품 등록</button>
		</div>
		<script type="text/javascript">
		
		function selectSearch() {
			var selection = document.getElementById('searchCondition').value;
			if(selection=='pcode'){
				document.getElementById('searchText').style.display='inline';
				document.getElementById('serachDate').style.display='none';
				document.getElementById('status').style.display='none';
				document.getElementById('constitution').style.display='none';
				document.getElementById('pcategory').style.display='none';
				document.getElementById('order').style.display='inline';
			} if(selection=='pdate'){
				document.getElementById('searchText').style.display='none';
				document.getElementById('serachDate').style.display='inline';
				document.getElementById('status').style.display='none';
				document.getElementById('constitution').style.display='none';
				document.getElementById('pcategory').style.display='none';
				document.getElementById('order').style.display='inline';
			} else if(selection=='pcategory') {
				document.getElementById('searchText').style.display='none';
				document.getElementById('serachDate').style.display='none';
				document.getElementById('status').style.display='none';
				document.getElementById('constitution').style.display='none';
				document.getElementById('pcategory').style.display='inline';
				document.getElementById('order').style.display='none';
			} else if(selection=='constitution') {
				document.getElementById('searchText').style.display='none';
				document.getElementById('serachDate').style.display='none';
				document.getElementById('status').style.display='none';
				document.getElementById('constitution').style.display='inline';
				document.getElementById('pcategory').style.display='none';
				document.getElementById('order').style.display='none';
			} else if(selection=='pname') {
				document.getElementById('searchText').style.display='inline';
				document.getElementById('serachDate').style.display='none';
				document.getElementById('status').style.display='none';
				document.getElementById('constitution').style.display='none';
				document.getElementById('pcategory').style.display='none';
				document.getElementById('order').style.display='inline';
			} else {
				document.getElementById('searchText').style.display='none';
				document.getElementById('serachDate').style.display='none';
				document.getElementById('status').style.display='inline';
				document.getElementById('constitution').style.display='none';                        
				document.getElementById('pcategory').style.display='none';
				document.getElementById('order').style.display='none';
			}
		}
		function warehousing(){
			location.href = "<%=request.getContextPath()%>/views/admin/admin_warehousingResister.jsp";
		}
		function release(){
			location.href = "<%=request.getContextPath()%>/views/admin/admin_releaseResister.jsp";
		}
		</script>
	</div>
	<%@ include file="../admin/common/footer.jsp" %>
</body>
</html>