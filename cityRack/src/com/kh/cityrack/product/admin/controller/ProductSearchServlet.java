package com.kh.cityrack.product.admin.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.product.admin.model.dto.PageInfo;
import com.kh.cityrack.product.admin.model.dto.Pcategory;
import com.kh.cityrack.product.admin.model.dto.Product;
import com.kh.cityrack.product.admin.model.dto.ProductSearch;
import com.kh.cityrack.product.admin.model.service.PcategoryService;
import com.kh.cityrack.product.admin.model.service.ProductService;

/**
 * Servlet implementation class ProductGetAllServlet
 */
@WebServlet("/productSearch.pr")
public class ProductSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductSearch pSearch = new ProductSearch();
		
		String[] searchTypeArr = request.getParameterValues("searchType");
		String orderType = request.getParameter("orderType");
		String[] eventArr = request.getParameterValues("event");
		
		System.out.println(orderType);
		
		String search_pcode = "";
		String pcode_order = "";
		Date beforeDate = null;
		Date afterDate = null;
		int search_pcno = 0;
		String search_constitution = "";
		String search_pname = "";
		String pname_order = "";
		String search_status = "";
		String event = "";
				
		pSearch.setEvent(event);
		
		for(int i = 0; i < searchTypeArr.length; i++){
			switch (searchTypeArr[i]) {
			case "searchCheackedpCode":
				search_pcode = request.getParameter("search_pcode").trim();
				pcode_order = request.getParameter("pcode_order");
				pSearch.setSearch_pcode(search_pcode);
				break;
			case "searchCheackedRdate": 
				beforeDate = java.sql.Date.valueOf(request.getParameter("beforeDate"));
				afterDate = java.sql.Date.valueOf(request.getParameter("afterDate"));
				pSearch.setBeforeDate(beforeDate);
				pSearch.setAfterDate(afterDate);
				break;
			case "searchCheackedPcategory":
				search_pcno= Integer.parseInt(request.getParameter("search_pcategory"));
				pSearch.setSearch_pcno(search_pcno);
				break;
			case "searchCheackedConstitution":
				search_constitution = request.getParameter("search_constitution");
				pSearch.setSearch_constitution(search_constitution);
				break;
			case "searchCheackedPname":
				search_pname = request.getParameter("search_pname").trim();
				pname_order = request.getParameter("pname_order");
				pSearch.setSearch_pname(search_pname);	
				break;
			case "searchCheackedStatus":
				search_status = request.getParameter("search_status");
				pSearch.setSearch_status(search_status);
				break;
			default: //searchCheackedEvent
				for (int j = 0; j < eventArr.length; j++) {
					if(j < eventArr.length-1){
						event += eventArr[j] + " ";
					} else {
						event += eventArr[j];
					}
				}
				pSearch.setEvent(event.trim());
				break;
			}
			
			if(orderType.equals("searchCheackedPnameOrder")){
				pSearch.setPname_order(pname_order);
			} else {
				pSearch.setPcode_order(pcode_order);
			}
			
		}
				
		ArrayList<Product> pList = null;
		
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
		int listCount = new ProductService().getListCount();
		
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
				
		
		
		pList = new ProductService().productSearchGetAll(currentPage, limit, pSearch, searchTypeArr, orderType);
		
		String page = "";
		
		if(pList != null){
			ArrayList<Pcategory> cList = new PcategoryService().categoryGetAll();
			
			request.setAttribute("pList", pList);
			request.setAttribute("pi", pi);
			request.setAttribute("cList", cList);
			page = "views/admin/admin_productList.jsp";
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
