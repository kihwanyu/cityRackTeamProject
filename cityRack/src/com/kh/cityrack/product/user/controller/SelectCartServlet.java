package com.kh.cityrack.product.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.product.user.model.dto.Pcategory;
import com.kh.cityrack.product.user.model.dto.Product;
import com.kh.cityrack.product.user.model.service.CartService;
import com.kh.cityrack.product.user.model.service.PcategoryService;

/**
 * Servlet implementation class SelectCartServlet
 */
@WebServlet("/selectCart.ct")
public class SelectCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//상품코드와 수량을 담아올 hmap을 생성
		HashMap<Product, Integer> hmap = null;
		
		hmap = new CartService().selectCart();
		
		System.out.println(hmap);
		
		String page = "";
		
		if(hmap !=null) {
			
			page = "/views/user/rani/signature.jsp";
			request.setAttribute("hmap", hmap);
			
			System.out.println("hmap @Servlet : " + hmap);
			
		} else {
			page="/views/common/errorPage.jsp";
			request.setAttribute("msg", "조회 실패");
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
