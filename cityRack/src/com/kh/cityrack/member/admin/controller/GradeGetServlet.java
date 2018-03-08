package com.kh.cityrack.member.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.member.admin.model.dto.Grade;
import com.kh.cityrack.member.admin.model.service.GradeService;

/**
 * Servlet implementation class GradeGetServlet
 */
@WebServlet({ "/GradeGetServlet", "/GradeGet.me" })
public class GradeGetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GradeGetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		Grade g = new GradeService().gradeGet(num);
		
		String page = "";
		if(g != null){
			page = "/views/admin/admin_gradeUpdateForm.jsp";
			request.setAttribute("g", g);
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 불러오기 실패!");
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
