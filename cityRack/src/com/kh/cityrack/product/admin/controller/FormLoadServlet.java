package com.kh.cityrack.product.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.product.admin.model.dto.Pcategory;
import com.kh.cityrack.product.admin.model.dto.Product;
import com.kh.cityrack.product.admin.model.service.PcategoryService;
import com.kh.cityrack.product.admin.model.service.ProductService;

/**
 * Servlet implementation class PcategoryGetAllServlet
 */
@WebServlet("/ProductFormLoad.pr")
public class FormLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormLoadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String formType = request.getParameter("formType");
		
		ArrayList<Pcategory> cList = new PcategoryService().categoryGetAll();
		
		String page = "";
				
		if(cList != null){
			request.setAttribute("cList", cList);
			if(formType.equals("resister")){
				page = "views/admin/admin_productResister.jsp";
			} else if(formType.equals("update")) {
				String pcode = request.getParameter("pcode");
				
				Product p = new ProductService().productGet(pcode);
				
				page = "views/admin/admin_productUpadate.jsp";
			} else {
				
			}
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
