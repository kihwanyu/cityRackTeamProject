<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String msg = (String) request.getAttribute("msg");
    %>
<!DOCTYPE html>
<html>
<head>
<meta "charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<H2>성공이다 가즈아~</H2>
	<H2><%= msg%></H2>
</body>
</html>