<%@page import="com.kh.cityrack.product.admin.model.dto.PageInfo"%>
<%@page import="com.kh.cityrack.product.admin.model.dto.Stock"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ArrayList<Stock> sList = (ArrayList<Stock>)request.getAttribute("sList");
	String pcode = (String)request.getAttribute("pcode");
	String pname = (String)request.getAttribute("pname");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int limit = pi.getLimit();
	
	int sAmount = (Integer)request.getAttribute("sAmount");
	int rAmount = (Integer)request.getAttribute("rAmount");
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
</style>
<title>재고 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>
		<div align="center">
		<h2>재고 상세</h2><br>
			<form action="" method="get">
				<input type="radio" value="warehosing" id="wareHosing" name="division">
				<label for="warehosing">입고</label>
				&nbsp;
				<input type="radio" value="release" id="release" name="division">
				<label for="release">폐기</label>
				&nbsp;
				<select id="searchCondition" name="searchCondition">
					<option value="date">등록날짜</option>
					<option value="selfLife">유통기한</option>
				</select>
				&nbsp;
				<span id="serachDate">
					<input type="date" name="beforeDate" id="beforeDate"> -
					<input type="date" name="AfterDate" id="AfterDate" > 
				</span>
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
			<table style="width: 40%">
				<tr>
					<td colspan="6" style="text-align: center; font-size: 20px; background: lightyellow;">상품명 : <%=pname %></td>
				</tr>
				<tr>
					<th width="10%" style="text-align: center;">재고번호</th>
					<th width="10%" style="text-align: center;">재고구분</th>
					<th width="15%" style="text-align: center;">등록날짜</th>
					<th width="15%" style="text-align: center;">유통기한</th>				
					<th width="30%" style="text-align: center;">분류</th>
					<th width="10%" style="text-align: center;">수량</th>
				</tr>
				<%for(int i = 0; i < sList.size(); i++){ %>
				<tr>
					<td style="text-align: right;"><%=sList.get(i).getScode() %></td>
					<td style="text-align: left;"><%=sList.get(i).getDivsion() %></td>
					<td><%=sList.get(i).getResisterDate() %></td>
					<td><%=sList.get(i).getSelflife() %></td>
					<td style="text-align: left;"><%=sList.get(i).getNote() %></td>
					<td style="text-align: right;"><%=sList.get(i).getAmount() %></td>
				</tr>
				<%} %>
			</table>
			<br>
			<!-- 페이지 처리 -->
			<% 
					double backNextPageVal = (double)currentPage/limit;
					int backNextpage = ((int)(backNextPageVal-0.9))*limit+1;
					
					double forwardNextPageVal = (double)currentPage/limit;
					int forwardNextpage = ((int)(forwardNextPageVal+0.9))*limit+1;
				/* (((int)((double)currentPage/limit))+0.9)*5-1;  */	
			%>
			<div class="pagingArea" align="center">
				<button onclick="location.href='<%= request.getContextPath()%>/stockDetails.pr?currentPage=1&pcode=<%=pcode%>&pname=<%=pname%>'"><<</button>
				<%if(currentPage <= 1) { %>
				<button><</button>
				<%} else { 
					if(backNextpage < 1) {%>
						<button onclick="location.href='<%= request.getContextPath()%>/stockDetails.pr?currentPage=1&pcode=<%=pcode%>&pname=<%=pname%>'"><</button>
				<% 	} else {%>
				
						<button onclick="location.href='<%= request.getContextPath()%>/stockDetails.pr?currentPage=<%=backNextpage%>&pcode=<%=pcode%>&pname=<%=pname%>'"><</button>
				<%	} %>
				<%} %>
				<%for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
				%>
					<button disabled="disabled"><%=p %></button>
				<%	} else { %>
					<button onclick="location.href='<%= request.getContextPath()%>/stockDetails.pr?currentPage=<%=p %>&pcode=<%=pcode%>&pname=<%=pname%>'"><%=p %></button>
				<%	} %>	
				<%} %>
				<%if(currentPage >= maxPage){ %>
				<button disabled="disabled">></button>	
				<%} else { 
					if(forwardNextpage > maxPage) {%>
					<button onclick="location.href='<%= request.getContextPath()%>/stockDetails.pr?currentPage=<%= maxPage%>&pcode=<%=pcode%>&pname=<%=pname%>'">></button>
					<% } else { %>
					<button onclick="location.href='<%= request.getContextPath()%>/stockDetails.pr?currentPage=<%= forwardNextpage%>&pcode=<%=pcode%>&pname=<%=pname%>'">></button>
					<%} %>
				<%} %> 
				<button onclick="location.href='<%= request.getContextPath()%>/stockDetails.pr?currentPage=<%=maxPage%>&pcode=<%=pcode%>&pname=<%=pname%>'">>></button>
			</div>
			<br>
			<div class="tableArea" align="center">
				<table style="width: 40%;" class="total">
					<tr>
						<td colspan="6" style="background: lightgray">합계</td>
					</tr>
					<tr>
						<td>입고량</td>
						<td><%=sAmount %></td>
						<td>출고량</td>
						<td><%=rAmount %></td>
						<td>재고량</td>
						<td><%=sAmount-rAmount %></td>
					</tr>
				</table>
			</div>
		</div>	
			
	</section>
	<%@ include file="/views/admin/common/footer.jsp" %>
</body>
</html>