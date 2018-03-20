<%@page import="com.kh.cityrack.question.user.model.dto.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.cityrack.member.common.model.dto.Member" %>

<%
	String qResult = ((Member)(session.getAttribute("loginUser"))).getQ_8constitution();
%>

<!DOCTYPE html>
<html lang="en">
<!-- asd --><!-- ads -->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>cityRack_myPage_result</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/views/user/jeong/css/bootstrap.min.css" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/views/user/jeong/css/slick.css" />
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/views/user/jeong/css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/views/user/jeong/css/nouislider.min.css" />

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="<%= request.getContextPath() %>/views/user/jeong/css/font-awesome.min.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/views/user/jeong/css/style.css" />

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

		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<form id="checkout-form" class="clearfix">

					<div class="col-md-12">
						<div class="order-summary clearfix">
							<div class="section-title">
								<h3 class="title">설문조사결과</h3>
							</div>
							<br/>
							<br/>
							<h3 align="center"><%= loginUser.getM_name() %>님의 체질을 알려드립니다!</h3>
							<br/>
							<br/>
							
							<div align="center">
							
								<% 
								
								String qqResult = "목양";
								
								switch(qqResult){ 
								
									case "목양" : %>
									
										<img src="<%= request.getContextPath() %>/views/user/jeong/img/목양표.png" alt="" height="300px">
										<img src="<%= request.getContextPath() %>/views/user/jeong/img/목양.png" alt="" height="300px">
										</div>
							
										<br/>
										<br/>
										<br/>
										<div align="center">
											<h3>목양체질 총 정리</h3>
											<br/>
											
											<pre><br/>1. 건강한 목양체질은 항상 땀이 많으며, 쇠약할 땐 땜을 흘려주면 몸이 가벼워지며 건강해집니다. 
											<br/>2. 폐가 작기에 말하는 것을 피곤하게 생각합니다. 그래서 말을 잘 안 하는 과묵한 사람이 많습니다. 또 작은 폐로 인해 노래를 잘 못하는 음치가 많습니다.
											<br/>3. 보통 풍채가 좋고 체구가 큰 사람이 많습니다. 어깨가 좁고 몸 아래로 갈수록 굵어져서 허리가 가장 큰 것이 특징입니다.
											<br/>4. 채식, 생선을 즐기시거나 육식을 적게 하면, 피곤하고 눈이 아프며 발이 답답하게 됩니다.
											<br/>5. 육식과 온수욕을 즐기게 되면 살이 희고, 채식과 생선을 즐기며 냉수욕을 자주 하게 되면 피부색이 어둡고 검어집니다.
											<br/>6. 평균보다 혈압이 높아야 건강하며 의욕도 왕성합니다.
											<br/>7. 목양체질은 왼쪽 발을 잘 삐며, 왼쪽으로 오는 병이 많습니다.
											</pre>
										</div>
										<br/>
										<br/>	
									
									<% break;
									
									case "목음" : %>
									
									<img src="<%= request.getContextPath() %>/views/user/jeong/img/목음표.png" alt="" height="300px">
									<img src="<%= request.getContextPath() %>/views/user/jeong/img/목음.png" alt="" height="300px">
									</div>
						
									<br/>
									<br/>
									<br/>
									<div align="center">
										<h3>목음체질 총 정리</h3>
										<br/>
										
										<pre><br/>1. 위무력증과 위하수는 이 체질의 독점병이라 할 수 있습니다. 
										<br/>2. 위가 작게 타고 났으므로, 음식은 정말 적게 먹어야 건강합니다. 보통량으로 먹는 것도 과식이 됩니다.
										<br/>3. 건강은 소화와 깊은 관련이 있습니다. 냉한 음식을 섭취하게 되면 위가 더욱 차가워지기에 모든 건강의 악화와 불안의 시작이 됩니다. <br/>그러므로 보리, 돼지고기는 수음체질에 독이 됩니다. 항상 따뜻한 음식을 섭취하고 과식은 피하시길 바랍니다.
										<br/>4. 변이 항상 무르며, 설사를 하면 힘이 빠지게 됩니다.
										<br/>5. 땀을 많이 흘리는 것을 피하십시오.
										<br/>6. 모든 병이 오른쪽에서부터 시작됩니다.
										</pre>
									</div>
									<br/>
									<br/>	
								
								<% break;
									
									case "수양" : %>
									
									<img src="<%= request.getContextPath() %>/views/user/jeong/img/수양표.png" alt="" height="300px">
									<img src="<%= request.getContextPath() %>/views/user/jeong/img/수양.png" alt="" height="300px">
									</div>
						
									<br/>
									<br/>
									<br/>
									<div align="center">
										<h3>수양체질 총 정리</h3>
										<br/>
										
										<pre><br/>1. 위무력증과 위하수는 이 체질의 독점병이라 할 수 있습니다. 
										<br/>2. 위가 작게 타고 났으므로, 음식은 정말 적게 먹어야 건강합니다. 보통량으로 먹는 것도 과식이 됩니다.
										<br/>3. 건강은 소화와 깊은 관련이 있습니다. 냉한 음식을 섭취하게 되면 위가 더욱 차가워지기에 모든 건강의 악화와 불안의 시작이 됩니다. <br/>그러므로 보리, 돼지고기는 수음체질에 독이 됩니다. 항상 따뜻한 음식을 섭취하고 과식은 피하시길 바랍니다.
										<br/>4. 변이 항상 무르며, 설사를 하면 힘이 빠지게 됩니다.
										<br/>5. 땀을 많이 흘리는 것을 피하십시오.
										<br/>6. 모든 병이 오른쪽에서부터 시작됩니다.
										</pre>
									</div>
									<br/>
									<br/>	
								
								<% break;
								
									case "수음" : %>
									
									<img src="<%= request.getContextPath() %>/views/user/jeong/img/수음표.png" alt="" height="300px">
									<img src="<%= request.getContextPath() %>/views/user/jeong/img/수음.png" alt="" height="300px">
									</div>
						
									<br/>
									<br/>
									<br/>
									<div align="center">
										<h3>수음체질 총 정리</h3>
										<br/>
										
										<pre><br/>1. 위무력증과 위하수는 이 체질의 독점병이라 할 수 있습니다. 
										<br/>2. 위가 작게 타고 났으므로, 음식은 정말 적게 먹어야 건강합니다. 보통량으로 먹는 것도 과식이 됩니다.
										<br/>3. 건강은 소화와 깊은 관련이 있습니다. 냉한 음식을 섭취하게 되면 위가 더욱 차가워지기에 모든 건강의 악화와 불안의 시작이 됩니다. <br/>그러므로 보리, 돼지고기는 수음체질에 독이 됩니다. 항상 따뜻한 음식을 섭취하고 과식은 피하시길 바랍니다.
										<br/>4. 변이 항상 무르며, 설사를 하면 힘이 빠지게 됩니다.
										<br/>5. 땀을 많이 흘리는 것을 피하십시오.
										<br/>6. 모든 병이 오른쪽에서부터 시작됩니다.
										</pre>
									</div>
									<br/>
									<br/>	
								
								<% break;
								
									case "금양" : %>
									
									<img src="<%= request.getContextPath() %>/views/user/jeong/img/금양표.png" alt="" height="300px">
									<img src="<%= request.getContextPath() %>/views/user/jeong/img/금양.png" alt="" height="300px">
									</div>
						
									<br/>
									<br/>
									<br/>
									<div align="center">
										<h3>금양체질 총 정리</h3>
										<br/>
										
										<pre><br/>1. 위무력증과 위하수는 이 체질의 독점병이라 할 수 있습니다. 
										<br/>2. 위가 작게 타고 났으므로, 음식은 정말 적게 먹어야 건강합니다. 보통량으로 먹는 것도 과식이 됩니다.
										<br/>3. 건강은 소화와 깊은 관련이 있습니다. 냉한 음식을 섭취하게 되면 위가 더욱 차가워지기에 모든 건강의 악화와 불안의 시작이 됩니다. <br/>그러므로 보리, 돼지고기는 수음체질에 독이 됩니다. 항상 따뜻한 음식을 섭취하고 과식은 피하시길 바랍니다.
										<br/>4. 변이 항상 무르며, 설사를 하면 힘이 빠지게 됩니다.
										<br/>5. 땀을 많이 흘리는 것을 피하십시오.
										<br/>6. 모든 병이 오른쪽에서부터 시작됩니다.
										</pre>
									</div>
									<br/>
									<br/>	
								
								<% break;
								
									case "금음" : %>
									
									<img src="<%= request.getContextPath() %>/views/user/jeong/img/금음표.png" alt="" height="300px">
									<img src="<%= request.getContextPath() %>/views/user/jeong/img/금음.png" alt="" height="300px">
									</div>
						
									<br/>
									<br/>
									<br/>
									<div align="center">
										<h3>금음체질 총 정리</h3>
										<br/>
										
										<pre><br/>1. 위무력증과 위하수는 이 체질의 독점병이라 할 수 있습니다. 
										<br/>2. 위가 작게 타고 났으므로, 음식은 정말 적게 먹어야 건강합니다. 보통량으로 먹는 것도 과식이 됩니다.
										<br/>3. 건강은 소화와 깊은 관련이 있습니다. 냉한 음식을 섭취하게 되면 위가 더욱 차가워지기에 모든 건강의 악화와 불안의 시작이 됩니다. <br/>그러므로 보리, 돼지고기는 수음체질에 독이 됩니다. 항상 따뜻한 음식을 섭취하고 과식은 피하시길 바랍니다.
										<br/>4. 변이 항상 무르며, 설사를 하면 힘이 빠지게 됩니다.
										<br/>5. 땀을 많이 흘리는 것을 피하십시오.
										<br/>6. 모든 병이 오른쪽에서부터 시작됩니다.
										</pre>
									</div>
									<br/>
									<br/>	
								
								<% break;
								
								
									case "토양" : %>
									
									<img src="<%= request.getContextPath() %>/views/user/jeong/img/토양표.png" alt="" height="300px">
									<img src="<%= request.getContextPath() %>/views/user/jeong/img/토양.png" alt="" height="300px">
									</div>
						
									<br/>
									<br/>
									<br/>
									<div align="center">
										<h3>토양체질 총 정리</h3>
										<br/>
										
										<pre><br/>1. 위무력증과 위하수는 이 체질의 독점병이라 할 수 있습니다. 
										<br/>2. 위가 작게 타고 났으므로, 음식은 정말 적게 먹어야 건강합니다. 보통량으로 먹는 것도 과식이 됩니다.
										<br/>3. 건강은 소화와 깊은 관련이 있습니다. 냉한 음식을 섭취하게 되면 위가 더욱 차가워지기에 모든 건강의 악화와 불안의 시작이 됩니다. <br/>그러므로 보리, 돼지고기는 수음체질에 독이 됩니다. 항상 따뜻한 음식을 섭취하고 과식은 피하시길 바랍니다.
										<br/>4. 변이 항상 무르며, 설사를 하면 힘이 빠지게 됩니다.
										<br/>5. 땀을 많이 흘리는 것을 피하십시오.
										<br/>6. 모든 병이 오른쪽에서부터 시작됩니다.
										</pre>
									</div>
									<br/>
									<br/>	
								
								<% break;
								
								
									case "토음" : %>
									
									<img src="<%= request.getContextPath() %>/views/user/jeong/img/토음표.png" alt="" height="300px">
									<img src="<%= request.getContextPath() %>/views/user/jeong/img/토음.png" alt="" height="300px">
									</div>
						
									<br/>
									<br/>
									<br/>
									<div align="center">
										<h3>토음체질 총 정리</h3>
										<br/>
										
										<pre><br/>1. 위무력증과 위하수는 이 체질의 독점병이라 할 수 있습니다. 
										<br/>2. 위가 작게 타고 났으므로, 음식은 정말 적게 먹어야 건강합니다. 보통량으로 먹는 것도 과식이 됩니다.
										<br/>3. 건강은 소화와 깊은 관련이 있습니다. 냉한 음식을 섭취하게 되면 위가 더욱 차가워지기에 모든 건강의 악화와 불안의 시작이 됩니다. <br/>그러므로 보리, 돼지고기는 수음체질에 독이 됩니다. 항상 따뜻한 음식을 섭취하고 과식은 피하시길 바랍니다.
										<br/>4. 변이 항상 무르며, 설사를 하면 힘이 빠지게 됩니다.
										<br/>5. 땀을 많이 흘리는 것을 피하십시오.
										<br/>6. 모든 병이 오른쪽에서부터 시작됩니다.
										</pre>
									</div>
									<br/>
									<br/>	
								
								<% break;
								
								
								
								
								
								
								} 
								
								%>
							
													
							<div align="center">
								<button onclick="history(); return false;" class="primary-btn">설문조사 히스토리</button>
								<button onclick="again(); return false;" class="primary-btn">8체질 설문조사 다시하기</button>
							</div>
							
							<script>
							
								function history(){
									location.href="<%= request.getContextPath() %>/views/user/jeong/myPage_survey_history.jsp";	
								}
								
								function again(){
									location.href="<%= request.getContextPath() %>/views/user/rani/survey.jsp";
								}
							
							</script>
							
							<br/>
							<br/>
						</div>
					</div>
				</form>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
 

		<!-- 푸터 -->
	<%@ include file="/views/user/common/footer.jsp" %>
	
	<!--/ 푸터 -->
	<!-- jQuery Plugins -->
	<script src="<%= request.getContextPath() %>/views/user/jeong/js/jquery.min.js"></script>
	<script src="<%= request.getContextPath() %>/views/user/jeong/views/user/jeong/js/bootstrap.min.js"></script>
	<script src="<%= request.getContextPath() %>/views/user/jeong/views/user/jeong/js/slick.min.js"></script>
	<script src="<%= request.getContextPath() %>/views/user/jeong/views/user/jeong/js/nouislider.min.js"></script>
	<script src="<%= request.getContextPath() %>/views/user/jeong/views/user/jeong/js/jquery.zoom.min.js"></script>
	<script src="<%= request.getContextPath() %>/views/user/jeong/views/user/jeong/js/main.js"></script>
</body>

</html>
l>