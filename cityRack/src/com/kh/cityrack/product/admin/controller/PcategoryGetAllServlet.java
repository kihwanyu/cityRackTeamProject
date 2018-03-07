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
 * Servlet implementation class PcategoryGetAllServlet
 */
@WebServlet("/categoryGetAll.pr")
public class PcategoryGetAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PcategoryGetAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Pcategory> cList = new PcategoryService().categoryGetAll();
		
		String page = "";
		
		System.out.println(cList);
		
		if(cList != null){
			request.setAttribute("cList", cList);
			page = "views/admin/admin_categoryList.jsp";
		} else {
			request.setAttribute("msg", "카테고리 리스트 조회 실패");
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
