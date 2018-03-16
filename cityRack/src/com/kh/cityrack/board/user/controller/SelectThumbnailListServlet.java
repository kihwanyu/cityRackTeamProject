package com.kh.cityrack.board.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.board.user.model.service.ThumbBoardService;

@WebServlet("/selectThumbList.tn")
public class SelectThumbnailListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectThumbnailListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 해쉬맵에 받아오기 (해쉬맵 한개한개가 조인한 결과문)
		ArrayList<HashMap<String, Object>> list = new ThumbBoardService().selectThumbnailList(); 
		
		System.out.println("SelectThumbnailListServlet's list : " + list);
		
		String page = "";
		if(list != null) {
			page = "views/user/jeong/product_review_list.jsp";
			request.setAttribute("list", list);
		} else {
			page = "views/user/common/errorPage.jsp";
			request.setAttribute("msg", "사진 게시판 조회 실패...");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
