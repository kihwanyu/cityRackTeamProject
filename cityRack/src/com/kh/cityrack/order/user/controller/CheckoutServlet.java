package com.kh.cityrack.order.user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.product.user.model.dto.Cart;
import com.kh.cityrack.product.user.model.service.CartService;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/goCheckOut.or")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//멤버 정보 가져오기
		Member m = (Member) request.getSession().getAttribute("loginUser");
		
		//totalPay 가져오기		
		int totalPay = Integer.parseInt(request.getParameter("totalPay"));
		//카트 어레이 리스트 담기
		ArrayList<Cart> cart = new CartService().selectCart(m);
		
		String page = "";
		if(cart!=null) {
			page = "views/user/rani/checkout.jsp";
			request.setAttribute("cartList", cart);
			request.setAttribute("totalPay", totalPay);			
			
		} else {
			page= "views/common/errorPage.jsp";
			request.setAttribute("msg", "주문 페이지 이동 실패");
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
