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
 * Servlet implementation class QnA_reply
 */
@WebServlet("/QnA_Re.bo")
public class QnA_reply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnA_reply() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String division = request.getParameter("division");
		int mno = Integer.parseInt(request.getParameter("mno"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("content :"+content);
		System.out.println("divistion :" + division);
		System.out.println("category :"+category);
		System.out.println("title :"+title);
		System.out.println("mno:" + mno);
		System.out.println("bno:" + bno);
		Board re_b = new Board();
		
		
		re_b.setBo_title(title);
		re_b.setBo_category(category);
		re_b.setBo_content(content);
		re_b.setBo_division(division);
		
		re_b.setM_no(mno);
		re_b.setBo_pno(bno);
		int result = new BoardService().insertRe(re_b);
		
		
		System.out.println("result:"+result);
		String page = "";
		if(re_b != null){
			page = "views/user/jeong/myPage_QnA_View.jsp";
			request.setAttribute("re_b",re_b);
		}
		if(result > 0){
			response.sendRedirect(request.getContextPath() + "/selectList.bo");
			request.setAttribute("re_b", re_b);
		}else{
			request.setAttribute("msg", "문의답글 작성 실패");
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
