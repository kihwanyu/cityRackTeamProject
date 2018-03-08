package com.kh.cityrack.member.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.member.admin.model.dto.Grade;
import com.kh.cityrack.member.admin.model.service.GradeService;

/**
 * Servlet implementation class GradeSelectServlet
 */
@WebServlet("/GradeGetAll.me")
public class GradeGetAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GradeGetAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Grade> list = new GradeService().gradeGetAll();
		
		System.out.println(list);
		
		String page = "";
		if(list != null){
			page = "/views/admin/admin_gradeList.jsp";
			request.setAttribute("list", list);
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
