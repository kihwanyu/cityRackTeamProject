<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String message = (String) request.getAttribute("message");
    %>
<!DOCTYPE html>
<html>
<head>
<meta "charset=UTF-8">
	<style type="text/css">
	body{
	font-family: 'Nanum Gothic', sans-serif !important;
	}
	</style>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<!-- 메뉴바 -->
	<%@ include file="/views/user/common/menubar_main.jsp" %>
	<!-- /메뉴바 -->
	
	<br><br>
	<h1 align="center" style="color:#FF720D;font-weight:bold;">SUCCESS!</h1><br><br>
	<h2 align="center"><%= message%></h2>
	
	
	<!-- 푸터 -->
	<%@ include file="/views/user/common/footer.jsp" %>
	<!--/ 푸터 -->
</body>
</html>