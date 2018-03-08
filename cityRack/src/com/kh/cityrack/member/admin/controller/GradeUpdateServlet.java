package com.kh.cityrack.member.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.member.admin.model.dao.GradeDao;
import com.kh.cityrack.member.admin.model.dto.Grade;
import com.kh.cityrack.member.admin.model.service.GradeService;

/**
 * Servlet implementation class GradeUpdateServlet
 */
@WebServlet("/GradeUpdate.me")
public class GradeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GradeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Grade g = new Grade();
		String gradeName = request.getParameter("gradeName");
		int gradeDiscount = Integer.parseInt(request.getParameter("gradeDiscount"));
		int gradeCode = Integer.parseInt(request.getParameter("gradeCode"));
		
		g.setGradeCode(gradeCode);
		g.setGradeName(gradeName);
		g.setGradeDiscount(gradeDiscount);
		
		int result = new GradeService().gradeUpdate(g);
		
		
		
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
