package com.kh.cityrack.member.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.member.admin.model.dto.Payment;
import com.kh.cityrack.member.admin.model.service.PaymentService;

/**
 * Servlet implementation class PaymentGetAllServlet
 */
@WebServlet({ "/PaymentGetAllServlet", "/PaymentGetAll.me" })
public class PaymentGetAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentGetAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderCode = request.getParameter("orderCode");
		
		Payment p = new PaymentService().paymentGetAll(orderCode);
		
		String page = "";
		if(p != null){
			page = "/views/admin/admin_paymentDetails.jsp";
			request.setAttribute("p", p);
			request.setAttribute("orderCode", orderCode);
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "결제정보 조회실패!");
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
