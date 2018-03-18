<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.cityrack.member.admin.model.dto.*"%>
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
Grade g = (Grade)request.getAttribute("g"); 
%>    
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
    @import url("views/admin/css/common.css");
	table {
		border: 1px solid black;
		border-collapse: collapse;
		
	}	
	.tableArea {
		width: 100%;
		height: 200px;
		margin-left: auto;
		margin-right: auto;
	}
	th, td {
		border: 1px solid black;
		padding: 10px;
		font-size: 12px;
		text-align:center;
 	}
 	th {
		background: lightgray;
	}
	
</style>
</head>
<body>
  <%@ include file="/views/admin/common/header.jsp" %>
    <form action="<%= request.getContextPath() %>/GradeUpdate.me" method="get">
    <div class="tableArea" align="center">
      <input type="hidden" name="gradeCode" value="<%= g.getGradeCode()%>">
      <input type="hidden" name="originGradeName" value="<%= g.getGradeName() %>">
	  <table style="width: 40%;">
		<tr>
		  <td colspan="6" style="background: lightyellow"><h2><%= g.getGradeCode() %></h2></td>
		</tr>
		<tr>
		  <th colspan="3">등급명</th>
		  <th colspan="3">할인률(%)</th>
		</tr>
		<tr>
		  <td colspan="3"><input type="text" name="gradeName" placeholder="<%= g.getGradeName() %>"></td>
		  <td colspan="3">
		    <select name="gradeDiscount">
				<option value="5">5%</option>
				<option value="10">10%</option>
				<option value="15">15%</option>
			    <option value="20">20%</option>
				<option value="25">25%</option>
				<option value="30">30%</option>
				<option value="35">35%</option>
				<option value="40">40%</option>
				<option value="45">45%</option>
				<option value="50">50%</option>
							 
			</select>
		  </td>
		</tr>
	  </table>
	</div>
	<div style="float:left; padding-left:780px; padding-right:10px;">
	  <input type="submit" class="btn btn-default" value="수정하기">
	</div>
	
	</form>
	<div>
	  <button class="btn btn-default" data-toggle="modal" data-target="#myModal" display="inline-block">삭제하기</button>
	</div>  
	    <div id="myModal" class="modal fade" role="dialog">
          <div class="modal-dialog modal-sm">

            <!-- Modal content-->
           <div class="modal-content">
            <div class="modal-header" align="center">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">정말 삭제하시겠습니까?</h4>
            </div>
            <div class="modal-body" align="center">
              <button onclick="gradeDelete();" class="btn btn-default" data-dismiss="modal">&nbsp;&nbsp;&nbsp;예&nbsp;&nbsp;&nbsp;</button>
              <button class="btn btn-default" data-dismiss="modal">아니오</button>
            </div>
            
           </div>

           </div>
    </div>
    <script>
      function gradeDelete(){
    	  location.href="<%= request.getContextPath()%>/GradeDelete.me?num=" + <%= g.getGradeCode()%>;
      } 
    </script>
</body>
  <%@ include file="/views/admin/common/footer.jsp" %>
</html>