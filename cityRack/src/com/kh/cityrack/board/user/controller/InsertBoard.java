package com.kh.cityrack.board.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.board.user.model.dto.Board;
import com.kh.cityrack.board.user.model.service.BoardService;

/**
 * Servlet implementation class InsertBoard
 */
@WebServlet("/insertBoard.bo")
public class InsertBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//글작성 내용값 꺼내기
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		System.out.println("category:"+category);
		System.out.println("title:"+title);
		System.out.println("content:"+content);

		//작성자 가져오기 멤버연결안되있어서 나중에
		//String writer = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getUno());

		Board b = new Board();
		b.setBo_category(category);
		b.setBo_title(title);
		b.setBo_content(content);

		int result = new BoardService().insertBoard(b);
		
		
		String page = "";
		if(result > 0){
			response.sendRedirect(request.getContextPath() + "/selectList.bo");
		}else{
			request.setAttribute("msg", "게시판 작성 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
