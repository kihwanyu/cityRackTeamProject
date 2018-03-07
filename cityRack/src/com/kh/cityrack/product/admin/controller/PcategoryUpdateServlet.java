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
 * Servlet implementation class PcategoryUpdateServlet
 */
@WebServlet("/PcategoryUpdate.pr")
public class PcategoryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PcategoryUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category_code = request.getParameter("category_code").trim();
		String category_name = request.getParameter("category_name").trim();
		Pcategory pc = new Pcategory(category_code, category_name);
		
		int result = 0;
		String page = "";
		result = new PcategoryService().categoryUpdate(pc);
		
		if(result > 0){
			ArrayList<Pcategory> cList = new PcategoryService().categoryGetAll();
			request.setAttribute("cList", cList);
			page = "views/admin/admin_categoryList.jsp";
		} else {
			request.setAttribute("msg", "카테고리 업데이트 실패");
			page = "views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
