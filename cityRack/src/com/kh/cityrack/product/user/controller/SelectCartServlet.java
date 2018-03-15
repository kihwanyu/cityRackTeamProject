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

import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.product.user.model.dto.Cart;
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
		//로그인 유저 가져오기
		Member m = (Member) request.getSession().getAttribute("loginUser");
		
		// cart ArrayList 생성
		ArrayList<Cart> c = new CartService().selectCart(m);
		
		System.out.println("cart @selectCartServlet : " +c );
		
		String page = "";
		
		if(c !=null) {
			
			page = "/views/user/jeong/cart.jsp";
			
			request.setAttribute("cartList", c);
			
			
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
