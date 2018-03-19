package com.kh.cityrack.order.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.cityrack.order.admin.model.dto.TodayOrder;
import com.kh.cityrack.order.admin.model.service.OrderService;
import com.kh.cityrack.product.admin.model.dto.Stock;
import com.kh.cityrack.product.admin.model.service.StockService;

/**
 * Servlet implementation class todayOrderGetAll
 */
@WebServlet({ "/todayOrderGetAll", "/todayOrder.main" })
public class todayOrderGetAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public todayOrderGetAll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<TodayOrder> todayOrder = null;
		
		todayOrder = new OrderService().todayOrderGetAll();
		
		System.out.println(todayOrder);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(todayOrder, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
