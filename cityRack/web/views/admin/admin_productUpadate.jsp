<%@page import="com.kh.cityrack.product.admin.model.dto.Product"%>
<%@page import="com.kh.cityrack.product.admin.model.dto.Pcategory"%>
<%@page import="java.util.ArrayList"%>
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
	ArrayList<Pcategory> cList = (ArrayList<Pcategory>)request.getAttribute("cList");
	Product p = (Product)request.getAttribute("p");
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
	@import url("views/admin/css/common.css");
	table {
		border: 1px solid black;
		text-align: center;
		border-collapse: collapse;
		
	}	
	.tableArea {
		width: 100%;
		height: 800px;
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
	.productPosition {
		display:  inline-block;
		width: 40%;
		height: 100%;
		margin: 0.05em;
	}
	#titleImgArea {
		width: 500px;
		border: 2px dashed darkgray;
		text-align: center;
		display: table-cell;
		vertical-align: middle;
	}
	#contentImgArea {
		width: 500px;
		border: 2px dashed darkgray;
		text-align: center;
		display: table-cell;
		vertical-align: middle;
	}
	
	#titleImgArea:hover {
		cursor: pointer;
	}
	#contentImgArea:hover {
		cursor: pointer;
	}
	.resisterBt {
		padding: 10px;
	}
</style>
<title>상품 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>
		<form action="updateProduct.pr" method="post" encType="multipart/form-data">
			<div class="tableArea" align="center">
				<h2>상품 수정</h2><br>
					<table style="width: 40%;">
						<tr>
							<th width="25%" style="text-align: center; background: lightyellow">상품 코드</th>
							<!-- 상품코드 = 카테고리 코드  -->
							<th width="25%" style="text-align: center; background: lightyellow">
								<input type="text" class="form-control" readonly="readonly" name="pcode" value="<%=p.getP_code()%>">
							</th>
							<th width="25%" style="text-align: center; background: lightyellow">진열 상태</th>
							<th width="25%" style="text-align: center; background: lightyellow">
								<%if(p.getP_status().equals("Y")){ %>
									<input id="statusY" type="radio" name="status" value="Y" checked="checked">
									<label for="statusY">Y</label>&nbsp;&nbsp;
									<input id="statusN" type="radio" name="status" value="N">
									<label for="statusN">N</label>
								<%} else {%>
									<input id="statusY" type="radio" name="status" value="Y">
									<label for="statusY">Y</label>&nbsp;&nbsp;
									<input id="statusN" type="radio" name="status" value="N" checked="checked">
									<label for="statusN">N</label>
								<%} %>
							</th>
						</tr>
					</table>
					<br><br>
					<div class="productPosition">
						<table style="width: 80%; height: 70%">
							<tr>
								<td width="30%" style="text-align: center;">카테고리</td>
								<td width="70%" style="text-align: left;">
									<select class="form-control" name="category">
										<%for(int i = 0; i < cList.size(); i++){ %>
										<option value="<%=cList.get(i).getCa_code()%>"><%=cList.get(i).getCa_name() %></option>
										<%} %>
									</select>
								</td>
							</tr>
							<%
								String[] constitutionChecked = new String[8];
								switch (p.getP_8constitution()) {
								case "수음":
									constitutionChecked[0] = "checked=\"checked\"";
									break;
								case "수양":
									constitutionChecked[1] = "checked=\"checked\"";	
									break;
								case "목음":
									constitutionChecked[2] = "checked=\"checked\"";
									break;
								case "목양":
									constitutionChecked[3] = "checked=\"checked\"";
									break;
								case "금음":
									constitutionChecked[4] = "checked=\"checked\"";
									break;
								case "금양":
									constitutionChecked[5] = "checked=\"checked\"";
									break;
								case "토음":
									constitutionChecked[6] = "checked=\"checked\"";
									break;
								default:
									constitutionChecked[7] = "checked=\"checked\"";
									break;
								}
							%>
							<tr>
								<td style="text-align: center;">체질명</td>
								<td>
									<input style="margin: 5px;" type="radio" name="constitution" value="수음" <%=constitutionChecked[0] %>>수음
									<input style="margin: 5px;" type="radio" name="constitution" value="수양" <%=constitutionChecked[1] %>>수양
									<input style="margin: 5px;" type="radio" name="constitution" value="목음" <%=constitutionChecked[2] %>>목음
									<input style="margin: 5px;" type="radio" name="constitution" value="목양" <%=constitutionChecked[3] %>>목양<br>
									<input style="margin: 5px;" type="radio" name="constitution" value="금음" <%=constitutionChecked[4] %>>금음
									<input style="margin: 5px;" type="radio" name="constitution" value="금양" <%=constitutionChecked[5] %>>금양
									<input style="margin: 5px;" type="radio" name="constitution" value="토음" <%=constitutionChecked[6] %>>토음
									<input style="margin: 5px;" type="radio" name="constitution" value="토양" <%=constitutionChecked[7] %>>토양							
								</td>
							</tr>
							<tr>			 
								<td style="text-align: center;">상품명</td>
								<td colspan="2">
									<input class="form-control" id="pname" name="pname" type="text" value="<%=p.getP_name()%>">
								</td>
							</tr>
							<tr>			 
								<td style="text-align: center;">가격</td>
								<td colspan="2" style="text-align: left;">
									<input class="form-control" id="price" name="price" type="number" value="<%=p.getP_price()%>" name="price">
								</td>
							</tr>
							<%
								String[] eventArr = p.getP_event().split(" ");
								
								String[] eventChecked = new String[3];
								String hiddenChecked = "hidden=\"\"";
								for(int i = 0; i < eventArr.length; i++){
									System.out.println(eventArr[i]);
									switch (eventArr[i]) {
									case "new":
										eventChecked[0] = "checked=\"checked\"";
										break;
									case "hot":
										eventChecked[1] = "checked=\"checked\"";	
										break;
									default:
										eventChecked[2] = "checked=\"checked\"";
										hiddenChecked = "";
										break;
									}
								}
								
							%>
							<tr>
								<td style="text-align: center;">이벤트명</td>
								<td>
									<input id="new" type="checkbox" name="event" value="new" <%=eventChecked[0] %>> New
									<input id="hot" type="checkbox" name="event" value="hot" <%=eventChecked[1] %>> Hot
									<input id="sale" type="checkbox" name="event" value="sale" onclick="saleSelected();" <%=eventChecked[2] %>> Sale
									<div align="center" id="saleGroup" <%=hiddenChecked %>>
										<br>
										<label for="saleValues"> 할인율(%) : </label>
										<input id="saleValues" class="form-control" type="text" name="saleValues" min="1" max="100" value="<%=p.getP_discount() %>" style="width: 30%;">	
									</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="productPosition">
						<div style="margin-bottom: 50px">
							<table style="width:80%; height: 70%;">
								<tr>
									<td style="text-align: center; height: 60%">
										<div id="titleImgArea">
											<img id="titleImg" height="312px" width="70%" src="<%=request.getContextPath()%>/product_download_imgFiles/<%=p.getP_pic1()%>">
										</div>
									</td>
								</tr>
								<tr>
									<td style="text-align: center;">
										<div id="contentImgArea">
											<img id="contentImg" height="200px" width="40%" src="<%=request.getContextPath()%>/product_download_imgFiles/<%=p.getP_pic2()%>">
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>	
				</div>
			<div align="center" style="margin-top: -50px;">
					<input class="resisterBt" type="submit" value="수정하기">&nbsp;
					<input class="resisterBt" type="button" value="삭제하기" onclick="location.href='<%=request.getContextPath()%>/productDelete.pr?pcode=<%=p.getP_code()%>'">
			</div>
			<div id="fileArea">
				<input type="file" id="file1" name="file1" onchange="LoadImg1(this);" value="<%=request.getContextPath()%>/product_download_imgFiles/<%=p.getP_pic1()%>">
				<input type="file" id="file2" name="file2" onchange="LoadImg2(this);" value="<%=request.getContextPath()%>/product_download_imgFiles/<%=p.getP_pic2()%>">
			</div>	
		</form>
		
	</section>
	<script type="text/javascript">
		$(function() {
			$("#fileArea").hide();
			$("#titleImgArea").click(function () {
				$("#file1").click();
			});
			$("#contentImgArea").click(function () {
				$("#file2").click();
			});
		});
		
		function LoadImg1(value) {
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#titleImg").attr("src", e.target.result);
				}
			reader.readAsDataURL(value.files[0]);
			}
		}
		function LoadImg2(value) {
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#contentImg").attr("src", e.target.result);
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
		
		function saleSelected(){
			var selection = document.getElementById('sale').checked;
			console.log(selection);
			if(selection==true){
				document.getElementById('saleGroup').style.display='inline';
			} else {
				document.getElementById('saleGroup').style.display='none';
			}
		};
	</script>
	<%@ include file="/views/admin/common/footer.jsp" %>
</body>
</html>