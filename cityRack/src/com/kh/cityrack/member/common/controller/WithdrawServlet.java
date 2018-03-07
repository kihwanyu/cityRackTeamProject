package com.kh.cityrack.member.common.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.member.common.model.service.WithdrawService;

/**
 * Servlet implementation class WithdrawServlet
 */
@WebServlet("/withdraw.do")
public class WithdrawServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WithdrawServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 1. 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
				
		// 2. 객체가져와
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginUser");
				
		// 3. 서비스로 전달
		int result = new WithdrawService().deleteMember(m);
				
		if(result > 0) {
			session.invalidate();
					
			response.sendRedirect("index.jsp");
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
