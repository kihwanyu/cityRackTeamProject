<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.cityrack.member.admin.model.dto.*"%>
<%
if((com.kh.cityrack.member.common.model.dto.Member)session.getAttribute("loginUser")!=null){
	  com.kh.cityrack.member.common.model.dto.Member me = (com.kh.cityrack.member.common.model.dto.Member)session.getAttribute("loginUser");
	  if(!(me.getC_name().equals("관리자"))){
		 RequestDispatcher view = request.getRequestDispatcher("/views/common/errorPage.jsp");
		 request.setAttribute("msg", "잘못된 요청입니다.");
		 view.forward(request, response);
	  }
	}else{
		System.out.println("bye");
		RequestDispatcher view = request.getRequestDispatcher("/views/common/errorPage.jsp");
		  request.setAttribute("msg", "잘못된 요청입니다.");
		  view.forward(request, response);
	}
ArrayList<Withdraw> list = (ArrayList<Withdraw>)request.getAttribute("list");
int currentPage = Integer.parseInt((String)request.getAttribute("currentPage"));
int startPage = Integer.parseInt((String)request.getAttribute("startPage"));
int endPage = Integer.parseInt((String)request.getAttribute("endPage"));
int totalPage = Integer.parseInt((String)request.getAttribute("totalPage"));

Search search = null;
String searchWord = null;

if(request.getAttribute("search") != null){
search = (Search)request.getAttribute("search");
String searchCondition = search.getSearchCondition();
String searchText = search.getSearchText();
String beforeDate = search.getBeforeDate();
String afterDate = search.getAfterDate();

searchWord = "&searchCondition=" + searchCondition + "&searchText=" + searchText + "&beforeDate=" + beforeDate + "&afterDate=" + afterDate;
}
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
	}
	th {
		background: lightgray;
	}
</style>
<title>회원 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>	
		<div align="center">
			<h2>회원 탈퇴 정보</h2><br>
			<form action="<%=request.getContextPath()%>/WithdrawMemberSearch.me" method="get">
				<select id="searchCondition" name="searchCondition" onchange="selectSearch();">
					<option value="email">이메일</option>
					<option value="withdrawDate">탈퇴 날짜</option>
				</select>
				&nbsp;
				<input type="search" name="searchText" id="searchText">
				<span id="serachDate" hidden="">
					<input type="date" name="beforeDate" id="beforeDate"> -
					<input type="date" name="afterDate" id="afterDate" > 
				</span>
				&nbsp;
				<input type="submit" value="검색">
			</form>
		</div>
		<br>
		<div class="tableArea" align="center">
			<table id="withdrawMemberTable" style="width: 40%">
				<tr>
					<th width="10%" style="text-align: center;">번호</th>
					<th width="10%" style="text-align: center;">이름</th>
					<th width="20%" style="text-align: center;">탈퇴날짜</th>
					<th width="40%" style="text-align: center;">탈퇴사유</th>
				</tr>
				
			</table>	
			
		</div>
		
		<% if(search != null){ %>
	
	
	<div class="paging" align="center">
	  <button onclick="location.href='<%= request.getContextPath() %>/WithdrawMemberSearch.me?currentPage=<%= 1%><%= searchWord%>'"><<</button>
	  
	  <% if(startPage == 1){%>
	  <button onclick="location.href='<%= request.getContextPath() %>/WithdrawMemberSearch.me?currentPage=<%= startPage%><%= searchWord%>'"><</button>
	  <%}else{ %>
	  <button onclick="location.href='<%= request.getContextPath() %>/WithdrawMemberSearch.me?currentPage=<%= startPage-10%><%= searchWord%>'"><</button>
	  <%} %>
	  
	  <%for(int p = startPage; p <= endPage; p++){ 
	  if(p == currentPage){ %>
		 <button disabled style="background:black; color:white"><%= p%></button>
	    <%}else{ %>
	  <button id="index"onclick="location.href='<%= request.getContextPath() %>/WithdrawMemberSearch.me?currentPage=<%= p%><%= searchWord%>'"><%= p %></button>
	  <%}
	  }%>
	  
	  <!-- 현재 페이지가 끝페이지면 더이상 페이지 넘어가지 않게 처리 -->
	  <%if(currentPage != totalPage){ %>
	  <button onclick="location.href='<%= request.getContextPath() %>/WithdrawMemberSearch.me?currentPage=<%= endPage+1%><%= searchWord%>'">></button>
	  <%}else{ %>
	  <button onclick="location.href='<%= request.getContextPath() %>/WithdrawMemberSearch.me?currentPage=<%= endPage%><%= searchWord%>'">></button>
	  <%} %>
	  
	  <button onclick="location.href='<%= request.getContextPath() %>/WithdrawMemberSearch.me?currentPage=<%= totalPage%><%= searchWord%>'">>></button>
	</div>
	
	
	<%}else{%>
	<div class="paging2" align="center">
	  <button onclick="location.href='<%= request.getContextPath() %>/WithdrawMemberGetAll.me?currentPage=<%= 1%>'"><<</button>
	  <% if(startPage == 1){%>
	  <button onclick="location.href='<%= request.getContextPath() %>/WithdrawMemberGetAll.me?currentPage=<%= startPage%>'"><</button>
	  <%}else{ %>
	  <button onclick="location.href='<%= request.getContextPath() %>/WithdrawMemberGetAll.me?currentPage=<%= startPage-10%>'"><</button>
	  <%} %>
	  
	  <%for(int p = startPage; p <= endPage; p++){ 
	  if(p == currentPage){ %>
		 <button disabled style="background:black; color:white"><%= p%></button>
	  <%}else{%>
	  <button id="index"onclick="location.href='<%= request.getContextPath() %>/WithdrawMemberGetAll.me?currentPage=<%= p%>'"><%= p %></button>
	  <%}
	  }%>
	  <button onclick="location.href='<%= request.getContextPath() %>/WithdrawMemberGetAll.me?currentPage=<%= endPage+1%>'">></button>
	  <button onclick="location.href='<%= request.getContextPath() %>/WithdrawMemberGetAll.me?currentPage=<%= totalPage%>'">>></button>
	</div>
	<%} %>
	
	</section>
	<%@ include file="/views/admin/common/footer.jsp" %>
	<script type="text/javascript">
		function selectSearch() {
			var selection = document.getElementById('searchCondition').value;
			console.log(selection);
			if(selection=='email'){
				document.getElementById('searchText').style.display='inline';
				document.getElementById('serachDate').style.display='none';
			} else {
				document.getElementById('searchText').style.display='none';
				document.getElementById('serachDate').style.display='inline';
			} 
		}
		
		$(function(){
			var $withdrawMemberTable = $('#withdrawMemberTable');
		
			
			<% for(Withdraw w : list){%>
			  $tr = $('<tr>');
			  
			  $memberCode = $('<td>').text(<%=w.getMemberCode()%>);
			  $memberName = $('<td>').text('<%=w.getMemberName()%>');
			  $withdrawDate = $('<td>').text('<%=w.getWithdrawDate()%>');
			  $withdrawReason = $('<td>').text('<%=w.getWithdrawReason()%>');
			  
			  $tr.append($memberCode);
			  $tr.append($memberName);
			  $tr.append($withdrawDate);
			  $tr.append($withdrawReason);
			  
			  $withdrawMemberTable.append($tr);
			  
			<%}%>
			
		});
		
	</script>
</body>
</html>