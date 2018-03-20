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


ArrayList<com.kh.cityrack.member.admin.model.dto.Member> list = (ArrayList<com.kh.cityrack.member.admin.model.dto.Member>)request.getAttribute("list");
int currentPage = Integer.parseInt((String)request.getAttribute("currentPage"));
int startPage = Integer.parseInt((String)request.getAttribute("startPage"));
int endPage = Integer.parseInt((String)request.getAttribute("endPage"));
int totalPage = Integer.parseInt((String)request.getAttribute("totalPage"));

Search search = null;
String searchWord = null;
String gender = null;
String searchCondition = null;
String searchText = null;
String beforeDate = null;
String afterDate = null;
String grade = null;
String status = null;

if(request.getAttribute("search") != null){
  search = (Search)request.getAttribute("search");
  gender = search.getGender();
  searchCondition = search.getSearchCondition();
  searchText = search.getSearchText();
  beforeDate = search.getBeforeDate();
  afterDate = search.getAfterDate();
  grade = search.getGrade();
  status = search.getStatus();

searchWord = "&gender=" + gender + "&searchCondition=" + searchCondition + "&searchText=" + searchText + "&beforeDate=" + beforeDate + "&afterDate=" + afterDate + "&grade=" + grade + "&status=" + status;  
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	@import url("views/admin/css/common.css");
	table {
		border: 1px solid black;
		text-align: center;
		border-collapse: collapse;
		
	}	
	#memberTable {
		width: 90%;
		height: 100px;
		margin-left: auto;
		margin-right: auto;
	}
	th, td {
		border: 1px solid black;
		padding: 10px;
		font-size: 10px;
	}
	th {
		background: lightgray;
	}
	.paging{
	  align:center;
	  margin-top:20px;
	  
	}
	.paging2{
	  align:center;
	  margin-top:20px;
	  
	}
</style>
<title>회원 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>
		<div align="center">
			<h2>회원 정보</h2><br>
			<form action="<%=request.getContextPath()%>/MemberSearch.me" method="get">
				<input type="radio" value="A" id="alㅣ" name="gender" checked="checked">
				<label for="all">전체</label>
				&nbsp;
				<input type="radio" value="M" id="gender" name="gender">
				<label for="male">남성</label>
				&nbsp;
				<input type="radio" value="F" id="gender" name="gender">
				<label for=" female">여성</label>
				&nbsp;&nbsp;
				<select id="searchCondition" name="searchCondition">
					<option value="email">이메일</option>
					<option value="name">이름</option>
					<option value="birthday">생년월일</option>
					<option value="grade">등급</option>
					<option value="enrollDate">가입일</option>
				</select>
				&nbsp;
				<input type="search" name="searchText" id="searchText">
				<span id="serachDate">
					<input type="date" name="beforeDate" id="beforeDate"> -
					<input type="date" name="afterDate" id="afterDate" > 
				</span>
				<select id="status" name="status" hidden="">
					<option value="Y">Y</option>
					<option value="N">N</option>
				</select>
				<select id="grade" name="grade" hidden="">
				    <option value="--">--</option>
					<option value="다이아몬드">다이아몬드</option>
					<option value="골드">골드</option>
					<option value="실버">실버</option>
					<option value="브론즈">브론즈</option>		
				</select>
				
				<input type="submit" value="검색">
			</form>
		</div>
		
		<br>
		<div align="center">
			<table id="memberTable" style="width: 40%">
				<tr>
					<th width="4%" style="text-align: center;">번호</th>
					<th width="5%" style="text-align: center;">등급</th>
					<th width="4%" style="text-align: center;">이름</th>
					<th width="2%" style="text-align: center;">성별</th>
					<th width="2%" style="text-align: center;">탈퇴여부</th>
					
				</tr>

			</table>	
		</div>	
	</section>
	
	<% if(search != null){ %>
	<div class="paging" align="center">
	  <button onclick="location.href='<%= request.getContextPath() %>/MemberSearch.me?currentPage=<%= 1%><%= searchWord%>'"><<</button>
	  
	  <% if(startPage == 1){%>
	  <button onclick="location.href='<%= request.getContextPath() %>/MemberSearch.me?currentPage=<%= startPage%><%= searchWord%>'"><</button>
	  <%}else{ %>
	  <button onclick="location.href='<%= request.getContextPath() %>/MemberSearch.me?currentPage=<%= startPage-10%><%= searchWord%>'"><</button>
	  <%} %>
	  
	  <%for(int p = startPage; p <= endPage; p++){ 
	  if(p == currentPage){ %>
		 <button disabled style="background:black; color:white"><%= p%></button>
	    <%}else{ %>
	  <button id="index"onclick="location.href='<%= request.getContextPath() %>/MemberSearch.me?currentPage=<%= p%><%= searchWord%>'"><%= p %></button>
	  <%}
	  }%>
	  
	  <!-- 현재 페이지가 끝페이지면 더이상 페이지 넘어가지 않게 처리 -->
	  <%if(currentPage != totalPage){ %>
	  <button onclick="location.href='<%= request.getContextPath() %>/MemberSearch.me?currentPage=<%= endPage+1%><%= searchWord%>'">></button>
	  <%}else{ %>
	  <button onclick="location.href='<%= request.getContextPath() %>/MemberSearch.me?currentPage=<%= endPage%><%= searchWord%>'">></button>
	  <%} %>
	  
	  <button onclick="location.href='<%= request.getContextPath() %>/MemberSearch.me?currentPage=<%= totalPage%><%= searchWord%>'">>></button>
	</div>
	
	
	<%}else{%>
	<div class="paging2" align="center">
	  <button onclick="location.href='<%= request.getContextPath() %>/MemberGetAll.me?currentPage=<%= 1%>'"><<</button>
	  <% if(startPage == 1){%>
	  <button onclick="location.href='<%= request.getContextPath() %>/MemberGetAll.me?currentPage=<%= startPage%>'"><</button>
	  <%}else{ %>
	  <button onclick="location.href='<%= request.getContextPath() %>/MemberGetAll.me?currentPage=<%= startPage-10%>'"><</button>
	  <%} %>
	  
	  <%for(int p = startPage; p <= endPage; p++){ 
	  if(p == currentPage){ %>
		 <button disabled style="background:black; color:white"><%= p%></button>
	  <%}else{%>
	  <button id="index"onclick="location.href='<%= request.getContextPath() %>/MemberGetAll.me?currentPage=<%= p%>'"><%= p %></button>
	  <%}
	  }%>
	  <button onclick="location.href='<%= request.getContextPath() %>/MemberGetAll.me?currentPage=<%= endPage+1%>'">></button>
	  <button onclick="location.href='<%= request.getContextPath() %>/MemberGetAll.me?currentPage=<%= totalPage%>'">>></button>
	</div>
	<%} %>
	
	
	<%@ include file="/views/admin/common/footer.jsp" %>
	<script type="text/javascript">
		
		
		$(function() {
		
			$('#searchCondition').change(function(){
				console.log('바뀜!');
			var selection = document.getElementById('searchCondition').value;
			if(selection=='email'){
				$('#searchText').val('');
				$('#grade').val('--');
				document.getElementById('searchText').style.display='inline';
				document.getElementById('serachDate').style.display='none';
				document.getElementById('status').style.display='none';
				document.getElementById('grade').style.display='none';
				
			} else if(selection=='name') {
				$('#searchText').val('');
				$('#grade').val('--');
				document.getElementById('searchText').style.display='inline';
				document.getElementById('serachDate').style.display='none';
				document.getElementById('status').style.display='none';
				document.getElementById('grade').style.display='none';
				
			} else if(selection=='birthday') {
				$('#searchText').val('');
				$('#grade').val('--');
				document.getElementById('searchText').style.display='none';
				document.getElementById('serachDate').style.display='inline';
				document.getElementById('status').style.display='none';
				document.getElementById('grade').style.display='none';
				
			} else if(selection=='status'){
				$('#searchText').val('');
				$('#grade').val('--');
				document.getElementById('searchText').style.display='none';
				document.getElementById('serachDate').style.display='none';
				document.getElementById('status').style.display='inline';
				document.getElementById('grade').style.display='none';
				
			} else if(selection=='grade'){
				$('#searchText').val('');
				$('#grade').val('--');
				document.getElementById('searchText').style.display='none';
				document.getElementById('serachDate').style.display='none';
				document.getElementById('status').style.display='none';
				document.getElementById('grade').style.display='inline';
			} else {
				$('#searchText').val('');
				$('#grade').val('--');
				document.getElementById('searchText').style.display='none';
				document.getElementById('serachDate').style.display='inline';
				document.getElementById('status').style.display='none';
				document.getElementById('grade').style.display='none';
			
			}
			});

		
		
			var $memberTable = $('#memberTable');
			document.getElementById('serachDate').style.display='none';
			
			<% for(com.kh.cityrack.member.admin.model.dto.Member me : list){%>
			  $tr = $('<tr>');
			  
			  $memberCode = $('<td>').text(<%= me.getM_no()%>);
			  $gradeName = $('<td>').text('<%= me.getC_name()%>');
			  $memberName = $('<td>').text('<%= me.getM_name()%>');
			  $memberGender = $('<td>').text('<%= me.getM_gender()%>');
			  $memberState = $('<td>').text('<%= me.getM_status()%>');
			  
			  $tr.append($memberCode);
			  $tr.append($gradeName);
			  $tr.append($memberName);
			  $tr.append($memberGender);
			  $tr.append($memberState);
			  
			  $memberTable.append($tr);
			  
			<%}%>
				
				$("#memberTable td").mouseenter(function () {
					$(this).parent().css({"background":"lightyellow","cursor":"pointer"});
					var num = $(this).val();
				}).mouseout(function() {
					$(this).parent().css("background","white");
				}).click(function() {
					var num = $(this).parent().children().eq(0).text();
					location.href="<%= request.getContextPath()%>/MemberGet.me?num=" + num;
				});
			
			
			
		});
		
		</script>
	</script>
</body>
</html>