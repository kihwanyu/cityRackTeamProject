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
@WebServlet("/deliveryInsert.de")
public class DeliveryInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeliveryInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		///*배송*/
		
		Delivery d = (Delivery)request.getAttribute("d");
		int paycode = (Integer)request.getAttribute("paycode");
		
		String page="";
		
		int result = new DeliveryService().deliveryInsert(d);
		
		if(result > 0){
			
			
			request.setAttribute("paycode", paycode);
			request.setAttribute("dcode", result);
			page = "/OrderInsert.or";
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
