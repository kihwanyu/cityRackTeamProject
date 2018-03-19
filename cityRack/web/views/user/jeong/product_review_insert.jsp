<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>

<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
%>

<!DOCTYPE html>
<html lang="en">


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>cityRack_product_review</title>

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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
.outer {
	width: 1000px;
	background: lightyellow;
	color: black;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

#titleImgArea {
	width: 350px;
	height: 200px;
	border: 2px solid orange;
	border-radius: 50px;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

#titleImgArea:hover, #contentImgArea1, #contentImgArea2,
	#contentImgArea3 {
	cursor: pointer;
}

#titleImgArea, #contentImgArea1, #contentImgArea2, #contentImgArea3 {
	width: 145px;
	height: 100px;
	border: 2px solid orange;
	border-radius: 10px;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
	background: white;
}

#contentImgArea1, #contentImgArea2, #contentImgArea3 {
	border-top: none;
}




</style>




</head>

<body>
	<!-- 메인페이지용 메뉴바 -->
	<%@ include file="/views/user/common/menubar_main.jsp"%>


	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="section-title">
					<h3 class="title">city樂 이용 후기작성</h3>
				</div>
				<br /> <br />

				<%
					if (loginUser != null) {
				%>

				<div class="outer">
					<!-- 파일 업로드시에는 액션/메소드말고 encType이라고 하나 더해야 request에 사진도 함께 전송해줌 -->
					<form action="<%=request.getContextPath()%>/insertThumb.tn"
						method="post" encType="multipart/form-data">

						<div class="insertArea">
							<div align="center">
								<img src="<%= request.getContextPath() %>/views/user/jeong/img/review1.png">
							</div>
							<br/>
							<br/>
							<table align="center">
								<tr>
									<td height="40px"><strong>제목</strong></td>
									<td colspan="4">
										<input type="text" size="62" name="title"
											style="resize:none; border:2px solid orange; border-radius: 20px;">
										<input type="hidden" value="<%= loginUser.getM_no() %>" name="mNo">
									</td>
								</tr>
								<tr>
									<td height="40px"><strong>내용</strong></td>
									<td colspan="4">
										<textarea rows="15" cols="64" name="content" 
												style="resize:none; border:2px solid orange; border-radius: 20px;">
										</textarea>
									</td>
								</tr>	
								<tr>
									<td colspan="4" align="right">* 빈 칸을 눌러 사진을 추가해주세요.</td>
								</tr>
								<tr>
									<td><strong>후기<br/>사진</strong></td>
									<td colspan="4">
										<!-- 사진을 선택했을때 미리보기 공간 -->
										<div id="titleImgArea">
											<img id="titleImg" width="440" height="200">
										</div>
									</td>
								</tr>
								<tr>
									<td style="color:white;">후기사진</td>
									<td>
										<div id="contentImgArea1">
											<img id="contentImg1" width="143" height="100" >
										</div>
									</td>
									<td>
										<div id="contentImgArea2">
											<img id="contentImg2" width="143" height="100" >
										</div>
									</td>
									<td>
										<div id="contentImgArea3">
											<img id="contentImg3" width="143" height="100">
										</div>
									</td>
								</tr>

							</table>
							<div id="fileArea" style="display:none;">
								<input type="file" id="thumbnail1" name="thumbnailImg1"	onchange="LoadImg1(this);"> 
								<input type="file" id="thumbnail2" name="thumbnailImg2" onchange="LoadImg2(this);">
								<input type="file" id="thumbnail3" name="thumbnailImg3" onchange="LoadImg3(this);"> 
								<input type="file" id="thumbnail4" name="thumbnailImg4" onchange="LoadImg4(this);">
							</div>
						</div>
						<br/>
						<br/>
						<div align="center">
							<button class="primary-btn" type="reset">취소하기</button>
							<button class="primary-btn" type="submit">작성완료</button>
						</div>
					</form>
				</div>
				<br/>
				<br/>
				<script>
					$(function() {
						/* 전송하기 누르면 div가 아닌 input file 태그가 전송됨 */
						$("#fileArea").hide();

						$("#titleImgArea").click(function() {
							$("#thumbnail1").click();
						});

						$("#contentImgArea1").click(function() {
							$("#thumbnail2").click();
						});

						$("#contentImgArea2").click(function() {
							$("#thumbnail3").click();
						});

						$("#contentImgArea3").click(function() {
							$("#thumbnail4").click();

						});
					});

					/* 전달하고싶은 this에 대한 value값을 전달 */
					function LoadImg1(value) {
						/* 브라우저가 임시로 파일정보를 가지고있을때 (업로드가 되기 전) */
						if (value.files && value.files[0]) {

							var reader = new FileReader();

							reader.onload = function(e) {
								$("#titleImg").attr("src", e.target.result);
							}
							
							// 0번째 파일 읽어오기
							reader.readAsDataURL(value.files[0]);
						}
					}

					function LoadImg2(value) {

						if (value.files && value.files[0]) {

							var reader = new FileReader();

							reader.onload = function(e) {
								$("#contentImg1").attr("src", e.target.result);
							}

							reader.readAsDataURL(value.files[0]);
						}
					}

					function LoadImg3(value) {

						if (value.files && value.files[0]) {

							var reader = new FileReader();

							reader.onload = function(e) {
								$("#contentImg2").attr("src", e.target.result);
							}

							reader.readAsDataURL(value.files[0]);
						}
					}

					function LoadImg4(value) {

						if (value.files && value.files[0]) {

							var reader = new FileReader();

							reader.onload = function(e) {
								$("#contentImg3").attr("src", e.target.result);
							}

							reader.readAsDataURL(value.files[0]);
						}
					}
				</script>

				<%
					} else {

						request.setAttribute("msg", "잘못된 경로의 접근입니다");
						request.getRequestDispatcher("views/user/common/errorPage.jsp").forward(request, response);

					}
				%>



			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->
	<br/>
	<br/>
	<br/>

	<!-- 푸터용 메뉴바 -->
	<%@ include file="footer.jsp"%>

	<!-- jQuery Plugins -->
	<script src="views/user/jeong/js/jquery.min.js"></script>
	<script src="views/user/jeong/js/bootstrap.min.js"></script>
	<script src="views/user/jeong/js/slick.min.js"></script>
	<script src="views/user/jeong/js/nouislider.min.js"></script>
	<script src="views/user/jeong/js/jquery.zoom.min.js"></script>
	<script src="views/user/jeong/js/main.js"></script>
</body>

</html>
