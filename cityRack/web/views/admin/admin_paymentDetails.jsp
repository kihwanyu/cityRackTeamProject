<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.cityrack.member.admin.model.dto.Payment"%>
<%
    if((com.kh.cityrack.member.common.model.dto.Member)session.getAttribute("loginUser")!=null){
	  com.kh.cityrack.member.common.model.dto.Member me = (com.kh.cityrack.member.common.model.dto.Member)session.getAttribute("loginUser");
	  if(!(me.getC_name().equals("관리자"))){
		 RequestDispatcher view = request.getRequestDispatcher("/views/common/errorPage.jsp");
		 request.setAttribute("msg", "동작그만 밑장빼기냐?");
		 view.forward(request, response);
	  }
	}else{
		System.out.println("bye");
		RequestDispatcher view = request.getRequestDispatcher("/views/common/errorPage.jsp");
		  request.setAttribute("msg", "동작그만 밑장빼기냐?");
		  view.forward(request, response);
	}

int amount = 0;
String applyNum = "";
String buyerAddr = "";
String buyerEmail = "";
String buyerName = "";
String buyerPostcode = "";
String buyerTel = "";
String impUid = "";
String merchantUid = "";
String name = "";
int no = 0;
String payMethod = "";
String pg = "";
String status = "";
if(request.getAttribute("p") != null){
  Payment p = (Payment)request.getAttribute("p");
  amount = p.getAmount();
  applyNum = p.getApplyNum();
  buyerAddr = p.getBuyerAddr();
  buyerEmail = p.getBuyerEmail();
  buyerName = p.getBuyerName();
  buyerPostcode = p.getBuyerPostcode();
  buyerTel = p.getBuyerTel();
  impUid = p.getImpUid();
  merchantUid = p.getMerchantUid();
  name = p.getName();
  no = p.getNo();
  payMethod = p.getPayMethod();
  pg = p.getPg();
  status = p.getStatus();
}

String orderCode = "";
if(request.getAttribute("orderCode") != null){
	orderCode = String.valueOf(request.getAttribute("orderCode"));
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
	@import url("css/common.css");
	table {
		border: 1px solid black;
		text-align: center;
		border-collapse: collapse;
		
	}	
	.tableArea {
		width: 100%;
		height: 700px;
		margin-left: auto;
		margin-right: auto;
		font-size: 15px;
	}
	th, td {
		border: 1px solid black;
		padding: 10px;
		font-size: 14px;
	}
	th {
		background: lightyellow;
	}
	.paymentPosition {
		display:  inline-block;
		width: 40%;
		height: 100%;
		margin: 0.05em;
	}
</style>
<title>결제 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>
		<div class="tableArea" align="center">
			<h2>결제 상세</h2><br>
			<table style="width: 40%;">
				<tr>
					<th width="50%" style="text-align: center; background: lightyellow">주문 번호</th>
					<th width="50%" style="text-align: center; background: lightyellow"><%= orderCode %></th>
				</tr>
			</table>
			<br><br>
			<div class="paymentPosition">
				<table style="width: 80%">
					<tr>
						<th colspan="2" style="text-align: center;">결제 내역</th>
					</tr>
					<tr>
						<td width="30%" style="text-align: center;">결제 번호</td>
						<td width="70%" style="text-align: left;"><%= no %></td>
					</tr>
					<tr>
						<td style="text-align: center;">PG사</td>
						<td style="text-align: left;"><%= pg %></td>
					</tr>
					<tr>
						<td width="10%" style="text-align: center;">결제 수단</td>
						<td width="22%" style="text-align: left;"><%= payMethod %></td>
					</tr>
					<tr>			 
						<td style="text-align: center;">상점 거래 ID</td>
						<td colspan="2" style="text-align: left;"><%= merchantUid %></td>
					</tr>
					<tr>			 
						<td style="text-align: center;">주문명</td>
						<td colspan="2" style="text-align: left;"><%= name %></td>
					</tr>
					<tr>			 
						<td style="text-align: center;">결제 금액</td>
						<td colspan="2" style="text-align: left;"><%= amount %>원</td>
					</tr>
					<tr>			 
						<td style="text-align: center;">구매자 이메일</td>
						<td colspan="2" style="text-align: left;"><%= buyerEmail %></td>
					</tr>
					<tr>			 
						<td style="text-align: center;">구매자 이름</td>
						<td colspan="2" style="text-align: left;"><%= buyerName %></td>
					</tr>
					<tr>			 
						<td style="text-align: center;">구매자 전화번호</td>
						<td colspan="2" style="text-align: left;"><%= buyerTel %></td>
					</tr>
					<tr>			 
						<td style="text-align: center;">구매자 주소</td>
						<td colspan="2" style="text-align: left;"><%= buyerAddr %></td>
					</tr>
					<tr>			 
						<td style="text-align: center;">구매자 우편번호</td>
						<td colspan="2" style="text-align: left;"><%= buyerPostcode %></td>
					</tr>
				</table>
			</div>
			<div class="paymentPosition">
				<div style="margin-bottom: 50px">
					<table style="width:80%">
						<tr>
							<th colspan="2" style="text-align: center;">결제 결과</th>
						</tr>
						<tr>
							<td width="30%" style="text-align: center;">고유 번호</td>
							<td width="70%" style="text-align: left;">100001</td>
						</tr>
						<tr>
							<td width="30%" style="text-align: center;">상점 거래 ID</td>
							<td width="70%" style="text-align: left;"><%= merchantUid %></td>
						</tr>
						<tr>
							<td width="30%" style="text-align: center;">결제 금액</td>
							<td width="70%" style="text-align: left;"><%= amount %>원</td>
						</tr>
						<tr>
							<td width="30%" style="text-align: center;">카드 승인 번호</td>
							<td width="70%" style="text-align: left;"><%= applyNum %></td>
						</tr>
					</table>
				</div>
			<table style="width: 80%">
				<tr>			 
					<td width="30%" style="text-align: center;">결제 상태</td>
					<td colspan="2" style="text-align: center;">
						<select class="form-control" id="status" name="status" style="margin-bottom: 10px;">
							<option value="결제 완료">결제완료</option>
							<option value="결제 취소">결제취소</option>
						</select>
						<button class="btn btn-primary active" style="width: 100%" onclick="changeStatus();">변경</button>
					</td>
				</tr>
			</table>
			</div>		
		</div>
	</section>
	<script>
	  $(function(){
		 <%if(request.getAttribute("p") != null){%>
		 <%if(status.equals("결제 완료")){%>
		   $('#status option').eq(0).attr("selected","selected");
		 <%}else{%>
		 $('#status option').eq(1).attr("selected","selected");
		 <%}
		 }%>
		 
	  });
	  
	  function changeStatus(){
		  $status = $('#status').val();
		  $orderCode = '<%=orderCode%>';
		  
		  location.href='<%=request.getContextPath()%>' + "/PaymentUpdate.me?status=" + $status + "&orderCode=" + $orderCode;
	  }
	</script>
	<%@ include file="/views/admin/common/footer.jsp" %>
</body>
</html>