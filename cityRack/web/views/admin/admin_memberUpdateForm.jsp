<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.cityrack.member.admin.model.dto.*"%>
<% Member m = (Member)request.getAttribute("m"); %>    
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
	#memberTable {
		width: 100%;
		height: 100px;
		margin-left: auto;
		margin-right: auto;
	}
	th, td {
		border: 1px solid black;
		padding: 10px;
		font-size: 10px;
	}
	th {
		background: lightgray;
	}
	#withdrawReasonArea{
	  margin-top:20px;
	}
</style>
<title>회원 관리</title>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
	<section>
		
		<div align="center">
			<table id="memberTable" style="width: 75%">
			    <tr>
			      <th colspan="12" style="text-align: center; background:lightyellow" ><h3>회원 상세정보</h3></th>
			    </tr>
				<tr>
					<th width="4%" style="text-align: center;">번호</th>
					<th width="10%" style="text-align: center;">이메일</th>
					<th width="5%" style="text-align: center;">등급</th>
					
					<th width="4%" style="text-align: center;">이름</th>
					<th width="4%" style="text-align: center;">성별</th>
					<th width="7%" style="text-align: center;">생년월일</th>
					<th width="20%" style="text-align: center;">주소</th>
					<th width="7%" style="text-align: center;">전화번호</th>
					<th width="7%" style="text-align: center;">핸드폰번호</th>
					<th width="7%" style="text-align: center;">가입일</th>
					<th width="5%" style="text-align: center;">탈퇴여부</th>
					
				</tr>
					
			</table>	
		</div>
		<div align="center" style="margin-top:10px">
	      <button id="signout" class="btn btn-default" data-toggle="modal" data-target="#signoutModal" display="inline-block">탈퇴처리</button>
	      <button id="rollback" class="btn btn-default" data-toggle="modal" data-target="#rollbackModal" display="inline-block">탈퇴취소</button>
	    </div>  
	    
	    <div id="signoutModal" class="modal fade" role="dialog">
          <div class="modal-dialog modal-sm">

            <!-- Modal content-->
           <div class="modal-content">
            <div class="modal-header" align="center">
              <button type="button" class="close" data-dismiss="modal">&times;</button>              
              <h4 class="modal-title">정말 탈퇴처리하시겠습니까?</h4>            
            </div>
            <div class="modal-body" align="center">
              <button data-toggle="modal" data-target="#signoutModal2" class="btn btn-default" data-dismiss="modal">&nbsp;&nbsp;&nbsp;예&nbsp;&nbsp;&nbsp;</button>
              <button class="btn btn-default" data-dismiss="modal">아니오</button>
            </div>
            
           </div>

         </div>	
        </div>
        
        <div id="rollbackModal" class="modal fade" role="dialog">
          <div class="modal-dialog modal-sm">

            <!-- Modal content-->
           <div class="modal-content">
            <div class="modal-header" align="center">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">정말 탈퇴취소하시겠습니까?</h4>
            </div>
            <div class="modal-body" align="center">
              <button onclick="withdrawer();" class="btn btn-default" data-dismiss="modal">&nbsp;&nbsp;&nbsp;계속&nbsp;&nbsp;&nbsp;</button>
              <button class="btn btn-default" data-dismiss="modal">아니오</button>
            </div>
            
           </div>

         </div>	
        </div>
        
        <div id="signoutModal2" class="modal fade" role="dialog">
          <div class="modal-dialog modal-sm">

            <!-- Modal content-->
           <div class="modal-content">
            <div class="modal-header" align="center">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4>탈퇴 사유를 입력해주세요</h4>
              <textarea class="form-control" rows="5" id="withdrawReasonArea"></textarea>
              
            </div>
            <div class="modal-body" align="center">
              <button onclick="withdrawer();" class="btn btn-default" data-dismiss="modal">&nbsp;&nbsp;&nbsp;계속&nbsp;&nbsp;&nbsp;</button>
              <button class="btn btn-default" data-dismiss="modal">취소</button>
            </div>
            
           </div>

         </div>	
        </div>
        
	</section>
	<%@ include file="/views/admin/common/footer.jsp" %>
	<script>
	$(function(){ 
		var $memberTable = $('#memberTable');
		
		<% if(m != null){%>
		  $tr = $('<tr>');
		  
		  $memberCode = $('<td>').text(<%= m.getM_no()%>);
		  $memberEmail = $('<td>').text('<%= m.getM_email()%>');
		  $gradeName = $('<td>').text('<%= m.getC_name()%>');
		
		  $memberName = $('<td>').text('<%= m.getM_name()%>');
		  $memberGender = $('<td>').text('<%= m.getM_gender()%>');
		  $memberBirthday = $('<td>').text('<%= m.getM_birthDay()%>');
		  $memberAddress = $('<td>').text('<%= m.getM_address()%>');
		  $memberTel = $('<td>').text('<%= m.getM_tel()%>');
		  $memberPhone = $('<td>').text('<%= m.getM_phone()%>');
		  $memberEnrollDate = $('<td>').text('<%= m.getM_enorll_date()%>');
		  $memberState = $('<td>').text('<%= m.getM_status()%>');
		  
		  $tr.append($memberCode);
		  $tr.append($memberEmail);
		  $tr.append($gradeName);
		
		  $tr.append($memberName);
		  $tr.append($memberGender);
		  $tr.append($memberBirthday);
		  $tr.append($memberAddress);
		  $tr.append($memberTel);
		  $tr.append($memberPhone);
		  $tr.append($memberEnrollDate);
		  $tr.append($memberState);
		  
		  $memberTable.append($tr);
		  
		<%}%>
		
		var $memberState = '<%= m.getM_status()%>';
		
		if($memberState === "Y"){
			$('#signout').attr('disabled','disabled');
		}else{
			$('#rollback').attr('disabled','disabled');
		}
		
		
	});
		function withdrawer(){
			
			$withdrawReason = $('#withdrawReasonArea').val();
			$memberCode = '<%= m.getM_no()%>';
			$memberState = '<%= m.getM_status()%>';
			location.href="<%= request.getContextPath()%>/MemberUpdate.me?memberCode=" + $memberCode + "&memberState=" + $memberState + "&withdrawReason=" + $withdrawReason;
		}
	
	</script>
	
</body>
</html>