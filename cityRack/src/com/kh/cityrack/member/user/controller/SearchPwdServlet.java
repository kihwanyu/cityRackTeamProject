package com.kh.cityrack.member.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.google.gson.Gson;
import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.member.user.model.service.MemberService;
import com.kh.cityrack.warpper.LoginWrapper;

/**
 * Servlet implementation class SearchPwdServlet
 */
@WebServlet("/searchPwd.do")
public class SearchPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
  


    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//입력한 이름과 이메일을 가지고 온다.
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String key="pwd"; //아이디 찾기와 같은 서비스, Dao를 이용하므로 비밀번호 찾기임을 알려주는 키.
		String alert=""; //보낼 알림 메세지
			
		/*System.out.println("name : "+ name);
		System.out.println("email : " + email);*/
		
		
		//멤버 객체 로그인 유저 생성		
		Member loginUser = new MemberService().checkLoginUser(name, email, key);
		/*System.out.println("가져온 메일 : " + loginUser.getM_email());
		System.out.println("이메일 : " + email);*/
		
		//받아온 loginUser의 값에 따라 보낼 alert 메세지 설정
		//loginUser의 메일과 일치하다면 메일을 보낸다.
		if(loginUser.getM_email().equals(email)) {
		
				String newpd = connectEmail(email); //아래 메일 보내는 메소드 실행
				System.out.println("newpd : " + newpd);
				int mno = loginUser.getM_no();	
				
		
				String encPwd = "";
				try {
					MessageDigest md = MessageDigest.getInstance("SHA-512");
					
					byte[] bytes = newpd.getBytes(Charset.forName("UTF-8"));
					
					md.update(bytes);
					
					encPwd = Base64.getEncoder().encodeToString(md.digest());
					
				} catch (NoSuchAlgorithmException e) {
					e.printStackTrace();
				}
				
				
		
		//비밀번호 새로 만든 것을 수정 서비스, DAO를 통해 수정.
		int result = new MemberService().updateMemberPwd(encPwd, mno);
			
			if(result>0){
				alert = "임시 비밀번호가 메일로 발송되었습니다.";
			} else {
				alert="수정 실패";
			}
			
		} else {
			alert = "해당하는 회원 정보가 없습니다!";			
		}	
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		
		new Gson().toJson(alert, response.getWriter());
		
		
		/*String page = "/views/user/rani/searchIdPwd.jsp";
		request.getRequestDispatcher(page).forward(request, response); */
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	  public String connectEmail(String email){
			String to1=email; // 인증위해 사용자가 입력한 이메일주소
			String host="smtp.gmail.com"; // smtp 서버
			String subject="새로 발급된 비밀번호 입니다."; // 보내는 제목 설정
			String fromName="관리자"; // 보내는 이름 설정
			String from="ctradm119@gmail.com"; // 보내는 사람(구글계정)
			String authNum=authNum(); // 인증번호 위한 난수 발생부분
			String content="새 비밀번호는  ["+authNum+"] 입니다. 반드시 로그인해서 비밀번호를 재설정해주시기 바랍니다."; // 이메일 내용 설정
			
	        // SMTP 이용하기 위해 설정해주는 설정값들
			try{
			Properties props=new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty
	                       ("mail.smtp.socketFactory.class",
	                        "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port","465");
			props.put("mail.smtp.user",from);
			props.put("mail.smtp.auth","true");
			
			Session mailSession 
	           = Session.getInstance(props,new javax.mail.Authenticator(){
				    protected PasswordAuthentication getPasswordAuthentication(){
					    return new PasswordAuthentication
	                                        ("ctradm119@gmail.com","cityrackadmin"); // gmail계정
				}
			});
			
			Message msg = new MimeMessage(mailSession);
			InternetAddress []address1 = {new InternetAddress(to1)};
			msg.setFrom(new InternetAddress
	                      (from, MimeUtility.encodeText(fromName,"utf-8","B")));
			msg.setRecipients(Message.RecipientType.TO, address1); // 받는사람 설정
			msg.setSubject(subject); // 제목설정
			msg.setSentDate(new java.util.Date()); // 보내는 날짜 설정
			msg.setContent(content,"text/html; charset=utf-8"); // 내용설정
			
			Transport.send(msg); // 메일보내기
			}catch(MessagingException e){
				e.printStackTrace();
			}catch(Exception e){
				e.printStackTrace();
			}
			return authNum;
		}

	    // 난수발생 function
		public static String authNum(){
			StringBuffer buffer=new StringBuffer();
			for(int i=0;i<=4;i++){
				int num=(int)(Math.random()*9+1);
				buffer.append(num);
			}
			return buffer.toString();
		}


}
