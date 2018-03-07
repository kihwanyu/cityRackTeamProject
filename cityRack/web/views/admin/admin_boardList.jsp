	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
      <tr>
        <td>1</td>
        <td>문의-----</td>
        <td>관리자</td>
        <td>2018-03-03</td>
        <td>0</td>
        <td>N</td>
      </tr>
      <tr>
        <td>1</td>
        <td>문의-----</td>
        <td>관리자</td>
        <td>2018-03-03</td>
        <td>0</td>
        <td>N</td>
      </tr>
       <tr>
        <td>1</td>
        <td>문의-----</td>
        <td>관리자</td>
        <td>2018-03-03</td>
        <td>0</td>
        <td>N</td>
      </tr>
    </tbody>
  </table>
  <table align="right">
  	<tr>
  	<td>
  	<button id="write" class="btn btn-success" onclick="location.href='<%=request.getContextPath()%>/views/admin/admin_boardWriter.jsp'">글쓰기</button>
  	</td>
  	</tr>
  </table>
</div>
</body>
</html>