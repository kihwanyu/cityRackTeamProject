package com.kh.cityrack.board.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.board.user.model.service.ThumbBoardService;

@WebServlet("/deleteThumbnail.tn")
public class DeleteThumbnailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteThumbnailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int boNo = Integer.parseInt(request.getParameter("boNo"));
		
		int result = 0;
		
		result = new ThumbBoardService().deleteThumbnail(boNo);
		
		String page = "";
		if(result > 0) {
			page = "views/user/jeong/product_review_delete.jsp";
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "사진 게시글 삭제 실패...");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
