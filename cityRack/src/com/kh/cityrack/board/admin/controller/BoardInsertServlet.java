package com.kh.cityrack.board.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.board.admin.model.dto.Board;
import com.kh.cityrack.board.admin.model.service.BoardService;

/**
 * Servlet implementation class BoardInsertServlet
 * 게시판 등록
 */
@WebServlet("/BoardInsert.do")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public BoardInsertServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println("writer :" + writer);
		System.out.println("title :" + title);
		System.out.println("content :" + content);
		
		Board b = new Board();
		
		b.setM_email(writer);
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
