<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" %>

<% ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>)request.getAttribute("list"); %>


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
<link type="text/css" rel="stylesheet" href="views/user/jeong/css/bootstrap.min.css" />

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="views/user/jeong/css/slick.css" />
<link type="text/css" rel="stylesheet" href="views/user/jeong/css/slick-theme.css" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet" href="views/user/jeong/css/nouislider.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="views/user/jeong/css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="views/user/jeong/css/style.css" />

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
	height: 700px;
	background: #132639;
	color: white;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

.searchArea {
	width: 420px;
	margin-left: auto;
	margin-right: auto;
}

.thumbnailArea {
	margin-left: auto;
	margin-right: auto;
}

.thumb-list {
	width: 220px;
	border: 1px solid white;
	display: inline-block;
	margin: 10px;
	align: center;
}

.thumb-list:hover {
	opacity: 0.5;
	cursor: pointer;
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
					<div class="col-md-qq">
						<div class="order-summary clearfix">

							<!-- 사진리스트를 불러와서 반복출력 -->
							<div class="thumbnailArea" align="center"> 
							
							<% 
								// hmap을 반복하면서 아래 div를 반복생성 
								for(int i = 0; i < list.size(); i++){ 
							
									HashMap<String, Object> hmap = list.get(i);
							%>
								<div class="thumb-list" align="center">
									<div>
										<!-- 히든으로 고유의 boNo를 전해줌 -->
										<input type="hidden" value="<%= hmap.get("bo_no") %>"> 
										<img src="/cityRack/thumbnail_uploadFiles/<%= hmap.get("bf_name") %>"
											width="200px" height="150px">
									</div>
									<p>
										<%= loginUser.getM_name() %>님
										<br/> < 제목 : 
										<%= hmap.get("bo_title") %> >
										<br /> 조회수 :
										<%= hmap.get("bo_hit") %> &nbsp;&nbsp;|&nbsp;&nbsp;
										추천수 :
										<%= hmap.get("bo_recomm") %>
									</p>
								</div>
			
								<% 	} %>
			
							</div>							
						</div>
					</div>
				<br/>
				<br/>
				<br/>
				<div align="right">
				<% if(loginUser != null){ %>
					<button class="primary-btn" onclick="location.href='views/user/jeong/product_review_insert.jsp'">후기작성</button>
				<% } %>	
				</div>
				<br/> 

				<script>
			
					/* 게시글 한개 상세보기 */
					$(document).on("click", ".thumb-list", function(){
						alert("j");
						var num = $(this).children().children().eq(0).val(); /* 즉, 히든인 input의 값 */
						
						location.href="<%= request.getContextPath() %>/selectThumbOne.tn?num=" + num;
					});	
		
				</script>
			</div>


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
