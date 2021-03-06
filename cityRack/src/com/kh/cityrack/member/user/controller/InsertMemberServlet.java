package com.kh.cityrack.member.user.controller;

import java.io.IOException;
import java.net.URLEncoder;
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
		
		
		
		//서비스로 전달
		int result = new MemberService().insertMember(m);
				
		System.out.println(result);
		
		
			//페이지 연결
			String page = "";
				
				if(result>0) {
					String message = "회원 가입에 성공하셨습니다.";
					String encVal = URLEncoder.encode( message,"UTF-8");
					response.sendRedirect("views/common/successPage.jsp?message="+encVal);
				} else {
					page = "views/common/errorPage.jsp";
					request.setAttribute("msg", "회원 가입에 실패하셨습니다.");
					RequestDispatcher view = request.getRequestDispatcher(page);
					view.forward(request, response);
				}
				
			
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	
	
	
}
