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

import com.kh.cityrack.board.user.model.dto.Board;
import com.kh.cityrack.board.user.model.dto.BoardFile;
import com.kh.cityrack.board.user.model.service.ThumbBoardService;

@WebServlet("/selectThumbOne.tn")
public class SelectOneThumbnailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectOneThumbnailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println("SelectOneThumbnailServlet's num : " + num);
		
		HashMap<String, Object> hmap = new ThumbBoardService().selectThumbnailMap(num);
		
		System.out.println("hmap : " + hmap);
		
		// 이쪽에서 먼저 꺼내줘서 던져줌
		Board b = (Board)hmap.get("board");
		ArrayList<BoardFile> fileList = (ArrayList<BoardFile>)hmap.get("BoardFile");
		
		String page = "";
		if(hmap != null) {
			page = "views/user/jeong/product_review_detail.jsp";
			request.setAttribute("b", b);
			request.setAttribute("fileList", fileList);
			
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "사진 게시글 상세보기 실패...");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
