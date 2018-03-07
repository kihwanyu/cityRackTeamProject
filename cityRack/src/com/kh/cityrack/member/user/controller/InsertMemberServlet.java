package com.kh.cityrack.member.user.controller;

import java.io.IOException;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.member.user.model.dto.Member;

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
		String bday = request.getParameter("birthday");
		DateFormat format = new SimpleDateFormat("MMMM d, yy", Locale.ENGLISH);
		/*java.util.Date date = format.parse(bday);*/
		/*System.out.println(date);*/ 
		
		String tel = request.getParameter("phone");
		String mobile = request.getParameter("mobile");
		String zc = request.getParameter("zipcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr = addr1 +" " + addr2 + " "+ zc;
		
	/*	System.out.println("email : "+ email);
		System.out.println("password: " + pwd); 
		System.out.println("name " + name);
		System.out.println("sex : " + sex);
		System.out.println( "birthday :" + bday);
		System.out.println("tel : " + tel);
		System.out.println("mobile " + mobile);
		System.out.println("주소 : " + addr);*/
		
		//멤버 객체 생성
		Member m = new Member();
		
		//세터로 값 지정
		m.setM_mail(email);
		m.setM_password(pwd);
		m.setM_name(name);
		m.setM_gender(sex);
		m.setM_phone(mobile);
		m.setM_tel(tel);
		m.setM_address(addr);
		
		
		
		/*M_NO
		C_NO
		M_EMAIL
		M_PASSWORD
		M_NAME
		M_GENDER
		M_BIRTHDAY
		M_ADDRESS
		M_TEL
		M_PHONE
		M_ENROLL_DATE
		M_STATUS*/
		
	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
