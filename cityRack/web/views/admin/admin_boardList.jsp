
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.cityrack.board.admin.model.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list"); %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<style>
</style>

<title>게시판 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp"%>
	<div class="container">
		<h2>문의 게시판</h2>
		<hr>
		<p></p>
		<table class="table table-striped">
			<thead>
				<tr>
					<th width="10">No</th>
					<th width="500">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회</th>
					<th>파일</th>
				</tr>
			</thead>
			<tbody>
					<%System.out.println(list); %>
				<% for(Board b : list){ %>
				<tr>
					<td><%= b.getBo_no() %></td>
					<td><%= b.getBo_title() %></td>
					<td><%= b.getM_email() %></td>
					<td><%= b.getBo_date() %></td>
					<td><%= b.getBo_hit() %></td>
					<td></td>
				</tr>
				<% } %>
			</tbody>
		</table>
		<table align="right">
			<tr>
				<td>
					<button id="write" class="btn btn-success"
						onclick="location.href='<%=request.getContextPath()%>/views/admin/admin_boardWriter.jsp'">글쓰기</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>