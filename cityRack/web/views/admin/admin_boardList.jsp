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
	.category{
		width:10%;
		border: 1px solid #4CAF50;
	}
	.category td{
		border: 1px solid black;
	}
	
	.outer{
		
		
		border: 1px solid black;
	}
	.top{
		background: black;
		color: gray;
	}
	
   table {
      border:1px solid black;
      text-align:center;
      color:white;
      
   }
   table td{
   	text-align:center;
   }
   #board {
      width:900px;
      height:500px;
      background:black;
      color:white;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
   }
   #writer{
   	
   }
</style>
<title>게시판 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp"%>
	<section>
		
		
		<div class="top">
			<br>
			<h2>문의게시판</h2>
		</div>
		<div class="searchArea" align="center">
         <select id="searchCondition" name="searchCondition">
            <option>-----</option>
            <option value="">제목</option>
            <option value="">작성자</option>
            
         </select>
         <input type="search" name="searchValue">
         <button type="button">검색하기</button>
        
      </div>
		<div id="board" align="center">
			<table>
				<tr>
					<th width="50px">no</th>
					<th width="400px">제목</th>
					<th width="50px">작성자</th>
					<th width="100px">작성일</th>
					<th width="50px">조회수</th>
					<th width="50px">추천수</th>
					<th width="70px">삭제여부</th>
					<th width="70px">첨부파일</th>
				</tr>
				<tr>
					<td>1</td>
					<td>문의드립니다.</td>
					<td>이훈택</td>
					<td>2018-03-01</td>
					<td>5</td>
					<td>3</td>
					<td>
					<input type="button" value="삭제">
					</td>
					<td>Y</td>
					
				</tr>
				<tr>
					<td>1</td>
					<td>문의드립니다.</td>
					<td>이훈택</td>
					<td>2018-03-01</td>
					<td>5</td>
					<td>3</td>
					<td>
					<input type="button" value="삭제">
					</td>
					<td>Y</td>
					
				</tr>
				<tr>
					<td>1</td>
					<td>문의드립니다.</td>
					<td>이훈택</td>
					<td>2018-03-01</td>
					<td>5</td>
					<td>3</td>
					<td>
					<input type="button" value="삭제">
					</td>
					<td>Y</td>
					
				</tr>
			</table>
			<input id="writer" type="button" value="글쓰기" >
		</div>
		</div>
	</section>






</body>
</html>