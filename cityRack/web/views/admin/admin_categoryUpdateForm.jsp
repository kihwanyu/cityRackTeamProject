<%@page import="com.kh.cityrack.product.admin.model.dto.Pcategory"%>
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

	Pcategory pc = new Pcategory();
	pc.setCa_code(request.getParameter("num"));
	pc.setCa_name(request.getParameter("name"));
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
	}
</style>
<title>상품 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>	
		<div class="tableArea" align="center">
			<h2>카테고리 수정</h2><br>
			<form action="<%=request.getContextPath() %>/PcategoryUpdate.pr" method="get">
				<table style="width: 30%">
					<tr>
						<td colspan="2">카테고리 추가</td>
					</tr>
					<tr>
						<td>카테고리 번호</td>
						<td>
							<input class="form-control" type="text" name="category_code" readonly="readonly" value="<%=pc.getCa_code()%>">
						</td>
					</tr>
					<tr>
						<td>카테고리명</td>
						<td>
							<input class="form-control" type="text" id="category_name" name="category_name" value="<%=pc.getCa_name()%>">
						</td>
					</tr>
				</table>
			</form>
			<div align="center" style="margin: 15px;">
				<button id="updateBtn">수정</button>&nbsp;
				<button id="deleteBtn">삭제</button>
			</div>
		</div>
		
	</section>
	<%@ include file="/views/admin/common/footer.jsp" %>
	<script type="text/javascript">
		$(function(){
			$('#updateBtn').click(function(){
				var pcodeName = $('#category_name').val();
				var str = <%=pc.getCa_code()%>+"번 을(를) 수정하시겠습니까?";
				var result = window.confirm(str);
				if(result==true){
					location.href='<%=request.getContextPath() %>/PcategoryUpdate.pr?category_code='+'<%=pc.getCa_code()%>'+'&category_name='+pcodeName;
				}
			});
				
			$('#deleteBtn').click(function(){
				var str = <%=pc.getCa_code()%>+"번 을(를) 삭제하시겠습니까?";
				var result = window.confirm(str);
				if(result==true){
					location.href='<%=request.getContextPath()%>/categoryDelete.pr?cano=<%=pc.getCa_code()%>';
				}
			});
		});
		
		
	</script>
</body>
</html>