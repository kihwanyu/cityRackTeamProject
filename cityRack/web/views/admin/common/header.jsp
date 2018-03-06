<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header>
	<div>	
		<div id="logout" align="right">
			<img alt="" src="../logo.jpg" style="" align="left">
			관리자님 환영합니다.&nbsp;
			<a href="#" class="btn btn-default" role="button"><i class="fas fa-sign-out-alt"></i>&nbsp;로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</div>
</header>
<div align="center">
<nav class="navbar navbar-inverse" id="menubar" style="width: 99%">
	<ul class="nav navbar-nav">
		<li class="menuNav"><a href="<%=request.getContextPath() %>/index.jsp" class="home" style="color: white;">HOME</a></li>
		<li class="menuNav">
       		<a class="dropdown-toggle" data-toggle="dropdown" href="#">회원 관리
        	<span class="caret"></span></a>
	        <ul class="dropdown-menu">
	          <li><a href="<%=request.getContextPath() %>/views/admin/admin_memberList.jsp">회원 정보</a></li>
	          <li><a href="<%=request.getContextPath() %>/views/admin/admin_gradeList.jsp">등급 정보</a></li>
	          <li><a href="<%=request.getContextPath() %>/views/admin/admin_memberWithdrawList.jsp">회원 탈퇴 정보</a></li>
	        </ul>
      	</li>
		<li class="menuNav">
       		<a class="dropdown-toggle" data-toggle="dropdown" href="#">상품 관리
        	<span class="caret"></span></a>
	        <ul class="dropdown-menu">
		        <li><a href="<%=request.getContextPath() %>/views/admin/admin_productList.jsp">상품 정보</a></li>
		        <li><a href="<%=request.getContextPath() %>/views/admin/admin_categoryList.jsp">카테고리 정보</a></li>
	        </ul>
      	</li>
		<li class="menuNav"><a href="<%=request.getContextPath() %>/views/admin/admin_stockList.jsp">재고 관리</a></li>
		<li class="menuNav"><a href="<%=request.getContextPath() %>/views/admin/admin_orderList.jsp">주문 관리</a></li>
		<li class="menuNav">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">배송 관리
        	<span class="caret"></span></a>
	        <ul class="dropdown-menu">
		        <li><a href="<%=request.getContextPath() %>/views/admin/admin_deliverySearch.jsp">배송 정보 검색</a></li>
		        <li><a href="<%=request.getContextPath() %>/views/admin/admin_deliveryInvocenoResister.jsp">운송장 번호 등록</a></li>
	        </ul>
      	</li>
		<li class="menuNav"><a href="<%=request.getContextPath() %>/views/admin/admin_paymentSearch.jsp">결제 관리</a></li>
		<li class="menuNav"><a href="<%=request.getContextPath() %>/views/admin/admin_boardList.jsp">게시판 관리</a></li>		
	</ul>
</nav>
</div>