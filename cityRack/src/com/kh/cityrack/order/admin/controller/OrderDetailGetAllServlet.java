package com.kh.cityrack.order.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.order.admin.model.dto.Order;
import com.kh.cityrack.order.admin.model.dto.Product;
import com.kh.cityrack.order.admin.model.service.OrderService;


/**
 * Servlet implementation class ProductGetAllServlet
 */
@WebServlet("/orderDetailGetAll.or")
public class OrderDetailGetAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDetailGetAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ono = request.getParameter("ono");
		
		String page = "";
		
		Order o = new OrderService().orderDetailGet(ono);
		
		if(o != null){
			ArrayList<Product> pList = new OrderService().orderProductGetAll(ono);
			
			request.setAttribute("o", o);
			request.setAttribute("pLIst", pList);
			page = "views/admin/admin_orderDetails.jsp";
		} else {
			request.setAttribute("msg", "주문 상세 목록 조회 실패");
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
