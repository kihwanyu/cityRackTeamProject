<%@page import="com.kh.cityrack.board.user.model.dto.PageInfo"%>
<%@page import="com.kh.cityrack.board.user.model.dto.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>cityRack_myPage_QnA</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="views/user/jeong/css/bootstrap.min.css" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="views/user/jeong/css/slick.css" />
	<link type="text/css" rel="stylesheet" href="views/user/jeong/css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="views/user/jeong/css/nouislider.min.css" />

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="views/user/jeong/css/font-awesome.min.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="views/user/jeong/css/style.css" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>

<body>
		<!-- 마이페이지용 메뉴바 -->
	<%@ include file="/views/user/common/menubar_myPage.jsp" %>




	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				
				<form id="checkout-form" class="clearfix">

					<div class="section-title">
						<h3 class="title">체질 Q & A</h3>
					</div>
							
					<div class="col-md-q" align="center">
						<img src="./img/q.png" alt="" width="15%">
						<a href="#"><b>목양체질</b></a> / 
						<a href="#"><b>목음체질</b></a> / 
						<a href="#"><b>토양체질</b></a> / 
						<a href="#"><b>토음체질</b></a> / 
						<a href="#"><b>금양체질</b></a> / 
						<a href="#"><b>금음체질</b></a> / 
						<a href="#"><b>수양체질</b></a> / 
						<a href="#"><b>수음체질</b></a>
					</div>	
					<br/>
					<br/>
					<br/>
					<div class="col-md-qq">
						<div class="order-summary clearfix">
							<table class="question-table table">
								<thead>
									<tr>
										<th class="text-center">번호</th>
										<th colspan="2">제목</th>
										<th class="text-center">작성자</th>
										<th class="text-center">작성일</th>
										<th class="text-center">답변상태</th>
									</tr>
								</thead>
								<tbody>
									<% System.out.println(list); %>
									<% for(Board b : list){ %>
									<tr>
										<td align="center"><%=b.getBo_no() %></td>
										<td class="details" colspan="2">
											<a href="#"><%=b.getBo_title() %></a>
										</td>
										<td class="price text-center"><%=b.getM_name() %></td>
										<td align="center"><%=b.getBo_date() %></td>
										<td align="center"><%=b.getBo_status() %></td>
										<td class="text-right"></td>
									</tr>
									<% } %>
									<tr>
										<td align="center">2</td>
										<td class="details" colspan="2">
											<a href="#">토음체질과 수음체질이 함께 먹으면 좋은 반찬 추천해주세요~</a>
										</td>
										<td class="price text-center">city****@naver.com</td>
										<td align="center">2018/02/18</td>
										<td align="center">답변대기</td>
										<td class="text-right"></td>
									</tr>
																											
								</tbody>
							</table>
						</div>
					</div>
				</form>
				<%-- 페이지 처리 --%>
		 <div class="pagingArea" align="center">
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=1'"><<</button>
			<% if(currentPage <= 1){ %>
			<button disabled><</button>
			<% }else{ %>
			<button onclick="location.href='<%=request.getContextPath() %>/selectList.bo?currentPage=<%= currentPage -1 %>'"><</button>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
			%>
						<button disabled><%= p %></button>
			<%      }else{ %>
						<button onclick="location.href='<%=request.getContextPath() %>/selectList.bo?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
			<% } %>
			
			<% if(currentPage >= maxPage){ %>
			<button disabled>></button>
			<% }else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectList.bo?currentPage=<%=currentPage + 1%>'">></button>
			<% } %>
			<button onclick="location.href='<%=request.getContextPath() %>/selectList.bo?curruntPage=<%=maxPage%>'">>></button>
		</div>
				<br/>
				
				<!-- Search -->
				<div class="question-search" align="center">
					<form>
						<input class="input search-input" type="text" placeholder="키워드를 입력하세요" size="60px">
						<select class="input search-categories">
							<option value="0">제목</option>
							<option value="1">제목+내용</option>
						</select>
						<button class="search-btn"><i class="fa fa-search"></i></button>
					</form>
				</div>
				<!-- /Search -->
				<br/>
				<br/>
				<div align="right">
					<button onclick="location.href='views/user/jeong/myPage_question.jsp'" class="primary-btn">질문하기</button>
					<button onclick="history(); return false;" class="primary-btn">내 질문내역</button>
				</div>
				
				<script>
				
					function qu(){
						location.href="myPage_question.jsp";
					}
					
					function history(){
						location.href="myPage_question_history.jsp";
					}
				
				</script>
				
				<br/>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->



	<!-- 푸터용 메뉴바 -->
	<%@ include file="footer.jsp" %>

	<!-- jQuery Plugins -->
	<script src="views/user/jeong/js/jquery.min.js"></script>
	<script src="views/user/jeong/js/bootstrap.min.js"></script>
	<script src="views/user/jeong/js/slick.min.js"></script>
	<script src="views/user/jeong/js/nouislider.min.js"></script>
	<script src="views/user/jeong/js/jquery.zoom.min.js"></script>
	<script src="views/user/jeong/js/main.js"></script>
</body>

</html>
