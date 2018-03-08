<%@page import="com.kh.cityrack.board.admin.model.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% Board b = (Board)request.getAttribute("b"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#tableArea{
		border:2px solid black;
		border-color: lightgray;
	}
</style>
</head>
<!-- 1리스트 값 가져오기 -->

<body>
	<div align="center">
	<table>
		<tr>
			<td>
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td align="center">내용</td>
					</tr>
				</table>
				<table id="tableArea" class="table table-striped" width="400">
					<tr>
						<td width="0"></td>
						<td align="center" width="76">글번호</td>
						<td width="319"></td>
						<td width="0"></td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0"></td>
						<td align="center" width="76">조회수</td>
						<td width="319"></td>
						<td width="0"></td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0"></td>
						<td align="center" width="76">추천수</td>
						<td width="319"></td>
						<td width="0"></td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0"></td>
						<td align="center" width="76">이름</td>
						<td width="319"></td>
						<td width="0"></td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0"></td>
						<td align="center" width="76">작성일</td>
						<td width="319">2018-03-01</td>
						<td width="0"></td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0"></td>
						<td align="center" width="76">제목</td>
						<td width="319">안녕하세요</td>
						<td width="0"></td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0"></td>
						<td width="399" colspan="2" height="400">asdfasfsdfasdfsd</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="4" width="407"></td>
					</tr>
					<tr align="center">
						<td width="0"></td>
						<td colspan="2" width="399">
							<input type=button value="글쓰기">
							<input type=button value="답글">
						    <input type=button value="목록">
						    <input type=button value="수정">
						    <input type=button value="삭제">
						<td width="0"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</div>
</body>




</html>