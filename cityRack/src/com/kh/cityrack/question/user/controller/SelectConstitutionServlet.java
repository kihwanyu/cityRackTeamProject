package com.kh.cityrack.question.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.question.user.model.dto.Question;
import com.kh.cityrack.question.user.model.service.QuestionService;
/*sdf*//* sd */
@WebServlet("/selectCon")
public class SelectConstitutionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectConstitutionServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		/* 계획 - 회원번호로 체질결과 조회 */
		// 파라미터는 유저번호만 꺼내도 됨
		int mNo = Integer.parseInt(request.getParameter("mNo"));
		
		System.out.println("SelectConstitutionServlet's mNo : " + mNo);
		
		// 객체에 파라미터로 받아온 값을 set으로 넣어
		Question q = new Question();
		q.setM_no(mNo);
		
		// 서비스 호출
		int result = new QuestionService().selectConstitution(q);
		
		/*// 페이지
		String page = "";
		if(result > 0) {
			request.setAttribute("mNo", mNo);
			page = "views/user/jeong/myPage_result.jsp";
			response.sendRedirect(page);
		} */
		
		String page = "";
		if(result > 0) {
			request.setAttribute("mNo", mNo);
			request.setAttribute("conResult", q.getQ_8constitution());
			page = "views/user/jeong/myPage_result.jsp";
		} else {
			request.setAttribute("msg", "회원 정보 조회 실패");
			page = "views/common/errorPage.jsp";
		}
		
		// 최종전달
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
