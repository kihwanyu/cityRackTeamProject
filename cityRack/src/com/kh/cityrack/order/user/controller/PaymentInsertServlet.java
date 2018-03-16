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
import com.kh.cityrack.order.user.model.dto.Delivery;
import com.kh.cityrack.order.user.model.dto.Payment;
import com.kh.cityrack.order.user.model.dto.Stock;
import com.kh.cityrack.order.user.model.service.CartService;
import com.kh.cityrack.order.user.model.service.PaymentService;
import com.kh.cityrack.order.user.model.service.StockService;

/**
 * Servlet implementation class PaymentInsertServlet
 */
@WebServlet("/PaymentInsert.pay")
public class PaymentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*결제*/
		String pg = request.getParameter("pay_pg");
		String pay_method = request.getParameter("pay_paymethod");
		String merchant_uid = request.getParameter("pay_merchant_uid");
		String name = request.getParameter("pay_name");
		String amount = request.getParameter("pay_amount");
		String buyer_email = request.getParameter("pay_buyer_email");
		String buyer_name = request.getParameter("pay_buyer_name");
		String buyer_tel = request.getParameter("pay_buyer_tel");
		String buyer_addr = request.getParameter("pay_buyer_addr");
		String buyer_postcode = request.getParameter("pay_buyer_postcode");
		String pay_imp_uid = request.getParameter("pay_imp_uid");
		String pay_apply_num = request.getParameter("pay_apply_num");
		
		System.out.println("buyer_postcode : " + buyer_postcode);
		
		Payment p = new Payment(pg, pay_method, merchant_uid, name,Integer.parseInt(amount)
								, buyer_name, buyer_tel, buyer_email, buyer_addr, buyer_postcode, pay_imp_uid
								, pay_apply_num);
		
		
		System.out.println("p.getBuyer_postcode() : "+p.getBuyer_postcode());
		/*배송*/
		String d_addr_name = request.getParameter("name");
		String d_addr_tel = request.getParameter("tel");
		String d_addr_phone = request.getParameter("phone");
		
		String postcode = request.getParameter("postcode");
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		String d_addr_adress = postcode + "/" + address + "/" + address2;

		String d_addr_msg = request.getParameter("message");
		
		Delivery d = new Delivery(d_addr_name, d_addr_tel, d_addr_phone, d_addr_adress, d_addr_msg);
		String page="";
		
		HttpSession session = request.getSession();
		/*재고*/
		Member m = (Member)session.getAttribute("loginUser");	
		int mno = m.getM_no();
	
		ArrayList<Cart> cartList = new CartService().memberCartListGetAll(mno);
		
		int result = 0;
		
		result = new StockService().StockInsert(cartList);
	
		if(result > 0){
			System.out.println("입력완료");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "재고 입력 에러 발생");
			request.getRequestDispatcher(page).forward(request, response);
			return;
		}
			
		result = new PaymentService().paymentInsert(p);
		
		if(result > 0){
	
			request.setAttribute("paycode", result);
			request.setAttribute("d", d);
			request.setAttribute("cartList", cartList);
			page = "/deliveryInsert.de";
		} else {
			request.setAttribute("msg", "결제 등록 실패");
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
