<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.SimpleTimeZone"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
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
	Date dateNow = Calendar.getInstance(new SimpleTimeZone(0x1ee6280, "KST")).getTime();
	SimpleDateFormat datNowSDF = new SimpleDateFormat("yyyy-MM-dd",Locale.getDefault());
	
	String todayStr = datNowSDF.format(dateNow);
%>
<!DOCTYPE html>
<html>
<head>
<!--  -->
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

<style>
	@import url("<%=request.getContextPath()%>/views/admin/css/common.css");

	.mainArea {
		width: 100%;
		height: 500px;
		margin: 10px;
		margin-left: auto;
		margin-right: auto;
	}
	.mainDiv {
		border:2px solid black;
		display:  inline-block;
		width: 45%;
		height: 95%;
		margin: 10px;
		
	}
</style>
<title>회원 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>
		<div class="mainArea" align="center">
			<div class="mainDiv">
				
					<table id="stockTodayTable" class="table table-striped" style="margin-left:10px;margin-top:20px; width: 90%;">
						<thead>
							<tr>
								<td colspan="5">금일 재고 등록 현황&nbsp;&nbsp; (<%= todayStr %> 기준)</td>
								<td colspan="1" align="right">
									<select id="standard" name="standard">
										<option value="입고">입고</option>
										<option value="출고">출고</option>									
									</select>
								</td>
							</tr>
							<tr>
								<th width="10%" style="text-align: center;">번호</th>
								<th width="10%" style="text-align: center;">구분</th>
								<th width="20%" style="text-align: center;">상품코드</th>
								<th width="20%" style="text-align: center;">상품명</th>
								<th width="30%" style="text-align: center;">분류</th>
								<th width="10%" style="text-align: center;">수량</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				
			
			
			</div>
			<div class="mainDiv">
			   <table id="orderTable" class="table table-striped" style="margin-left:30px;margin-top:20px; width: 90%;">
						<thead>
							<tr>
								<td colspan="5">최근 주문 현황&nbsp;&nbsp;</td>
								<td colspan="1" align="right">
									
								</td>
							</tr>
							<tr>
								<th width="10%" style="text-align: center;">번호</th>
								<th width="10%" style="text-align: center;">주문번호</th>
								<th width="20%" style="text-align: center;">상품명</th>
								<th width="20%" style="text-align: center;">수량</th>
								<th width="30%" style="text-align: center;">주문일</th>
								
							</tr>
							
						</thead>
						<tbody>
							
						</tbody>
				 </table>
			</div>
		</div>
		    
	</section>
	<%@ include file="/views/admin/common/footer.jsp" %>
	<script type="text/javascript">
	$(function(){
		var standard = $("#standard").val();
		
		$.ajax({
			url:"<%=request.getContextPath()%>/todayStock.main",
			data:{standard:standard},
			type:"get",
			success:function(data){
				console.log("서버 전송 성공!");
				console.log(data);
				
				var $tableBody = $("#stockTodayTable tbody");
				
				$tableBody.html('');
				
				$.each(data, function(index, value){
					var $tr = $("<tr>"); // tr태그로 만들어주는것을 $tr에 저장
					var $scode = $("<td style='text-align: center;'>").text(value.scode);
					var $divsion = $("<td style='text-align: center;'>").text(value.divsion);
					var $pcode = $("<td style='text-align: center;'>").text(value.pcode);
					var $pname = $("<td style='text-align: center;'>").text(value.pname);
					var $note = $("<td style='text-align: center;'>").text(value.note);
					var $amount = $("<td style='text-align: center;'>").text(value.amount);
					
					// 어펜드
					$tr.append($scode);
					$tr.append($divsion);
					$tr.append($pcode);
					$tr.append($pname);
					$tr.append($note);
					$tr.append($amount);
					$tableBody.append($tr);
				});
			},
			error:function(data){
				console.log("서버 전송 실패..");
			},
		});
		$("#standard").change(function(){
			var standard = $("#standard").val();
			
			$.ajax({
				url:"<%=request.getContextPath()%>/todayStock.main",
				data:{standard:standard},
				type:"get",
				success:function(data){
					console.log("서버 전송 성공!");
					console.log(data);
					
					var $tableBody = $("#stockTodayTable tbody");
					
					$tableBody.html('');
					
					$.each(data, function(index, value){
						var $tr = $("<tr>"); // tr태그로 만들어주는것을 $tr에 저장
						var $scode = $("<td style='text-align: center;'>").text(value.scode);
						var $divsion = $("<td style='text-align: center;'>").text(value.divsion);
						var $pcode = $("<td style='text-align: center;'>").text(value.pcode);
						var $pname = $("<td style='text-align: center;'>").text(value.pname);
						var $note = $("<td style='text-align: center;'>").text(value.note);
						var $amount = $("<td style='text-align: center;'>").text(value.amount);
						
						// 어펜드
						$tr.append($scode);
						$tr.append($divsion);
						$tr.append($pcode);
						$tr.append($pname);
						$tr.append($note);
						$tr.append($amount);
						$tableBody.append($tr);
					});
				},
				error:function(data){
					console.log("서버 전송 실패..");
				},
			});
		});
		$.ajax({
						url:"<%=request.getContextPath()%>/todayOrder.main",
						data:{},
		    			type:"get",
						success:function(data){
							
							console.log(data);
							
		     				var $tableBody = $("#orderTable tbody");
							
							$tableBody.html('');
							
							$.each(data, function(index, value){
								var $tr = $('<tr>');
								var $index = $('<td style="text-align: center">').text(index+1)
								var $o_ono = $('<td style="text-align: center">').text(value.o_ono);
								var $p_name = $('<td style="text-align: center">').text(value.p_name);
								var $o_amount = $('<td style="text-align: center">').text(value.o_amount);
								var $o_orderdate = $('<td style="text-align: center">').text(value.o_orderdate);
								
								$tr.append($index);
								$tr.append($o_ono);
								$tr.append($p_name);
								$tr.append($o_amount);
								$tr.append($o_orderdate);
								
							$tableBody.append($tr);
							});
						},
						error:function(data){
							console.log("서버 전송 실패..");
						},
					});
	});
	</script>
</body>
</html>