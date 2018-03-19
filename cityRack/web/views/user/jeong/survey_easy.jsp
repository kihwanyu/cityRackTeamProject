<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>survey_easy</title>

<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Hind:400,700"
	rel="stylesheet">

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
	<!-- 메인용 메뉴바 -->
	<%@ include file="/views/user/common/menubar_main.jsp" %>

	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
					<div class="col-survey">
						<div class="section-title">
							<h3 class="title">간편설문조사</h3>
							<p>간편한게 체질을 판단합니다. 총 20문항으로, 정확성은 다소 떨어집니다. 정확한 체질판단을 원하시면
								상세 설문조사를 이용해주세요.</p>
						</div>
						<br/>

						<div class="survey_radio">
							<input type="radio" name="q1" id="q1_yes" value="1" checked> 
							<label for="q1_yes">Yes</label> &nbsp;
							<input type="radio" name="q1" id="q1_no" value="0"> 
							<label for="q1_no">No</label> &nbsp;&nbsp; 
							<strong>풍채가좋고 체구가 크다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="q2" id="q2_yes" value="1" checked> 
							<label for="q2_yes">Yes</label> &nbsp; 
							<input type="radio" name="q2" id="q2_no" value="0"> 
							<label for="q2_no">No</label> &nbsp;&nbsp; 
							<strong>해산물을 먹으면 좋지 않다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="q3" id="q3_yes" value="1" checked> 
							<label for="q3_yes">Yes</label> &nbsp; 
							<input type="radio" name="q3" id="q3_no" value="0"> 
							<label for="q3_no">No</label> &nbsp;&nbsp; 
							<strong>인삼을 먹고 불편한 경험이 있다 (두통, 답답함, 열감, 가슴 뜀 등).</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="q4" id="q4_yes" value="1" checked> 
							<label for="q4_yes">Yes</label> &nbsp; 
							<input type="radio" name="q4" id="q4_no" value="0"> 
							<label for="q4_no">No</label> &nbsp;&nbsp; 
							<strong>대변을 자주 본다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="q5" id="q5_yes" value="1" checked> 
							<label for="q5_yes">Yes</label> &nbsp; 
							<input type="radio" name="q5" id="q5_no" value="0"> 
							<label for="q5_no">No</label> &nbsp;&nbsp; 
							<strong>매운 음식을 먹으면 좋지 않다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="q6" id="q6_yes" value="1" checked> 
							<label for="q6_yes">Yes</label> &nbsp; 
							<input type="radio" name="q6" id="q6_no" value="0"> 
							<label for="q6_no">No</label> &nbsp;&nbsp; 
							<strong>닭고기를 먹고 불편한 적이 있다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="q7" id="q7_yes" value="1" checked> 
							<label for="q7_yes">Yes</label> &nbsp; 
							<input type="radio" name="q7" id="q7_no" value="0"> 
							<label for="q7_no">No</label> &nbsp;&nbsp; 
							<strong>성격이 급해 용두사미가 되기 쉽다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="q8" id="q8_yes" value="1" checked> 
							<label for="q8_yes">Yes</label> &nbsp; 
							<input type="radio" name="q8" id="q8_no" value="0"> 
							<label for="q8_no">No</label> &nbsp;&nbsp; 
							<strong>마음이 항상 바쁘다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="q9" id="q9_yes" value="1" checked> 
							<label for="q9_yes">Yes</label> &nbsp; 
							<input type="radio" name="q9" id="q9_no" value="0"> 
							<label for="q9_no">No</label> &nbsp;&nbsp; 
							<strong>땀을 흘리고 나면 피곤하거나 지치는 것 같다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="q10" id="q10_yes" value="1" checked> 
							<label for="q10_yes">Yes</label> &nbsp; 
							<input type="radio" name="q10" id="q10_no" value="0"> 
							<label for="q10_no">No</label> &nbsp;&nbsp; 
							<strong>육식을 먹으면 좋지 않다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="q11" id="q11_yes" value="1" checked> 
							<label for="q11_yes">Yes</label> &nbsp; 
							<input type="radio" name="q11" id="q11_no" value="0"> 
							<label for="q11_no">No</label> &nbsp;&nbsp; 
							<strong>의욕이 지나치면 꼼꼼하고 까다로워진다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="q12" id="q12_yes" value="1" checked> 
							<label for="q12_yes">Yes</label> &nbsp; 
							<input type="radio" name="q12" id="q12_no" value="0"> 
							<label for="q12_no">No</label> &nbsp;&nbsp; 
							<strong>뒷머리 아랫부분이 윗부분보다 나왔다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="q13" id="q13_yes" value="1" checked> 
							<label for="q13_yes">Yes</label> &nbsp; 
							<input type="radio" name="q13" id="q13_no" value="0"> 
							<label for="q13_no">No</label> &nbsp;&nbsp; 
							<strong>광대뼈가 튀어나왔다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="q14" id="q14_yes" value="1" checked> 
							<label for="q14_yes">Yes</label> &nbsp; 
							<input type="radio" name="q14" id="q14_no" value="0"> 
							<label for="q14_no">No</label> &nbsp;&nbsp; 
							<strong>자존심이 강해 맘대로 성취를 못하면 쉽게 흥분하고 분노를 한다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="q15" id="q15_yes" value="1" checked> 
							<label for="q15_yes">Yes</label> &nbsp; 
							<input type="radio" name="q15" id="q15_no" value="0"> 
							<label for="q15_no">No</label> &nbsp;&nbsp; 
							<strong>어깨가 넓고 허리가 가늘며 엉덩이가 나와 몸매가 곱다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="q16" id="q16_yes" value="1" checked> 
							<label for="q16_yes">Yes</label> &nbsp; 
							<input type="radio" name="q16" id="q16_no" value="0"> 
							<label for="q16_no">No</label> &nbsp;&nbsp; 
							<strong>남에게 인색한 편이다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="q17" id="q17_yes" value="1" checked> 
							<label for="q17_yes">Yes</label> &nbsp; 
							<input type="radio" name="q17" id="q17_no" value="0"> 
							<label for="q17_no">No</label> &nbsp;&nbsp; 
							<strong>인삼을 먹고 효과를 보았다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="q18" id="q18_yes" value="1" checked> 
							<label for="q18_yes">Yes</label> &nbsp; 
							<input type="radio" name="q18" id="q18_no" value="0"> 
							<label for="q18_no">No</label> &nbsp;&nbsp; 
							<strong>1주일에 2~3번 변을 봐도 불편하지 않다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="q19" id="q19_yes" value="1" checked> 
							<label for="q19_yes">Yes</label> &nbsp; 
							<input type="radio" name="q19" id="q19_no" value="0"> 
							<label for="q19_no">No</label> &nbsp;&nbsp; 
							<strong>마르고 여윈 모습으로 빼빼하고 가늘다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="q20" id="q20_yes" value="1" checked> 
							<label for="q20_yes">Yes</label> &nbsp; 
							<input type="radio" name="q20" id="q20_no" value="0"> 
							<label for="q20_no">No</label> &nbsp;&nbsp; 
							<strong>보통 량은 과식이 된다 (조금만 더 먹어도 불편하다).</strong>
						</div>
						<br/><br/>
						<form id="result-form" class="clearfix"
								action="<%=request.getContextPath()%>/qResult" method="post">
							<div align="right">
								<input type="text" id="mNo" name="mNo" value="<%= loginUser.getM_no() %>"/>
								<input type="text" id="qResult" name="qResult">
								<button class="primary-btn" type="button" onclick="goResult();">완료</button>
								<button class="primary-btn" type="button" onclick="goMain();">메인으로</button>
							</div>
						</form>
						<script>
						
							function goResult(){
								
								$(function(){
									
									var qResult = "수음";
									
									// 체질결과 담아주기
									document.getElementById("qResult").value = qResult;
									
								});
									
								// question테이블의 Q_8CONSTITUTION에 결과저장을 위해 서블릿으로 보내기려고 submit~~
								$("#result-form").submit();
									
								
							}
								
							function goMain(){
								
								location.href="<%= request.getContextPath()%>";
							}
								
						</script>		
					</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->
	
	<script>
		$(function(){
			var cpwlf = new Array(8);
			for(var i = 0; i < cpwlf.length; i++){
				cpwlf[i] = new Array();
				for(var j = 1; j <= cpwlf[i].length; j++){
					cpwlf[i][j] = $("input[name=q" + j + "]").val();
				}
			}
			
			
		});
	</script>

	<!-- 푸터 -->
	<%@ include file="/views/user/common/footer.jsp" %>
	
	<!--/ 푸터 -->

</body>

</html>
