package com.kh.cityrack.member.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cityrack.member.admin.model.dto.Member;
import com.kh.cityrack.member.admin.model.dto.Search;
import com.kh.cityrack.member.admin.model.service.MemberService;

/**
 * Servlet implementation class MemberSearchServlet
 */
@WebServlet("/MemberSearch.me")
public class MemberSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = 1;
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
		}
		
		//값을 하나도 입력하지 않은 경우 전체 조회 서블릿으로 리다이렉트 
		if(request.getParameter("searchText") == "" && request.getParameter("beforeDate") == "" && request.getParameter("afterDate") == ""){
			response.sendRedirect("/cityRack/MemberGetAll.me");
			return;
		}
		
		Search search = new Search();
		
		
		String gender = request.getParameter("gender");
		System.out.println(gender);
		search.setGender(gender);
		
		String searchCondition = request.getParameter("searchCondition");
		System.out.println(searchCondition);
		search.setSearchCondition(searchCondition);
		
		String searchText = request.getParameter("searchText");
		System.out.println(searchText);
		search.setSearchText(searchText);
		
		String beforeDate = request.getParameter("beforeDate");
		System.out.println(beforeDate);
		search.setBeforeDate(beforeDate);
		
		String afterDate = request.getParameter("afterDate");
		System.out.println(afterDate);
		search.setAfterDate(afterDate);
		
		String grade = request.getParameter("grade");
		System.out.println(grade);
		search.setGrade(grade);
		
		String status = request.getParameter("status");
		System.out.println(status);
		search.setStatus(status);
		
		HashMap hmap = new MemberService().memberSearch(search, currentPage);
		
		ArrayList<Member> list = (ArrayList<Member>)hmap.get("list");	
		int totalPage = Integer.parseInt(String.valueOf(hmap.get("totalPage")));
		int startPage = Integer.parseInt(String.valueOf(hmap.get("startPage")));
		int endPage = Integer.parseInt(String.valueOf(hmap.get("endPage")));
		
		System.out.println(list);
		System.out.println(totalPage);
		System.out.println(startPage);
		System.out.println(endPage);
		
		String page = "";
		if(list != null){
			page = "/views/admin/admin_memberList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("currentPage", String.valueOf(currentPage));
			request.setAttribute("startPage", String.valueOf(startPage));
			request.setAttribute("endPage", String.valueOf(endPage));
			request.setAttribute("totalPage", String.valueOf(totalPage));
			request.setAttribute("search", search);
			
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 불러오기 실패!");
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
