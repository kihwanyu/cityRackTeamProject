package com.kh.cityrack.member.common.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.member.common.model.service.MemberService;



/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/login.do")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//이메일과 비밀번호를 가져온다.
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Member loginUser = null;
		String page = "";
		
		System.out.println("email : " + email);
		System.out.println("password : " + password);
		
		//Member 클래스를 통해 loginUser 객체 생성
		Member m = new Member();
		m.setM_email(email);
		m.setM_password(password);
		
		//MemberDao login메소드 호출
		loginUser = new MemberService().login(m);
	
		System.out.println(loginUser);
		
		//loginUser가 null 일 경우 error 페이지로 보낸다.
		if(loginUser != null){
			if(loginUser.getC_name().equals("관리자")){
				page = "views/admin/index.jsp";
			} else {
				page = "views/user/jeong/index.jsp"  ;				
			}
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			request.setAttribute("loginUser", loginUser);
			//loginUser의 등급이 관리자일 경우 관리자 페이지로 보낸다.
			//loginUser의 등급이 나머지일 경우 유저 페이지로 보낸다.
			
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("loginUser", loginUser);
		}
	
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
