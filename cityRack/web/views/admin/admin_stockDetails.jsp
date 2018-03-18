<%@page import="com.kh.cityrack.product.admin.model.dto.PageInfo"%>
<%@page import="com.kh.cityrack.product.admin.model.dto.Stock"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
if((com.kh.cityrack.member.common.model.dto.Member)session.getAttribute("loginUser")!=null){
	  com.kh.cityrack.member.common.model.dto.Member me = (com.kh.cityrack.member.common.model.dto.Member)session.getAttribute("loginUser");
	  if(!(me.getC_name().equals("관리자"))){
		 RequestDispatcher view = request.getRequestDispatcher("/views/common/errorPage.jsp");
		 request.setAttribute("msg", "동작그만 밑장빼기냐?");
		 view.forward(request, response);
	  }
	}else{
		System.out.println("bye");
		RequestDispatcher view = request.getRequestDispatcher("/views/common/errorPage.jsp");
		  request.setAttribute("msg", "동작그만 밑장빼기냐?");
		  view.forward(request, response);
	}
	ArrayList<Stock> sList = (ArrayList<Stock>)request.getAttribute("sList");
	
	System.out.println("jsp sList : " + sList);

	Boolean searchBloolean = (Boolean)request.getAttribute("searchBloolean");

	System.out.println("jsp searchBloolean : " + searchBloolean);
	
	String pcode = (String)request.getAttribute("pcode");
	String pname = (String)request.getAttribute("pname");
	
	System.out.println("jsp pcode : " + pcode);
	System.out.println("jsp pname : " + pname);
	
	String beforeDate = "";
	String afterDate = "";
	String order = "";
	
	if(searchBloolean){
		beforeDate = (String)request.getAttribute("beforeDate");
		afterDate = (String)request.getAttribute("afterDate");
		order = (String)request.getAttribute("order");		
		
		System.out.println("jsp beforeDate : " + beforeDate);
		System.out.println("jsp afterDate : " + afterDate);
		System.out.println("jsp afterDate : " + order);
		
	}	
	
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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   
<style>
	@import url("views/admin/css/common.css");
	table {
		border: 1px solid black;
		text-align: center;
		border-collapse: collapse;
		
	}	
	.tableArea {
		width: 100%;
		height: 650px;
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
			<form action="StockDetailSearch.pr" method="get">
				<input type="hidden" name="pcode" value="<%=pcode%>">
				<input type="hidden" name="pname" value="<%=pname%>">
				<label>등록 날짜 : </label>
				<%if(!searchBloolean){ %>
				<span id="serachDate">
					<input type="date" name="beforeDate" id="beforeDate"> -
					<input type="date" name="afterDate" id="afterDate" > 
				</span>
				<%} else {%>
				<span id="serachDate">
					<input type="date" name="beforeDate" id="beforeDate" value="<%=beforeDate%>"> -
					<input type="date" name="afterDate" id="afterDate" value="<%=afterDate%>"> 
				</span>
				<%} %>
				&nbsp;
				<%if(!searchBloolean) {%>
				<select id="order" name="order">
					<option value="ASC">오름차순</option>
					<option value="DESC">내림차순</option>
				</select>
				<%} else {
					if(order.equals("ASC")){%>
					<select id="order" name="order">
						<option value="ASC" selected="selected">오름차순</option>
						<option value="DESC">내림차순</option>
					</select>
					<%} else {%>
					<select id="order" name="order">
						<option value="ASC">오름차순</option>
						<option value="DESC" selected="selected">내림차순</option>
					</select>
					<%}
				}%>
				&nbsp;
				<input type="submit" value="검색">
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
			<%if(!searchBloolean){ %>
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
			<%} else {%>
			<div class="pagingArea" align="center">
				<button onclick="location.href='<%= request.getContextPath()%>/StockDetailSearch.pr?currentPage=1&pcode=<%=pcode%>&pname=<%=pname%>&beforeDate=<%=beforeDate%>&afterDate=<%=afterDate%>&order=<%=order%>'"><<</button>
				<%if(currentPage <= 1) { %>
				<button><</button>
				<%} else { 
					if(backNextpage < 1) {%>
						<button onclick="location.href='<%= request.getContextPath()%>/StockDetailSearch.pr?currentPage=1&pcode=<%=pcode%>&pname=<%=pname%>&beforeDate=<%=beforeDate%>&afterDate=<%=afterDate%>&order=<%=order%>'"><</button>
				<% 	} else {%>
				
						<button onclick="location.href='<%= request.getContextPath()%>/StockDetailSearch.pr?currentPage=<%=backNextpage%>&pcode=<%=pcode%>&pname=<%=pname%>&beforeDate=<%=beforeDate%>&afterDate=<%=afterDate%>&order=<%=order%>'"><</button>
				<%	} %>
				<%} %>
				<%for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
				%>
					<button disabled="disabled"><%=p %></button>
				<%	} else { %>
					<button onclick="location.href='<%= request.getContextPath()%>/StockDetailSearch.pr?currentPage=<%=p %>&pcode=<%=pcode%>&pname=<%=pname%>&beforeDate=<%=beforeDate%>&afterDate=<%=afterDate%>&order=<%=order%>'"><%=p %></button>
				<%	} %>	
				<%} %>
				<!--                                                                                                       -->
				<%if(currentPage >= maxPage){ %>
				<button disabled="disabled">></button>	
				<%} else { 
					if(forwardNextpage > maxPage) {%>
					<button onclick="location.href='<%= request.getContextPath()%>/StockDetailSearch.pr?currentPage=<%= maxPage%>&pcode=<%=pcode%>&pname=<%=pname%>&beforeDate=<%=beforeDate%>&afterDate=<%=afterDate%>&order=<%=order%>'">></button>
					<% } else { %>
					<button onclick="location.href='<%= request.getContextPath()%>/StockDetailSearch.pr?currentPage=<%= forwardNextpage%>&pcode=<%=pcode%>&pname=<%=pname%>&beforeDate=<%=beforeDate%>&afterDate=<%=afterDate%>&order=<%=order%>'">></button>
					<%} %>
				<%} %> 
				<button onclick="location.href='<%= request.getContextPath()%>/StockDetailSearch.pr?currentPage=<%=maxPage%>&pcode=<%=pcode%>&pname=<%=pname%>&beforeDate=<%=beforeDate%>&afterDate=<%=afterDate%>&order=<%=order%>'">>></button>
			</div>
			<%} %>
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
				<div id="chart_div" align="center"></div>
			</div>
			
		</div>	
		<script type="text/javascript">
		// Load the Visualization API and the corechart package.
		google.charts.load('current', {'packages':['corechart']});
		
		// Set a callback to run when the Google Visualization API is loaded.
		google.charts.setOnLoadCallback(drawChart);
		
		// Callback that creates and populates a data table,
		// instantiates the pie chart, passes in the data and
		// draws it.
		function drawChart() {
		
			// Create the data table.
			var data = new google.visualization.DataTable();
			data.addColumn('string', 'Topping');
			data.addColumn('number', 'Slices');
			data.addRows([
			  ['입고량', <%=sAmount%>],
			  ['출고량', <%=rAmount%>]
			]);
		
			// Set chart options
			var options = {'width':600,
			               'height':300};
		
			// Instantiate and draw our chart, passing in some options.
			var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
			chart.draw(data, options);
			}
		</script>
	</section>
	<%@ include file="/views/admin/common/footer.jsp" %>
</body>
</html>--