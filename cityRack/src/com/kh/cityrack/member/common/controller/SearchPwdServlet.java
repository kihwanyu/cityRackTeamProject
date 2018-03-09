package com.kh.cityrack.member.common.controller;

import java.io.IOException;
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


import com.kh.cityrack.member.user.model.dto.Member;
import com.kh.cityrack.member.user.model.service.MemberService;

/**
 * Servlet implementation class SearchPwdServlet
 */
@WebServlet("/searchPwdServlet.em")
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
		String name = request.getParameter("namePwd");
		String email = request.getParameter("emailPwd");
		String key="pwd"; //아이디 찾기와 같은 서비스, Dao를 이용하므로 비밀번호 찾기임을 알려주는 키.
		
			
		
		//멤버 객체 로그인 유저 생성		
		Member loginUser = new MemberService().checkLoginUser(name, email, key);
		
		//받아온 loginUser의 값에 따라 보낼 페이지 설정
		String page = "";
		
		if(loginUser !=null) {
			connectEmail(email); //아래 메일 보내는 메소드 실행
			request.setAttribute("alert", "임시 비밀번호가 발송되었습니다.");
		} else {
			request.setAttribute("alert", "해당하는 회원 정보가 없습니다.");
		}
				
		request.getRequestDispatcher(page).forward(request, response);
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
			String from="구글계정"; // 보내는 사람(구글계정)
			String authNum=authNum(); // 인증번호 위한 난수 발생부분
			String content="새 비밀번호는  ["+authNum+"] 입니다."; // 이메일 내용 설정
			
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
	                                        ("구글계정","계정비밀번호"); // gmail계정
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
