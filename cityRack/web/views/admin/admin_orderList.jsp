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
	.statusButton {
		display:  inline-block;
		width: 40%;
		height: 50%;
		margin: 0.05em;	
		
	}
	.pagingArea {
		margin-top: 15px;
	}
	.searchDiv {
		display:  inline-block;
		margin-left:auto;
		margin-right:auto;
		vertical-align: middle;
	}
</style>
<title>회원 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>
		<div align="center">
			<h2>주문 정보</h2>
			<table style="width: 40%; border: 2px solid black; margin: 15px;">
				<tr style="border: none">
					<td style="border: none;">
						<div align="left">
							<div class="searchDiv" style="width: 18%;" align="center"> 
								<label for="search_pname">주문번호 : </label>
							</div>
							<div class="searchDiv" style="width: 40%">
								<input type="search" name="search_pname" id="search_pname" class="form-control">
							</div>
							<div class="searchDiv" style="width: 5%;" align="center"> 
								<input type="checkbox" id="searchCheackedPname" name="searchType" value="searchCheackedPname">
							</div>
							<div class="searchDiv" style="width: 25%">
								<select id="pname_order" name="pname_order" class="form-control">
									<option value="ASC">오름차순</option>
									<option value="DESC">내림차순</option>
								</select>
							</div>
						</div>
					</td>	
					<td style="border: none">
						<input type="radio" id="searchCheackedPnameOrder" name="orderType" value="searchCheackedPnameOrder">
					</td>
				</tr>
				<tr style="border: none">
					<td style="border: none;">
						<div align="left">
							<div class="searchDiv" style="width: 18%;" align="center"> 
								<label style="height: 100%; margin-top: 5px;" for="search_pcode">회원이메일 : </label>	
							</div>
							<div class="searchDiv" style="width: 40%">
								<input type="search" name="search_pcode" id="search_pcode" class="form-control">
							</div>
							<div class="searchDiv" style="width: 5%;" align="center"> 
								<input id="searchCheackedpCode" type="checkbox" name="searchType" value="searchCheackedpCode">
							</div>
							<div class="searchDiv" style="width: 25%">
								<select id="pcode_order" name="pcode_order" class="form-control">
									<option value="ASC">오름차순</option>
									<option value="DESC">내림차순</option>
								</select>
							</div>		
						</div>
					</td>	
					
					<td style="border: none">
						<input type="radio" id="searchCheackedpCodeOrder" name="orderType" value="searchCheackedpCodeOrder">
					</td>
				</tr>
				<tr style="border: none">
					<td style="border: none;">
						<div align="left">
							<div class="searchDiv" style="width: 18%;" align="center"> 
								<label for="search_rdate">주문일자 : </label>
							</div>
							<div class="searchDiv" style="width: 36%">
								<input type="date" name="beforeDate" id="beforeDate" class="form-control">
							</div>
							<div class="searchDiv" style="width: 2%;" align="center">
								-
							</div>
							<div class="searchDiv" style="width: 36%">
								<input type="date" name="afterDate" id="afterDate" class="form-control">
							</div>
						</div>	
					</td>	
					<td style="border: none">
						<input id="searchCheackedRdate" type="checkbox" name="searchType" value="searchCheackedRdate">
					</td>
				</tr>
				<tr style="border: none">
					<td style="border: none;">
						<div align="left">
							<div class="searchDiv" style="width: 18%;" align="center"> 
								<label for="search_pname">상품명 : </label>
							</div>
							<div class="searchDiv" style="width: 40%">
								<input type="search" name="search_pname" id="search_pname" class="form-control">
							</div>
							<div class="searchDiv" style="width: 5%;" align="center"> 
								<input type="checkbox" id="searchCheackedPname" name="searchType" value="searchCheackedPname">
							</div>
							<div class="searchDiv" style="width: 25%">
								<select id="pname_order" name="pname_order" class="form-control">
									<option value="ASC">오름차순</option>
									<option value="DESC">내림차순</option>
								</select>
							</div>
						</div>
					</td>	
					<td style="border: none">
						<input type="radio" id="searchCheackedPnameOrder" name="orderType" value="searchCheackedPnameOrder">
					</td>
				</tr>
				<tr style="border: none">
					<td style="border: none;" colspan="2">
						<div align="center">
							<div class="searchDiv" style="width: 15%;" align="center"> 
								<label for="search_status">주문상태 : </label>
							</div>
							<div class="searchDiv" align="right">
								<select name="status">
									<option value="ready">준비중</option>
									<option value="allSet">준비완료</option>
									<option value="delivery">배송중</option>
									<option value="deliveryCompleted">배송완료</option>
									<option value="contractStandby">취소대기</option>
									<option value="contractCompleted">취소완료</option>
								</select>
							</div>
							<div class="searchDiv" style="width: 5%">
								<input type="checkbox" id="searchCheackedStatus" name="searchType" value="searchCheackedStatus">
							</div>
							<div class="searchDiv" style="width: 5%;" align="center"> 
							</div>
							<div class="searchDiv" style="width: 5%;" align="center"> 
							</div>
							<div class="searchDiv" style="width: 10%">
								<input type="submit" id="SearchBtn" value="검색" class="btn btn-primary active" style="width: 100%">
							</div>
							<div class="searchDiv" style="width: 10%;">
								<input type="reset" id="rsetBtn" value="초기화" class="btn btn-primary active" style="width: 100%">
							</div>
						</div>
					</td>	
				</tr>
			</table>			
			
		</div>
		
		<br>
		<div class="tableArea" align="center">
			<table style="width: 80%">
				<tr>
					<th width="10%" style="text-align: center;">주문번호</th>
					<th width="7%" style="text-align: center;">주문일자</th>
					<th width="15%" style="text-align: center;">회원이메일</th>
					<th width="20%" style="text-align: center;">상품명</th>
					<th width="10%" style="text-align: center;">총가격(원)</th>
					<th width="6%" style="text-align: center;">주문상태</th>
					<th width="6%" style="text-align: center;">상태변경</th>
					<!-- 도시락 외 3 클릭시 주문 정보 다 출력. -->
				</tr>
				<tr>
					<td style="text-align: right;">100000</td>
					<td style="text-align: left;">2018-03-01</td>
					<td style="text-align: left;">abcd1234@naver.com</td>
					<td style="text-align: left;"><a href="<%=request.getContextPath()%>/views/admin/admin_orderDetails.jsp">********* 외 3</a></td>
					<td style="text-align: right;">56,000</td>
					<td>
						<select name="status">
							<option value="ready">준비중</option>
							<option value="allSet">준비완료</option>
							<option value="delivery">배송중</option>
							<option value="deliveryCompleted">배송완료</option>
							<option value="contractStandby">취소대기</option>
							<option value="contractCompleted">취소완료</option>
						</select>
					</td>
					<td><button onclick="dropOut();">변경</button></td>
				</tr>
			</table>	
		</div>	
	</section>
	<%@ include file="/views/admin/common/footer.jsp" %>
	<script type="text/javascript">
		
		}
		function dropOut(var no){
			var msgStr = "주문번호 : "+no+" 의 상태를 변경하시겠습니까?";
			var result = window.confirm(msgStr);
			if(result==true){
				
			} else {
				
			}
		}
	</script>
</body>
</html>