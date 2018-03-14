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


<style>
.outer {
	width: 1000px;
	height: 650px;
	background: #132639;
	color: white;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

table {
	border: 1px solid white;
}

.insertArea {
	width: 500px;
	height: 450px;
	margin-left: auto;
	margin-right: auto;
}

#titleImgArea {
	width: 350px;
	height: 200px;
	border: 2px dashed lightgray;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

#titleImgArea:hover, #contentImgArea1, #contentImgArea2,
	#contentImgArea3 {
	cursor: pointer;
}

#contentImgArea1, #contentImgArea2, #contentImgArea3 {
	width: 150px;
	height: 100px;
	border: 2px dashed lightgray;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

.btnArea {
	width: 150px;
	margin-left: auto;
	margin-right: auto;
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
					<h3 class="title">city樂 이용 후기</h3>
				</div>
				<br /> <br />



				<%
					if (loginUser != null) {
				%>

				<div class="outer">
					<br />
					<h2 align="center">사진 게시글 작성 ㅇㅅㅇ</h2>
					<!-- 파일 업로드시에는 액션/메소드말고 encType이라고 하나 더해야 request에 사진도 함께 전송해줌 -->
					<form action="<%=request.getContextPath()%>/insertThumb"
						method="post" encType="multipart/form-data">

						<div class="insertArea">
							<table align="center">
								<tr>
									<td width="100px">제목</td>
									<td colspan="3"><input type="text" size="53" name="title">
									</td>
								</tr>
								<tr>
									<td>대표이미지</td>
									<td colspan="3">
										<!-- 사진을 선택했을때 미리보기 공간 -->
										<div id="titleImgArea">
											<img id="titleImg" width="400" height="200">
										</div>
									</td>
								</tr>
								<tr>
									<td>내용사진</td>
									<td>
										<div id="contentImgArea1">
											<img id="contentImg1" width="120" height="100">
										</div>
									</td>
									<td>
										<div id="contentImgArea2">
											<img id="contentImg2" width="120" height="100">
										</div>
									</td>
									<td>
										<div id="contentImgArea3">
											<img id="contentImg3" width="120" height="100">
										</div>
									</td>
								</tr>
								<tr>
									<td>사진 메모</td>
									<td colspan="3"><textarea name="content" rows="5"
											cols="55" style="resize: none;"></textarea></td>
								</tr>



							</table>
							<div id="fileArea">
								<input type="file" id="thumbnail1" name="thumbnailImg1"
									onchange="LoadImg1(this);"> <input type="file"
									id="thumbnail2" name="thumbnailImg2" onchange="LoadImg2(this);">
								<input type="file" id="thumbnail3" name="thumbnailImg3"
									onchange="LoadImg3(this);"> <input type="file"
									id="thumbnail4" name="thumbnailImg4" onchange="LoadImg4(this);">
							</div>
						</div>
						<br />

						<div class="btnArea">
							<button>취소하기</button>
							<button type="submit">작성완료</button>
						</div>
					</form>
				</div>

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
