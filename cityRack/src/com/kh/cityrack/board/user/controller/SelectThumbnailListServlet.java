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

import com.kh.cityrack.board.user.model.dto.PageInfo;
import com.kh.cityrack.board.user.model.service.ThumbBoardService;

@WebServlet("/selectThumbList.tn")
public class SelectThumbnailListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectThumbnailListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 페이징 처리
		int currentPage;	// 현재 페이지를 표시할 변수
		int limit;	// 한 페이지에 몇개의 게시글이 보이게 할지 
		int maxPage;	// 전체페이지에서 가장 마지막 페이지
		int startPage;	// 하단에 표시되는 페이지들중에 가장 처음페이지 
		int endPage;	// 하단에 표시되는 페이지들중에 가장 마지막페이지
		
		// 게시판은 1페이지부터 시작함
		currentPage = 1;
		
		// 1로시작해서 누르는대로 현재페이지로 지정
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 한페이지에 보여질 목록 개수
		limit = 10;
		
		// 전체 목록 개수를 리턴받음
		ThumbBoardService bs = new ThumbBoardService();
		int listCount = bs.getListCount();
				
		// 카운트개수 잘 가져오는지 확인
		System.out.println("listCount : " + listCount);
		
		// 총 페이지 수 계산
		// 예를들어, 목록 수가 총 123개일때 10개씩 보여준다고하면 13페이지가 필요함
		// 그래서 나머지수가 최소 1개이상일때, 1페이지로 처리하기위해서 
		// 전체목록/(나누기)limit + 0.9를 해주면 됨 그다음 소수점 자르기
		// 소수점을 나타내기위해 listCount를 소수로 형변환해줌 -> 다시 int로 형변환
		maxPage = (int)((double)listCount / limit + 0.9);
		
		// 현재 페이지에 보여줄 시작 페이지 수(10개씩 보여지게 할 경우)
		// 아래쪽 페이지 수가 10개씩 보여지게 한다면
		// 1, 11, 21, 31... 이런식으로 나오게 함
		startPage = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1;
		
		// 하단에 보여질 마지막페이지 수(10, 20, 30... 이런식으로 나오게 함)
		endPage = startPage + limit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		// 이 다섯개의 변수를 rquest로 전송해도 되지만 객체로 묶어서 전송
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		
		
		// 해쉬맵에 받아오기 (해쉬맵 한개한개가 조인한 결과문)
		ArrayList<HashMap<String, Object>> list = new ThumbBoardService().selectThumbnailList(currentPage, limit); 
		
		System.out.println("SelectThumbnailListServlet's list : " + list);
		
		String page = "";
		if(list != null) {
			page = "views/user/jeong/product_review_list.jsp";
			request.setAttribute("list", list);
			// 페이징처리된 페이지 info정보도 같이 넘김
			request.setAttribute("pi", pi);
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
