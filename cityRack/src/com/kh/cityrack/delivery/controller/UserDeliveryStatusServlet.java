package com.kh.cityrack.delivery.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.order.user.model.dto.Order;
import com.kh.cityrack.order.user.model.service.OrderService;

/**
 * Servlet implementation class UserDeliveryStatusServlet
 */
@WebServlet({ "/UserDeliveryStatusServlet", "/UserDeliveryStatus.me" })
public class UserDeliveryStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeliveryStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mno = loginUser.getM_no();
		
		int no = 1;
		if(request.getParameter("no")!=null){
			no = Integer.parseInt(request.getParameter("no"));
		}
		
		ArrayList<Order> oList = new OrderService().orderListGetAll(mno ,1, 100);
		
		String invoice = oList.get(no).getInvoice_no();
		
		response.getWriter().print(invoice);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
