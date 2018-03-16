package com.kh.cityrack.order.user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.order.user.model.dto.Cart;
import com.kh.cityrack.order.user.model.service.CartService;
import com.kh.cityrack.order.user.model.service.OrderService;

/**
 * Servlet implementation class PaymentInsertServlet
 */
@WebServlet("/OrderInsert.or")
public class OrderInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*배송*/
		
		int dcode = (Integer)request.getAttribute("dcode");
		int paycode = (Integer)request.getAttribute("paycode");
		ArrayList<Cart> cartList = (ArrayList<Cart>)request.getAttribute("cartList");
		String page="";
		
		HttpSession session = request.getSession();
		//
		//로그인 정보
		Member m = (Member)session.getAttribute("loginUser");
		
		int mno = m.getM_no();
	
		int result = 0;
		
		result = new OrderService().orderInsert(mno ,dcode, paycode ,cartList);
		
		if(result > 0){
			result = new CartService().memberCartDeleteAll(mno);
			if(result > 0){
				request.setAttribute("msg", "결제 성공");
				page = "views/common/successPage.jsp";
			} else {
				request.setAttribute("msg", "장바구니 삭제 실패");
				page = "views/common/errorPage.jsp";
			}
		} else {
			request.setAttribute("msg", "주문 등록 실패");
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
