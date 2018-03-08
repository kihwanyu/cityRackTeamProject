<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.cityrack.member.admin.model.dto.*"%>
<% 
  ArrayList<Grade> list = (ArrayList<Grade>)request.getAttribute("list");
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
	
</style>
<title>등급 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>	
		<div class="tableArea" align="center">
			<h2>등급 정보</h2><br>
			<table id="gradeTable" style="width: 25%">
				<tr>
					<th width="30%" style="text-align: center;">코드</th>
					<th width="40%" style="text-align: center;">등급명</th>
					<th width="30%" style="text-align: center;">할인율(%)</th>
					
				</tr>
				

			</table>	
			<br>
			<div align="center">
				<button onclick="location.href='<%= request.getContextPath()%>/views/admin/admin_gradeInsertForm.jsp'">추가하기</button>
			</div>
		</div>
	</section>
	<%@ include file="/views/admin/common/footer.jsp" %>
	<script type="text/javascript">
		$(function() {
			var $gradeTable = $('#gradeTable');
			
			<% for(Grade g : list){%>
			  console.log(<%= g.getGradeCode()%>);
			  console.log('<%= (String)g.getGradeName()%>');
			  console.log(<%= g.getGradeDiscount()%>);
			
			  $tr = $('<tr>');
			  
			  $gradeCode = $('<td>').text(<%= g.getGradeCode()%>);  
			  $gradeName = $('<td>').text("<%= g.getGradeName()%>");
			  $gradeDiscount = $('<td>').text(<%= g.getGradeDiscount()%>);
			 
			  
			  $tr.append($gradeCode);
			  $tr.append($gradeName);
			  $tr.append($gradeDiscount);
			  
			  $gradeTable.append($tr);
			<%}%>
			    
				$(".tableArea td").mouseenter(function () {
					$(this).parent().css({"background":"lightyellow","cursor":"pointer"});
					var code = $(this).val();
				}).mouseout(function() {
					$(this).parent().css("background","white");
				}).click(function() {
					var num = $(this).parent().children().eq(0).text();
					location.href="<%= request.getContextPath()%>/GradeGet.me?num=" + num;
				});
			
			
		});
		
		</script>
</body>
</html>