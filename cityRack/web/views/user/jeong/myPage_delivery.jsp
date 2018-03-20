<%@page import="com.kh.cityrack.product.admin.model.dto.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.cityrack.order.user.model.dto.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    ArrayList<Order> oList = (ArrayList<Order>)request.getAttribute("oList");
  
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int limit = pi.getLimit();
	
	int j = 0;
	String invoice[] = new String[30];
	for(Order o : oList){
		invoice[j++] = o.getInvoice_no();
	}
	
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<title>cityRack_myPage_delivery</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/views/user/jeong/css/bootstrap.min.css" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/views/user/jeong/css/slick.css" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/views/user/jeong/css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/views/user/jeong/css/nouislider.min.css" />

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/views/user/jeong/css/font-awesome.min.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/views/user/jeong/css/style.css" />

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
	
					<div class="col-md-12">
						<div class="order-summary clearfix">
							<div class="section-title">
								<h3 class="title">주문배송조회</h3>
							</div>
							<table class="shopping-cart-table table">
								<thead>
									<tr>
										<th class="text-center">주문번호</th>
										<th class="text-center">주문일자</th>
										<th class="text-center">상품</th>
										<th class="text-center">결제금액</th>
										<th class="text-center">배송상태</th>
										<th class="text-center">배송조회</th>
									</tr>
								</thead>
								<tbody>
									<%for(int i = 0; i < oList.size(); i++){ %>
									<tr>
										<td><a href="#"><%=oList.get(i).getO_ono() %></a></td>
										<td class="price text-center"><%=oList.get(i).getO_orderDate() %></td>
										<td class="details">
											<%if(oList.get(i).getpCount() > 0){ %>
											<a href="#"><%=oList.get(i).getP_name() %> 외 <%=oList.get(i).getpCount()-1 %></a>
											<%} else { %>
											<a href="#"><%=oList.get(i).getP_name() %></a>
											<%} %>
										</td>
										<td class="price text-center"><strong><%=oList.get(i).getPa_amount() %></strong></td>
										<td class="price text-center"><%=oList.get(i).getO_state() %></td>
										<td align="center"><button type="button" class="delivery" value="<%= i%>"onclick="delivery();" >배송조회</button></td>
										<td class="text-right" ><input type="hidden" name="invoice_no" value="<%=oList.get(i).getInvoice_no()%>"></td>
									</tr>
									<%} %>
									
								</tbody>
							</table>
							
						</div>
					</div>
				</form>
				<% 
					double backNextPageVal = (double)currentPage/limit;
					int backNextpage = ((int)(backNextPageVal-0.9))*limit+1;
					
					double forwardNextPageVal = (double)currentPage/limit;
					int forwardNextpage = ((int)(forwardNextPageVal+0.9))*limit+1;
				/* (((int)((double)currentPage/limit))+0.9)*5-1;  */	
				%>
				<!-- <h3>검색 안한 페이징</h3> -->
				<div class="pagingArea" align="center">
					<button onclick="location.href='<%= request.getContextPath()%>/userOrderGetAll.or?currentPage=1'"><<</button>
					<%if(currentPage <= 1) { %>
					<button><</button>
					<%} else { 
						if(backNextpage < 1) {%>
							<button onclick="location.href='<%= request.getContextPath()%>/userOrderGetAll.or?currentPage=1'"><</button>
					<% 	} else {%>
					
							<button onclick="location.href='<%= request.getContextPath()%>/userOrderGetAll.or?currentPage=<%=backNextpage%>'"><</button>
					<%	} %>
					<%} %>
					<%for(int p = startPage; p <= endPage; p++){ 
						if(p == currentPage){
					%>
						<button disabled="disabled"><%=p %></button>
					<%	} else { %>
						<button onclick="location.href='<%= request.getContextPath()%>/userOrderGetAll.or?currentPage=<%=p %>'"><%=p %></button>
					<%	} %>	
					<%} %>
					<%if(currentPage >= maxPage){ %>
					<button disabled="disabled">></button>	
					<%} else { 
						if(forwardNextpage > maxPage) {%>
						<button onclick="location.href='<%= request.getContextPath()%>/userOrderGetAll.or?currentPage=<%= maxPage%>'">></button>
						<% } else { %>
						<button onclick="location.href='<%= request.getContextPath()%>/userOrderGetAll.or?currentPage=<%= forwardNextpage%>'">></button>
						<%} %>
					<%} %> 
					<button onclick="location.href='<%= request.getContextPath()%>/userOrderGetAll.or?currentPage=<%=maxPage%>'">>></button>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->


<!-- 푸터 -->
	<%@ include file="/views/user/common/footer.jsp" %>
	
	<!--/ 푸터 -->

	<!-- jQuery Plugins -->
	<script src="<%=request.getContextPath() %>/views/user/jeong/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/views/user/jeong/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/views/user/jeong/views/user/jeong/js/slick.min.js"></script>
	<script src="<%=request.getContextPath() %>/views/user/jeong/js/nouislider.min.js"></script>
	<script src="<%=request.getContextPath() %>/views/user/jeong/js/jquery.zoom.min.js"></script>
	<script src="<%=request.getContextPath() %>/views/user/jeong/js/main.js"></script>
</body>
<script>
									function delivery(){
									var no = $('.delivery').attr('value');
									
								    $.ajax({
								    url:"<%=request.getContextPath()%>/UserDeliveryStatus.me",
									data:{"no":no},
									type:"get",
									success:function(data){
										
										location.href="javascript:void(window.open('views/common/testViews.jsp?invoice=" + data + "','_blank','width=750, height=900'))";
											
										
									},
									error:function(data){
										console.log("서버 전송 실패..");
									},
								  });
								}
										 
								    <%-- location.href="javascript:void(window.open('views/common/testViews.jsp?invoice=<%=invoice%>', '_blank','width=750, height=900'))";
										  $('.delivery').on('click', (e) => {
												  no = e.target.value;
												  location.href='<%=request.getContextPath()%>'  + "/userOrdersGetAllServlet.me?no=" + no + "&currentPage=" + 1;
												  
											 }) --%>
										   
												  
										</script>

</html>
