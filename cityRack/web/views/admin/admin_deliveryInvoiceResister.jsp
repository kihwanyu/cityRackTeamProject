<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if((com.kh.cityrack.member.common.model.dto.Member)session.getAttribute("loginUser")!=null){
	  com.kh.cityrack.member.common.model.dto.Member me = (com.kh.cityrack.member.common.model.dto.Member)session.getAttribute("loginUser");
	  if(!(me.getC_name().equals("관리자"))){
		 RequestDispatcher view = request.getRequestDispatcher("/views/common/errorPage.jsp");
		 request.setAttribute("msg", "잘못된 요청입니다.");
		 view.forward(request, response);
	  }
	}else{
		System.out.println("bye");
		RequestDispatcher view = request.getRequestDispatcher("/views/common/errorPage.jsp");
		  request.setAttribute("msg", "잘못된 요청입니다.");
		  view.forward(request, response);
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	* {
		font-family: 'Nanum Gothic', serif;
		font-size: 15px;
		font-weight: bold;
	}
	header {
		margin-top: 20px;
	}
	footer{
		padding-bottom : 100px;
		background : black;
		color: white;
	}
	#menubar {
		margin-top : 20px;
		text-align: center;
	}
	#logo {
		height: 100%;
	}
	.menuNav {
		padding: 10px;
		text-align: center;
		margin-left: 20px;
		margin-right: 20px;
	}
	.home {
		background: gray; 
		border-top-left-radius:1em; 
		border-top-right-radius:1em; 
		border-bottom-right-radius:1em; 
		border-bottom-left-radius:1em;
	}
	.searchArea {
		width: 30%;
		height: 300px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 100px;
		margin-bottom: 100px;
		vertical-align: middle;
		border: 2px solid gray;
	}
	h2 {
		margin-left: auto;
		margin-right: auto;
		margin-top: 30px;
	}
	.searchForm {
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 50px;
		margin-top: 50px;
	}
	.searchText{
		margin-left: auto;
		margin-right: auto;
		width: 290px;
		margin-top: -30px;
		margin-bottom: 20px;
	}
	.invoiceNoTest{
		margin-left: auto;
		margin-right: auto;
		width: 290px;
		margin-bottom: 20px;
	}
</style>
<title>배송 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>
		<div class="searchArea" align="center">
				<h2>운송장 번호 등록</h2>
				<div class="searchForm">
					<form action="<%= request.getContextPath()%>/DeliveryUpdate.me" method="get" >
						<div class="searchText">
							<label for="searchTest">주문번호 : </label>
							<input type="search" class="form-control" id="searchTest" name="orderCode" id="orderCode">
						</div>
						<div class="invoiceNoTest">
							<label for="searchTest">운송장 번호 : </label>
							<input type="search" class="form-control" id="invoiceNoTest" name="invoice" id="invoice">
						</div>
						
						<input type="submit" class="btn btn-primary active" value="등록" >
					</form>
				</div>				
		</div>
	</section>
	<%@ include file="/views/admin/common/footer.jsp" %>
</body>
</html>