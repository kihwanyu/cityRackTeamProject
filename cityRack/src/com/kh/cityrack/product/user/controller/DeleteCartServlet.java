package com.kh.cityrack.product.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.product.user.model.service.CartService;

/**
 * Servlet implementation class DeleteCartServlet
 */
@WebServlet("/deleteCart.ct")
public class DeleteCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//카트 삭제 서블렛
		
		//세션 가져오기
		Member m = (Member) request.getSession().getAttribute("loginUser");
		
		//해당 물품 코드 가져오기
		String[] list = request.getParameterValues("productCheck");
		for(int i = 0; i<list.length;i++) {
			System.out.println("삭제리스트 :" + list[i]);
		}
		
		int result = new CartService().deleteCart(list, m); 
		
		String page = "";
			
		if(result>0) {
			page = "selectCart.ct";
						
		}else {
			page= "views/common/errorPage.jsp";
			request.setAttribute("msg", "장바구니 삭제에 실패하였습니다.");
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
