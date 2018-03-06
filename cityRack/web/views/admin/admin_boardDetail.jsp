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
.outer {
	width: 1000px;
	height: 500px;
	background: white;
	color: black;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
	border: 1px;
}

table {
	
	margin-left: auto;
	margin-right: auto;
}

#content {
	margin-left: auto;
	margin-right: auto;
}

  textarea{
    resize:none;
    color:black;
}

</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp"%>
	<div>
		<h2>문의게시판</h2>
		<hr>
	</div>

	<div class="outer">
		<table border="2">
			<tr>
				<th>제목</th>
				<td width="400" align="left">문의문의문의<td>
				<th colspan="2">작성일</th>
				<td colspan="2">2018-03-01</td>
				

			</tr>
			<tr>
				<td>작성자</td>
				<td align="left">이훈택</td>
				<td>조회수</td>
				<td>34</td>
				<td>추천수</td>
				<td colspan="2">5</td>
				
				
			</tr>
			<tr>
				<td colspan=>내용</td>
				<td colspan="7">3월 01, 2018 5:13:54 오후 org.apache.coyote.AbstractProtocol start
정보: Starting ProtocolHandler ["http-nio-8003"]
3월 01, 2018 5:13:54 오후 org.apache.coyote.AbstractProtocol start
정보: Starting ProtocolHandler ["ajp-nio-8009"]
3월 01, 2018 5:13:54 오후 org.apache.catalina.startup.Catalina star<td>
				
				
			</tr>
			<tr>
				
				<td align="right" colspan="7"><input type="button" value="목록보기"></td>
				
			</tr>
			<tr>
				<td colspan="6"><textarea cols="120" rows="15">: 답변공간---------------------------</textarea></td>
				<td colspan="2"><input type="submit" value="답변하기"></td>
			</tr>
		</table>
		
	</div>
</body>
</html>