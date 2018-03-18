package com.kh.cityrack.delivery.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.delivery.model.dto.Delivery;
import com.kh.cityrack.delivery.model.service.DeliveryService;

/**
 * Servlet implementation class DeliveryUpdateServlet
 */
@WebServlet({ "/DeliveryUpdateServlet", "/DeliveryUpdate.me" })
public class DeliveryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeliveryUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Delivery d;
		int result = 0;
		
		String orderCode = (request.getParameter("orderCode"));
		
		if(request.getParameter("dno") != null){
			d = new Delivery();
			d.setD_no(Integer.parseInt(request.getParameter("dno")));
			d.setD_addr_name(request.getParameter("receiverName"));
			d.setD_invoice_no(request.getParameter("invoice"));
			d.setD_addr_tel(request.getParameter("receiverTel"));
			d.setD_addr_phone(request.getParameter("receiverPhone"));
			
			String d_addr_address = request.getParameter("postcode") + "/" + request.getParameter("address1") + "/" + request.getParameter("address2");
			d.setD_addr_address(d_addr_address);
			
			d.setD_addr_msg(request.getParameter("receiverMsg"));
			System.out.println(d);
		}else{
			d = new DeliveryService().deliverySearch(orderCode);
			d.setD_invoice_no(request.getParameter("invoice"));
		}
		
		result = new DeliveryService().deliveryUpdate(d);
		
		String page = "";
		if(result > 0){
			page = request.getContextPath() + "/DeliverySearch.me?orderCode=" + orderCode;
			response.sendRedirect(page);
			return;
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "업데이트실패!");
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
