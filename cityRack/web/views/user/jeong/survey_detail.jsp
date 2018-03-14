<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.cityrack.member.common.model.dto.Member" %>

<%
	//Member loginUser = (Member) session.getAttribute("loginUser");
%>
<!-- sdfs --><!-- sf -->
<!DOCTYPE html>
<html lang="en">
<!-- asd -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>cityRack_survey_detail</title>

<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Hind:400,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="css/slick.css" />
<link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="css/style.css" />

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
							<h3 class="title">상세설문조사</h3>
							<p>총 65문항으로, 디테일하게 체질을 판단합니다. 체질설문조사 특성상 중복된 질문을 포함합니다.
							<br/>언제나(매우)는 5점 / 평소에(상당히)는 4점 / 때로는(조금)은 3점 / 매우적다(약간)은 2점 / 해당없다(원래아님)은 1점을 선택해주세요.
							<br/><br/><strong>보기를 선택하신 후, 단락마다의 확인 버튼을 꼭! 눌러주세요.</strong></p>
						</div>
						<br/>


							<!-- 목양 -->
						<div class="survey_radio">
							<input type="radio" name="dq1" id="q1_very" value="5" checked> 
							<label for="q1_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq1" id="q1_usually" value="4"> 
							<label for="q1_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq1" id="q1_sometimes" value="3"> 
							<label for="q1_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq1" id="q1_little" value="2"> 
							<label for="q1_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq1" id="q1_n/a" value="1"> 
							<label for="q1_n/a">1</label> &nbsp;&nbsp; 
						<strong>포도당 주사를 맞으면 몸이 더욱 안 좋아진다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq2" id="q2_very" value="5" checked> 
							<label for="q2_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq2" id="q2_usually" value="4"> 
							<label for="q2_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq2" id="q2_sometimes" value="3"> 
							<label for="q2_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq2" id="q2_little" value="2"> 
							<label for="q2_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq2" id="q2_n/a" value="1"> 
							<label for="q2_n/a">1</label> &nbsp;&nbsp; 
						<strong>배추나 상추, 양배추, 김치, 시금치 같은 잎채소 반찬만으로 계속 밥을 먹어도 속이 거북하거나 피곤하지않다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq3" id="q3_very" value="5" checked> 
							<label for="q3_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq3" id="q3_usually" value="4"> 
							<label for="q3_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq3" id="q3_sometimes" value="3"> 
							<label for="q3_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq3" id="q3_little" value="2"> 
							<label for="q3_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq3" id="q3_n/a" value="1"> 
							<label for="q3_n/a">1</label> &nbsp;&nbsp; 
						<strong>음식을 가리지 않고 잘 먹으며 별 탈이 없다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq4" id="q4_very" value="5" checked> 
							<label for="q4_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq4" id="q4_usually" value="4"> 
							<label for="q4_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq4" id="q4_sometimes" value="3"> 
							<label for="q4_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq4" id="q4_little" value="2"> 
							<label for="q4_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq4" id="q4_n/a" value="1"> 
							<label for="q4_n/a">1</label> &nbsp;&nbsp; 
						<strong>몸이 아플 때도 식욕이 대개 좋다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq5" id="q5_very" value="5" checked> 
							<label for="q5_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq5" id="q5_usually" value="4"> 
							<label for="q5_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq5" id="q5_sometimes" value="3"> 
							<label for="q5_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq5" id="q5_little" value="2"> 
							<label for="q5_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq5" id="q5_n/a" value="1"> 
							<label for="q5_n/a">1</label> &nbsp;&nbsp; 
						<strong>평소에는 땀이 잘 나다가도 건강이 나빠지면 땀이 좀체 안난다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq6" id="q6_very" value="5" checked> 
							<label for="q6_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq6" id="q6_usually" value="4"> 
							<label for="q6_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq6" id="q6_sometimes" value="3"> 
							<label for="q6_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq6" id="q6_little" value="2"> 
							<label for="q6_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq6" id="q6_n/a" value="1"> 
							<label for="q6_n/a">1</label> &nbsp;&nbsp; 
						<strong>인삼을 먹고 효과를 보았다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq7" id="q7_very" value="5" checked> 
							<label for="q7_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq7" id="q7_usually" value="4"> 
							<label for="q7_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq7" id="q7_sometimes" value="3"> 
							<label for="q7_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq7" id="q7_little" value="2"> 
							<label for="q7_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq7" id="q7_n/a" value="1"> 
							<label for="q7_n/a">1</label> &nbsp;&nbsp; 
						<strong>말을 많이 하면 피곤하다.</strong>
						</div>
						
						<!-- 1번부터 7번까지의 평균값 -->
						<button type="button" class="survey-btn" onclick="test1();">확인</button>
						<input type="text" id="check1" >

						<script>
						
							 function test1(){
								
								var avg1 = 0;
								var sum1 = 0;
								
								 for(var i = 1; i <= 7; i++){ 
									
									var check = $("input[name=dq"+i+"]:checked").val();
									var checkVal = Number(check);

									sum1 += checkVal;
							 	} 
								
								avg1 = sum1/7;
								document.getElementById("check1").value = avg1;
							};		
							
						</script>
						<br/><br/>
						
						<div class="survey_radio">
							<input type="radio" name="dq8" id="q8_very" value="5" checked> 
							<label for="q8_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq8" id="q8_usually" value="4"> 
							<label for="q8_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq8" id="q8_sometimes" value="3"> 
							<label for="q8_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq8" id="q8_little" value="2"> 
							<label for="q8_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq8" id="q8_n/a" value="1"> 
							<label for="q8_n/a">1</label> &nbsp;&nbsp; 
						<strong>풍채가 좋고 체구가 크다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq9" id="q9_very" value="5" checked> 
							<label for="q9_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq9" id="q9_usually" value="4"> 
							<label for="q9_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq9" id="q9_sometimes" value="3"> 
							<label for="q9_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq9" id="q9_little" value="2"> 
							<label for="q9_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq9" id="q9_n/a" value="1"> 
							<label for="q9_n/a">1</label> &nbsp;&nbsp; 
						<strong>해산물을 먹으면 좋지 않다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq10" id="q10_very" value="5" checked> 
							<label for="q10_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq10" id="q10_usually" value="4"> 
							<label for="q10_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq10" id="q10_sometimes" value="3"> 
							<label for="q10_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq10" id="q10_little" value="2"> 
							<label for="q10_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq10" id="q10_n/a" value="1"> 
							<label for="q10_n/a">1</label> &nbsp;&nbsp; 
						<strong>육식을 먹으면 힘이 나는 것 같고 좋다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq11" id="q11_very" value="5" checked> 
							<label for="q11_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq11" id="q11_usually" value="4"> 
							<label for="q11_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq11" id="q11_sometimes" value="3"> 
							<label for="q11_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq11" id="q11_little" value="2"> 
							<label for="q11_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq11" id="q11_n/a" value="1"> 
							<label for="q11_n/a">1</label> &nbsp;&nbsp; 
						<strong>인삼을 먹고 불편한 경험이 있다 (두통, 답답함, 열감, 가슴 뜀 등).</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq12" id="q12_very" value="5" checked> 
							<label for="q12_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq12" id="q12_usually" value="4"> 
							<label for="q12_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq12" id="q12_sometimes" value="3"> 
							<label for="q12_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq12" id="q12_little" value="2"> 
							<label for="q12_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq12" id="q12_n/a" value="1"> 
							<label for="q12_n/a">1</label> &nbsp;&nbsp; 
						<strong>대변을 자주 본다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq13" id="q13_very" value="5" checked> 
							<label for="q13_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq13" id="q13_usually" value="4"> 
							<label for="q13_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq13" id="q13_sometimes" value="3"> 
							<label for="q13_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq13" id="q13_little" value="2"> 
							<label for="q13_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq13" id="q13_n/a" value="1"> 
							<label for="q13_n/a">1</label> &nbsp;&nbsp; 
						<strong>술을 좋아하고 알콜 중독에 빠지기 쉽다.</strong>
						</div>
						
						<!-- 8번부터 13번까지의 평균값 -->
						<button type="button" class="survey-btn" onclick="test2();">확인</button>
						<input type="text" id="check2" >

						<script>
						
							 function test2(){
								
								var avg = 0;
								var sum = 0;
								
								 for(var i = 8; i <= 13; i++){ 
									
									var check = $("input[name=dq"+i+"]:checked").val();
									var checkVal = Number(check);

									sum += checkVal;
							 	} 
								
								avg = sum/6;
								document.getElementById("check2").value = avg;
							};		
							
						</script>
						<br/><br/>
						
						
						
						
						<div class="survey_radio">
							<input type="radio" name="dq14" id="q14_very" value="5" checked> 
							<label for="q14_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq14" id="q14_usually" value="4"> 
							<label for="q14_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq14" id="q14_sometimes" value="3"> 
							<label for="q14_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq14" id="q14_little" value="2"> 
							<label for="q14_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq14" id="q14_n/a" value="1"> 
							<label for="q14_n/a">1</label> &nbsp;&nbsp; 
						<strong>사과를 먹으면 속이 거북하거나 소화가 잘 안된다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq15" id="q15_very" value="5" checked> 
							<label for="q15_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq15" id="q15_usually" value="4"> 
							<label for="q15_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq15" id="q15_sometimes" value="3"> 
							<label for="q15_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq15" id="q15_little" value="2"> 
							<label for="q15_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq15" id="q15_n/a" value="1"> 
							<label for="q15_n/a">1</label> &nbsp;&nbsp; 
						<strong>매운 음식을 먹으면 좋지 않다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq16" id="q16_very" value="5" checked> 
							<label for="q16_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq16" id="q16_usually" value="4"> 
							<label for="q16_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq16" id="q16_sometimes" value="3"> 
							<label for="q16_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq16" id="q16_little" value="2"> 
							<label for="q16_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq16" id="q16_n/a" value="1"> 
							<label for="q16_n/a">1</label> &nbsp;&nbsp; 
						<strong>닭고기를 먹고 불편한 적이 있다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq17" id="q17_very" value="5" checked> 
							<label for="q17_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq17" id="q17_usually" value="4"> 
							<label for="q17_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq17" id="q17_sometimes" value="3"> 
							<label for="q17_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq17" id="q17_little" value="2"> 
							<label for="q17_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq17" id="q17_n/a" value="1"> 
							<label for="q17_n/a">1</label> &nbsp;&nbsp; 
						<strong>어패류를 먹으면 좋고 힘이 나는 것 같다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq18" id="q18_very" value="5" checked> 
							<label for="q18_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq18" id="q18_usually" value="4"> 
							<label for="q18_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq18" id="q18_sometimes" value="3"> 
							<label for="q18_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq18" id="q18_little" value="2"> 
							<label for="q18_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq18" id="q18_n/a" value="1"> 
							<label for="q18_n/a">1</label> &nbsp;&nbsp; 
						<strong>자장면을 먹으면 소스가 묽어져 물로 변한다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq19" id="q19_very" value="5" checked> 
							<label for="q19_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq19" id="q19_usually" value="4"> 
							<label for="q19_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq19" id="q19_sometimes" value="3"> 
							<label for="q19_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq19" id="q19_little" value="2"> 
							<label for="q19_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq19" id="q19_n/a" value="1"> 
							<label for="q19_n/a">1</label> &nbsp;&nbsp; 
						<strong>신경을 쓰면 유독 머리에서 땀이 많이 난다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq20" id="q20_very" value="5" checked> 
							<label for="q20_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq20" id="q20_usually" value="4"> 
							<label for="q20_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq20" id="q20_sometimes" value="3"> 
							<label for="q20_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq20" id="q20_little" value="2"> 
							<label for="q20_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq20" id="q20_n/a" value="1"> 
							<label for="q20_n/a">1</label> &nbsp;&nbsp; 
						<strong>마음이 항상 바쁘며, 성격이 급해 용두사미가 되기 쉽다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq21" id="q21_very" value="5" checked> 
							<label for="q21_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq21" id="q21_usually" value="4"> 
							<label for="q21_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq21" id="q21_sometimes" value="3"> 
							<label for="q21_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq21" id="q21_little" value="2"> 
							<label for="q21_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq21" id="q21_n/a" value="1"> 
							<label for="q21_n/a">1</label> &nbsp;&nbsp; 
						<strong>맥주를 마셔도 설사하지 않는다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq22" id="q22_very" value="5" checked> 
							<label for="q22_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq22" id="q22_usually" value="4"> 
							<label for="q22_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq22" id="q22_sometimes" value="3"> 
							<label for="q22_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq22" id="q22_little" value="2"> 
							<label for="q22_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq22" id="q22_n/a" value="1"> 
							<label for="q22_n/a">1</label> &nbsp;&nbsp; 
						<strong>걸음걸이가 경박하다(빠르다).</strong>
						</div>
						
						<!-- 14번부터 22번까지의 평균값 -->
						<button type="button" class="survey-btn" onclick="test3();">확인</button>
						<input type="text" id="check3" >

						<script>
							 function test3(){
								
								var avg = 0;
								var sum = 0;
								
								 for(var i = 14; i <= 22; i++){ 
									
									var check = $("input[name=dq"+i+"]:checked").val();
									var checkVal = Number(check);

									sum += checkVal;
							 	} 
								
								avg = sum/9;
								document.getElementById("check3").value = avg;
							};		
							
						</script>
						<br/><br/>
						
						<div class="survey_radio">
							<input type="radio" name="dq23" id="q23_very" value="5" checked> 
							<label for="q23_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq23" id="q23_usually" value="4"> 
							<label for="q23_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq23" id="q23_sometimes" value="3"> 
							<label for="q23_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq23" id="q23_little" value="2"> 
							<label for="q23_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq23" id="q23_n/a" value="1"> 
							<label for="q23_n/a">1</label> &nbsp;&nbsp; 
						<strong>고등어를 먹으면 신물이 올라온다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq24" id="q24_very" value="5" checked> 
							<label for="q24_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq24" id="q24_usually" value="4"> 
							<label for="q24_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq24" id="q24_sometimes" value="3"> 
							<label for="q24_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq24" id="q24_little" value="2"> 
							<label for="q24_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq24" id="q24_n/a" value="1"> 
							<label for="q24_n/a">1</label> &nbsp;&nbsp; 
						<strong>얼음을 많이 먹어도 탈이 없다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq25" id="q25_very" value="5" checked> 
							<label for="q25_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq25" id="q25_usually" value="4"> 
							<label for="q25_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq25" id="q25_sometimes" value="3"> 
							<label for="q25_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq25" id="q25_little" value="2"> 
							<label for="q25_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq25" id="q25_n/a" value="1"> 
							<label for="q25_n/a">1</label> &nbsp;&nbsp; 
						<strong>어패류를 먹으면 좋고 힘이 나는 것 같다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq26" id="q26_very" value="5" checked> 
							<label for="q26_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq26" id="q26_usually" value="4"> 
							<label for="q26_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq26" id="q26_sometimes" value="3"> 
							<label for="q26_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq26" id="q26_little" value="2"> 
							<label for="q26_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq26" id="q26_n/a" value="1"> 
							<label for="q26_n/a">1</label> &nbsp;&nbsp; 
						<strong>음식 조절을 안하면 금세 살이 잘 찐다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq27" id="q27_very" value="5" checked> 
							<label for="q27_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq27" id="q27_usually" value="4"> 
							<label for="q27_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq27" id="q27_sometimes" value="3"> 
							<label for="q27_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq27" id="q27_little" value="2"> 
							<label for="q27_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq27" id="q27_n/a" value="1"> 
							<label for="q27_n/a">1</label> &nbsp;&nbsp; 
						<strong>중이염이 잘 낫지 않고 재발한 적이 있다.</strong>
						</div>
						
						
						<!-- 23번부터 27번까지의 평균값 -->
						<button type="button" class="survey-btn" onclick="test4();">확인</button>
						<input type="text" id="check4" >

						<script>
						
							 function test4(){
								
								var avg = 0;
								var sum = 0;
								
								 for(var i = 23; i <= 27; i++){ 
									
									var check = $("input[name=dq"+i+"]:checked").val();
									var checkVal = Number(check);

									sum += checkVal;
							 	} 
								
								avg = sum/5;
								document.getElementById("check4").value = avg;
							};		
							
						</script>
						<br/><br/>
						
						
						
						<div class="survey_radio">
							<input type="radio" name="dq28" id="q28_very" value="5" checked> 
							<label for="q28_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq28" id="q28_usually" value="4"> 
							<label for="q28_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq28" id="q28_sometimes" value="3"> 
							<label for="q28_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq28" id="q28_little" value="2"> 
							<label for="q28_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq28" id="q28_n/a" value="1"> 
							<label for="q28_n/a">1</label> &nbsp;&nbsp; 
						<strong>땅콩이나 호두 등 견과류를 먹으면 설사를 하거나 속이 매우 불편하다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq29" id="q29_very" value="5" checked> 
							<label for="q29_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq29" id="q29_usually" value="4"> 
							<label for="q29_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq29" id="q29_sometimes" value="3"> 
							<label for="q29_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq29" id="q29_little" value="2"> 
							<label for="q29_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq29" id="q29_n/a" value="1"> 
							<label for="q29_n/a">1</label> &nbsp;&nbsp; 
						<strong>커피를 자주 마시면 손이 딸리거나 가슴이 두근거린다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq30" id="q30_very" value="5" checked> 
							<label for="q30_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq30" id="q30_usually" value="4"> 
							<label for="q30_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq30" id="q30_sometimes" value="3"> 
							<label for="q30_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq30" id="q30_little" value="2"> 
							<label for="q30_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq30" id="q30_n/a" value="1"> 
							<label for="q30_n/a">1</label> &nbsp;&nbsp; 
						<strong>식탐이 많아 과식을 하고서 속이 부대끼는 경우가 많다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq31" id="q31_very" value="5" checked> 
							<label for="q31_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq31" id="q31_usually" value="4"> 
							<label for="q31_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq31" id="q31_sometimes" value="3"> 
							<label for="q31_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq31" id="q31_little" value="2"> 
							<label for="q31_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq31" id="q31_n/a" value="1"> 
							<label for="q31_n/a">1</label> &nbsp;&nbsp; 
						<strong>차갑지 않은 우유를 마셔도 속이 불변하고 설사를 한다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq32" id="q32_very" value="5" checked> 
							<label for="q32_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq32" id="q32_usually" value="4"> 
							<label for="q32_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq32" id="q32_sometimes" value="3"> 
							<label for="q32_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq32" id="q32_little" value="2"> 
							<label for="q32_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq32" id="q32_n/a" value="1"> 
							<label for="q32_n/a">1</label> &nbsp;&nbsp; 
						<strong>항상 변비로 고생한다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq33" id="q33_very" value="5" checked> 
							<label for="q33_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq33" id="q33_usually" value="4"> 
							<label for="q33_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq33" id="q33_sometimes" value="3"> 
							<label for="q33_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq33" id="q33_little" value="2"> 
							<label for="q33_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq33" id="q33_n/a" value="1"> 
							<label for="q33_n/a">1</label> &nbsp;&nbsp; 
						<strong>대부분의 육식을 싫어하고 잘 먹지 않는다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq34" id="q34_very" value="5" checked> 
							<label for="q34_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq34" id="q34_usually" value="4"> 
							<label for="q34_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq34" id="q34_sometimes" value="3"> 
							<label for="q34_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq34" id="q34_little" value="2"> 
							<label for="q34_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq34" id="q34_n/a" value="1"> 
							<label for="q34_n/a">1</label> &nbsp;&nbsp; 
						<strong>목욕탕에서 땀을 빼면 매우 어지럽다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq35" id="q35_very" value="5" checked> 
							<label for="q35_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq35" id="q35_usually" value="4"> 
							<label for="q35_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq35" id="q35_sometimes" value="3"> 
							<label for="q35_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq35" id="q35_little" value="2"> 
							<label for="q35_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq35" id="q35_n/a" value="1"> 
							<label for="q35_n/a">1</label> &nbsp;&nbsp; 
						<strong>마취 후 잘 깨어나지 못한 적이 있다 (또는 마취가 잘 안된다).</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq36" id="q36_very" value="5" checked> 
							<label for="q36_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq36" id="q36_usually" value="4"> 
							<label for="q36_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq36" id="q36_sometimes" value="3"> 
							<label for="q36_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq36" id="q36_little" value="2"> 
							<label for="q36_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq36" id="q36_n/a" value="1"> 
							<label for="q36_n/a">1</label> &nbsp;&nbsp; 
						<strong>뒷머리 아랫부분이 윗부분보다 나왔다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq37" id="q37_very" value="5" checked> 
							<label for="q37_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq37" id="q37_usually" value="4"> 
							<label for="q37_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq37" id="q37_sometimes" value="3"> 
							<label for="q37_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq37" id="q37_little" value="2"> 
							<label for="q37_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq37" id="q37_n/a" value="1"> 
							<label for="q37_n/a">1</label> &nbsp;&nbsp; 
						<strong>의욕이 지나치면 꼼꼼하고 까다로워진다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq38" id="q38_very" value="5" checked> 
							<label for="q38_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq38" id="q38_usually" value="4"> 
							<label for="q38_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq38" id="q38_sometimes" value="3"> 
							<label for="q38_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq38" id="q38_little" value="2"> 
							<label for="q38_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq38" id="q38_n/a" value="1"> 
							<label for="q38_n/a">1</label> &nbsp;&nbsp; 
						<strong>약을 써도 효과가 잘 없고 오히려 몸이 안좋아진다.</strong>
						</div>
						
						<!-- 28번부터 38번까지의 평균값 -->
						<button type="button" class="survey-btn" onclick="test5();">확인</button>
						<input type="text" id="check5" >

						<script>
						
							 function test5(){
								
								var avg = 0;
								var sum = 0;
								
								 for(var i = 28; i <= 38; i++){ 
									
									var check = $("input[name=dq"+i+"]:checked").val();
									var checkVal = Number(check);

									sum += checkVal;
							 	} 
								
								avg = sum/11;
								document.getElementById("check5").value = avg;
							};		
							
						</script>
						<br/><br/>
						
						
						
						<div class="survey_radio">
							<input type="radio" name="dq39" id="q39_very" value="5" checked> 
							<label for="q39_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq39" id="q39_usually" value="4"> 
							<label for="q39_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq39" id="q39_sometimes" value="3"> 
							<label for="q39_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq39" id="q39_little" value="2"> 
							<label for="q39_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq39" id="q39_n/a" value="1"> 
							<label for="q39_n/a">1</label> &nbsp;&nbsp; 
						<strong>땀을 흘리고 나면 피곤하거나 지치는 것 같다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq40" id="q40_very" value="5" checked> 
							<label for="q40_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq40" id="q40_usually" value="4"> 
							<label for="q40_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq40" id="q40_sometimes" value="3"> 
							<label for="q40_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq40" id="q40_little" value="2"> 
							<label for="q40_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq40" id="q40_n/a" value="1"> 
							<label for="q40_n/a">1</label> &nbsp;&nbsp; 
						<strong>육식을 먹으면 좋지 않다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq41" id="q41_very" value="5" checked> 
							<label for="q41_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq41" id="q41_usually" value="4"> 
							<label for="q41_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq41" id="q41_sometimes" value="3"> 
							<label for="q41_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq41" id="q41_little" value="2"> 
							<label for="q41_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq41" id="q41_n/a" value="1"> 
							<label for="q41_n/a">1</label> &nbsp;&nbsp; 
						<strong>닭고기를 먹고 불편한 적이 있다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq42" id="q42_very" value="5" checked> 
							<label for="q42_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq42" id="q42_usually" value="4"> 
							<label for="q42_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq42" id="q42_sometimes" value="3"> 
							<label for="q42_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq42" id="q42_little" value="2"> 
							<label for="q42_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq42" id="q42_n/a" value="1"> 
							<label for="q42_n/a">1</label> &nbsp;&nbsp; 
						<strong>돼지고기를 먹고 불편한 적이 있다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq43" id="q43_very" value="5" checked> 
							<label for="q43_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq43" id="q43_usually" value="4"> 
							<label for="q43_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq43" id="q43_sometimes" value="3"> 
							<label for="q43_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq43" id="q43_little" value="2"> 
							<label for="q43_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq43" id="q43_n/a" value="1"> 
							<label for="q43_n/a">1</label> &nbsp;&nbsp; 
						<strong>어패류를 먹으면 좋고 힘이 나는 것 같다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq44" id="q44_very" value="5" checked> 
							<label for="q44_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq44" id="q44_usually" value="4"> 
							<label for="q44_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq44" id="q44_sometimes" value="3"> 
							<label for="q44_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq44" id="q44_little" value="2"> 
							<label for="q44_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq44" id="q44_n/a" value="1"> 
							<label for="q44_n/a">1</label> &nbsp;&nbsp; 
						<strong>고추, 후추, 파가 들어간 음식을 먹으면 불편하다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq45" id="q45_very" value="5" checked> 
							<label for="q45_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq45" id="q45_usually" value="4"> 
							<label for="q45_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq45" id="q45_sometimes" value="3"> 
							<label for="q45_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq45" id="q45_little" value="2"> 
							<label for="q45_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq45" id="q45_n/a" value="1"> 
							<label for="q45_n/a">1</label> &nbsp;&nbsp; 
						<strong>인삼을 먹고 불편한 경험이 있다 (두통, 답답함, 열감, 가슴 뜀 등).</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq46" id="q46_very" value="5" checked> 
							<label for="q46_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq46" id="q46_usually" value="4"> 
							<label for="q46_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq46" id="q46_sometimes" value="3"> 
							<label for="q46_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq46" id="q46_little" value="2"> 
							<label for="q46_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq46" id="q46_n/a" value="1"> 
							<label for="q46_n/a">1</label> &nbsp;&nbsp; 
						<strong>광대뼈가 튀어나왔다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq47" id="q47_very" value="5" checked> 
							<label for="q47_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq47" id="q47_usually" value="4"> 
							<label for="q47_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq47" id="q47_sometimes" value="3"> 
							<label for="q47_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq47" id="q47_little" value="2"> 
							<label for="q47_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq47" id="q47_n/a" value="1"> 
							<label for="q47_n/a">1</label> &nbsp;&nbsp; 
						<strong>화를 잘 낸다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq48" id="q48_very" value="5" checked> 
							<label for="q48_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq48" id="q48_usually" value="4"> 
							<label for="q48_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq48" id="q48_sometimes" value="3"> 
							<label for="q48_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq48" id="q48_little" value="2"> 
							<label for="q48_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq48" id="q48_n/a" value="1"> 
							<label for="q48_n/a">1</label> &nbsp;&nbsp; 
						<strong>자존심이 강해 맘대로 성취를 못하면 쉽게 흥분하고 분노를 한다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq49" id="q49_very" value="5" checked> 
							<label for="q49_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq49" id="q49_usually" value="4"> 
							<label for="q49_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq49" id="q49_sometimes" value="3"> 
							<label for="q49_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq49" id="q49_little" value="2"> 
							<label for="q49_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq49" id="q49_n/a" value="1"> 
							<label for="q49_n/a">1</label> &nbsp;&nbsp; 
						<strong>대변이 가늘며 시원치 않다.</strong>
						</div>
						
						<!-- 39번부터 49번까지의 평균값 -->
						<button type="button" class="survey-btn" onclick="test6();">확인</button>
						<input type="text" id="check6" >

						<script>
						
							 function test6(){
								
								var avg = 0;
								var sum = 0;
								
								 for(var i = 39; i <= 49; i++){ 
									
									var check = $("input[name=dq"+i+"]:checked").val();
									var checkVal = Number(check);

									sum += checkVal;
							 	} 
								
								avg = sum/11;
								document.getElementById("check6").value = avg;
							};		
							
						</script>
						<br/><br/>
						
						
						
						<div class="survey_radio">
							<input type="radio" name="dq50" id="q50_very" value="5" checked> 
							<label for="q50_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq50" id="q50_usually" value="4"> 
							<label for="q50_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq50" id="q50_sometimes" value="3"> 
							<label for="q50_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq50" id="q50_little" value="2"> 
							<label for="q50_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq50" id="q50_n/a" value="1"> 
							<label for="q50_n/a">1</label> &nbsp;&nbsp; 
						<strong>평소 적게 먹어도 허기지거나 기운이 달리지 않는다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq51" id="q51_very" value="5" checked> 
							<label for="q51_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq51" id="q51_usually" value="4"> 
							<label for="q51_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq51" id="q51_sometimes" value="3"> 
							<label for="q51_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq51" id="q51_little" value="2"> 
							<label for="q51_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq51" id="q51_n/a" value="1"> 
							<label for="q51_n/a">1</label> &nbsp;&nbsp; 
						<strong>병나거나 몸이 좋지 않을 때, 식욕이 뚝 떨어진다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq52" id="q52_very" value="5" checked> 
							<label for="q52_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq52" id="q52_usually" value="4"> 
							<label for="q52_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq52" id="q52_sometimes" value="3"> 
							<label for="q52_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq52" id="q52_little" value="2"> 
							<label for="q52_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq52" id="q52_n/a" value="1"> 
							<label for="q52_n/a">1</label> &nbsp;&nbsp;  
						<strong>생굴을 먹으면 배탈이 난다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq53" id="q53_very" value="5" checked> 
							<label for="q53_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq53" id="q53_usually" value="4"> 
							<label for="q53_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq53" id="q53_sometimes" value="3"> 
							<label for="q53_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq53" id="q53_little" value="2"> 
							<label for="q53_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq53" id="q53_n/a" value="1"> 
							<label for="q53_n/a">1</label> &nbsp;&nbsp;  
						<strong>강한 운동을 해도 땀이 거의 없다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq54" id="q54_very" value="5" checked> 
							<label for="q54_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq54" id="q54_usually" value="4"> 
							<label for="q54_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq54" id="q54_sometimes" value="3"> 
							<label for="q54_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq54" id="q54_little" value="2"> 
							<label for="q54_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq54" id="q54_n/a" value="1"> 
							<label for="q54_n/a">1</label> &nbsp;&nbsp;  
						<strong>옻닭을 먹고 몸이 많이 좋아졌다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq55" id="q55_very" value="5" checked> 
							<label for="q55_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq55" id="q55_usually" value="4"> 
							<label for="q55_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq55" id="q55_sometimes" value="3"> 
							<label for="q55_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq55" id="q55_little" value="2"> 
							<label for="q55_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq55" id="q55_n/a" value="1"> 
							<label for="q55_n/a">1</label> &nbsp;&nbsp;  
						<strong>인삼을 먹고 효과를 보았다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq56" id="q56_very" value="5" checked> 
							<label for="q56_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq56" id="q56_usually" value="4"> 
							<label for="q56_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq56" id="q56_sometimes" value="3"> 
							<label for="q56_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq56" id="q56_little" value="2"> 
							<label for="q56_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq56" id="q56_n/a" value="1"> 
							<label for="q56_n/a">1</label> &nbsp;&nbsp;  
						<strong>1주일에 2~3번 변을 봐도 불편하지 않다.</strong>
						</div>
						
						
						<!-- 50번부터 56번까지의 평균값 -->
						<button type="button" class="survey-btn" onclick="test7();">확인</button>
						<input type="text" id="check7" >

						<script>
						
							 function test7(){
								
								var avg = 0;
								var sum = 0;
								
								 for(var i = 50; i <= 56; i++){ 
									
									var check = $("input[name=dq"+i+"]:checked").val();
									var checkVal = Number(check);

									sum += checkVal;
							 	} 
								
								avg = sum/7;
								document.getElementById("check7").value = avg;
							};		
							
						</script>
						<br/><br/>
						
						
						<div class="survey_radio">
							<input type="radio" name="dq57" id="q57_very" value="5" checked> 
							<label for="q57_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq57" id="q57_usually" value="4"> 
							<label for="q57_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq57" id="q57_sometimes" value="3"> 
							<label for="q57_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq57" id="q57_little" value="2"> 
							<label for="q57_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq57" id="q57_n/a" value="1"> 
							<label for="q57_n/a">1</label> &nbsp;&nbsp; 
						<strong>어깨가 넓고 허리가 가늘며 엉덩이가 나와 몸매가 곱다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq58" id="q58_very" value="5" checked> 
							<label for="q58_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq58" id="q58_usually" value="4"> 
							<label for="q58_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq58" id="q58_sometimes" value="3"> 
							<label for="q58_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq58" id="q58_little" value="2"> 
							<label for="q58_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq58" id="q58_n/a" value="1"> 
							<label for="q58_n/a">1</label> &nbsp;&nbsp; 
						<strong>남에게 인색한 편이다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq59" id="q59_very" value="5" checked> 
							<label for="q59_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq59" id="q59_usually" value="4"> 
							<label for="q59_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq59" id="q59_sometimes" value="3"> 
							<label for="q59_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq59" id="q59_little" value="2"> 
							<label for="q59_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq59" id="q59_n/a" value="1"> 
							<label for="q59_n/a">1</label> &nbsp;&nbsp;  
						<strong>땀을 흘리고 나면 피곤하거나 지치는 것 같다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq60" id="q60_very" value="5" checked> 
							<label for="q60_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq60" id="q60_usually" value="4"> 
							<label for="q60_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq60" id="q60_sometimes" value="3"> 
							<label for="q60_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq60" id="q60_little" value="2"> 
							<label for="q60_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq60" id="q60_n/a" value="1"> 
							<label for="q60_n/a">1</label> &nbsp;&nbsp;  
						<strong>돼지고기를 먹고 불편한 적이 있다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq61" id="q61_very" value="5" checked> 
							<label for="q61_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq61" id="q61_usually" value="4"> 
							<label for="q61_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq61" id="q61_sometimes" value="3"> 
							<label for="q61_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq61" id="q61_little" value="2"> 
							<label for="q61_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq61" id="q61_n/a" value="1"> 
							<label for="q61_n/a">1</label> &nbsp;&nbsp;  
						<strong>인삼을 먹고 효과를 보았다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq62" id="q62_very" value="5" checked> 
							<label for="q62_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq62" id="q62_usually" value="4"> 
							<label for="q62_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq62" id="q62_sometimes" value="3"> 
							<label for="q62_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq62" id="q62_little" value="2"> 
							<label for="q62_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq62" id="q62_n/a" value="1"> 
							<label for="q62_n/a">1</label> &nbsp;&nbsp;  
						<strong>맥주를 마시면 십중팔구는 설사를 한다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq63" id="q63_very" value="5" checked> 
							<label for="q62_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq63" id="q63_usually" value="4"> 
							<label for="q62_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq63" id="q63_sometimes" value="3"> 
							<label for="q62_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq63" id="q63_little" value="2"> 
							<label for="q62_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq63" id="q63_n/a" value="1"> 
							<label for="q62_n/a">1</label> &nbsp;&nbsp;  
						<strong>마르고 여윈 모습으로 빼빼하고 가늘다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq64" id="q64_very" value="5" checked> 
							<label for="q64_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq64" id="q64_usually" value="4"> 
							<label for="q64_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq64" id="q64_sometimes" value="3"> 
							<label for="q64_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq64" id="q64_little" value="2"> 
							<label for="q64_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq64" id="q64_n/a" value="1"> 
							<label for="q64_n/a">1</label> &nbsp;&nbsp;  
						<strong>설사 후 힘이 빠진다.</strong>
						</div>
						<div class="survey_radio">
							<input type="radio" name="dq65" id="q65_very" value="5" checked> 
							<label for="q65_very">5</label> &nbsp;&nbsp;
							<input type="radio" name="dq65" id="q65_usually" value="4"> 
							<label for="q65_usually">4</label> &nbsp;&nbsp;
							<input type="radio" name="dq65" id="q65_sometimes" value="3"> 
							<label for="q65_sometimes">3</label> &nbsp;&nbsp;
							<input type="radio" name="dq65" id="q65_little" value="2"> 
							<label for="q65_little">2</label> &nbsp;&nbsp;
							<input type="radio" name="dq65" id="q65_n/a" value="1"> 
							<label for="q65_n/a">1</label> &nbsp;&nbsp;  
						<strong>보통 량은 과식이 된다 (조금만 더 먹어도 불편하다).</strong>
						</div>
						
						
						<!-- 57번부터 65번까지의 평균값 -->
						<button type="button" class="survey-btn" onclick="test8();">확인</button>
						<input type="text" id="check8" >

						<script>
						
							 function test8(){
								
								var avg = 0;
								var sum = 0;
								
								 for(var i = 57; i <= 65; i++){ 
									
									var check = $("input[name=dq"+i+"]:checked").val();
									var checkVal = Number(check);

									sum += checkVal;
							 	} 
								
								avg = sum/9;
								document.getElementById("check8").value = avg;
							};		
							
						</script>
						<br/><br/>
						<form id="result-form" class="clearfix"
								action="<%=request.getContextPath()%>/8result" method="post">
							<div align="right">
								<input type="text" id="mNo" name="mNo" value="<%= loginUser.getM_no() %>"/>
								<input type="text" id="conResult" name="conResult">
								<button class="primary-btn" type="button" onclick="goResult();">완료</button>
								<button class="primary-btn" type="button" onclick="goMain();">메인으로</button>
							</div>
						</form>
						<script>
							function goResult(){
								
								// 8개의 평균값 비교하고 해당 체질명 구해서 결과를 result에 저장
								$(function(){
									
									var check1 = $("#check1").val();
									var check2 = $("#check2").val();
									var check3 = $("#check3").val();
									var check4 = $("#check4").val();
									var check5 = $("#check5").val();
									var check6 = $("#check6").val();
									var check7 = $("#check7").val();
									var check8 = $("#check8").val();
									var conResult = "";
									
									var arr = [check1, check2, check3, check4,
													check5, check6, check7, check8];
	
									console.log(arr);
									console.log(check1);
									var max = 0;

									for (var i = 0; i < arr.length; i++) {

										if (arr[i] > max) {
											max = arr[i];
										}
									}
									console.log	("가장 큰 수는 : " + max);
									
									switch(max){
									case check1 : conResult = "목양"; break;
									case check2 : conResult = "목음"; break;
									case check3 : conResult = "토양"; break;
									case check4 : conResult = "토음"; break;
									case check5 : conResult = "금양"; break;
									case check6 : conResult = "금음"; break;
									case check7 : conResult = "수양"; break;
									case check8 : conResult = "수음"; break;
									}
									
									console.log("체질결과 : " + conResult);
									
									// 체질결과 담아주기
									document.getElementById("conResult").value = conResult;
									
								});
								

								// question테이블의 Q_8CONSTITUTION에 결과저장을 위해 서블릿으로 보내기려고 submit~~
								$("#result-form").submit();
								
								<%-- location.href="<%= request.getContextPath() %>/views/user/jeong/myPage_cs.jsp?사랑해="+ "사랑해"; --%>
								
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
