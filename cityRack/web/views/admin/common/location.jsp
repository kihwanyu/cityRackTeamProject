<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String location = (String)request.getAttribute("location");
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%
		switch (location) {
		case "stockInsert":
			response.sendRedirect(request.getContextPath()+"/productGetAll.pr");
			break;
		
		default:
			break;
		}
	%>
<script type="text/javascript">
	$(function(){
		alert(<%=msg%>);
	});
</script>
</body>
</html>