package com.kh.cityrack.product.user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.kh.cityrack.product.user.model.dto.Pcategory;
import com.kh.cityrack.product.user.model.dto.Product;
import com.kh.cityrack.product.user.model.service.PcategoryService;
import com.kh.cityrack.product.user.model.service.ProductService;


/**
 * Servlet implementation class ProductListServlet
 */
@WebServlet("/getProducts.pr")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListServlet() {
        super();     
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Product> pList = null;
		
		pList = new ProductService().selectAllProduct();
		
		System.out.println(pList);
		
		String page = "";
		if(pList !=null) {
			//상품 리스트를 받아 오면 카테고리 리스트를 생성한다.
			//저장된 카테고리를 전부 받아온다.
			ArrayList<Pcategory> cList = new PcategoryService().selectAllCategory();
			
			page = "/views/user/rani/signature.jsp";
			request.setAttribute("pList", pList );
			request.setAttribute("cList", cList);
			
			System.out.println("pList @Servlet : " + pList);
			System.out.println("cList @Servlet : " + cList);
			
		} else {
			page="/views/common/errorPage.jsp";
			request.setAttribute("msg", "상품 리스트 조회 실패");
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
