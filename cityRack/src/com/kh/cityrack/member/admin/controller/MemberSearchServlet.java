package com.kh.cityrack.member.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberSearchServlet
 */
@WebServlet("/MemberSearch.me")
public class MemberSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gender = request.getParameter("gender");
		System.out.println(gender);
		
		String searchCondition = request.getParameter("searchCondition");
		System.out.println(searchCondition);
		
		if(searchCondition.equals("email")){
			String searchText = request.getParameter("searchText");
			System.out.println(searchText);
			
		}else if(searchCondition.equals("name")){
			String searchText = request.getParameter("searchText");
			System.out.println(searchText);

			
		}else if(searchCondition.equals("birthday")){
			String afterDate = request.getParameter("afterDate");
			String beforeDate = request.getParameter("beforeDate");
			System.out.println(afterDate);
			System.out.println(beforeDate);
			
		}else if(searchCondition.equals("grade")){
			String grade = request.getParameter("grade");
			System.out.println(grade);ff
			
		}else if(searchCondition.equals("enrollDate")){
			String afterDate = request.getParameter("afterDate");
			String beforeDate = request.getParameter("beforeDate");
			System.out.println(afterDate);
			System.out.println(beforeDate);
			
		}else if(searchCondition.equals("status")){
			String status = request.getParameter("status");
			System.out.println(status);
			
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
