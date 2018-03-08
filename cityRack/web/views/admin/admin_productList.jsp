<%@page import="com.kh.cityrack.product.admin.model.dto.Pcategory"%>
<%@page import="com.kh.cityrack.product.admin.model.dto.PageInfo"%>
<%@page import="com.kh.cityrack.product.admin.model.dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Product> pList = (ArrayList<Product>)request.getAttribute("pList");
	ArrayList<Pcategory> cList = (ArrayList<Pcategory>)request.getAttribute("cList");
			
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int limit = pi.getLimit();
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
<title>Insert title here</title>
<style type="text/css">
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
</head>
<body>
	<%@ include file="../admin/common/header.jsp" %>
	<div align="center">
		<h2>상품 정보</h2>
		<form action="productSearch.pr" method="post">
			<table style="width: 40%; border: 2px solid black; margin: 15px;">
				<tr style="border: none">
					<td style="border: none;">
						<div align="left">
							<div class="searchDiv" style="width: 18%;" align="center"> 
								<label style="height: 100%; margin-top: 5px;" for="search_pcode">상품코드 : </label>	
							</div>
							<div class="searchDiv" style="width: 40%">
								<input type="search" name="search_pcode" id="search_pcode" class="form-control">
							</div>
							<div class="searchDiv" style="width: 5%;" align="center"> 
								<input type="checkbox" name="searchType" value="searchCheackedpCode">
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
						<input type="radio" name="orderType" value="searchCheackedpCodeOrder" checked="checked">
					</td>
				</tr>
				<tr style="border: none">
					<td style="border: none;">
						<div align="left">
							<div class="searchDiv" style="width: 18%;" align="center"> 
								<label for="search_rdate">등록일 : </label>
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
						<input type="checkbox" name="searchType" value="searchCheackedRdate">
					</td>
				</tr>
				<tr style="border: none">
					<td style="border: none;" colspan="2">
						<div align="center">
							<div class="searchDiv" style="width: 18%;" align="center"> 
								<label for="search_pcategory">카테고리명 : </label>														
							</div>
							<div class="searchDiv">
								<select id="search_pcategory" name="search_pcategory" class="form-control">
								<%for(int i = 0 ; i < cList.size() ; i++) {%>
									<option value="<%=cList.get(i).getCa_code()%>" class="form-control"><%=cList.get(i).getCa_name() %></option>
								<%} %>
							</select>
							</div>
							<div class="searchDiv" style="width: 5%">
								<input type="checkbox" name="searchType" value="searchCheackedPcategory">
							</div>
							<div class="searchDiv" style="width: 18%;" align="center"> 
								<label for="search_constitution">체질명 : </label>
							</div>
							<div class="searchDiv">
								<select id="search_constitution" name="search_constitution" class="form-control">
									<option value="수양">수양</option>
									<option value="수음">수음</option>
									<option value="목양">목양</option>
									<option value="목음">목음</option>
									<option value="금양">금양</option>
									<option value="금음">금음</option>
									<option value="토양">토양</option>
									<option value="토음">토음</option>
								</select>
							</div>	
							
							<div class="searchDiv" style="width: 5%">
								<input type="checkbox" name="searchType" value="searchCheackedConstitution">
							</div>		
						</div>
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
								<input type="checkbox" name="searchType" value="searchCheackedPname">
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
						<input type="radio" name="orderType" value="searchCheackedPnameOrder">
					</td>
				</tr>
				<tr style="border: none">
					<td style="border: none;" colspan="2">
						<div align="center">
							<div class="searchDiv" style="width: 18%;" align="center"> 
								<label for="search_status">진열상태 : </label>
							</div>
							<div class="searchDiv">
								<select id="search_status" name="search_status" class="form-control">
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</div>
							<div class="searchDiv" style="width: 5%">
								<input type="checkbox" name="searchType" value="searchCheackedStatus">
							</div>
							<div class="searchDiv" style="width: 5%;" align="center"> 
							</div>
							<div class="searchDiv">
								<input type="checkbox" value="new" id="new" name="event">
							</div>
							<div class="searchDiv">
								<label for="new">NEW</label>
							</div>
							<div class="searchDiv">
								<input type="checkbox" value="sale" id="sale" name="event">
							</div>
							<div class="searchDiv">
								<label for="new">HOT</label>
							</div>
							<div class="searchDiv">
								<input type="checkbox" value="hot" id="hot" name="event">
							</div>
							<div class="searchDiv">
								<label for="hot">SALE</label>
							</div>
							<div class="searchDiv" style="width: 5%;" align="center"> 
								<input type="checkbox" name="searchType" value="searchCheackedEvent">
							</div>
							<div class="searchDiv" style="width: 5%;" align="center"> 
							</div>
							<div class="searchDiv" style="width: 15%">
								<input type="submit" value="검색" class="btn btn-primary active" style="width: 100%">
							</div>
						</div>
					</td>	
				</tr>
			</table>			
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
			<%for(int i = 0 ; i < pList.size(); i++){ %>
			<tr>
				<td style="text-align: right;"><%=pList.get(i).getP_code() %></td>
				<td style="text-align: center;"><%=pList.get(i).getP_resisterDate() %></td>
				<td style="text-align: left;"><%=pList.get(i).getCa_name() %></td>
				<td style="text-align: left;"><%=pList.get(i).getP_8constitution() %></td>
				<td style="text-align: left;"><a href="<%= request.getContextPath()%>/ProductFormLoad.pr?formType=update&pcode=<%=pList.get(i).getP_code() %>"><%=pList.get(i).getP_name() %></a></td>
				<td style="text-align: right;"><%=pList.get(i).getP_price() %></td>
				<td style="text-align: left;"><%=pList.get(i).getP_event() %></td>
				<td style="text-align: right;"><%=pList.get(i).getP_discount() %></td>
				<td style="text-align: left;"><%=pList.get(i).getP_status() %></td>
				
				<td>
					<div class="statusButton">
						<button type="button" style="font-size: 13px;" onclick="warehousing();">입고</button>
					</div>
					<div class="statusButton">
						<button type="button" style="font-size: 13px;" onclick="release();">폐기</button>
					</div>						  
				</td>
			</tr>
			<%} %>
		</table>
		<!-- 페이지 처리 -->
		<% 
				double backNextPageVal = (double)currentPage/limit;
				int backNextpage = ((int)(backNextPageVal-0.9))*limit+1;
				
				double forwardNextPageVal = (double)currentPage/limit;
				int forwardNextpage = ((int)(forwardNextPageVal+0.9))*limit+1;
			/* (((int)((double)currentPage/limit))+0.9)*5-1;  */	
		%>
		<div class="pagingArea" align="center">
			<button onclick="location.href='<%= request.getContextPath()%>/productGetAll.pr?currentPage=1'"><<</button>
			<%if(currentPage <= 1) { %>
			<button><</button>
			<%} else { 
				if(backNextpage < 1) {%>
					<button onclick="location.href='<%= request.getContextPath()%>/productGetAll.pr?currentPage=1'"><</button>
			<% 	} else {%>
			
					<button onclick="location.href='<%= request.getContextPath()%>/productGetAll.pr?currentPage=<%=backNextpage%>'"><</button>
			<%	} %>
			<%} %>
			<%for(int p = startPage; p <= endPage; p++){ 
				if(p == currentPage){
			%>
				<button disabled="disabled"><%=p %></button>
			<%	} else { %>
				<button onclick="location.href='<%= request.getContextPath()%>/productGetAll.pr?currentPage=<%=p %>'"><%=p %></button>
			<%	} %>	
			<%} %>
			<%if(currentPage >= maxPage){ %>
			<button disabled="disabled">></button>	
			<%} else { 
				if(forwardNextpage > maxPage) {%>
				<button onclick="location.href='<%= request.getContextPath()%>/productGetAll.pr?currentPage=<%= maxPage%>'">></button>
				<% } else { %>
				<button onclick="location.href='<%= request.getContextPath()%>/productGetAll.pr?currentPage=<%= forwardNextpage%>'">></button>
				<%} %>
			<%} %> 
			<button onclick="location.href='<%= request.getContextPath()%>/productGetAll.pr?currentPage=<%=maxPage%>'">>></button>
		</div>
		<br>
		<div align="center">
			<button class="resisterBt" onclick="location.href='<%=request.getContextPath()%>/ProductFormLoad.pr?formType=resister'">상품 등록</button>
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