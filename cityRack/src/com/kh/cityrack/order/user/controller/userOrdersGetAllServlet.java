package com.kh.cityrack.order.user.controller;
//
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.order.user.model.dto.Order;
import com.kh.cityrack.order.user.model.service.OrderService;
import com.kh.cityrack.product.admin.model.dto.PageInfo;

/**
 * Servlet implementation class OrdersGetAll
 */
@WebServlet("/userOrderGetAll.or")
public class userOrdersGetAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userOrdersGetAllServlet() {
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
		
		int currentPage; // 현재 페이지를 표시할 변수
		int limit; // 한 페이지에 게시글이 몇 개 보여질 것인지
		int maxPage; // 전체 페이지에서 가장 마지막 페이지
		int startPage; // 한번에 표시될  시작할 페이지
		int endPage; // 한번에 표시될 페이지가 페이지가끝나는 페이지
		
		// 게시판은 1페이지부터 시작한다.
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 한페이지에 보여질 목록 갯수를 지정
		
		limit = 5;
		
		//전체 목록 갯수를 리턴 받음
		int listCount = new OrderService().orderListCount(mno);
		
		
		//총 페이지수 계산
		//예를 들면, 목록 수가 123개 이면 13페이지가 필요함.
		//짜투리 목록 최소 1개일 때, 1page로 처리하기 위해서 
		//전체 목록 / limit + 0.9
		maxPage = (int) ((double)listCount / limit + 0.9);
		
		//현제 페이지에 보여줄 시작 페이지 수 ( 10개 씩 보여주게 할 경우 )
		//아래쪽 페이지 수가 10개씩 보여주게 한 다면 
		//1, 11, 21, 31...
		startPage = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1;
		
		//목록 아래 보여질 마지막 페이지수 (10, 20, 30, ...)
		endPage = startPage + limit - 1;
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
						
		 ArrayList<Order> oList = new OrderService().orderListGetAll(mno ,currentPage, limit);
		
		 int no = 0;
		 if(request.getParameter("no")!=null){
			 no = Integer.parseInt(request.getParameter("no"));
		 }
		 
		 String invoice = oList.get(no).getInvoice_no();
		 
		System.out.println("oListServlet : " + oList);
		String page = "";
		
		if(oList != null){
			oList = new OrderService().orderListGetPcount(mno ,currentPage, limit, oList);
			
			Boolean searchBoolean = false;
			request.setAttribute("searchBoolean", searchBoolean);
			
			request.setAttribute("oList", oList);
			request.setAttribute("pi", pi);
			request.setAttribute("invoice", invoice);
			page = "views/user/jeong/myPage_delivery.jsp";
		} else {
			request.setAttribute("msg", "주문 목록 조회 실패");
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
