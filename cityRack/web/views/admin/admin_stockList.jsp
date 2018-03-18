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

	Boolean searchBloolean = (Boolean)request.getAttribute("searchBloolean");
	System.out.println(searchBloolean);
	String order = (String)request.getAttribute("order");
	String searchText = (String)request.getAttribute("searchText");
	String searchCondition = (String)request.getAttribute("searchCondition");
	/*  */
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
			<h2>재고 정보</h2><br>
			<form action="<%=request.getContextPath() %>/StockSearch.pr" method="get">
				<%if(!searchBloolean){ %>
				<select id="searchCondition" name="searchCondition">
					<option value="product_code">상품코드</option>
					<option value="product_name">상품명</option>
				</select>
				<%} else {
					if(searchCondition.equals("product_code")) {%>
					<select id="searchCondition" name="searchCondition">
						<option value="product_code" selected="selected">상품코드</option>
						<option value="product_name">상품명</option>
					</select>
					<%} else {%>
					<select id="searchCondition" name="searchCondition">
						<option value="product_code">상품코드</option>
						<option value="product_name" selected="selected">상품명</option>
					</select>
					<%}
				}%>
				&nbsp;
				<%if(!searchBloolean){ %>
				<input type="search" name="searchText" id="searchText">
				<%} else {%>
				<input type="search" name="searchText" id="searchText" value="<%=searchText%>">
				<%} %>
				&nbsp;
				<%if(!searchBloolean){ %>
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
				<%	} else {%>
					<select id="order" name="order">
						<option value="ASC">오름차순</option>
						<option value="DESC" selected="selected">내림차순</option>
					</select>
				<%	}
				}%>
				&nbsp;
				<input type="submit" value="검색">
			</form>
		</div>
		
		<br>
		<div class="tableArea" align="center">
			<table style="width: 30%">
				<tr>
					<th width="30%" style="text-align: center;">상품코드</th>
					<th width="70%" style="text-align: center;">상품명</th>
				</tr>
				<%for(int i = 0 ; i < sList.size(); i++){ %>
				<tr>
					<td id="pcode" style="text-align: right;"><%=sList.get(i).getPcode() %></td>
					<td id="pname" style="text-align: left;"><%=sList.get(i).getPname() %></td>
				</tr>
				<%} %>
			</table>	
		</div>	
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
			<button onclick="location.href='<%= request.getContextPath()%>/stockGetAll.pr?currentPage=1'"><<</button>
			<%if(currentPage <= 1) { %>
			<button><</button>
			<%} else { 
				if(backNextpage < 1) {%>
					<button onclick="location.href='<%= request.getContextPath()%>/stockGetAll.pr?currentPage=1'"><</button>
			<% 	} else {%>
			
					<button onclick="location.href='<%= request.getContextPath()%>/stockGetAll.pr?currentPage=<%=backNextpage%>'"><</button>
			<%	} %>
			<%} %>
			<%for(int p = startPage; p <= endPage; p++){ 
				if(p == currentPage){
			%>
				<button disabled="disabled"><%=p %></button>
			<%	} else { %>
				<button onclick="location.href='<%= request.getContextPath()%>/stockGetAll.pr?currentPage=<%=p %>'"><%=p %></button>
			<%	} %>	
			<%} %>
			<%if(currentPage >= maxPage){ %>
			<button disabled="disabled">></button>	
			<%} else { 
				if(forwardNextpage > maxPage) {%>
				<button onclick="location.href='<%= request.getContextPath()%>/StockSearch.pr?currentPage=<%= maxPage%>&order=<%=order%>&searchText=<%=searchText%>&searchCondition=<%=searchCondition%>'">></button>
				<% } else { %>
				<button onclick="location.href='<%= request.getContextPath()%>/StockSearch.pr?currentPage=<%= forwardNextpage%>&order=<%=order%>&searchText=<%=searchText%>&searchCondition=<%=searchCondition%>'">></button>
				<%} %>
			<%} %> 
			<button onclick="location.href='<%= request.getContextPath()%>/StockSearch.pr?currentPage=<%=maxPage%>&order=<%=order%>&searchText=<%=searchText%>&searchCondition=<%=searchCondition%>'">>></button>
		</div>
		<%} else { %>
		<div class="pagingArea" align="center">
			<button onclick="location.href='<%= request.getContextPath()%>/StockSearch.pr?currentPage=1&order=<%=order%>&searchText=<%=searchText%>&searchCondition=<%=searchCondition%>'"><<</button>
			<%if(currentPage <= 1) { %>
			<button><</button>
			<%} else { 
				if(backNextpage < 1) {%>
					<button onclick="location.href='<%= request.getContextPath()%>/StockSearch.pr?currentPage=1&order=<%=order%>&searchText=<%=searchText%>&searchCondition=<%=searchCondition%>'"><</button>
			<% 	} else {%>
			
					<button onclick="location.href='<%= request.getContextPath()%>/StockSearch.pr?currentPage=<%=backNextpage%>&order=<%=order%>&searchText=<%=searchText%>&searchCondition=<%=searchCondition%>'"><</button>
			<%	} %>
			<%} %>
			<%for(int p = startPage; p <= endPage; p++){ 
				if(p == currentPage){
			%>
				<button disabled="disabled"><%=p %></button>
			<%	} else { %>
				<button onclick="location.href='<%= request.getContextPath()%>/StockSearch.pr?currentPage=<%=p %>&order=<%=order%>&searchText=<%=searchText%>&searchCondition=<%=searchCondition%>'"><%=p %></button>
			<%	} %>	
			<%} %>
			<%if(currentPage >= maxPage){ %>
			<button disabled="disabled">></button>	
			<%} else { 
				if(forwardNextpage > maxPage) {%>
				<button onclick="location.href='<%= request.getContextPath()%>/StockSearch.pr?currentPage=<%= maxPage%>&order=<%=order%>&searchText=<%=searchText%>&searchCondition=<%=searchCondition%>'">></button>
				<% } else { %>
				<button onclick="location.href='<%= request.getContextPath()%>/StockSearch.pr?currentPage=<%= forwardNextpage%>&order=<%=order%>&searchText=<%=searchText%>&searchCondition=<%=searchCondition%>'">></button>
				<%} %>
			<%} %> 
			<button onclick="location.href='<%= request.getContextPath()%>/StockSearch.pr?currentPage=<%=maxPage%>&order=<%=order%>&searchText=<%=searchText%>&searchCondition=<%=searchCondition%>'">>></button>
		</div>
		<%} %>
	</section>
	<script type="text/javascript">
	$(function() {
		$(".tableArea td").mouseenter(function () {
			$(this).parent().css({"background":"lightyellow","cursor":"pointer"});
		}).mouseout(function() {
			$(this).parent().css("background","white");
		}).click(function() {
			var pcode = $(this).parent().children().eq(0).text();
			var pname = $(this).parent().children().eq(1).text();
			location.href="<%= request.getContextPath()%>/stockDetails.pr?pcode="+pcode+"&pname="+pname;
		});
	});
	</script>
	<%@ include file="/views/admin/common/footer.jsp" %>
</body>
</html>