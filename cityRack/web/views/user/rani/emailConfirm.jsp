<%@page import="com.kh.cityrack.member.user.controller.VerifyEmailServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


<%
String email=request.getParameter("email");
// 위에서 작성한 java파일 객체 생성
VerifyEmailServlet emailconfirm = new VerifyEmailServlet();
String authNum=emailconfirm.connectEmail(email);
%>

<form method="post" action="" name="emailcheck">
	<table>
		<tr>
			<th colspan="2">인증번호를 입력하세요.</th>
		</tr>
		<tr>
			<td>
				<input type="text" name="emailconfirm">
			</td>
			<td>
				<input type="button" value="확인" 
                 onclick="confirmemail(emailcheck.emailconfirm.value,
                                                               <%=authNum%>)">
			</td>
		</tr>
	</table>
	<script type="text/javascript">
	function confirmemail(emailconfirm_value, authNum){
	    // 입력한 값이 없거나, 인증코드가 일지하지 않을 경우
		if(!emailconfirm_value || emailconfirm_value != authNum){
			alert('인증에 실패하였습니다.');
			emailconfirm_value="";
			self.close();
	    // 인증코드가 일치하는 경우
		}else if(emailconfirm_value==authNum){
			alert('인증되었습니다.');
			emailconfirm_value="";
			opener.document.getElementById("validateResult").innerHTML = '인증되었습니다.';
			
			self.close();
		
		}
	}

	</script>
</form>
