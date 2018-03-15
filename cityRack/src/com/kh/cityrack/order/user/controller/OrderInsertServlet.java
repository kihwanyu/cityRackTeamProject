package com.kh.cityrack.order.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.order.user.model.dto.Delivery;
import com.kh.cityrack.order.user.model.service.DeliveryService;

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
		
		String page="";
		/*상품이 넘어와야됨*/
		int result = 0;
		
		if(result > 0){
			
			page = "";
		} else {
			request.setAttribute("msg", "배송 등록 실패");
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
