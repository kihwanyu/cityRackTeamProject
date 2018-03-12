package com.kh.cityrack.question.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.member.common.model.service.WithdrawService;
import com.kh.cityrack.question.user.model.dto.Question;
import com.kh.cityrack.question.user.model.service.QuestionService;
/*sdf*/
@WebServlet("/8result")
public class ConstitutionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ConstitutionServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 파라미터 꺼내기
		/* 1. 유저번호
		* 2. 체질결과
		*  */
		int mNo = Integer.parseInt(request.getParameter("mNo"));
		String conResult = request.getParameter("conResult");
		
		System.out.println("ConstitutionServlet's mNo : " + mNo);
		System.out.println("ConstitutionServlet's conResult : " + conResult);
		
		
		// 객체에 파라미터로 받아온 두값을 set으로 넣어
		Question q = new Question();
		q.setM_no(mNo);
		q.setQ_8constitution(conResult);
		
		// 서비스 호출
		int result = new QuestionService().insertConstitution(q);
		
		// 페이지
		String page = "";
		if(result > 0) {
			page = "views/user/jeong/myPage_result.jsp";
			response.sendRedirect(page);
		} 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
