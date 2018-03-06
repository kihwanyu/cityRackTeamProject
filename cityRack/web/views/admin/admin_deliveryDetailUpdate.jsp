<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	@import url("css/common.css");
	table {
		border: 1px solid black;
		text-align: center;
		border-collapse: collapse;
		
	}	
	.tableArea {
		width: 100%;
		height: 700px;
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
</style>
<title>회원 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>
		<div class="tableArea" align="center">
		<h2>배송 상세 수정</h2><br>
			<table style="width: 30%;">
				<tr>
					<th width="50%" style="text-align: center; background: lightyellow">주문번호</th>
					<th width="50%" style="text-align: center; background: lightyellow">100000</th>
				</tr>
			</table>
			<br>
			<br>
			<table style="width: 40%">
				<tr>
					<td width="15%" style="text-align: center;">배송번호</td>
					<td width="35%" style="text-align: center;">100001</td>
					<td width="15%" style="text-align: center;">운송장번호</td>
					<td width="35%" style="text-align: center;">
						<input class="form-control" type="text" value="1000043241">
					</td>
				</tr>
				<tr>
					<td colspan="1" style="text-align: center;">수취인</td>
					<td colspan="3" style="text-align: center;">
						<input class="form-control" type="text" maxlength="5">
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">전화번호</td>
					<td style="text-align: center;">
						<input type="tel" class="form-control">
					</td>
					<td style="text-align: center;">핸드폰</td>
					<td style="text-align: center;">
						<input type="tel" class="form-control">
					</td> 
				</tr>
				<tr>
					<td rowspan="3" style="text-align: left;">주소</td>
					<td style="text-align: left;" colspan="2" style="border: none;">
						<input class="form-control" type="text" id="sample6_postcode" placeholder="우편번호" style="margin: 5px;" size="8">
						
					</td>
					<td>
						<input type="button" class="btn btn-primary btn-block" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="margin: 5px;">
					</td>
				</tr>
				<tr>
					<td style="text-align: left;" colspan="4">
						<input class="form-control" type="text" id="sample6_address" placeholder="주소" style="margin: 5px;" size="40">
					</td>
				</tr>
				<tr>
					<td style="text-align: left;" colspan="4">
						<input class="form-control" type="text" id="sample6_address2" placeholder="상세주소" style="margin: 5px;" size="40">
					</td>
				</tr>
				<tr>
					<td style="text-align: left;">메세지</td>
					<td style="text-align: left;" colspan="4">
					<textarea class="form-control" rows="5" style="resize: none; margin-left: auto; margin-right: auto;"></textarea>
					</td>
				</tr>
			</table>	
			<div align="center">
				<br>
				<button class="btn btn-primary active" style="height: 50px; width: 100px;" onclick="">저장하기</button>
			</div>
		</div>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
		    function sample6_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var fullAddr = ''; // 최종 주소 변수
		                var extraAddr = ''; // 조합형 주소 변수
		
		                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    fullAddr = data.roadAddress;
		
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    fullAddr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
		                if(data.userSelectedType === 'R'){
		                    //법정동명이 있을 경우 추가한다.
		                    if(data.bname !== ''){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있을 경우 추가한다.
		                    if(data.buildingName !== ''){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
		                document.getElementById('sample6_address').value = fullAddr;
		
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById('sample6_address2').focus();
		            }
		        }).open();
		    }
		</script>
	</section>
	<%@ include file="/views/admin/common/footer.jsp" %>
</body>
</html>