package com.kh.cityrack.order.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.order.admin.model.service.OrderService;

/**
 * Servlet implementation class OrderStatusUpdateServlet
 */
@WebServlet("/orderStatusUpdate.or")
public class OrderStatusUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderStatusUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ono = request.getParameter("no");
		String status = request.getParameter("status");
		
		System.out.println("onoServlet : " + ono);
		System.out.println("statusServlet : " + status);
		String page = "";
		
		int result = new OrderService().getOrderStatusUpdate(ono, status);
		
		if(result > 0){
			response.sendRedirect(request.getContextPath()+"/OrderGetAll.or");
		} else {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "주문 상태 정보 변경 에러");
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
