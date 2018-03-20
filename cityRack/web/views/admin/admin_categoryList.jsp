<%@page import="com.kh.cityrack.product.admin.model.dto.Pcategory"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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

	ArrayList<Pcategory> cList = (ArrayList<Pcategory>)request.getAttribute("cList");
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
<title>상품 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>	
		<div class="tableArea" align="center">
			<h2>카테고리 정보</h2><br>
			<table style="width: 30%">
				<tr>
					<th width="10%" style="text-align: center;">코드</th>
					<th width="30%" style="text-align: center;">카테고리명</th>
				</tr>
				<%for(int i = 0; i < cList.size(); i++){ %>
				<tr>
					<td style="text-align: right;"><%=cList.get(i).getCa_code() %></td>
					<td style="text-align: left;"><%=cList.get(i).getCa_name() %></td>
				</tr>
				<%} %>
			</table>	
			<br>
			<div align="center">
				<button onclick="location.href='<%= request.getContextPath()%>/views/admin/admin_categoryInsertForm.jsp'">추가하기</button>
			</div>
		</div>
	</section>
	<%@ include file="/views/admin/common/footer.jsp" %>
	<script type="text/javascript">
		$(function() {
			$(".tableArea td").mouseenter(function () {
				$(this).parent().css({"background":"lightyellow","cursor":"pointer"});
			}).mouseout(function() {
				$(this).parent().css("background","white");
			}).click(function() {
				var num = $(this).parent().children().eq(0).text();
				var name = $(this).parent().children().eq(1).text();
				location.href="<%= request.getContextPath()%>/views/admin/admin_categoryUpdateForm.jsp?num="+num+"&name="+name;
			});
		});
		function dropOut(){
			var result = window.confirm("관리자등급을 삭제하시겠습니까?");
			if(result==true){
				
			} else {
				
			}
		}
		</script>
</body>
</html>