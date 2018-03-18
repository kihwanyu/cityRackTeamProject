package com.kh.cityrack.order.admin.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.order.admin.model.dto.Order;
import com.kh.cityrack.order.admin.model.dto.OrderSearch;
import com.kh.cityrack.order.admin.model.service.OrderService;
import com.kh.cityrack.product.admin.model.dto.PageInfo;


/**
 * Servlet implementation class ProductGetAllServlet
 */
@WebServlet("/orderSearch.or")
public class OrderSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		OrderSearch oSearch = new OrderSearch();
		
		String[] searchTypeArr = request.getParameterValues("searchType");
		String orderType = request.getParameter("orderType");
				
		String search_oono = "";
		String search_email = "";
		Date beforeDate = null;
		Date afterDate = null;
		String search_pname = "";
		String search_status = "";
		
		String oono_order = "";
		String email_order = "";
		String pname_order = "";
		
		for(int i = 0; i < searchTypeArr.length; i++){
			System.out.println(searchTypeArr[i]);
			switch (searchTypeArr[i]) {
			case "searchCheackedOono":
				search_oono = request.getParameter("search_oono").trim();
				oSearch.setSearch_oono(search_oono);
				System.out.println("Servlet search_oono : " + search_oono);
				break;
			case "searchCheackedEmail": 
				search_email= request.getParameter("search_email").trim();
				oSearch.setSearch_email(search_email);
				break;
			case "searchCheackedOdate":
				String beforDateStr = request.getParameter("beforeDate");
				String afterdateStr = request.getParameter("afterDate");
				if(beforDateStr != null){
					beforeDate = java.sql.Date.valueOf(beforDateStr);
				}
				if(afterdateStr != null){
					afterDate = java.sql.Date.valueOf(afterdateStr);
				}
				
				oSearch.setBeforeDate(beforeDate);
				oSearch.setAfterDate(afterDate);
				break;
			case "searchCheackedPname":
				search_pname= request.getParameter("search_pname").trim();
				oSearch.setSearch_pname(search_pname);
				break;
			default: //searchCheackedStatus
				search_status= request.getParameter("search_status").trim();
				oSearch.setSearch_status(search_status);
				break;
			}
			if(orderType.equals("searchCheackedOonoOrder")){
				oono_order = request.getParameter("oono_order");
				oSearch.setOono_order(oono_order);
			} else if(orderType.equals("searchCheackedEmailOrder")) {
				email_order = request.getParameter("email_order");
				oSearch.setEmail_order(email_order);
			} else { //searchCheackedPnameOrder
				pname_order = request.getParameter("pname_order");
				oSearch.setPname_order(pname_order);
			}
			
		}
				
		ArrayList<Order> oList = null;
		
		// 페이징 처리	
		int currentPage; // 현재 페이지를 표시할 변수
		int limit; // 한 페이지에 게시글이 몇 개 보여질 것인지
		int maxPage; // 전체 페이지에서 가장 마지막 페이지
		int startPage; // 한번에 표시될 페이지가 시작할 페이지
		int endPage; // 한번에 표시될 페이지가 끝나는 페이지
		
		// 게시판은 1페이지부터 시작한다.
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 한페이지에 보여질 목록 갯수를 지정
		
		limit = 3;
		
		//전체 목록 갯수를 리턴 받음
		int listCount = new OrderService().getListSearchCount(oSearch, searchTypeArr, orderType);
		/**/
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
				
		
		
		oList = new OrderService().orderListSearchGetAll(currentPage, limit, oSearch, searchTypeArr, orderType);
	
		System.out.println("oList : " + oList);
		
		String page = "";
		
		if(oList != null){
			oList = new OrderService().orderListSearchGetPcount(currentPage, limit, oSearch, searchTypeArr, orderType, oList);
			System.out.println("Servlet searchTypeArr[0]" + searchTypeArr[0]);
			if(searchTypeArr != null){
				request.setAttribute("searchTypeArr", searchTypeArr);
			}
			if(orderType != null){
				request.setAttribute("orderType", orderType);
			}
			if(search_oono != null){
				request.setAttribute("search_oono", search_oono);
			}
			if(search_email != null){
				request.setAttribute("search_email", search_email);
			}
			if(beforeDate != null){
				request.setAttribute("beforeDate", String.valueOf(beforeDate));
			}
			if(afterDate != null){
				request.setAttribute("afterDate", String.valueOf(afterDate));
			}
			if(search_pname != null){
				request.setAttribute("search_pname", search_pname);
			}	
			if(search_status != null){
				request.setAttribute("search_status", search_status);
			}
			if(oono_order != null){
				request.setAttribute("oono_order", oono_order);
			}
			if(email_order != null){
				request.setAttribute("email_order", email_order);
			}
			if(pname_order != null){
				request.setAttribute("pname_order", pname_order);
			}
			
			
			request.setAttribute("searchBoolean", true);
			request.setAttribute("oList", oList);
			request.setAttribute("pi", pi);
			page = "views/admin/admin_orderList.jsp";
		} else {
			request.setAttribute("msg", "상품 목록 조회 실패");
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
