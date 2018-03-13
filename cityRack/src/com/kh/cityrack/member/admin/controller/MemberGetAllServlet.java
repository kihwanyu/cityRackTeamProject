package com.kh.cityrack.member.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.member.admin.model.dao.MemberDao;
import com.kh.cityrack.member.admin.model.dto.Member;
import com.kh.cityrack.member.admin.model.dto.Search;
import com.kh.cityrack.member.admin.model.service.MemberService;

/**
 * Servlet implementation class MemberSearchAllServlet
 */
@WebServlet("/MemberGetAll.me")
public class MemberGetAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberGetAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ArrayList<Member> list = new MemberService().memberGetAll();
		int totalCount = new MemberService().getTotalCount();
		int totalPage;
		int listCount = 10;
		int pageCount = 10;
		int startPage; 
		int endPage;
		
		
		//현재 페이지 초기값 1
		int currentPage = 1;
		
		//넘겨받은 현재 페이지로 초기화 
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//총 페이지 수 설정
		totalPage = totalCount/listCount;
		
		//여유분 인덱스추가
		if(totalCount%listCount > 0){
			totalPage++;
		}
		
		//현재 페이지가 총 페이지보다 클 경우 치환 
		if(totalPage < currentPage){
			currentPage = totalPage;
		}
		
		//시작 페이지와 끝페이지 설정
		startPage = ((currentPage - 1) / pageCount) * pageCount + 1;
		endPage = startPage + pageCount - 1;
		
		//끝페이지가 총 페이지보다 클 경우 치환
		if(endPage > totalPage){
			endPage = totalPage;
		}
		
		ArrayList<Member> list = new MemberService().memberGetAll(currentPage);
		System.out.println(list);
		
		String page = "";
		if(list != null){
			page = "/views/admin/admin_memberList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("currentPage", String.valueOf(currentPage));
			request.setAttribute("startPage", String.valueOf(startPage));
			request.setAttribute("endPage", String.valueOf(endPage));
			request.setAttribute("totalPage", String.valueOf(totalPage));
			
		}else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "회원정보 조회 실패!");
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
