package com.kh.cityrack.member.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.member.admin.model.service.MemberService;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/MemberUpdate.me")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberCode = Integer.parseInt(request.getParameter("memberCode"));
		String memberStatus = request.getParameter("memberState");
		String withdrawReason = request.getParameter("withdrawReason"); 
		
		
		if(memberStatus.equals("Y")){
			withdrawReason = "--";
		}
			
		
		int result = new MemberService().memberUpdate(memberCode, memberStatus, withdrawReason);
		
		String page = "";
		if(result == 2){
			page = request.getContextPath() + "/MemberGetAll.me";
			response.sendRedirect(page);
			return;
		}else{
			page ="/views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 정보 수정 실패!");
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

}
