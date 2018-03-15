package com.kh.cityrack.product.user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.product.user.model.dto.Cart;
import com.kh.cityrack.product.user.model.service.CartService;

/**
 * Servlet implementation class UpdateCartServlet
 */
@WebServlet("/editCart.ct")
public class UpdateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 장바구니 수정
		
		//세션 가져오기
		Member m = (Member) request.getSession().getAttribute("loginUser");
		
		//수정할 상품정보 수량 가져오기
		
				
		String[] pCode = request.getParameterValues("pcode");
		String[] count = request.getParameterValues("quantity");
		
		System.out.println("수정 물품 코드 " + pCode);
		System.out.println("수량 " + count);
		
				
		//카트 어레이 리스트 생성
		ArrayList<Cart> cartList = new ArrayList<Cart>();
		Cart c = null;
		for(int i =0;i<pCode.length;i++) {
			c = new Cart();
			
			c.setProduct_code(pCode[i]);
			c.setCart_amount(Integer.parseInt(count[i]));
			cartList.add(c);
		}
		
		System.out.println(cartList);
		
		// 서비스로 전달
		int result = new CartService().updateCart(m, cartList);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
