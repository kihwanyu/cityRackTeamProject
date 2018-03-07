<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

<style>
	table{
		margin-left: auto;
		margin-right: auto;
		
	}
</style>

<title>Insert title here</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp"%>
	<h2 align="center">글작성</h2>
	<hr>
	<div class="tableArea"></div>
	<form action="<%= request.getContextPath()%>/BoardInsert.do" method="post" name="writeForm">
	<table width="500" border="3" bordercolor="lightgray" align="center">
	<tr>
		<td width="100" align="center">작성자</td>
		<td><input type="text" size="20" name="writer"></td>
	</tr>
	<tr>
		<td width="100" align="center">제목</td>
		<td><input type="text" size="50" name="title"></td>
	</tr>
	<tr>
		<td width="100" align="center">내용</td>
		<td><textarea rows="15" cols="50" name="content"></textarea></td>
	</tr>
	<tr>
		<td width="100" align="center">비밀번호</td>
		<td><input type="password" name="bo_password"></td>
	</tr>
	<tr>
		<td width="100" align="center">파일첨부</td>
		<td><input class="btn btn-success" type="button" value="파일선택"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input class="btn btn-success" type="submit" value="작성">
		<input class="btn btn-success" type="reset" value="취소">
		</td>
	</tr>
	</table>
	</form>
</body>
</html>