package com.kh.cityrack.member.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.member.admin.model.service.PaymentService;

/**
 * Servlet implementation class PaymentUpdateServlet
 */
@WebServlet({ "/PaymentUpdateServlet", "/PaymentUpdate.me" })
public class PaymentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String status = request.getParameter("status");
		String orderCode = request.getParameter("orderCode");
		System.out.println(orderCode);
		
		int result = new PaymentService().paymentUpdate(status, orderCode);
		
		String page = "";
		if(result > 0){
			page = request.getContextPath() + "/PaymentGetAll.me?orderCode=" + orderCode;
			response.sendRedirect(page);
			return;
		}else{
			page = "views/common/errorPage.jsp";
			RequestDispatcher view = request.getRequestDispatcher(page);
			request.setAttribute("msg", "결제정보 업데이트 실패!");
			view.forward(request, response);
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
