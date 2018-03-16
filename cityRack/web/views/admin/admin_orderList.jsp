<%@page import="com.kh.cityrack.product.admin.model.dto.PageInfo"%>
<%@page import="com.kh.cityrack.order.admin.model.dto.Order"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Order> olist = (ArrayList<Order>)request.getAttribute("oList");
	System.out.println(olist);
	Boolean searchBoolean = (Boolean)request.getAttribute("searchBoolean");
	
	String[] searchTypeArr = null;
	String orderType = null;
			
	String search_oono = "";
	String search_email = "";
	String beforeDate = "";
	String afterDate = "";
	String search_pname = "";
	String search_status = "";
	
	String oono_order = "";
	String email_order = "";
	String pname_order = "";
	
	System.out.println(searchBoolean);
	
	if(searchBoolean){
		searchTypeArr = (String[])request.getParameterValues("searchTypeArr");
		orderType = (String)request.getAttribute("orderType");
				
		search_oono = (String)request.getAttribute("search_oono");
		search_email = (String)request.getAttribute("search_email");
		beforeDate = (String)request.getAttribute("beforeDate");
		afterDate = (String)request.getAttribute("afterDate");
		search_pname = (String)request.getAttribute("search_pname");
		search_status = (String)request.getAttribute("search_status");
		
		oono_order = (String)request.getAttribute("oono_order");
		email_order = (String)request.getAttribute("email_order");
		pname_order = (String)request.getAttribute("pname_order");
	}
	
	String[] selectedStatus = new String[6];
	
	for(int i = 0; i < selectedStatus.length; i++){
		selectedStatus[i] = "";
	}
	
	if(search_status.equals("준비중")){
		selectedStatus[0] = "selected=\"selected\"";
	} else if(search_status.equals("준비완료")) {
		selectedStatus[1] = "selected=\"selected\"";
	} else if(search_status.equals("배송중")) {
		selectedStatus[2] = "selected=\"selected\"";
	} else if(search_status.equals("취소대기")) {
		selectedStatus[3] = "selected=\"selected\"";
	} else if(search_status.equals("준비완료")) {
		selectedStatus[4] = "selected=\"selected\"";
	} else{
		selectedStatus[5] = "selected=\"selected\"";
	} 
	
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int limit = pi.getLimit();
	/* 불러올 리스트가 없어서 포문으로 리스트 출력 처리 안함. */
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
		height: 500px;
		margin-left: auto;
		margin-right: auto;
	}
	th, td {
		border: 1px solid black;
		padding: 10px;
		font-size: 14px;
	}
	th {
		background: lightgray;
	}
	.statusButton {
		display:  inline-block;
		width: 40%;
		height: 50%;
		margin: 0.05em;	
		
	}
	.pagingArea {
		margin-top: 15px;
	}
	.searchDiv {
		display:  inline-block;
		margin-left:auto;
		margin-right:auto;
		vertical-align: middle;
	}
</style>
<title>회원 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>
		<div align="center">
			<h2>주문 정보</h2>
			<form role="search" action="orderSearch.or" method="get">
				<!-- 검색 페이징 처리용 -->
				<%if(searchBoolean){ %>
					<input type="hidden" name="currentPage" value="<%=currentPage%>"> 
				<%} %>
				<table style="width: 40%; border: 2px solid black; margin: 15px;">
					<tr style="border: none">
						<td style="border: none;">
							<div align="left">
								<div class="searchDiv" style="width: 18%;" align="center"> 
									<label for="search_oono">주문번호 : </label>
								</div>
								<div class="searchDiv" style="width: 40%">
									<%if(!searchBoolean){ %>
									<input type="search" name="search_oono" id="search_oono" class="form-control">
									<%} else { %>
									<input type="search" name="search_oono" id="search_oono" class="form-control" value="<%=search_oono%>">
									<%} %> 
								</div>
								<div class="searchDiv" style="width: 5%;" align="center"> 
									<%if(!searchBoolean) {%>
									<input type="checkbox" id="searchCheackedOono" name="searchType" value="searchCheackedOono">
									<%} else { 
										for(int i = 0; i < searchTypeArr.length; i++) {
											if(searchTypeArr[i].equals("searchCheackedOono")){%>
												<input type="checkbox" id="searchCheackedOono" name="searchType" value="searchCheackedOono" checked="checked">				
									<%		break;
											} else { %>
											<input type="checkbox" id="searchCheackedOono" name="searchType" value="searchCheackedOono">
									<%		}
										}
									}%>
								</div>
								<div class="searchDiv" style="width: 25%">
									<%if(!searchBoolean){ %>
									<select id="oono_order" name="oono_order" class="form-control">
										<option value="ASC">오름차순</option>
										<option value="DESC">내림차순</option>
									</select>
									<%} else {
										if(oono_order.equals("")) {%>
										<select id="oono_order" name="oono_order" class="form-control">
											<option value="ASC">오름차순</option>
											<option value="DESC">내림차순</option>
										</select>
									<%	} else { 
											if(oono_order.equals("ASC")){%>
											<select id="oono_order" name="oono_order" class="form-control">
												<option value="ASC" selected="selected">오름차순</option>
												<option value="DESC">내림차순</option>
											</select>
									<% 		} else { %>
											<select id="oono_order" name="oono_order" class="form-control">
												<option value="ASC">오름차순</option>
												<option value="DESC" selected="selected">내림차순</option>
											</select>
									<%		}
										}
									} %>
								</div>
							</div>
						</td>	
						<td style="border: none">
							<%if(!searchBoolean){ %>
							<input type="radio" id="searchCheackedOonoOrder" name="orderType" value="searchCheackedOonoOrder">
							<%} else { 
									if(orderType.equals("searchCheackedOonoOrder")){%>
									<input type="radio" id="searchCheackedOonoOrder" name="orderType" value="searchCheackedOonoOrder" checked="checked">	
							<%		} else { %>
									<input type="radio" id="searchCheackedOonoOrder" name="orderType" value="searchCheackedOonoOrder">	
							<%		}
							} %>
						</td>
					</tr>
					<tr style="border: none">
						<td style="border: none;">
							<div align="left">
								<div class="searchDiv" style="width: 18%;" align="center"> 
									
									<label style="height: 100%; margin-top: 5px;" for="search_email">회원이메일 : </label>	
									
								</div>
								<div class="searchDiv" style="width: 40%">
									<%if(!searchBoolean){ %>
									<input type="search" name="search_email" id="search_email" class="form-control">
									<%} else { %>
									<input type="search" name="search_email" id="search_email" class="form-control" value="<%=search_email%>">
									<%} %>
								</div>
								<div class="searchDiv" style="width: 5%;" align="center"> 
									<%if(!searchBoolean){ %>
									<input id="searchCheackedEmail" type="checkbox" name="searchType" value="searchCheackedEmail">
									<%} else { 
										for(int i = 0; i < searchTypeArr.length; i++) {
											if(searchTypeArr[i].equals("searchCheackedEmail")){%>
												<input id="searchCheackedEmail" type="checkbox" name="searchType" value="searchCheackedEmail" checked="checked">				
									<%		break;
											} else { %>
												<input id="searchCheackedEmail" type="checkbox" name="searchType" value="searchCheackedEmail">
									<%		}
										}
									}%>
								</div>
								<div class="searchDiv" style="width: 25%">
									<%if(!searchBoolean){ %>
									<select id="email_order" name="email_order" class="form-control">
										<option value="ASC">오름차순</option>
										<option value="DESC">내림차순</option>
									</select>
									<%} else {
										if(email_order.equals("")) {%>
										<select id="email_order" name="email_order" class="form-control">
											<option value="ASC">오름차순</option>
											<option value="DESC">내림차순</option>
										</select>
									<%	} else { 
											if(email_order.equals("ASC")){%>
											<select id="email_order" name="email_order" class="form-control">
												<option value="ASC" selected="selected">오름차순</option>
												<option value="DESC">내림차순</option>
											</select>
									<% 		} else { %>
											<select id="email_order" name="email_order" class="form-control">
												<option value="ASC">오름차순</option>
												<option value="DESC" selected="selected">내림차순</option>
											</select>
									<%		}
										}
									} %>
								</div>		
							</div>
						</td>	
						
						<td style="border: none">
							<%if(!searchBoolean){ %>
							<input type="radio" id="searchCheackedEmailOrder" name="orderType" value="searchCheackedEmailOrder">
							<%} else { 
									if(orderType.equals("searchCheackedEmailOrder")){%>
									<input type="radio" id="searchCheackedEmailOrder" name="orderType" value="searchCheackedEmailOrder" checked="checked">
							<%		} else { %>
									<input type="radio" id="searchCheackedEmailOrder" name="orderType" value="searchCheackedEmailOrder">	
							<%		}
							} %>
						</td>
					</tr>
					<tr style="border: none">
						<td style="border: none;">
							<div align="left">
								<div class="searchDiv" style="width: 18%;" align="center"> 
									<label for="search_odate">주문일자 : </label>
								</div>
								<%if(!searchBoolean){ %>
								<div class="searchDiv" style="width: 36%">
									<input type="date" name="beforeDate" id="beforeDate" class="form-control">
								</div>
								<div class="searchDiv" style="width: 2%;" align="center">
									-
								</div>
								<div class="searchDiv" style="width: 36%">
									<input type="date" name="afterDate" id="afterDate" class="form-control">
								</div>
								<%} else { %>
								<div class="searchDiv" style="width: 36%">
									<input type="date" name="beforeDate" id="beforeDate" class="form-control" value="<%=beforeDate%>">
								</div>
								<div class="searchDiv" style="width: 2%;" align="center">
									-
								</div>
								<div class="searchDiv" style="width: 36%">
									<input type="date" name="afterDate" id="afterDate" class="form-control" value="<%=afterDate%>">
								</div>
								<%} %>
								
							
							</div>	
						</td>	
						<td style="border: none">
							<%if(!searchBoolean){ %>
							<input id="searchCheackedOdate" type="checkbox" name="searchType" value="searchCheackedOdate">
							<%} else { 
								for(int i = 0; i < searchTypeArr.length; i++) {
									if(searchTypeArr[i].equals("searchCheackedEmail")){%>
										<input id="searchCheackedOdate" type="checkbox" name="searchType" value="searchCheackedOdate" checked="checked">				
							<%		break;
									} else { %>
										<input id="searchCheackedOdate" type="checkbox" name="searchType" value="searchCheackedOdate">		
							<%		}
								}
							}%>
						</td>
					</tr>
					<tr style="border: none">
						<td style="border: none;">
							<div align="left">
								<div class="searchDiv" style="width: 18%;" align="center"> 
									<label for="search_pname">상품명 : </label>
								</div>
								<div class="searchDiv" style="width: 40%">
									<%if(!searchBoolean){ %>
									<input type="search" name="search_pname" id="search_pname" class="form-control">
									<%} else {%>
									<input type="search" name="search_pname" id="search_pname" class="form-control" value="<%=search_pname %>">
									<%} %>
								</div>
								<div class="searchDiv" style="width: 5%;" align="center"> 
									<%if(!searchBoolean){ %>
									<input type="checkbox" id="searchCheackedPname" name="searchType" value="searchCheackedPname">
									<%} else { 
										for(int i = 0; i < searchTypeArr.length; i++) {
											if(searchTypeArr[i].equals("searchCheackedPname")){%>
												<input type="checkbox" id="searchCheackedPname" name="searchType" value="searchCheackedPname" checked="checked">			
									<%		break;
											} else { %>
												<input type="checkbox" id="searchCheackedPname" name="searchType" value="searchCheackedPname">		
									<%		}
										}
									}%>
								</div>
								<div class="searchDiv" style="width: 25%">
									<%if(!searchBoolean){ %>
									<select id="pname_order" name="pname_order" class="form-control">
										<option value="ASC">오름차순</option>
										<option value="DESC">내림차순</option>
									</select>
									<%} else {
										if(pname_order.equals("")) {%>
										<select id="pname_order" name="pname_order" class="form-control">
											<option value="ASC">오름차순</option>
											<option value="DESC">내림차순</option>
										</select>
									<%	} else { 
											if(pname_order.equals("ASC")){%>
											<select id="pname_order" name="pname_order" class="form-control">
												<option value="ASC" selected="selected">오름차순</option>
												<option value="DESC">내림차순</option>
											</select>
									<% 		} else { %>
											<select id="pname_order" name="pname_order" class="form-control">
												<option value="ASC">오름차순</option>
												<option value="DESC" selected="selected">내림차순</option>
											</select>
									<%		}
										}
									} %>
								</div>
							</div>
						</td>	
						<td style="border: none">
							<%if(!searchBoolean){ %>
							<input type="radio" id="searchCheackedPnameOrder" name="orderType" value="searchCheackedPnameOrder">
							<%} else { 
									if(orderType.equals("searchCheackedPnameOrder")){%>
									<input type="radio" id="searchCheackedPnameOrder" name="orderType" value="searchCheackedPnameOrder" checked="checked">
							<%		} else { %>
									<input type="radio" id="searchCheackedPnameOrder" name="orderType" value="searchCheackedPnameOrder">	
							<%		}
							} %>
						</td>
					</tr>
					<tr style="border: none">
						<td style="border: none;" colspan="2">
							<div align="center">
								<div class="searchDiv" style="width: 15%;" align="center"> 
									<label for="search_status">주문상태 : </label>
								</div>
								<div class="searchDiv" align="right">
									<%if(!searchBoolean){ %>
									<select name="search_status">
										<option value="준비중">준비중</option>
										<option value="준비완료">준비완료</option>
										<option value="배송중">배송중</option>
										<option value="배송완료">배송완료</option>
										<option value="취소대기">취소대기</option>
										<option value="취소완료">취소완료</option>
									</select>
									<%} else {
										if(search_status.equals("")) {%>
										<select name="search_status">
											<option value="준비중">준비중</option>
											<option value="준비완료">준비완료</option>
											<option value="배송중">배송중</option>
											<option value="배송완료">배송완료</option>
											<option value="취소대기">취소대기</option>
											<option value="취소완료">취소완료</option>
										</select>
									<%	} else { %>
										<select name="search_status">
											<option value="준비중" <%=selectedStatus[0] %>>준비중</option>
											<option value="준비완료" <%=selectedStatus[1] %>>준비완료</option>
											<option value="배송중" <%=selectedStatus[2] %>>배송중</option>
											<option value="배송완료" <%=selectedStatus[3] %>>배송완료</option>
											<option value="취소대기" <%=selectedStatus[4] %>>취소대기</option>
											<option value="취소완료" <%=selectedStatus[5] %>>취소완료</option>
										</select>											
									<%	}
									} %>
								</div>
								<!--  -->
								<div class="searchDiv" style="width: 5%">
									<%if(!searchBoolean){ %>
									<input type="checkbox" id="searchCheackedStatus" name="searchType" value="searchCheackedStatus">
									<%} else { 
										for(int i = 0; i < searchTypeArr.length; i++) {
											if(searchTypeArr[i].equals("searchCheackedStatus")){%>
												<input type="checkbox" id="searchCheackedStatus" name="searchType" value="searchCheackedStatus" checked="checked">			
									<%		break;
											} else { %>
												<input type="checkbox" id="searchCheackedStatus" name="searchType" value="searchCheackedStatus">		
									<%		}
										}
									}%>
								</div>
								<div class="searchDiv" style="width: 5%;" align="center"> 
								</div>
								<div class="searchDiv" style="width: 5%;" align="center"> 
								</div>
								<div class="searchDiv" style="width: 10%">
									<input type="submit" id="SearchBtn" value="검색" class="btn btn-primary active" style="width: 100%">
								</div>
								<div class="searchDiv" style="width: 10%;">
									<input type="reset" id="rsetBtn" value="초기화" class="btn btn-primary active" style="width: 100%">
								</div>
							</div>
						</td>	
					</tr>
				</table>	
			</form>		
		</div>
		
		<br>
		<div class="tableArea" align="center">
			<table style="width: 80%">
				<tr>
					<th width="10%" style="text-align: center;">주문번호</th>
					<th width="7%" style="text-align: center;">주문일자</th>
					<th width="15%" style="text-align: center;">회원이메일</th>
					<th width="20%" style="text-align: center;">상품명</th>
					<th width="10%" style="text-align: center;">총가격(원)</th>
					<th width="6%" style="text-align: center;">주문상태</th>
					<th width="6%" style="text-align: center;">상태변경</th>
					<!-- 도시락 외 3 클릭시 주문 정보 다 출력. -->
				<%
					String[] selectedArr = new String[6];		
				%>
				
				</tr>
				<%for(int i = 0; i < olist.size(); i++){ %>
				<tr>
					<td style="text-align: right;"><%=olist.get(i).getO_ono() %></td>
					<td style="text-align: left;">2018-03-01</td>
					<td style="text-align: left;"><%=olist.get(i).getM_email() %></td>
					<td style="text-align: left;"><a href="<%=request.getContextPath()%>/orderDetailGetAll.or?ono=<%=olist.get(i).getO_ono() %>"><%=olist.get(i).getP_name() %> 외 <%=olist.get(i).getpCount()-1 %></a></td>
					<td style="text-align: right;"><%=olist.get(i).getPa_amount() %></td>
					
					<%
					selectedArr[0] = "";
					selectedArr[1] = "";
					selectedArr[2] = "";
					selectedArr[3] = "";
					selectedArr[4] = "";
					selectedArr[5] = "";
					
					for(int j = 0; j < selectedArr.length; j++) { 
						switch (olist.get(i).getO_state()) {
						case "준비중":
							selectedArr[0] = "selected=\"selected\"";
							break;
						case "준비완료":
							selectedArr[0] = "selected=\"selected\"";
							break;
						case "배송대기":
							selectedArr[2] = "selected=\"selected\"";		
							break;
						case "배송완료":
							selectedArr[3] = "selected=\"selected\"";
 							break;
						case "취소대기":
							selectedArr[4] = "selected=\"selected\"";
 							break;
						default://취소완료.
							selectedArr[5] = "selected=\"selected\"";
							break;
						}
					} %>
					<td>
						<select name="status">
							<option value="준비중" <%=selectedArr[0] %>>준비중</option>
							<option value="준비완료" <%=selectedArr[1] %>>준비완료</option>
							<option value="배송중" <%=selectedArr[2] %>>배송중</option>
							<option value="배송완료" <%=selectedArr[3] %>>배송완료</option>
							<option value="취소대기" <%=selectedArr[4] %>>취소대기</option>
							<option value="취소완료" <%=selectedArr[5] %>>취소완료</option>
						</select>
					</td>
					
					<td><input type="button" onclick="uodateBtn();">변경</button></td>
				</tr>
				<%} %>
			</table>	
			<% 
				double backNextPageVal = (double)currentPage/limit;
				int backNextpage = ((int)(backNextPageVal-0.9))*limit+1;
				
				double forwardNextPageVal = (double)currentPage/limit;
				int forwardNextpage = ((int)(forwardNextPageVal+0.9))*limit+1;
			/* (((int)((double)currentPage/limit))+0.9)*5-1;  */	
			%>
			<%if(!searchBoolean) {%>
			<!-- <h3>검색 안한 페이징</h3> -->
			<div class="pagingArea" align="center">
				<button onclick="location.href='<%= request.getContextPath()%>/OrderGetAll.or?currentPage=1'"><<</button>
				<%if(currentPage <= 1) { %>
				<button><</button>
				<%} else { 
					if(backNextpage < 1) {%>
						<button onclick="location.href='<%= request.getContextPath()%>/OrderGetAll.or?currentPage=1'"><</button>
				<% 	} else {%>
				
						<button onclick="location.href='<%= request.getContextPath()%>/OrderGetAll.or?currentPage=<%=backNextpage%>'"><</button>
				<%	} %>
				<%} %>
				<%for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
				%>
					<button disabled="disabled"><%=p %></button>
				<%	} else { %>
					<button onclick="location.href='<%= request.getContextPath()%>/OrderGetAll.or?currentPage=<%=p %>'"><%=p %></button>
				<%	} %>	
				<%} %>
				<%if(currentPage >= maxPage){ %>
				<button disabled="disabled">></button>	
				<%} else { 
					if(forwardNextpage > maxPage) {%>
					<button onclick="location.href='<%= request.getContextPath()%>/OrderGetAll.or?currentPage=<%= maxPage%>'">></button>
					<% } else { %>
					<button onclick="location.href='<%= request.getContextPath()%>/OrderGetAll.or?currentPage=<%= forwardNextpage%>'">></button>
					<%} %>
				<%} %> 
				<button onclick="location.href='<%= request.getContextPath()%>/OrderGetAll.or?currentPage=<%=maxPage%>'">>></button>
			</div>
			<%} else {%>
			<!-- <h3>검색한 페이징</h3> -->
			<div class="pagingArea" align="center">
				<button id="firstPage"><<</button>
				<%if(currentPage <= 1) { %>
				<button><</button>
				<%} else { 
					if(backNextpage < 1) {%>
						<button id="firstPage"><</button>
				<% 	} else {%>
				
						<button id="nextPageLeft"><</button>
				<%	} %>
				<%} %>
				<%for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
				%>
					<button disabled="disabled"><%=p %></button>
				<%	} else { %>
					<button id="selectPage" value="<%=p %>"><%=p %></button>
				<%	} %>	
				<%} %>
				<%if(currentPage >= maxPage){ %>
				<button disabled="disabled">></button>	
				<%} else { 
					if(forwardNextpage > maxPage) {%>
					<button id="endPage" >></button>
					<% } else { %>
					<button id="nextPageRight">></button>
					<%} %>
				<%} %> 
				<button id="endPage">>></button>
			</div>
			<%} %>
		</div>	
	</section>
	<%@ include file="/views/admin/common/footer.jsp" %>
	<script type="text/javascript">
		var formObj = $("form[role='search']");
		
		console.log(formObj);
		
		$("#StartPage").on("click", function(){
			$("input[name='currentPage']").val(1);
			console.log($("input[name='currentPage']").val())
			formObj.submit();
		});
		$("#nextPageLeft").on("click", function(){
			$("input[name='currentPage']").val(<%=backNextpage%>);
			console.log($("input[name='currentPage']").val())
			formObj.submit();
		});
		$("#nextPageRight").on("click", function(){
			$("input[name='currentPage']").val(<%= forwardNextpage%>);
			console.log($("input[name='currentPage']").val())
			formObj.submit();
		});
		
		$("#endPage").on("click", function(){
			$("input[name='currentPage']").val(<%= maxPage%>);
			console.log($("input[name='currentPage']").val())
			formObj.submit();
		});
		$("#selectPage").on("click", function(){
			var selectPage = $(this).val();
			console.log(selectPage);
			$("input[name='currentPage']").val(selectPage);
			console.log($("input[name='currentPage']").val())
			formObj.submit();
		});
		
		function dropOut(var no){
			var msgStr = "주문번호 : "+no+" 의 상태를 변경하시겠습니까?";
			var result = window.confirm(msgStr);
			if(result==true){
				
			} else {
				
			}
		}
	</script>
</body>
</html>