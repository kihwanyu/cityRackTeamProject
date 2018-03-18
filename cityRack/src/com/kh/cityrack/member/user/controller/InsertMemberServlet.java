package com.kh.cityrack.member.user.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.member.user.model.service.MemberService;

/**
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet("/insertMember.do")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String pwd = request.getParameter("password");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String bday = request.getParameter("birthday") ;
		DateFormat format = new SimpleDateFormat("yyyyMMdd");
       
       java.util.Date utilDate;
       java.sql.Date sqlBirthday = null;
		try {
			utilDate = format.parse(bday);
			sqlBirthday = new java.sql.Date(utilDate.getTime()); 
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
		
        
		String tel = request.getParameter("phone");
		String mobile = request.getParameter("mobile");
		String zc = request.getParameter("zipcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr = zc + "/" + addr1 +"/" + addr2;
		
		System.out.println("email : "+ email);
		System.out.println("password: " + pwd); 
		System.out.println("name " + name);
		System.out.println("sex : " + sex);
		System.out.println( "birthday :" + bday);
		System.out.println("tel : " + tel);
		System.out.println("mobile " + mobile);
		System.out.println("주소 : " + addr);
		System.out.println("생일 : " + sqlBirthday);
		
		//멤버 객체 생성
		Member m = new Member();
		
		//세터로 값 지정
		m.setM_email(email);
		m.setM_password(pwd);
		m.setM_name(name);
		m.setM_gender(sex);
		m.setM_phone(mobile);
		m.setM_tel(tel);
		m.setM_address(addr);
		m.setM_birthDay(sqlBirthday);
		
		System.out.println(m);
		
		connectEmail(email); //아래 메일 보내는 메소드 실행
		
		//서비스로 전달
		int result = new MemberService().insertMember(m);
				
		System.out.println(result);
		
		
		
				
			//페이지 연결
			String page = "";
				
				if(result>0) {
					page = "views/common/successPage.jsp";
					request.setAttribute("message", "회원 가입에 성공하셨습니다.");
				} else {
					page = "views/user/common/errorPage.jsp";
					request.setAttribute("msg", "회원 가입에 실패하셨습니다.");
				}
				
				RequestDispatcher view = request.getRequestDispatcher(page);
				view.forward(request, response);
		
		
	
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
