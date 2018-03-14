<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<form action="deliveryInquiry.de" method="post" target="_blank" style="padding-left: 10px;">
	   <div class="form-group">
	       <label for="t_code">택배사 코드</label>
	       <input type="text" class="form-control" name="t_code" id="t_code" placeholder="숫자 두자리" required="" />
	   </div>
	   <div class="form-group">
	       <label for="t_invoice">운송장 번호</label>
	       <input type="text" class="form-control" name="t_invoice" id="t_invoice" placeholder="운송장 번호" required="" />
	   </div>
	   <div class="form-group" style="text-align: center;">
	        <button type="submit" class="btn btn-default">조회하기</button>
	    </div>
	</form>
</body>
</html>