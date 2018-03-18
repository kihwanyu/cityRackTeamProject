package com.kh.cityrack.delivery.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.delivery.model.dto.Delivery;
import com.kh.cityrack.delivery.model.service.DeliveryService;

/**
 * Servlet implementation class DeliverySearchServlet
 */
@WebServlet({ "/DeliverySearchServlet", "/DeliverySearch.me" })
public class DeliverySearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeliverySearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int orderCode = Integer.parseInt(request.getParameter("orderCode"));
		
		//가져온 주문번호로 배송상세정보 조회 
		Delivery d = new DeliveryService().deliverySearch(orderCode);
		
		System.out.println(d);
		//상세정보 list에 담아서 전송 
		String page = "";
		if(d != null){
			page = "/views/admin/admin_deliveryDetailUpdate.jsp";
			request.setAttribute("d", d);
			request.setAttribute("orderCode", orderCode);
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "그런 주문번호는 없다구!");
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
