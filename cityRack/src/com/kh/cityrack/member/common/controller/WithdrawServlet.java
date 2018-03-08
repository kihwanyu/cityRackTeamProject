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
import com.kh.cityrack.member.common.model.dto.Withdraw;
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
		
		
		// 파라미터 꺼내기
		/* 1. 유저번호
		 * 2. 탈퇴사유
		 *  */
		String reason = request.getParameter("w_reason");
				
		// 객체생성  asdsdf
		// 객체에 파라미터로 받아온 두값을 set으로 넣어
		Withdraw w = new Withdraw();
		
		// 서비스 호출
		int result = new WithdrawService().deleteMember(w);
		
		// 페이지
		String page = "";
		if(result > 0) {
			page = "views/user/jeong/myPage_info_unregister2.jsp";
			request.getSession().invalidate();
			response.sendRedirect(page);
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
