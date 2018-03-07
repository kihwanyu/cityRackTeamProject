package com.kh.cityrack.product.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.product.admin.model.dto.Pcategory;
import com.kh.cityrack.product.admin.model.service.PcategoryService;

/**
 * Servlet implementation class PcategoryInsertServlet
 */
@WebServlet("/PcategoryInsert.pr")
public class PcategoryInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PcategoryInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category_name = request.getParameter("category_name");
		
		String page = "";
		int result = 0;
		
		result = new PcategoryService().categoryInsert(category_name);
		
		if(result > 0){
			response.sendRedirect(request.getContextPath()+"/categoryGetAll.pr");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "카테고리 추가 실패");
			request.getRequestDispatcher(page).forward(request, response);
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
