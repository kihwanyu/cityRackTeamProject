package com.kh.cityrack.product.admin.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.product.admin.model.dto.Stock;
import com.kh.cityrack.product.admin.model.service.StockService;

/**
 * Servlet implementation class StockInsertServlet
 */
@WebServlet("/stockInsert.pr")
public class StockInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StockInsertServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Stock s = new Stock();
		int result = 0;
		String page = "";
			if(request.getParameter("selflife") != null){
				String selflife = request.getParameter("selflife");
				System.out.println("selflife :" + selflife);
				s.setSelflife(java.sql.Date.valueOf(selflife));
			}
			
			String pcode = request.getParameter("pcode");
			String divsion = request.getParameter("divsion");
			String note = request.getParameter("note");
			int amount =  Integer.parseInt(request.getParameter("amount"));
			
			System.out.println("divsion :" + divsion);
			System.out.println("pcode :" + pcode);
			System.out.println("note :" + note);
			System.out.println("amount :" + amount);
			
			s.setPcode(pcode);
			s.setDivsion(divsion);
			s.setNote(note);
			s.setAmount(amount);
			
			int p_total = 0;
			
			p_total = new StockService().StockTotal(s);
			
			if(p_total > -1){		
				result = new StockService().StockInsert(s);
			
				if(result > 0){
					System.out.println("입력완료");
				} else {
					page = "views/common/errorPage.jsp";
					request.setAttribute("msg", "재고 입력 에러 발생");
					request.getRequestDispatcher(page).forward(request, response);
				}
			} else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "재고가 부족합니다.");
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
