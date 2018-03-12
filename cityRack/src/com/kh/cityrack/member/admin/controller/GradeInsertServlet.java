package com.kh.cityrack.member.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.member.admin.model.service.GradeService;

/**
 * Servlet implementation class GradeInsertServlet
 */
@WebServlet("/GradeInsert.me")
public class GradeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GradeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gradeName = request.getParameter("grade_name");
		int gradeDiscount = Integer.parseInt(request.getParameter("grade_discount"));
		
		System.out.println(gradeName);
		System.out.println(gradeDiscount);
		
		int result = new GradeService().gradeInsert(gradeName, gradeDiscount);df
		
		String page = "";
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/GradeGetAll.me");
			return;
			
		}else {
			page = request.getContextPath() + "views/common/errorPage.jsp";
			request.setAttribute("msg", "등급 추가 실패!");
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
